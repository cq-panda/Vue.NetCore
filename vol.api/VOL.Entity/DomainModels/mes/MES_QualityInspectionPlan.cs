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
    [Entity(TableCnName = "质量检验",TableName = "MES_QualityInspectionPlan",DetailTable =  new Type[] { typeof(MES_QualityInspectionPlanDetail)},DetailTableCnName = "质检明细",DBServer = "VOLContext")]
    public partial class MES_QualityInspectionPlan:BaseEntity
    {
        /// <summary>
       ///检验计划ID
       /// </summary>
       [Key]
       [Display(Name ="检验计划ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)] 
       public Guid InspectionPlanID { get; set; }

       /// <summary>
       ///检验单号
       /// </summary>
       [Display(Name ="检验单号")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string InspectionPlanNumber { get; set; }

       /// <summary>
       ///订单ID
       /// </summary>
       [Display(Name ="订单ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? OrderID { get; set; }

       /// <summary>
       ///检验开始时间
       /// </summary>
       [Display(Name ="检验开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime PlanStartTime { get; set; }

       /// <summary>
       ///检验结束时间
       /// </summary>
       [Display(Name ="检验结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime PlanEndTime { get; set; }

       /// <summary>
       ///检验人
       /// </summary>
       [Display(Name ="检验人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string ResponsiblePerson { get; set; }

       /// <summary>
       ///计划状态
       /// </summary>
       [Display(Name ="计划状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string PlanStatus { get; set; }

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

       [Display(Name ="质检明细")]
       [ForeignKey("InspectionPlanID")]
       public List<MES_QualityInspectionPlanDetail> MES_QualityInspectionPlanDetail { get; set; }


       
    }
}