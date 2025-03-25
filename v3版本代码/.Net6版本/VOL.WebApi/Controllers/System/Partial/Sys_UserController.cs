
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.CacheManager;
using VOL.Core.Configuration;
using VOL.Core.Controllers.Basic;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Infrastructure;
using VOL.Core.ManageUser;
using VOL.Core.ObjectActionValidator;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.AttributeManager;
using VOL.Entity.DomainModels;
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.System.Repositories;

namespace VOL.System.Controllers
{
    [Route("api/User")]
    public partial class Sys_UserController
    {
        private ISys_UserRepository _userRepository;
        private ICacheService _cache;
        [ActivatorUtilitiesConstructor]
        public Sys_UserController(
               ISys_UserService userService,
               ISys_UserRepository userRepository,
               ICacheService cahce
              )
          : base(userService)
        {
            _userRepository = userRepository;
            _cache = cahce;
        }

        [HttpPost, HttpGet, Route("login"), AllowAnonymous]
        [ObjectModelValidatorFilter(ValidatorModel.Login)]
        public async Task<IActionResult> Login([FromBody] LoginInfo loginInfo)
        {
            return Json(await Service.Login(loginInfo));
        }

        private readonly ConcurrentDictionary<int, object> _lockCurrent = new ConcurrentDictionary<int, object>();
        [HttpPost, Route("replaceToken")]
        public IActionResult ReplaceToken()
        {
            WebResponseContent responseContent = new WebResponseContent();
            string error = "";
            string key = $"rp:Token:{UserContext.Current.UserId}";
            UserInfo userInfo = null;
            try
            {
                //如果5秒内替换过token,直接使用最新的token(防止一个页面多个并发请求同时替换token导致token错位)
                if (_cache.Exists(key))
                {
                    return Json(responseContent.OK(null, _cache.Get(key)));
                }
                var _obj = _lockCurrent.GetOrAdd(UserContext.Current.UserId, new object() { });
                lock (_obj)
                {
                    if (_cache.Exists(key))
                    {
                        return Json(responseContent.OK(null, _cache.Get(key)));
                    }
                    string requestToken = HttpContext.Request.Headers[AppSetting.TokenHeaderName];
                    requestToken = requestToken?.Replace("Bearer ", "");

                    if (JwtHelper.IsExp(requestToken)) return Json(responseContent.Error("Token已过期!"));

                    int userId = UserContext.Current.UserId;

                    userInfo = _userRepository.FindAsIQueryable(x => x.User_Id == userId).Select(
                             s => new UserInfo()
                             {
                                 User_Id = userId,
                                 UserName = s.UserName,
                                 UserTrueName = s.UserTrueName,
                                 Role_Id = s.Role_Id,
                                 RoleName = s.RoleName
                             }).FirstOrDefault();

                    if (userInfo == null) return Json(responseContent.Error("未查到用户信息!"));

                    string token = JwtHelper.IssueJwt(userInfo);
                    //移除当前缓存
                    _cache.Remove(userId.GetUserIdKey());
                    //只更新的token字段
                    _userRepository.Update(new Sys_User() { User_Id = userId, Token = token }, x => x.Token, true);
                    //添加一个5秒缓存
                    _cache.Add(key, token, 5);
                    responseContent.OK(null, token);
                }
            }
            catch (Exception ex)
            {
                error = ex.Message + ex.StackTrace;
                responseContent.Error("token替换异常");
            }
            finally
            {
                _lockCurrent.TryRemove(UserContext.Current.UserId, out object val);
                string _message = $"用户{userInfo?.User_Id}_{userInfo?.UserTrueName},({(responseContent.Status ? "token替换成功": "token替换失败")})";
                Logger.Info(LoggerType.ReplaceToeken, _message, null, error);
            }
            return Json(responseContent);
        }


        [HttpPost, Route("modifyPwd")]
        [ApiActionPermission]
        //通过ObjectGeneralValidatorFilter校验参数，不再需要if esle判断OldPwd与NewPwd参数
        [ObjectGeneralValidatorFilter(ValidatorGeneral.OldPwd, ValidatorGeneral.NewPwd)]
        public async Task<IActionResult> ModifyPwd(string oldPwd, string newPwd)
        {
            return Json(await Service.ModifyPwd(oldPwd, newPwd));
        }

        [HttpPost, Route("getCurrentUserInfo")]
        public async Task<IActionResult> GetCurrentUserInfo()
        {
            return Json(await Service.GetCurrentUserInfo());
        }

        //只能超级管理员才能修改密码
        //2020.08.01增加修改密码功能
        [HttpPost, Route("modifyUserPwd"), ApiActionPermission(ActionRolePermission.SuperAdmin)]
        public IActionResult ModifyUserPwd(string password, string userName)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (string.IsNullOrEmpty(password) || string.IsNullOrEmpty(userName))
            {
                return Json(webResponse.Error("参数不完整"));
            }
            if (password.Length < 6) return Json(webResponse.Error("密码长度不能少于6位"));

            ISys_UserRepository repository = Sys_UserRepository.Instance;
            Sys_User user = repository.FindFirst(x => x.UserName == userName);
            if (user == null)
            {
                return Json(webResponse.Error("用户不存在"));
            }
            user.UserPwd = password.EncryptDES(AppSetting.Secret.User);
            repository.Update(user, x => new { x.UserPwd }, true);
            //如果用户在线，强制下线
            UserContext.Current.LogOut(user.User_Id);
            return Json(webResponse.OK("密码修改成功"));
        }

        /// <summary>
        /// 2020.06.15增加登陆验证码
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("getVierificationCode"), AllowAnonymous]
        public IActionResult GetVierificationCode()
        {
            string code = VierificationCode.RandomText();
            var data = new
            {
                img = VierificationCode.CreateBase64Imgage(code),
                uuid = Guid.NewGuid()
            };
            HttpContext.GetService<IMemoryCache>().Set(data.uuid.ToString(), code, new TimeSpan(0, 5, 0));
            return Json(data);
        }

        [ApiActionPermission()]
        public override IActionResult Upload(IEnumerable<IFormFile> fileInput)
        {
            return base.Upload(fileInput);
        }
        [HttpPost, Route("updateUserInfo")]
        public IActionResult UpdateUserInfo([FromBody] Sys_User user)
        {
            user.User_Id = UserContext.Current.UserId;

            _userRepository.Update(user, x => new { x.UserTrueName, x.Gender, x.Remark, x.HeadImageUrl }, true);
            return Content("修改成功");
        }
    }
}
