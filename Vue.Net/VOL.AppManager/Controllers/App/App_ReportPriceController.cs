/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.AppManager.IServices;
using VOL.Core.Controllers.Basic;
using Microsoft.AspNetCore.Mvc;

namespace VOL.AppManager.Controllers
{
    public partial class App_ReportPriceController : WebBaseController<IApp_ReportPriceService>
    {
        public App_ReportPriceController(IApp_ReportPriceService service)
        : base("AppManager","App","App_ReportPrice", service)
        {
        }
    }
}

