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
    [Entity(TableCnName = "不良处理记录",TableName = "MES_DefectiveProductDisposalRecord",DBServer = "ServiceDbContext")]
    public partial class MES_DefectiveProductDisposalRecord:BaseEntity
    {
        /// <summary>
       ///处理记录ID
       /// </summary>
       [SugarColumn(IsPrimaryKey = true)]
       [Key]
       [Display(Name ="处理记录ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid DisposalRecordID { get; set; }

       /// <summary>
       ///不良品ID
       /// </summary>
       [Display(Name ="不良品ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? DefectiveID { get; set; }

       /// <summary>
       ///处理人
       /// </summary>
       [Display(Name ="处理人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string DisposalPerson { get; set; }

       /// <summary>
       ///处理开始时间
       /// </summary>
       [Display(Name ="处理开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? DisposalStartTime { get; set; }

       /// <summary>
       ///处理结束时间
       /// </summary>
       [Display(Name ="处理结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? DisposalEndTime { get; set; }

       /// <summary>
       ///处理结果
       /// </summary>
       [Display(Name ="处理结果")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string DisposalResult { get; set; }

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