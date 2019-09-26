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
    [EntityAttribute(TableCnName = "公开提问(停用)",DetailTable =  new Type[] { typeof(App_QuestionReply)},DetailTableCnName = "提问回复明细")]
    public class App_PublicQuestion:BaseEntity
    {
        /// <summary>
       ///主键ID
       /// </summary>
       [Key]
       [Display(Name ="主键ID")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int QuestionId { get; set; }

       /// <summary>
       ///公母
       /// </summary>
       [Display(Name ="公母")]
       [MaxLength(10)]
       [Column(TypeName="nvarchar(10)")]
       public string Sex { get; set; }

       /// <summary>
       ///月龄
       /// </summary>
       [Display(Name ="月龄")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       public string Age { get; set; }

       /// <summary>
       ///温度
       /// </summary>
       [Display(Name ="温度")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       public string Temperature { get; set; }

       /// <summary>
       ///标题
       /// </summary>
       [Display(Name ="标题")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Title { get; set; }

       /// <summary>
       ///问题描述
       /// </summary>
       [Display(Name ="问题描述")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Describe { get; set; }

       /// <summary>
       ///提问照片
       /// </summary>
       [Display(Name ="提问照片")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       public string ImageUrls { get; set; }

       /// <summary>
       ///提问照片(大图)
       /// </summary>
       [Display(Name ="提问照片(大图)")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       public string BigImageUrls { get; set; }

       /// <summary>
       ///精选提问
       /// </summary>
       [Display(Name ="精选提问")]
       [Column(TypeName="int")]
       public int? Choiceness { get; set; }

       /// <summary>
       ///精选排序号
       /// </summary>
       [Display(Name ="精选排序号")]
       [Column(TypeName="int")]
       public int? OrderNo { get; set; }

       /// <summary>
       ///回答数量
       /// </summary>
       [Display(Name ="回答数量")]
       [Column(TypeName="int")]
       public int? ReplyQty { get; set; }

       /// <summary>
       ///回复状态
       /// </summary>
       [Display(Name ="回复状态")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int ReplyStatus { get; set; }

       /// <summary>
       ///审核状态
       /// </summary>
       [Display(Name ="审核状态")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int AuditStatus { get; set; }

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
       [MaxLength(20)]
       [Column(TypeName="varchar(20)")]
       public string Auditor { get; set; }

       /// <summary>
       ///审核时间
       /// </summary>
       [Display(Name ="审核时间")]
       [Column(TypeName="datetime")]
       public DateTime? AuditDate { get; set; }

       /// <summary>
       ///是否启用
       /// </summary>
       [Display(Name ="是否启用")]
       [Column(TypeName="tinyint")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public byte Enable { get; set; }

       /// <summary>
       ///创建人Id
       /// </summary>
       [Display(Name ="创建人Id")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///提问人
       /// </summary>
       [Display(Name ="提问人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///提问人头像
       /// </summary>
       [Display(Name ="提问人头像")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string HeadImageUrl { get; set; }

       /// <summary>
       ///提问时间
       /// </summary>
       [Display(Name ="提问时间")]
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
