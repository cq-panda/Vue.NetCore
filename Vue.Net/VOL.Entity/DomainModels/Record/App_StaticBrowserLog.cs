/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Entity;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [EntityAttribute(TableCnName = "静态页面访问记录")]
    public class App_StaticBrowserLog:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="LogId")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int LogId { get; set; }

       /// <summary>
       ///用户
       /// </summary>
       [Display(Name ="用户")]
       [Column(TypeName="int")]
       public int? User_Id { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ServerIP")]
       [MaxLength(10)]
       [Column(TypeName="varchar(10)")]
       public string ServerIP { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="TablePrimaryKey")]
       [Column(TypeName="int")]
       public int? TablePrimaryKey { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="TableName")]
       [MaxLength(25)]
       [Column(TypeName="varchar(25)")]
       public string TableName { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Url")]
       [MaxLength(150)]
       [Column(TypeName="varchar(150)")]
       public string Url { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateDate")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       
    }
}