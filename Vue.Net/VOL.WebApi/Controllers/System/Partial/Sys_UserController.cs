
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Filters;
using VOL.Core.Infrastructure;
using VOL.Core.ObjectActionValidator;
using VOL.Entity.AttributeManager;
using VOL.Entity.DomainModels;
using VOL.System.IServices;

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
    }
}
