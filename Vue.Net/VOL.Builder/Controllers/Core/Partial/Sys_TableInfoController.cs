using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.Builder.Controllers
{
    /// <summary>
    /// 限定权限只有角色1的才能访问
    /// </summary>
    [ActionPermission(1)]
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("Builder")]
    public partial class Sys_TableInfoController
    {
        [Route("Index")]
        public  override ActionResult Manager()
        {
            (string, string) treeData = Service.GetTableTree().Result;
            ViewData["TreeList"] = treeData.Item1;
            ViewData["NameSpaceArray"] = treeData.Item2;
            return View("~/Views/Builder/Manager.cshtml");
        }

        [Route("CreatePage")]
        public async Task<ActionResult> CreatePage([ModelBinder]Sys_TableInfo sysTableInfo)
        {
            return Content(await Task.Run(() => Service.CreatePage(sysTableInfo)));
        }

        [Route("CreateModel")]
        public async Task<ActionResult> CreateEntityModel([ModelBinder]Sys_TableInfo tableInfo)
        {
            return Content(await Task.Run(() => Service.CreateEntityModel(tableInfo)));
        }
        [Route("Eidt")]
        public async Task<ActionResult> SaveEidt([ModelBinder]Sys_TableInfo tableInfo)
        {
            return Json(await Task.Run(() => Service.SaveEidt(tableInfo)));
        }
        [Route("CreateServices")]
        public async Task<ActionResult> CreateServices(string tableName, string nameSpace, string foldername, bool? partial, bool? api)
        {
            return Content(await Task.Run(() => Service.CreateServices(tableName, nameSpace, foldername,true, false)));
        }
        [Route("LoadTableInfo")]
        public async Task<ActionResult> LoadTable(int parentId, string tableName, string columnCNName, string nameSpace, string foldername, int table_Id, bool isTreeLoad)
        {
            return Json(await Task.Run(() => Service.LoadTable(parentId, tableName, columnCNName, nameSpace, foldername, table_Id, isTreeLoad)));

        }
    }
}

