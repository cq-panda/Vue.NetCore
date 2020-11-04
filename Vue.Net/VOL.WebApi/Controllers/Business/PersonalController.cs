/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹PersonalController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using Business.IServices;
namespace Business.Controllers
{
    [Route("api/Personal")]
    [PermissionTable(Name = "Personal")]
    public partial class PersonalController : ApiBaseController<IPersonalService>
    {
        public PersonalController(IPersonalService service)
        : base(service)
        {
        }
    }
}

