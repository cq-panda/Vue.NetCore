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
using VOL.Sys.IServices;
using VOL.Core.WorkFlow;
using VOL.Sys.IRepositories;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Infrastructure;
using VOL.Core.DBManager;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using VOL.Core.Extensions;
using VOL.Core.UserManager;
using System.Linq.Expressions;
using VOL.Core.Configuration;
using VOL.Core.Filters;

namespace VOL.Sys.Controllers
{
    public partial class Sys_WorkFlowController
    {
        private readonly ISys_WorkFlowService _service;//访问业务代码
        private readonly ISys_UserRepository _userRepository;
        private readonly ISys_RoleRepository _roleRepository;
        private readonly ISys_DepartmentRepository _departmentRepository;
        private readonly ISys_WorkFlowRepository _workFlowRepository;
        private readonly ISys_WorkFlowTableRepository _workFlowTableRepository;
        private readonly ISys_WorkFlowTableStepRepository _workFlowTableStepRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_WorkFlowController(
            ISys_WorkFlowService service,
            ISys_UserRepository userRepository,
            ISys_RoleRepository roleRepository,
            ISys_WorkFlowRepository workFlowRepository,
            ISys_WorkFlowTableRepository workFlowTableRepository,
            IHttpContextAccessor httpContextAccessor,
            ISys_DepartmentRepository departmentRepository,
            ISys_WorkFlowTableStepRepository workFlowTableStepRepository
        )
        : base(service)
        {
            _service = service;
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _departmentRepository = departmentRepository;
            _workFlowRepository = workFlowRepository;
            _workFlowTableRepository = workFlowTableRepository;
            _workFlowTableStepRepository = workFlowTableStepRepository;
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
            var userQuery = _userRepository.FindAsIQueryable(x => true);
            var roleQuery = _roleRepository.FindAsIQueryable(x => true);
            var deptQuery = _departmentRepository.FindAsIQueryable(x => true);
            var data = new
            {
                users = await userQuery.Select(s => new { key = s.User_Id, value = s.UserTrueName }).Take(5000).ToListAsync(),
                roles = await roleQuery.Select(s => new { key = s.Role_Id, value = s.RoleName }).ToListAsync(),
                dept = await deptQuery.Select(s => new { key = s.DepartmentId, value = s.DepartmentName }).ToListAsync(),
            };
            return Json(data);
        }


        private async Task<List<Sys_WorkFlowTableAuditLog>> GetLogAsync(Expression<Func<Sys_WorkFlowTableAuditLog, bool>> expression)
        {
            var logs = await _workFlowTableRepository.DbContext.Set<Sys_WorkFlowTableAuditLog>()
                  .Where(expression)//(x => x.WorkFlowTable_Id == flow.WorkFlowTable_Id)
                  .OrderBy(x => x.CreateDate)
                  .ToListAsync();
            return logs;
        }

