using DairyStar.Builder.IServices;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.WebApi.Controllers.Builder
{
    [JWTAuthorize]
    [Route("/api/Builder")]
    public class BuilderController : Controller
    {
        private ISys_TableInfoService Service;
        public BuilderController(ISys_TableInfoService service)
        {
            Service = service;
        }
        [HttpPost]
        [Route("GetTableTree")]
        //[ApiActionPermission(ActionRolePermission.SuperAdmin)]
        public async Task<ActionResult> GetTableTree()
        {
            try
            {
                (string, string) builderInfo = await Service.GetTableTree();
                return Json(new { list = builderInfo.Item1, nameSpace = builderInfo.Item2 });
            }
            catch (Exception ex)
            {

                return Json(new { list = ex.Message+ex.StackTrace+ex.Source, nameSpace = ex.InnerException?.Message});
            }
        }

        [Route("CreatePage")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> CreatePage([FromBody]Sys_TableInfo sysTableInfo)
        {
            return Content(await Task.Run(() => Service.CreatePage(sysTableInfo)));
        }
        [Route("CreateVuePage")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> CreateVuePage([FromBody]Sys_TableInfo sysTableInfo, string vuePath)
        {
            return Content(await Task.Run(() => Service.CreateVuePage(sysTableInfo, vuePath)));
        }
        [Route("CreateModel")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> CreateEntityModel([FromBody] Sys_TableInfo tableInfo)
        {
            return Content(await Task.Run(() => Service.CreateEntityModel(tableInfo)));
        }
        [Route("Save")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> SaveEidt([FromBody] Sys_TableInfo tableInfo)
        {
            return Json(await Task.Run(() => Service.SaveEidt(tableInfo)));
        }
        [Route("CreateServices")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> CreateServices(string tableName, string nameSpace, string foldername, bool? partial, bool? api)
        {
            return Content(await Task.Run(() => Service.CreateServices(tableName, nameSpace, foldername, false, true)));
        }
        [Route("LoadTableInfo")]
        [HttpPost]
        public async Task<ActionResult> LoadTable(int parentId, string tableName, string columnCNName, string nameSpace, string foldername, int table_Id, bool isTreeLoad)
        {
            return Json(await Task.Run(() => Service.LoadTable(parentId, tableName, columnCNName, nameSpace, foldername, table_Id, isTreeLoad)));

        }
        [Route("delTree")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [HttpPost]
        public async Task<ActionResult> DelTree(int table_Id)
        {
            return Json(await Service.DelTree(table_Id));
        }
    }
}
