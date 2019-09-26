using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Entity.DomainModels;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    public class HomeController : Controller
    {
        private ISys_MenuService Service;
        public HomeController(ISys_MenuService service)
        {
            this.Service = service;
        }
        [ActionPermission()]
        public IActionResult Index()
        {
            ViewBag.MenuList = JsonConvert.SerializeObject(Service.GetCurrentMenuActionList().Result);
            List<AuditInfo> list = new List<AuditInfo>() {
                 new AuditInfo(){
                      qty=100,
                       tb="App_Expert"
                 },
                 new AuditInfo(){
                      qty=75,
                       tb="App_Question"
                 },
                 new AuditInfo(){
                      qty=52,
                       tb="App_ReportPrice"
                 }
             };

            ViewBag.AuditInfo = JsonConvert.SerializeObject(list);
            ViewBag.AuditQty = list.Count > 0 ? list.Sum(x => x.qty) : 0;
            return View("~/Views/System/Index.cshtml");
        }
    }

    public class AuditInfo
    {
        public string tb { get; set; }
        public int qty { get; set; }
    }
}
