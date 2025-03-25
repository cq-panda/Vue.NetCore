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
    [Entity(TableCnName = "变更记录",TableName = "MES_ProductionPlanChangeRecord",DBServer = "VOLContext")]
    public partial class MES_ProductionPlanChangeRecord:BaseEntity
    {
        /// <summary>
       ///变更记录ID
       /// </summary>
       [Key]
       [Display(Name ="变更记录ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid ChangeRecordID { get; set; }

       /// <summary>
       ///计划明细ID
       /// </summary>
       [Display(Name ="计划明细ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? PlanDetailID { get; set; }

       /// <summary>
       ///订单编号
       /// </summary>
       [Display(Name ="订单编号")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string OrderNumber { get; set; }

       /// <summary>
       ///客户名称
       /// </summary>
       [Display(Name ="客户名称")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string CustomerName { get; set; }

       /// <summary>
       ///订单日期
       /// </summary>
       [Display(Name ="订单日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? OrderDate { get; set; }

       /// <summary>
       ///变更日期
       /// </summary>
       [Display(Name ="变更日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime ChangeDate { get; set; }

       /// <summary>
       ///原计划数量
       /// </summary>
       [Display(Name ="原计划数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int OriginalPlanQuantity { get; set; }

       /// <summary>
       ///新计划数量
       /// </summary>
       [Display(Name ="新计划数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int NewPlanQuantity { get; set; }

       /// <summary>
       ///原计划开始时间
       /// </summary>
       [Display(Name ="原计划开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? OriginalPlannedStartTime { get; set; }

       /// <summary>
       ///新计划开始时间
       /// </summary>
       [Display(Name ="新计划开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? NewPlannedStartTime { get; set; }

       /// <summary>
       ///原计划结束时间
       /// </summary>
       [Display(Name ="原计划结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? OriginalPlannedEndTime { get; set; }

       /// <summary>
       ///新计划结束时间
       /// </summary>
       [Display(Name ="新计划结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? NewPlannedEndTime { get; set; }

       /// <summary>
       ///变更原因
       /// </summary>
       [Display(Name ="变更原因")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string ChangeReason { get; set; }

       /// <summary>
       ///变更人
       /// </summary>
       [Display(Name ="变更人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string ChangedBy { get; set; }

       /// <summary>
       ///创建人ID
       /// </summary>
       [Display(Name ="创建人ID")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? CreateID { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Creator { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///修改人ID
       /// </summary>
       [Display(Name ="修改人ID")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? ModifyID { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? ModifyDate { get; set; }

       
    }
}