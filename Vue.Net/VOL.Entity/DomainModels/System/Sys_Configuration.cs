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
    [Entity(TableCnName = "系统设置",TableName = "Sys_Configuration")]
    public class Sys_Configuration:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="Id")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int Id { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateDate")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Creator")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Creator { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Describe")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Describe { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Modifier")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Modifier { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyDate")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///编码
       /// </summary>
       [Display(Name ="编码")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string Code { get; set; }

       /// <summary>
       ///值
       /// </summary>
       [Display(Name ="值")]
       [Column(TypeName="nvarchar(max)")]
       public string Value { get; set; }

       /// <summary>
       ///名称
       /// </summary>
       [Display(Name ="名称")]
       [MaxLength(40)]
       [Column(TypeName="nvarchar(40)")]
       public string Name { get; set; }

       
    }
}