/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹test2019Controller编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.AppManager.IServices;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;

namespace VOL.AppManager.Controllers
{
    [Route("api/test2019")]
    [PermissionTable(Name = "test2019")]
    public partial class test2019Controller : ApiBaseController<Itest2019Service>
    {
        public test2019Controller(Itest2019Service service)
        : base("AppManager","App","test2019", service)
        {
        }
    }
}

