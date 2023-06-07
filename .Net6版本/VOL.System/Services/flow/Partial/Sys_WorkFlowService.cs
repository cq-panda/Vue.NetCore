/*
 *所有关于Sys_WorkFlow类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_WorkFlowService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.System.IRepositories;
using System.Collections.Generic;
using VOL.Core.WorkFlow;
using System;
using VOL.System.Repositories;

namespace VOL.System.Services
{
    public partial class Sys_WorkFlowService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISys_WorkFlowRepository _repository;//访问数据库
        private readonly ISys_WorkFlowStepRepository _stepRepository;
        [ActivatorUtilitiesConstructor]
        public Sys_WorkFlowService(
            ISys_WorkFlowRepository dbRepository,
            IHttpContextAccessor httpContextAccessor,
            ISys_WorkFlowStepRepository stepRepository
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            _stepRepository = stepRepository;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }

        WebResponseContent webResponse = new WebResponseContent();
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            saveDataModel.MainData["Enable"] = 1;


            AddOnExecuting = (Sys_WorkFlow workFlow, object list) =>
            {
                workFlow.WorkFlow_Id = Guid.NewGuid();

                webResponse= WorkFlowContainer.Instance.AddTable(workFlow, list as List<Sys_WorkFlowStep>);
                if (!webResponse.Status)
                {
                    return webResponse;
                }
                return webResponse.OK();
            };

            AddOnExecuted = (Sys_WorkFlow workFlow, object list) =>
            {
                return webResponse.OK();
            };
            return base.Add(saveDataModel);
        }

        public override WebResponseContent Update(SaveModel saveModel)
        {
            Sys_WorkFlow flow = null;
            UpdateOnExecuting = (Sys_WorkFlow workFlow, object addList, object updateList, List<object> delKeys) =>
            {
                flow = workFlow;
                if ((flow.AuditingEdit ?? 0) == 0)
                {
                    if (Sys_WorkFlowTableRepository.Instance.Exists(x=>x.WorkFlow_Id==flow.WorkFlow_Id&&(x.AuditStatus == (int)AuditStatus.审核中)))
                    {
                        return webResponse.Error("当前流程有审核中的数据，不能修改,可以修改,流程中的【审核中数据是否可以编辑】属性");
                    }
                }

                //新增的明细
                List<Sys_WorkFlowStep> add = addList as List<Sys_WorkFlowStep>;
                var stepsClone = add.Serialize().DeserializeObject<List<Sys_WorkFlowStep>>();
                add.Clear();

                var steps = _stepRepository.FindAsIQueryable(x => x.WorkFlow_Id == workFlow.WorkFlow_Id)
                 .Select(s => new { s.WorkStepFlow_Id, s.StepId })
                 .ToList();
                //删除的节点
                var delIds = steps.Where(x => !stepsClone.Any(c => c.StepId == x.StepId))
                 .Select(s => s.WorkStepFlow_Id).ToList();
                delKeys.AddRange(delIds.Select(s=>s as object));

                //新增的节点
                var newSteps = stepsClone.Where(x => !steps.Any(c => c.StepId == x.StepId))
                .ToList();
                add.AddRange(newSteps);

                List<Sys_WorkFlowStep> update = updateList as List<Sys_WorkFlowStep>;
                //修改的节点
                var updateSteps = stepsClone.Where(x => steps.Any(c => c.StepId == x.StepId))
                .ToList();
                update.AddRange(updateSteps);
                updateSteps.ForEach(x =>
                {
                    x.WorkStepFlow_Id = steps.Where(c => c.StepId == x.StepId).Select(s => s.WorkStepFlow_Id).FirstOrDefault();
                    foreach (var item in saveModel.DetailData)
                    {
                        if (item["StepId"].ToString() == x.StepId)
                        {
                            item["WorkFlow_Id"] = workFlow.WorkFlow_Id;
                            item["WorkStepFlow_Id"] = x.WorkStepFlow_Id;
                        }
                    }
                });
                return webResponse.OK();
            };


            webResponse= base.Update(saveModel);
            if (webResponse.Status)
            {
                flow= repository.FindAsIQueryable(x => x.WorkFlow_Id == flow.WorkFlow_Id).Include(x=>x.Sys_WorkFlowStep).FirstOrDefault();
                webResponse = WorkFlowContainer.Instance.AddTable(flow,flow.Sys_WorkFlowStep);
            }
            return webResponse;
        }

        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            
            webResponse= base.Del(keys, delList);
            if (webResponse.Status)
            {
                WorkFlowContainer.DelRange(keys.Select(s=>(Guid)s.GetGuid()).ToArray());
            }
            return webResponse;
        }
    }
}
