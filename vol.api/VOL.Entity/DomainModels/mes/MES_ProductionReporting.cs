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
    [Entity(TableCnName = "生产报工",TableName = "MES_ProductionReporting",DetailTable =  new Type[] { typeof(MES_ProductionReportingDetail)},DetailTableCnName = "报工明细",DBServer = "VOLContext")]
    public partial class MES_ProductionReporting:BaseEntity
    {
        /// <summary>
       ///报工ID
       /// </summary>
       [Key]
       [Display(Name ="报工ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid ReportingID { get; set; }

       /// <summary>
       ///订单
       /// </summary>
       [Display(Name ="订单")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? OrderID { get; set; }

       /// <summary>
       ///报工单号
       /// </summary>
       [Display(Name ="报工单号")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string ReportingNumber { get; set; }

       /// <summary>
       ///报工人
       /// </summary>
       [Display(Name ="报工人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string ReportedBy { get; set; }

       /// <summary>
       ///报工时间
       /// </summary>
       [Display(Name ="报工时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? ReportingTime { get; set; }

       /// <summary>
       ///报工数量
       /// </summary>
       [Display(Name ="报工数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Total { get; set; }

       /// <summary>
       ///不合格数量
       /// </summary>
       [Display(Name ="不合格数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? RejectedQuantity { get; set; }

       /// <summary>
       ///合格数量
       /// </summary>
       [Display(Name ="合格数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AcceptedQuantity { get; set; }

       /// <summary>
       ///工时(小时)
       /// </summary>
       [Display(Name ="工时(小时)")]
       [Column(TypeName="decimal")]
       [Editable(true)]
       public decimal? ReportHour { get; set; }

       /// <summary>
       ///审批状态
       /// </summary>
       [Display(Name ="审批状态")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditStatus { get; set; }

       /// <summary>
       ///审批人
       /// </summary>
       [Display(Name ="审批人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Auditor { get; set; }

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

       [Display(Name ="报工明细")]
       [ForeignKey("ReportingID")]
       public List<MES_ProductionReportingDetail> MES_ProductionReportingDetail { get; set; }


       
    }
}