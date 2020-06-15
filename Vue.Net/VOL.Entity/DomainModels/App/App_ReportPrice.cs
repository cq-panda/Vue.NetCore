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
    [Table("App_ReportPrice")]
    [Entity(TableCnName = "新增编辑表单",TableName = "App_ReportPrice")]
    public class App_ReportPrice:BaseEntity
    {
        /// <summary>
       ///主键ID
       /// </summary>
       [Key]
       [Display(Name ="主键ID")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int Id { get; set; }

       /// <summary>
       ///品种
       /// </summary>
       [Display(Name ="品种")]
       [MaxLength(40)]
       [Column(TypeName="nvarchar(40)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Variety { get; set; }

       /// <summary>
       ///月龄
       /// </summary>
       [Display(Name ="月龄")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Age { get; set; }

       /// <summary>
       ///城市
       /// </summary>
       [Display(Name ="城市")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string City { get; set; }

       /// <summary>
       ///价格
       /// </summary>
       [Display(Name ="价格")]
       [Column(TypeName="numeric")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public decimal Price { get; set; }

       /// <summary>
       ///上报人
       /// </summary>
       [Display(Name ="上报人")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string Creator { get; set; }

       /// <summary>
       ///上报时间
       /// </summary>
       [Display(Name ="上报时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///审核状态
       /// </summary>
       [Display(Name ="审核状态")]
       [Column(TypeName="int")]
       public int? AuditStatus { get; set; }

       /// <summary>
       ///审核时间
       /// </summary>
       [Display(Name ="审核时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? AuditDate { get; set; }

       /// <summary>
       ///审核人Id
       /// </summary>
       [Display(Name ="审核人Id")]
       [Column(TypeName="int")]
       public int? AuditId { get; set; }

       /// <summary>
       ///审核人
       /// </summary>
       [Display(Name ="审核人")]
       [MaxLength(40)]
       [Column(TypeName="nvarchar(40)")]
       public string Auditor { get; set; }

       /// <summary>
       ///是否启用
       /// </summary>
       [Display(Name ="是否启用")]
       [Column(TypeName="tinyint")]
       [Editable(true)]
       public byte? Enable { get; set; }

       /// <summary>
       ///创建人Id
       /// </summary>
       [Display(Name ="创建人Id")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///修改人ID
       /// </summary>
       [Display(Name ="修改人ID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///测试
       /// </summary>
       [Display(Name ="测试")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
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