        /// <summary>
        /// 获取单据的审批流程进度
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost, Route("getSteps")]
        public async Task<IActionResult> GetSteps([FromBody] List<string> ids, string tableName, bool isAnti)
        {
            if (ids == null || ids.Count == 0)
            {
                return Json(new { status = false, message = "请选择数据" });
            }
            var flows = await _workFlowTableRepository.FindAsIQueryable(x => x.WorkTable == tableName && ids.Contains(x.WorkTableKey))
                               .Include(x => x.Sys_WorkFlowTableStep)
                               .ToListAsync();
            var auditDic = DictionaryManager.GetDictionary("audit")?.Sys_DictionaryList?.Select(s => new { key = s.DicValue, value = s.DicName });
            List<Sys_WorkFlowTableAuditLog> logs;

            //不在审核中的数据
            if (flows.Count == 0)
            {
                logs = await GetLogAsync(x => x.StepId == ids[0] && x.StepName == tableName);
                return Json(new { status = true, logs, auditDic });
            }
            if (flows.Count > 1 || flows.Count != ids.Count)
            {
                return Json(new { status = false, message = "只能选择一条数据进行审核" });
            }

            if (ids.Count > 1 && isAnti)
            {
                return Json(new { status = false, message = "只能选择一行数据反审" });
            }


            var flow = flows[0];
            var user = UserContext.Current.UserInfo;

            Expression<Func<Sys_WorkFlowTableAuditLog, bool>> expression;
            if (isAnti)
            {
                expression = x => x.StepId == ids[0] && x.StepName == tableName;
            }
            else
            {
                expression = x => x.WorkFlowTable_Id == flow.WorkFlowTable_Id;
            }
            logs = await GetLogAsync(expression);
            //未审批时的用户信息
            var unauditSteps = flow.Sys_WorkFlowTableStep
                .Where(x => (x.AuditId == null || x.AuditId == 0) && x.StepType == (int)AuditType.用户审批)
                .Select(s => new { s.Sys_WorkFlowTableStep_Id, userIds = s.StepValue.Split(",").Select(s => s.GetInt()) }
                ).ToList();

            var unauditUsers = unauditSteps.SelectMany(c => c.userIds).ToList();
            List<(int userId, string userName)> userInfo = new List<(int userId, string userName)>();
            if (unauditUsers.Count > 0)
            {
                userInfo = (await _userRepository.FindAsIQueryable(x => unauditUsers.Contains(x.User_Id))
                                        .Select(u => new { u.User_Id, u.UserTrueName }).ToListAsync())
                                        .Select(c => (c.User_Id, c.UserTrueName)).ToList();
            }

            int currentOrderId = flow.Sys_WorkFlowTableStep.Where(x => x.StepId == flow.CurrentStepId)
                .Select(s => s.OrderId).FirstOrDefault() ?? 0;
            string GetAuditUsers(int? StepType, string StepValue, Guid Sys_WorkFlowTableStep_Id)
            {
                if (StepType == (int)AuditType.角色审批)
                {
                    int roleId = StepValue.GetInt();
                    return RoleContext.GetAllRoleId().Where(c => c.Id == roleId).Select(c => c.RoleName).FirstOrDefault();
                }
                //按部门审批
                if (StepType == (int)AuditType.部门审批)
                {
                    var deptId = StepValue.GetGuid();
                    return DepartmentContext.GetAllDept().Where(c => c.id == deptId).Select(c => c.value).FirstOrDefault();
                }
                var userIds = unauditSteps.Where(c => c.Sys_WorkFlowTableStep_Id == Sys_WorkFlowTableStep_Id)
                      .Select(c => c.userIds).FirstOrDefault();
                if (userIds == null)
                {
                    return "";
                }
                return string.Join("/", userInfo.Where(c => userIds.Contains(c.userId)).Select(s => s.userName));
            }

            bool CheckCurrentUser(Sys_WorkFlowTableStep c)
            {
                bool b = (c.AuditStatus == null || c.AuditStatus == (int)AuditStatus.审核中 || c.AuditStatus == (int)AuditStatus.待审核)
                                              && c.StepId == flow.CurrentStepId && GetAuditStepValue(c.StepType, c.StepValue);
                return b;
            }
            string currentSetpId = null;
            object GetStep(string stepId)
            {
                var list = flow.Sys_WorkFlowTableStep.Where(x => x.StepId == stepId)
                    .OrderByDescending(x => x.AuditDate)
                    .Select(c => new
                    {
                        c.WorkFlowTable_Id,
                        c.Sys_WorkFlowTableStep_Id,
                        c.AuditId,
                        c.StepType,
                        Auditor = c.Auditor ?? GetAuditUsers(c.StepType, c.StepValue, c.Sys_WorkFlowTableStep_Id),
                        //Auditor = auditor,
                        c.AuditDate,
                        c.AuditStatus,
                        c.Remark,
                        c.StepValue,
                        c.StepName,
                        c.OrderId,
                        c.Enable,
                        c.StepId,
                        c.StepAttrType,
                        c.CreateDate,
                        c.Creator,
                        //判断是按角色审批 还是用户帐号审批
                        isCurrentUser = CheckCurrentUser(c)
                        && (flow.AuditStatus == null || flow.AuditStatus == (int)AuditStatus.审核中 || flow.AuditStatus == (int)AuditStatus.待审核),
                        isCurrent = c.StepId == flow.CurrentStepId
                        && (flow.AuditStatus == null || flow.AuditStatus == (int)AuditStatus.审核中 || flow.AuditStatus == (int)AuditStatus.待审核)
                    }).ToList();

                if (currentSetpId == null)
                {
                    currentSetpId = list.Where(x => x.isCurrentUser).Select(s => s.StepId).FirstOrDefault();
                }

                if (list.Count == 1)
                {
                    return list[0];
                }
                //这里必须要用isCurrentUser排序，否则多人审批时，看不到当前人的数据
                var id = list.OrderByDescending(x => x.isCurrentUser).ThenByDescending(x => x.AuditDate).Select(x => x.Sys_WorkFlowTableStep_Id).FirstOrDefault();
                return list.Where(x => x.Sys_WorkFlowTableStep_Id == id)
                    .Select(c => new
                    {
                        c.WorkFlowTable_Id,
                        c.Sys_WorkFlowTableStep_Id,
                        c.AuditId,
                        AuditList =
                        list.OrderByDescending(x => x.AuditDate)
                        .Where(x => x.StepId == c.StepId && !string.IsNullOrEmpty(x.Auditor)
                        //如果是审批过的数据，只显示多人审批过的数据
                        && (x.OrderId >= currentOrderId ? true : x.AuditDate != null)
                        ).Select(x => new { id = x.Sys_WorkFlowTableStep_Id, x.StepType, x.StepValue, x.Auditor, x.AuditDate, x.AuditStatus }),
                        c.Auditor,
                        c.AuditDate,
                        c.AuditStatus,
                        c.Remark,
                        c.StepValue,
                        c.StepName,
                        c.OrderId,
                        c.Enable,
                        c.StepId,
                        c.StepAttrType,
                        c.StepType,
                        c.CreateDate,
                        c.Creator,
                        //这里还需要处理下
                        c.isCurrentUser,
                        c.isCurrent
                    }).First();
            }

            var steps = flow.Sys_WorkFlowTableStep
                 .OrderBy(o => o.OrderId)
                .GroupBy(x => x.StepId)
                .Select(c => GetStep(c.Key)).ToList();
            object form = await WorkFlowManager.GetAuditFormDataAsync(ids[0], tableName);
            object attachInfo = null;
            var data = new
            {
                status = true,
                step = flow.CurrentStepId,
                flow.AuditStatus,
                auditDic,// = DictionaryManager.GetDictionary("audit")?.Sys_DictionaryList?.Select(s => new { key = s.DicValue, value = s.DicName }),
                list = steps,//.OrderBy(x => x.OrderId).ToList(),
                logs,
                form,
                attachInfo
            };

            return Json(data);
        }
        [HttpPost, Route("getFields")]
        public async Task<IActionResult> GetFields(string table)
        {
            var query = _workFlowTableRepository.DbContext.Set<Sys_TableColumn>().Where(c => c.TableName == table);
            var fields = WorkFlowContainer.GetFilterFields(table);
            if (fields != null && fields.Length > 0)
            {
                query = query.Where(x => fields.Contains(x.ColumnName));
            }
            else
            {
                query = query.Where(x => x.IsDisplay == 1);
            }
            var columns = await query.OrderByDescending(c => c.OrderNo)
                 .Select(s => new
                 {
                     field = s.ColumnName,
                     name = s.ColumnCnName,
                     dicNo = s.DropNo,
                     s.ColumnType
                 }).ToListAsync();


            var data = columns.Select(s => new
            {
                s.field,
                s.name,
                s.dicNo,
                columnType = s.ColumnType,
                data = string.IsNullOrEmpty(s.dicNo)
                ? null
                : DictionaryManager.GetDictionary(s.dicNo)?.Sys_DictionaryList?.Select(c => new { key = c.DicValue, value = c.DicName })?.ToList()
            }).ToList();
            return JsonNormal(data);

        }

