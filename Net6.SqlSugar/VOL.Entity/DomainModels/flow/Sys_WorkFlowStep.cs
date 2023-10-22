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
using SqlSugar;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [Entity(TableCnName = "审批节点配置",TableName = "Sys_WorkFlowStep")]
    public partial class Sys_WorkFlowStep:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [SugarColumn(IsPrimaryKey = true)]
       [Key]
       [Display(Name ="WorkStepFlow_Id")]
       [Column(TypeName="uniqueidentifier")]
       [Required(AllowEmptyStrings=false)]
       public Guid WorkStepFlow_Id { get; set; }

       /// <summary>
       ///流程主表id
       /// </summary>
       [Display(Name ="流程主表id")]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? WorkFlow_Id { get; set; }

       /// <summary>
       ///流程节点Id
       /// </summary>
       [Display(Name ="流程节点Id")]
       [MaxLength(100)]
       [Column(TypeName="varchar(100)")]
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
       ///节点类型(1=按用户审批,2=按角色审批)
       /// </summary>
       [Display(Name ="节点类型(1=按用户审批,2=按角色审批)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? StepType { get; set; }

       /// <summary>
       ///审批用户id或角色id
       /// </summary>
       [Display(Name ="审批用户id或角色id")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       [Editable(true)]
       public string StepValue { get; set; }

       /// <summary>
       ///备注
       /// </summary>
       [Display(Name ="备注")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string Remark { get; set; }

       /// <summary>
       ///审批顺序
       /// </summary>
       [Display(Name ="审批顺序")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? OrderId { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Enable")]
       [Column(TypeName="tinyint")]
       public byte? Enable { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///下一个审批节点
       /// </summary>
       [Display(Name ="下一个审批节点")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       [Editable(true)]
       public string NextStepIds { get; set; }

       /// <summary>
       ///父级节点
       /// </summary>
       [Display(Name ="父级节点")]
       [MaxLength(2000)]
       [Column(TypeName="varchar(2000)")]
       [Editable(true)]
       public string ParentId { get; set; }

       /// <summary>
       ///审核未通过(返回上一节点,流程重新开始,流程结束)
       /// </summary>
       [Display(Name ="审核未通过(返回上一节点,流程重新开始,流程结束)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditRefuse { get; set; }

       /// <summary>
       ///驳回(返回上一节点,流程重新开始,流程结束)
       /// </summary>
       [Display(Name ="驳回(返回上一节点,流程重新开始,流程结束)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditBack { get; set; }

       /// <summary>
       ///审批方式(启用会签)
       /// </summary>
       [Display(Name ="审批方式(启用会签)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditMethod { get; set; }

       /// <summary>
       ///审核后发送邮件通知
       /// </summary>
       [Display(Name ="审核后发送邮件通知")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? SendMail { get; set; }

       /// <summary>
       ///审核条件
       /// </summary>
       [Display(Name ="审核条件")]
       [MaxLength(4000)]
       [Column(TypeName="nvarchar(4000)")]
       [Editable(true)]
       public string Filters { get; set; }

       /// <summary>
       ///节点属性(start、node、end))
       /// </summary>
       [Display(Name ="节点属性(start、node、end))")]
       [MaxLength(50)]
       [Column(TypeName="varchar(50)")]
       [Editable(true)]
       public string StepAttrType { get; set; }

       /// <summary>
       ///权重(相同条件权重大的优先匹配)
       /// </summary>
       [Display(Name ="权重(相同条件权重大的优先匹配)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Weight { get; set; }

       
    }
}