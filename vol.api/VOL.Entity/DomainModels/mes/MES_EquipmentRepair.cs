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
    [Entity(TableCnName = "设备维修",DBServer = "VOLContext")]
    public partial class MES_EquipmentRepair:BaseEntity
    {
        /// <summary>
       ///维修ID
       /// </summary>
       [Key]
       [Display(Name ="维修ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid RepairID { get; set; }

       /// <summary>
       ///设备ID
       /// </summary>
       [Display(Name ="设备ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? EquipmentID { get; set; }

       /// <summary>
       ///维修日期
       /// </summary>
       [Display(Name ="维修日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? RepairDate { get; set; }

       /// <summary>
       ///维修原因
       /// </summary>
       [Display(Name ="维修原因")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string RepairReason { get; set; }

       /// <summary>
       ///维修内容
       /// </summary>
       [Display(Name ="维修内容")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string RepairContent { get; set; }

       /// <summary>
       ///维修人员
       /// </summary>
       [Display(Name ="维修人员")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string RepairPerson { get; set; }

       /// <summary>
       ///维修成本
       /// </summary>
       [Display(Name ="维修成本")]
       [DisplayFormat(DataFormatString="10,2")]
       [Column(TypeName="decimal")]
       [Editable(true)]
       public decimal? RepairCost { get; set; }

       /// <summary>
       ///维修状态
       /// </summary>
       [Display(Name ="维修状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string RepairStatus { get; set; }

       /// <summary>
       ///维修开始时间
       /// </summary>
       [Display(Name ="维修开始时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? RepairStartTime { get; set; }

       /// <summary>
       ///维修结束时间
       /// </summary>
       [Display(Name ="维修结束时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? RepairEndTime { get; set; }

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