        private bool GetAuditStepValue(int? stepType, string stepValue)
        {
            if (stepType == (int)AuditType.角色审批)
            {
                return UserContext.Current.RoleId==stepValue.GetInt();
            }
            //按部门审批
            if (stepType == (int)AuditType.部门审批)
            {
                return UserContext.Current.UserInfo.DeptIds.Select(s => s.ToString()).Contains(stepValue);
            }
            //按用户审批
            return UserContext.Current.UserId.ToString() == stepValue;

        }
        [Route("getOptions"), HttpGet]
        public async Task<IActionResult> GetOptions(Guid id)
        {
            var data = await _workFlowRepository.FindAsIQueryable(x => x.WorkFlow_Id == id)
                .Include(c => c.Sys_WorkFlowStep)
                .FirstOrDefaultAsync();
            return JsonNormal(data);
        }
        [ApiActionPermission()]
        public override ActionResult Audit([FromBody] object[] id, int? auditStatus, string auditReason)
        {
            return base.Audit(id, auditStatus, auditReason);
        }
        [ApiActionPermission()]
        public override IActionResult Upload(IEnumerable<IFormFile> fileInput)
        {
            return base.Upload(fileInput);
        }
    }
    public enum SignType
    {
        current,
        before,
        after
    }
    public class SignInfo
    {
        public string SignType { get; set; }
        //      signType: null, //加签方式
        public int AuditMethod { get; set; }
        //auditMethod: null, //审批方式
        //auditType: null, //审批类型
        public int AuditType { get; set; }
        /// <summary>
        /// 审批流程id
        /// </summary>

        public Guid WorkFlowTable_Id { get; set; }
        /// <summary>
        /// 当前审批Sys_WorkFlowTableStep的表主键id
        /// </summary>
        public Guid? CurrentWorkFlowTableStep_Id { get; set; }


        /// <summary>
        /// 当前审批的节点编号
        /// </summary>
        public string CurrentStepId { get; set; }

        //rows: [] //审批人数据
        public List<Sys_WorkFlowTableStep> Rows { get; set; }

        //前后加签的名字
        public string StepName { get; set; }
    }
}
