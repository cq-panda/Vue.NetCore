using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Core.ObjectActionValidator;
using VOL.Entity.DomainModels;

namespace VOL.WebApi.Controllers
{
    /// <summary>
    ///1、普通参数校验只需要标识属性：[ObjectGeneralValidatorFilter(ValidatorGeneral.xxx,ValidatorGeneral.xxx)]，
    ///需要在ValidatorGeneral枚举中添加枚举值(参数名)，并在UseMethodsGeneralParameters方法中注入进去即可在任何地方重复使用
    /// 
    /// 2、model校验只需要标识属性[ObjectModelValidatorFilter(ValidatorModel.xxx)]
    /// 需要在ValidatorModel枚举中添加枚举值(参数名)，
    /// 并在UseMethodsModelParameters方法中注入进去(注入时可以指定需要验证的字段)即可在任何地方重复使用
    /// --如果其他方法使用的是同一个model，但验证的字段不同，在ValidatorModel重新添加一个枚举值，
    /// --并在UseMethodsModelParameters方法注入,添加新的指定字段即可
    /// </summary>
    [JWTAuthorize, ApiController]
    [Route("validatorExample")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ObjectActionValidatorExampleController: Controller
    {
        public ObjectActionValidatorExampleController()
        { 
        
        }

        /// <summary>
        /// 验证UserName与PhoneNo为必填
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phoneNo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("test1")]
        [ObjectGeneralValidatorFilter(ValidatorGeneral.UserName,ValidatorGeneral.PhoneNo)]
        public IActionResult Test1(string userName,string phoneNo)
        {
            return Json("参数验证通过");
        }

        /// <summary>
        /// 验证PhoneNo为必填
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phoneNo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("test2")]
        [ObjectGeneralValidatorFilter(ValidatorGeneral.PhoneNo)]
        public IActionResult Test2(string userName, string phoneNo)
        {
            return Json("参数验证通过");
        }


        /// <summary>
        /// 验证字符长度与值大小
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phoneNo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("test3")]
        [ObjectGeneralValidatorFilter(ValidatorGeneral.Local, ValidatorGeneral.Qty)]
        public IActionResult Test3(string local, string qty)
        {
            return Json("参数验证通过");
        }

        /// <summary>
        /// Login配置的规则用户名与密码必填
        /// </summary>
        /// <param name="loginInfo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("Test4")]
        [ObjectModelValidatorFilter(ValidatorModel.Login)]
        public IActionResult Test4([FromBody]LoginInfo loginInfo)
        {
            return Json("参数验证通过");
        }

        /// <summary>
        /// LoginOnlyPassWord配置的规则密码必填
        /// </summary>
        /// <param name="loginInfo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("Test5")]
        [ObjectModelValidatorFilter(ValidatorModel.LoginOnlyPassWord)]
        public IActionResult Test5([FromBody]LoginInfo loginInfo)
        {
            return Json("参数验证通过");
        }


        /// <summary>
        /// 同时验证实体LoginInfo与单个参数phoneNo
        ///  Login配置的规则用户名与密码必填,手机号必填
        /// </summary>
        /// <param name="loginInfo"></param>
        /// <returns></returns>
        [HttpPost, HttpGet, Route("Test6")]
        [ObjectModelValidatorFilter(ValidatorModel.Login)]
        [ObjectGeneralValidatorFilter(ValidatorGeneral.PhoneNo)]
        public IActionResult Test6([FromBody]LoginInfo loginInfo, string phoneNo)
        {
            return Json("参数验证通过");
        }
    }
}
