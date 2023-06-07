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
    [Entity(TableCnName = "审批流程",TableName = "Sys_WorkFlowTable",DetailTable =  new Type[] { typeof(Sys_WorkFlowTableStep)},DetailTableCnName = "审批节点")]
    public partial class Sys_WorkFlowTable:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="WorkFlowTable_Id")]
       [Column(TypeName="uniqueidentifier")]
       [Required(AllowEmptyStrings=false)]
       public Guid WorkFlowTable_Id { get; set; }

       /// <summary>
       ///流程id
       /// </summary>
       [Display(Name ="流程id")]
       [Column(TypeName="uniqueidentifier")]
       public Guid? WorkFlow_Id { get; set; }

       /// <summary>
       ///流程名称
       /// </summary>
       [Display(Name ="流程名称")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string WorkName { get; set; }

       /// <summary>
       ///表主键id
       /// </summary>
       [Display(Name ="表主键id")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string WorkTableKey { get; set; }

       /// <summary>
       ///表名
       /// </summary>
       [Display(Name ="表名")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string WorkTable { get; set; }

       /// <summary>
       ///业务名称
       /// </summary>
       [Display(Name ="业务名称")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string WorkTableName { get; set; }

       /// <summary>
       ///审核节点ID
       /// </summary>
       [Display(Name ="审核节点ID")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string CurrentStepId { get; set; }

       /// <summary>
       ///审核节点名称
       /// </summary>
       [Display(Name ="审核节点名称")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string StepName { get; set; }

       /// <summary>
       ///不用
       /// </summary>
       [Display(Name ="不用")]
       [Column(TypeName="int")]
       public int? CurrentOrderId { get; set; }

       /// <summary>
       ///审批状态
       /// </summary>
       [Display(Name ="审批状态")]
       [Column(TypeName="int")]
       public int? AuditStatus { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Enable")]
       [Column(TypeName="tinyint")]
       public byte? Enable { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Modifier")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Modifier { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyDate")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       [Display(Name ="审批节点")]
       [ForeignKey("WorkFlowTable_Id")]
       public List<Sys_WorkFlowTableStep> Sys_WorkFlowTableStep { get; set; }

    }
}