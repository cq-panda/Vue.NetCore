/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹SellOrderController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.AppManager.IServices;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.Order.IServices;
namespace VOL.Order.Controllers
{
    [Route("api/SellOrder")]
    [PermissionTable(Name = "SellOrder")]
    public partial class SellOrderController : ApiBaseController<ISellOrderService>
    {
        public SellOrderController(ISellOrderService service)
        : base("Order","Sell","SellOrder", service)
        {
        }
    }
}

