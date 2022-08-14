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
using VOL.Core.ManageUser;

namespace VOL.System.Controllers
{
    public partial class Sys_WorkFlowController
    {
        private readonly ISys_WorkFlowService _service;//访问业务代码
        private readonly ISys_UserRepository _userRepository;
        private readonly ISys_RoleRepository _roleRepository;
        private readonly ISys_WorkFlowTableRepository _workFlowTableRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_WorkFlowController(
            ISys_WorkFlowService service,
            ISys_UserRepository userRepository,
        ISys_RoleRepository roleRepository,
               ISys_WorkFlowTableRepository workFlowTableRepository,
        IHttpContextAccessor httpContextAccessor
        )
        : base(service)
        {
            _service = service;
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _workFlowTableRepository = workFlowTableRepository;
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
                users = await _userRepository.FindAsIQueryable(x => true).Select(s => new { key = s.User_Id, value = s.UserTrueName }).ToListAsync(),
                roles = await _roleRepository.FindAsIQueryable(x => true).Select(s => new { key = s.Role_Id, value = s.RoleName }).ToListAsync(),
            };
            return Json(data);
        }
        /// <summary>
        /// 获取单据的审批流程进度
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet, Route("getSteps")]
        public async Task<IActionResult> GetSteps(string tableName, string id)
        {
            if (!WorkFlowManager.Exists(tableName)) return Json(new { });


            var user = UserContext.Current.UserInfo;
            var userQuery = _userRepository.FindAsIQueryable(x => 1 == 1);

            var data = await _workFlowTableRepository.FindAsIQueryable(x => x.WorkTable == tableName && x.WorkTableKey == id)
                 .Include(x => x.Sys_WorkFlowTableStep)
                 .Select(s => new
                 {
                     step = s.CurrentOrderId,
                     s.AuditStatus,
                     list = s.Sys_WorkFlowTableStep.OrderBy(o => o.OrderId)
                       .Select(c => new
                       {
                           c.AuditId,
                           Auditor = userQuery.Where(u => u.User_Id == c.StepValue).Select(u => u.UserTrueName).FirstOrDefault(),
                           c.AuditDate,
                           c.AuditStatus,
                         //  AuditStatus = c.AuditStatus ?? (int)AuditStatus.审核中,
                           c.Remark,
                           c.StepValue,
                           c.StepName,
                           c.OrderId,
                           //判断是按角色审批 还是用户帐号审批
                           isCurrentUser = s.AuditStatus == (int)AuditStatus.审核中 && c.OrderId == s.CurrentOrderId && (c.StepType == 1 ? user.User_Id : user.Role_Id) == c.StepValue,
                           isCurrent = s.AuditStatus == (int)AuditStatus.审核中 && c.OrderId == s.CurrentOrderId
                       })
                 }).FirstOrDefaultAsync();
            //获取用户名或者角色名待完
            if (data == null) return Json(new { });
            return Json(data);
        }

    }
}
