/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Personal_Certificates",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Entity.DomainModels;
using VOL.Entity.ViewModels;

namespace Business.Controllers
{
    public partial class Personal_CertificatesController
    {
        [HttpPost, Route("idCardOCR")]
        public async Task<IActionResult> IdCardOCR([FromBody]Personal_Certificates personal_Certificates)
        {
            return Json(await Service.OCR(personal_Certificates));
        }

        [HttpPost, Route("saveIdCardOCR")]
        public async Task<IActionResult> SaveIdCardOCR([FromBody] IDCardInfo idCardOCR)
        {
            return Json(await Service.SaveOCRInfo(idCardOCR));
        }
    }
}
