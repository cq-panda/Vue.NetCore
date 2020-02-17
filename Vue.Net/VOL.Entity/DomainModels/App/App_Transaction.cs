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
    [Entity(TableCnName = "导入导出")]
    public class App_Transaction:BaseEntity
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
       ///姓名
       /// </summary>
       [Display(Name ="姓名")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Name { get; set; }

       /// <summary>
       ///电话
       /// </summary>
       [Display(Name ="电话")]
       [MaxLength(15)]
       [Column(TypeName="nvarchar(15)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string PhoneNo { get; set; }

       /// <summary>
       ///数量
       /// </summary>
       [Display(Name ="数量")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int Quantity { get; set; }

       /// <summary>
       ///是否买入
       /// </summary>
       [Display(Name ="是否买入")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int TransactionType { get; set; }

       /// <summary>
       ///购买类型
       /// </summary>
       [Display(Name ="购买类型")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string CowType { get; set; }

       /// <summary>
       ///描述
       /// </summary>
       [Display(Name ="描述")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Describe { get; set; }

       /// <summary>
       ///是否启用
       /// </summary>
       [Display(Name ="是否启用")]
       [Column(TypeName="tinyint")]
       public byte? Enable { get; set; }

       /// <summary>
       ///创建人Id
       /// </summary>
       [Display(Name ="创建人Id")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///提交人
       /// </summary>
       [Display(Name ="提交人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///提交时间
       /// </summary>
       [Display(Name ="提交时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///修改人ID
       /// </summary>
       [Display(Name ="修改人ID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       
    }
}