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
    [Entity(TableCnName = "工序统计",DBServer = "VOLContext")]
    public partial class MES_ProcessReport:BaseEntity
    {
        /// <summary>
       ///汇报ID
       /// </summary>
       [Key]
       [Display(Name ="汇报ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid ReportID { get; set; }

       /// <summary>
       ///工序ID
       /// </summary>
       [Display(Name ="工序ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? ProcessID { get; set; }

       /// <summary>
       ///汇报日期
       /// </summary>
       [Display(Name ="汇报日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime ReportDate { get; set; }

       /// <summary>
       ///完成数量
       /// </summary>
       [Display(Name ="完成数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int CompletedQuantity { get; set; }

       /// <summary>
       ///不良数量
       /// </summary>
       [Display(Name ="不良数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int DefectiveQuantity { get; set; }

       /// <summary>
       ///汇报人
       /// </summary>
       [Display(Name ="汇报人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string ReportedBy { get; set; }

       /// <summary>
       ///汇报状态
       /// </summary>
       [Display(Name ="汇报状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string ReportStatus { get; set; }

       /// <summary>
       ///汇报备注
       /// </summary>
       [Display(Name ="汇报备注")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string ReportRemarks { get; set; }

       /// <summary>
       ///工序开始时间
       /// </summary>
       [Display(Name ="工序开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? StartTime { get; set; }

       /// <summary>
       ///工序结束时间
       /// </summary>
       [Display(Name ="工序结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? EndTime { get; set; }

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