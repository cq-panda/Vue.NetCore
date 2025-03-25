using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Core.UserManager;
using VOL.Core.Utilities;
using VOL.Entity.AttributeManager;
using VOL.Entity.DomainModels;
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.System.Repositories;
using VOL.System.Services;

namespace VOL.System.Controllers
{
    [Route("api/role")]
    public partial class Sys_RoleController
    {
        private readonly ISys_RoleService _service;//访问业务代码
        private readonly ISys_RoleRepository _repository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_RoleController(
            ISys_RoleService service,
            ISys_RoleRepository repository,
            IHttpContextAccessor httpContextAccessor
        )
        : base(service)
        {
            _service = service;
            _repository = repository;
            _httpContextAccessor = httpContextAccessor;
        }


        [HttpPost, Route("getCurrentTreePermission")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        public async Task<IActionResult> GetCurrentTreePermission()
        {
            return Json(await Service.GetCurrentTreePermission());
        }

        [HttpPost, Route("getUserTreePermission")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        public async Task<IActionResult> GetUserTreePermission(int roleId)
        {
            return Json(await Service.GetUserTreePermission(roleId));
        }

        [HttpPost, Route("savePermission")]
        [ApiActionPermission(ActionPermissionOptions.Update)]
        public async Task<IActionResult> SavePermission([FromBody] List<UserPermissions> userPermissions, int roleId)
        {
            return Json(await Service.SavePermission(userPermissions, roleId));
        }

        /// <summary>
        /// 获取当前角色下的所有角色 
        /// </summary>
        /// <returns></returns>

        [HttpPost, Route("getUserChildRoles")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        public IActionResult GetUserChildRoles()
        {
            int roleId = UserContext.Current.RoleId;
            var data = RoleContext.GetAllChildren(UserContext.Current.RoleId);

            if (UserContext.Current.IsSuperAdmin)
            {
                return Json(WebResponseContent.Instance.OK(null, data));
            }
            //不是超级管理，将自己的角色查出来，在树形菜单上作为根节点
            var self = _repository.FindAsIQueryable(x => x.Role_Id == roleId)
                 .Select(s => new VOL.Core.UserManager.RoleNodes()
                 {
                     Id = s.Role_Id,
                     ParentId = 0,//将自己的角色作为root节点
                     RoleName = s.RoleName
                 }).ToList();
            data.AddRange(self);
            return Json(WebResponseContent.Instance.OK(null, data));
        }



        /// <summary>
        /// treetable 获取子节点数据(2021.05.02)
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission(ActionPermissionOptions.Search)]
        [HttpPost, Route("GetPageData")]
        public override ActionResult GetPageData([FromBody] PageDataOptions loadData)
        {
            //获取根节点数据(对应Sys_Role1.js中searchBefore方法)
            if (loadData.Value.GetInt() == 1)
            {
                return GetTreeTableRootData(loadData).Result;
            }
            return base.GetPageData(loadData);
        }

        /// <summary>
        /// treetable 获取子节点数据(2021.05.02)
        /// </summary>
        /// <returns></returns>
        [HttpPost, Route("getTreeTableRootData")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        public async Task<ActionResult> GetTreeTableRootData([FromBody] PageDataOptions options)
        {
            //页面加载根节点数据条件x => x.ParentId == 0,自己根据需要设置
            var query = _repository.FindAsIQueryable(x => true);
            if (UserContext.Current.IsSuperAdmin)
            {
                query = query.Where(x => x.ParentId == 0);
            }
            else
            {
                int roleId = UserContext.Current.RoleId;
                query = query.Where(x => x.Role_Id == roleId);
            }
            var queryChild = _repository.FindAsIQueryable(x => true);
            var rows = await query.TakeOrderByPage(options.Page, options.Rows)
                .OrderBy(x => x.Role_Id).Select(s => new
                {
                    s.Role_Id,
                    //   ParentId=0,
                    s.ParentId,
                    s.RoleName,
                    s.DeptName,
                    s.Dept_Id,
                    s.Enable,
                    s.CreateDate,
                    s.Creator,
                    s.Modifier,
                    s.ModifyDate,
                    s.OrderNo,
                    hasChildren = queryChild.Any(x => x.ParentId == s.Role_Id)
                }).ToListAsync();
            return JsonNormal(new { total = await query.CountAsync(), rows });
        }

        /// <summary>
        ///treetable 获取子节点数据(2021.05.02)
        /// </summary>
        /// <returns></returns>
        [HttpPost, Route("getTreeTableChildrenData")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        public async Task<ActionResult> GetTreeTableChildrenData(int roleId)
        {
            if (!UserContext.Current.IsSuperAdmin && roleId != UserContext.Current.RoleId && !RoleContext.GetAllChildren(UserContext.Current.RoleId).Any(x => x.Id == roleId))
            {
                return JsonNormal(new { rows = new object[] { } });
            }
            //点击节点时，加载子节点数据
            var roleRepository = Sys_RoleRepository.Instance.FindAsIQueryable(x => true);
            var rows = await roleRepository.Where(x => x.ParentId == roleId)
                .Select(s => new
                {
                    s.Role_Id,
                    s.ParentId,
                    s.RoleName,
                    s.DeptName,
                    s.Dept_Id,
                    s.Enable,
                    s.CreateDate,
                    s.Creator,
                    s.Modifier,
                    s.ModifyDate,
                    s.OrderNo,
                    hasChildren = roleRepository.Any(x => x.ParentId == s.Role_Id)
                }).ToListAsync();
            return JsonNormal(new { rows });
        }

    }
}


