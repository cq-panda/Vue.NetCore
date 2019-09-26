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
    [EntityAttribute(TableCnName = "问答回复明细")]
    public class App_QuestionReply:BaseEntity
    {
        /// <summary>
       ///主键ID
       /// </summary>
       [Key]
       [Display(Name ="主键ID")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int ReplyId { get; set; }

       /// <summary>
       ///问题ID
       /// </summary>
       [Display(Name ="问题ID")]
       [Column(TypeName="int")]
       public int? QuestionId { get; set; }

       /// <summary>
       ///回复类型
       /// </summary>
       [Display(Name ="回复类型")]
       [Column(TypeName="int")]
       public int? QuestionType { get; set; }

       /// <summary>
       ///回复id
       /// </summary>
       [Display(Name ="回复id")]
       [Column(TypeName="int")]
       public int? ReplierId { get; set; }

       /// <summary>
       ///回复人
       /// </summary>
       [Display(Name ="回复人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string Replier { get; set; }

       /// <summary>
       ///回复日期
       /// </summary>
       [Display(Name ="回复日期")]
       [Column(TypeName="datetime")]
       public DateTime? ReplyDate { get; set; }

       /// <summary>
       ///回复内容
       /// </summary>
       [Display(Name ="回复内容")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string ReplyContent { get; set; }

       /// <summary>
       ///被回复人ID
       /// </summary>
       [Display(Name ="被回复人ID")]
       [Column(TypeName="int")]
       public int? ReplyToId { get; set; }

       /// <summary>
       ///被回复人
       /// </summary>
       [Display(Name ="被回复人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string ReplyTo { get; set; }

       /// <summary>
       ///回复选中的人回复的ID
       /// </summary>
       [Display(Name ="回复选中的人回复的ID")]
       public int? ReplyOrigId { get; set; }

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
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
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