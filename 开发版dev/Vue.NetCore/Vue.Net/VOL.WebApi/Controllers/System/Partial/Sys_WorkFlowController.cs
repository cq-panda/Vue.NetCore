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
using VOL.Core.Services;

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
                dept = new string[] { }//部门表，暂时没有
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
            var flow = await _workFlowTableRepository.FindAsIQueryable(x => x.WorkTable == tableName && x.WorkTableKey == id)
                               .Include(x => x.Sys_WorkFlowTableStep)
                               .FirstOrDefaultAsync();

            if (flow == null)
            {
                return Json(new { });
            }

            var user = UserContext.Current.UserInfo;
            List<int> stepValues = flow.Sys_WorkFlowTableStep.Select(s => s.StepValue ?? 0).ToList();

            var auditUsers = flow.Sys_WorkFlowTableStep.Where(x => x.AuditId > 0).Select(s => s.AuditId).ToArray();
            var users = await _userRepository.FindAsIQueryable(x => auditUsers.Contains(x.User_Id))
                                        .Select(u => new { u.User_Id, u.UserTrueName }).ToListAsync();

            var steps = flow.Sys_WorkFlowTableStep
                    .Select(c => new
                    {
                        c.AuditId,
                        Auditor = users.Where(us => us.User_Id == c.AuditId).Select(us => us.UserTrueName).FirstOrDefault(),
                        c.AuditDate,
                        c.AuditStatus,
                        c.Remark,
                        c.StepValue,
                        c.StepName,
                        c.OrderId,
                        c.Enable,
                        //判断是按角色审批 还是用户帐号审批
                        isCurrentUser = (c.AuditStatus ?? 0) == (int)AuditStatus.审核中 && c.OrderId == flow.CurrentOrderId && GetAuditStepValue(c.StepType) == c.StepValue,
                        isCurrent = c.OrderId == flow.CurrentOrderId && c.AuditStatus != (int)AuditStatus.审核通过
                    }).OrderBy(o => o.OrderId);
            var data = new
            {
                step = flow.CurrentOrderId,
                flow.AuditStatus,
                list = steps.Where(x => (x.Enable == null || x.Enable > 0)).ToList(),
                his = steps.Where(x => x.AuditId > 0 &&x.AuditStatus>0 && x.Enable == 0).ToList(),
            };

            return Json(data);
        }

        private int GetAuditStepValue(int? stepType)
        {
            if (stepType == (int)AuditType.角色审批)
            {
                return UserContext.Current.RoleId;
            }
            if (stepType == (int)AuditType.部门审批)
            {
                return UserContext.Current.UserInfo.DeptId;
            }
            //按用户审批
            return UserContext.Current.UserId;

        }
    }
}
