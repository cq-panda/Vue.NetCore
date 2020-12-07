
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Controllers.Basic;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Infrastructure;
using VOL.Core.ManageUser;
using VOL.Core.ObjectActionValidator;
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
        [HttpPost, HttpGet, Route("login"), AllowAnonymous]
        [ObjectModelValidatorFilter(ValidatorModel.Login)]
        public async Task<IActionResult> Login([FromBody]LoginInfo loginInfo)
        {
            return Json(await Service.Login(loginInfo));
        }

        [HttpPost, Route("replaceToken"), AllowAnonymous]
        public async Task<IActionResult> ReplaceToken()
        {
            return Json(await Service.ReplaceToken());
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

        [HttpPost, Route("modifyPhone")]
        public IActionResult ModifyPhone(string newPhoneNo)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (string.IsNullOrEmpty(newPhoneNo) || string.IsNullOrEmpty(newPhoneNo))
            {
                return Json(webResponse.Error("参数不完整"));
            }
            if (newPhoneNo.Length !=11) return Json(webResponse.Error("手机号码错误"));

            ISys_UserRepository repository = Sys_UserRepository.Instance;
            Sys_User user = repository.FindFirst(x => x.User_Id == UserContext.Current.UserId);
            if (user == null)
            {
                return Json(webResponse.Error("用户不存在"));
            }
            user.PhoneNo = newPhoneNo;
            repository.Update(user, x => new { x.PhoneNo }, true);
            return Json(webResponse.OK("手机号码修改成功"));
        }


        [HttpPost, Route("modifyUserInfo")]
        public IActionResult ModifyUserInfo([FromBody] Sys_User userInfo)
        {
            WebResponseContent webResponse = new WebResponseContent();
            ISys_UserRepository repository = Sys_UserRepository.Instance;
            Sys_User user = repository.FindFirst(x => x.User_Id ==  UserContext.Current.UserId);
            if (user == null)
            {
                return Json(webResponse.Error("用户不存在"));
            }
            user.Address = userInfo.Address;
            user.Gender = userInfo.Gender;
            user.Remark = userInfo.Remark;
            user.UserTrueName = user.UserTrueName;
            repository.Update(user, x => new { x.Address, x.Gender, x.Remark, x.UserTrueName }, true);
            return Json(webResponse.OK("修改成功", userInfo));
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
    }
}
