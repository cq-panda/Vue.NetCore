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
    [Entity(TableCnName = "产线管理",TableName = "MES_ProductionLine",DetailTable =  new Type[] { typeof(MES_ProductionLineDevice)},DetailTableCnName = "产线设备",DBServer = "VOLContext")]
    public partial class MES_ProductionLine:BaseEntity
    {
        /// <summary>
       ///产线ID
       /// </summary>
       [Key]
       [Display(Name ="产线ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid ProductionLineID { get; set; }

       /// <summary>
       ///产线名称
       /// </summary>
       [Display(Name ="产线名称")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string LineName { get; set; }

       /// <summary>
       ///产线类型
       /// </summary>
       [Display(Name ="产线类型")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string LineType { get; set; }

       /// <summary>
       ///产能信息
       /// </summary>
       [Display(Name ="产能信息")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string Capacity { get; set; }

       /// <summary>
       ///产线状态
       /// </summary>
       [Display(Name ="产线状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string Status { get; set; }

       /// <summary>
       ///负责人
       /// </summary>
       [Display(Name ="负责人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string ResponsiblePerson { get; set; }

       /// <summary>
       ///产线位置
       /// </summary>
       [Display(Name ="产线位置")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Location { get; set; }

       /// <summary>
       ///启用日期
       /// </summary>
       [Display(Name ="启用日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? StartDate { get; set; }

       /// <summary>
       ///停用日期
       /// </summary>
       [Display(Name ="停用日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? EndDate { get; set; }

       /// <summary>
       ///备注信息
       /// </summary>
       [Display(Name ="备注信息")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Remarks { get; set; }

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

       [Display(Name ="产线设备")]
       [ForeignKey("ProductionLineID")]
       public List<MES_ProductionLineDevice> MES_ProductionLineDevice { get; set; }


       
    }
}