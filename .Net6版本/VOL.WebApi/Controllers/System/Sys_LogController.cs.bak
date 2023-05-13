using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.DBManager;
using VOL.Entity.DomainModels;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    [Route("api/Sys_Log")]
    public partial class Sys_LogController : ApiBaseController<ISys_LogService>
    {
        public Sys_LogController(ISys_LogService service)
        : base("System", "System", "Sys_Log", service)
        {
        }
        [Route("test"), AllowAnonymous, HttpGet]
        public IActionResult Test()
        {
            string mess = "";
            try
            {
                List<Sys_Log> list = new List<Sys_Log>();
                for (int i = 0; i < 10; i++)
                {
                    list.Add(new Sys_Log()
                    {
                        BeginDate = DateTime.Now,
                        RequestParameter = i + ""
                    }); ;
                }
                DBServerProvider.SqlDapper.AddRange<Sys_Log>(list);

                List<App_Appointment> list1 = new List<App_Appointment>();
                for (int i = 0; i < 10; i++)
                {
                    list1.Add(new App_Appointment()
                    {
                        Id = Guid.NewGuid(),
                        Describe="111",
                        Name="222",
                        PhoneNo="333",
                        Creator = i.ToString()
                    }); ;
                }
                DBServerProvider.SqlDapper.AddRange<App_Appointment>(list1);

                //  DBServerProvider.SqlDapper.BulkInsert<Sys_Log>(list);
            }
            catch (Exception ex)
            {

                mess = ex.Message + ex.StackTrace;
            }
            return Content("11" + mess);

        }
    }
}
