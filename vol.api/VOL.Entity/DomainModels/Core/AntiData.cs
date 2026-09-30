using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class AntiData
    {
        /// <summary>
        /// 审批的主键
        /// </summary>
        public object Key { get; set; }
        /// <summary>
        /// 审批意见
        /// </summary>
        public string AuditReason { get; set; }

        /// <summary>
        /// 是否审批流程
        /// </summary>
        public bool IsFlow { get; set; }

        /// <summary>
        /// 退回节点
        /// </summary>
        public string StepId { get; set; }
    }
}
