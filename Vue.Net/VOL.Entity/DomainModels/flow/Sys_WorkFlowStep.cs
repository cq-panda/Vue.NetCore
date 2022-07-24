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
    [Entity(TableCnName = "审批流程步骤",TableName = "Sys_WorkFlowStep")]
    public partial class Sys_WorkFlowStep:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
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
       public Guid? WorkFlow_Id { get; set; }

       /// <summary>
       ///节点名称
       /// </summary>
       [Display(Name ="节点名称")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Name { get; set; }

       /// <summary>
       ///顺序步骤
       /// </summary>
       [Display(Name ="顺序步骤")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Step { get; set; }

       /// <summary>
       ///节点类型(1=按用户审批,2=按角色审批)
       /// </summary>
       [Display(Name ="节点类型(1=按用户审批,2=按角色审批)")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? NodeType { get; set; }

       /// <summary>
       ///审批用户id
       /// </summary>
       [Display(Name ="审批用户id")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? UserId { get; set; }

       /// <summary>
       ///审批角色id
       /// </summary>
       [Display(Name ="审批角色id")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? RoleId { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Remark")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Remark { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateDate")]
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
       [Display(Name ="Creator")]
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

       /// <summary>
       ///顺序步骤Id
       /// </summary>
       [Display(Name ="顺序步骤Id")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string StepId { get; set; }

       
    }
}