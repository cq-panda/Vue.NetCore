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
    [Entity(TableCnName = "仓库管理",TableName = "MES_WarehouseManagement",DBServer = "VOLContext")]
    public partial class MES_WarehouseManagement:BaseEntity
    {
        /// <summary>
       ///仓库ID
       /// </summary>
       [Key]
       [Display(Name ="仓库ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid WarehouseID { get; set; }

       /// <summary>
       ///仓库编码
       /// </summary>
       [Display(Name ="仓库编码")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseCode { get; set; }

       /// <summary>
       ///仓库名称
       /// </summary>
       [Display(Name ="仓库名称")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseName { get; set; }

       /// <summary>
       ///仓库类型
       /// </summary>
       [Display(Name ="仓库类型")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseType { get; set; }

       /// <summary>
       ///仓库面积
       /// </summary>
       [Display(Name ="仓库面积")]
       [DisplayFormat(DataFormatString="10,2")]
       [Column(TypeName="decimal")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public decimal WarehouseArea { get; set; }

       /// <summary>
       ///仓库地址
       /// </summary>
       [Display(Name ="仓库地址")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseAddress { get; set; }

       /// <summary>
       ///仓库电话
       /// </summary>
       [Display(Name ="仓库电话")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehousePhone { get; set; }

       /// <summary>
       ///仓库管理员
       /// </summary>
       [Display(Name ="仓库管理员")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseManager { get; set; }

       /// <summary>
       ///仓库状态
       /// </summary>
       [Display(Name ="仓库状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string WarehouseStatus { get; set; }

       /// <summary>
       ///仓库容量
       /// </summary>
       [Display(Name ="仓库容量")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int WarehouseCapacity { get; set; }

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