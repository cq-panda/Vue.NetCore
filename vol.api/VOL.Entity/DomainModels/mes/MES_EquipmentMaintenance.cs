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
    [Entity(TableCnName = "设备保养",DBServer = "VOLContext")]
    public partial class MES_EquipmentMaintenance:BaseEntity
    {
        /// <summary>
       ///保养ID
       /// </summary>
       [Key]
       [Display(Name ="保养ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid MaintenanceID { get; set; }

       /// <summary>
       ///设备ID
       /// </summary>
       [Display(Name ="设备ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? EquipmentID { get; set; }

       /// <summary>
       ///保养日期
       /// </summary>
       [Display(Name ="保养日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? MaintenanceDate { get; set; }

       /// <summary>
       ///保养类型
       /// </summary>
       [Display(Name ="保养类型")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string MaintenanceType { get; set; }

       /// <summary>
       ///保养内容
       /// </summary>
       [Display(Name ="保养内容")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string MaintenanceContent { get; set; }

       /// <summary>
       ///保养人员
       /// </summary>
       [Display(Name ="保养人员")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string MaintenancePerson { get; set; }

       /// <summary>
       ///保养状态
       /// </summary>
       [Display(Name ="保养状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string MaintenanceStatus { get; set; }

       /// <summary>
       ///下次保养日期
       /// </summary>
       [Display(Name ="下次保养日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? NextMaintenanceDate { get; set; }

       /// <summary>
       ///保养成本
       /// </summary>
       [Display(Name ="保养成本")]
       [DisplayFormat(DataFormatString="10,2")]
       [Column(TypeName="decimal")]
       [Editable(true)]
       public decimal? MaintenanceCost { get; set; }

       /// <summary>
       ///保养备注
       /// </summary>
       [Display(Name ="保养备注")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string MaintenanceRemarks { get; set; }

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