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
    [Entity(TableCnName = "生产订单",TableName = "MES_ProductionOrder",DetailTable =  new Type[] { typeof(MES_ProductionPlanDetail)},DetailTableCnName = "订单明细",DBServer = "VOLContext")]
    public partial class MES_ProductionOrder:BaseEntity
    {
        /// <summary>
       ///订单ID
       /// </summary>
       [Key]
       [Display(Name ="订单ID")]
       [MaxLength(36)]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public Guid OrderID { get; set; }

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
       [Required(AllowEmptyStrings=false)]
       public DateTime OrderDate { get; set; }

       /// <summary>
       ///交货日期
       /// </summary>
       [Display(Name ="交货日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime DeliveryDate { get; set; }

       /// <summary>
       ///订单数量
       /// </summary>
       [Display(Name ="订单数量")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? OrderQty { get; set; }

       /// <summary>
       ///优先级
       /// </summary>
       [Display(Name ="优先级")]
       [MaxLength(255)]
       [Column(TypeName="nvarchar(255)")]
       [Editable(true)]
       public string LV { get; set; }

       /// <summary>
       ///排产状态
       /// </summary>
       [Display(Name ="排产状态")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string OrderStatus { get; set; }

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
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? ModifyDate { get; set; }

       [Display(Name ="订单明细")]
       [ForeignKey("OrderID")]
       public List<MES_ProductionPlanDetail> MES_ProductionPlanDetail { get; set; }


       
    }
}