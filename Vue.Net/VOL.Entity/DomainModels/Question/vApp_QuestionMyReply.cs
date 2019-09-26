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
    [EntityAttribute(TableCnName = "我的回答")]
    public class vApp_QuestionMyReply:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Display(Name ="PartById")]
       [Column(TypeName="bigint")]
       public long? PartById { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="QuestionId")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int QuestionId { get; set; }

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
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateDate")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="HeadImageUrl")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string HeadImageUrl { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Title")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Title { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ImageUrls")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       public string ImageUrls { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Attr")]
       [MaxLength(4)]
       [Column(TypeName="varchar(4)")]
       [Required(AllowEmptyStrings=false)]
       public string Attr { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="QuestionType")]
       [Column(TypeName="int")]
       public int? QuestionType { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Content")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Content { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ReplyDate")]
       [Column(TypeName="datetime")]
       public DateTime? ReplyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ReplierId")]
       [Column(TypeName="int")]
       public int? ReplierId { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Replier")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string Replier { get; set; }

       
    }
}