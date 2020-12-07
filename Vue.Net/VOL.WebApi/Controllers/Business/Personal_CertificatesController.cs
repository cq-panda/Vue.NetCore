/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹Personal_CertificatesController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using Business.IServices;
namespace Business.Controllers
{
    [Route("api/Personal_Certificates")]
    [PermissionTable(Name = "Personal_Certificates")]
    public partial class Personal_CertificatesController : ApiBaseController<IPersonal_CertificatesService>
    {
        public Personal_CertificatesController(IPersonal_CertificatesService service)
        : base(service)
        {
        }
    }
}

