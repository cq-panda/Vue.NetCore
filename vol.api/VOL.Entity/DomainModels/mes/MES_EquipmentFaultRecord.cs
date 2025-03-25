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
    [Entity(TableCnName = "设备故障",DBServer = "VOLContext")]
    public partial class MES_EquipmentFaultRecord:BaseEntity
    {
        /// <summary>
       ///故障记录ID
       /// </summary>
       [Key]
       [Display(Name ="故障记录ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid FaultRecordID { get; set; }

       /// <summary>
       ///设备ID
       /// </summary>
       [Display(Name ="设备ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? EquipmentID { get; set; }

       /// <summary>
       ///故障日期
       /// </summary>
       [Display(Name ="故障日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? FaultDate { get; set; }

       /// <summary>
       ///故障类型
       /// </summary>
       [Display(Name ="故障类型")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string FaultType { get; set; }

       /// <summary>
       ///故障描述
       /// </summary>
       [Display(Name ="故障描述")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string FaultDescription { get; set; }

       /// <summary>
       ///故障影响
       /// </summary>
       [Display(Name ="故障影响")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string FaultImpact { get; set; }

       /// <summary>
       ///故障报告人
       /// </summary>
       [Display(Name ="故障报告人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string FaultReportedBy { get; set; }

       /// <summary>
       ///故障状态
       /// </summary>
       [Display(Name ="故障状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string FaultStatus { get; set; }

       /// <summary>
       ///故障排查开始时间
       /// </summary>
       [Display(Name ="故障排查开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? TroubleshootingStartTime { get; set; }

       /// <summary>
       ///故障排查结束时间
       /// </summary>
       [Display(Name ="故障排查结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? TroubleshootingEndTime { get; set; }

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