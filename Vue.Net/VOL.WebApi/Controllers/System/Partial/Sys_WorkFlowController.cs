/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Sys_WorkFlow",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.Entity.DomainModels;
using VOL.System.IServices;
using VOL.Core.WorkFlow;
using VOL.System.IRepositories;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace VOL.System.Controllers
{
    public partial class Sys_WorkFlowController
    {
        private readonly ISys_WorkFlowService _service;//访问业务代码
        private readonly ISys_UserRepository _userRepository;
        private readonly ISys_RoleRepository _roleRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_WorkFlowController(
            ISys_WorkFlowService service,
            ISys_UserRepository userRepository,
        ISys_RoleRepository roleRepository,
        IHttpContextAccessor httpContextAccessor
        )
        : base(service)
        {
            _service = service;
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _httpContextAccessor = httpContextAccessor;
        }
        /// <summary>
        /// 获取工作流程表数据源
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("getTableInfo")]
        public IActionResult GetTableInfo()
        {
            return Json(WorkFlowContainer.GetDic());
        }

        /// <summary>
        /// 获取流程节点数据源(用户与角色)
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("getNodeDic")]
        public async Task<IActionResult> GetNodeDic()
        {
            var data = new
            {
                users =await _userRepository.FindAsIQueryable(x => true).Select(s => new { key = s.User_Id, value = s.UserTrueName }).ToListAsync(),
                roles =await _roleRepository.FindAsIQueryable(x => true).Select(s => new { key = s.Role_Id, value = s.RoleName }).ToListAsync(),
            };
            return Json(data);
        }
    }
}
