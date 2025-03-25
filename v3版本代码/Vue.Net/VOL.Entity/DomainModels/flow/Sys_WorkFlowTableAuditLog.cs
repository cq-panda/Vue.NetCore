/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果数据库字段发生变化，请在代码生器重新生成此Model
 */
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [Entity(TableCnName = "审批记录",TableName = "Sys_WorkFlowTableAuditLog")]
    public partial class Sys_WorkFlowTableAuditLog:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="Id")]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid Id { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="WorkFlowTable_Id")]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? WorkFlowTable_Id { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="WorkFlowTableStep_Id")]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? WorkFlowTableStep_Id { get; set; }

       /// <summary>
       ///节点id
       /// </summary>
       [Display(Name ="节点id")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string StepId { get; set; }

       /// <summary>
       ///节点名称
       /// </summary>
       [Display(Name ="节点名称")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       public string StepName { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="AuditId")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditId { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Auditor")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Auditor { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="AuditStatus")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditStatus { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="AuditResult")]
       [MaxLength(1000)]
       [Column(TypeName="nvarchar(1000)")]
       [Editable(true)]
       public string AuditResult { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="AuditDate")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? AuditDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Remark")]
       [MaxLength(1000)]
       [Column(TypeName="nvarchar(1000)")]
       [Editable(true)]
       public string Remark { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateDate")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? CreateDate { get; set; }

       
    }
}