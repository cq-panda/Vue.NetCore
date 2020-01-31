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
    [Entity(TableCnName = "新闻列表",TableName = "App_News")]
    public class App_News:BaseEntity
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
       ///标题
       /// </summary>
       [Display(Name ="标题")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Title { get; set; }

       /// <summary>
       ///新闻内容
       /// </summary>
       [Display(Name ="新闻内容")]
       [Column(TypeName="nvarchar(max)")]
       [Editable(true)]
       public string Content { get; set; }

       /// <summary>
       ///发布人
       /// </summary>
       [Display(Name ="发布人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string Author { get; set; }

       /// <summary>
       ///发布时间
       /// </summary>
       [Display(Name ="发布时间")]
       [Column(TypeName="datetime")]
       public DateTime? ReleaseDate { get; set; }

       /// <summary>
       ///封面图片
       /// </summary>
       [Display(Name ="封面图片")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string ImageUrl { get; set; }

       /// <summary>
       ///图片(大图)
       /// </summary>
       [Display(Name ="图片(大图)")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string BigImageUrls { get; set; }

       /// <summary>
       ///新闻地址
       /// </summary>
       [Display(Name ="新闻地址")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       public string DetailUrl { get; set; }

       /// <summary>
       ///浏览次数
       /// </summary>
       [Display(Name ="浏览次数")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? ViewCount { get; set; }

       /// <summary>
       ///新闻类型
       /// </summary>
       [Display(Name ="新闻类型")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int NewsType { get; set; }

       /// <summary>
       ///是否今日推荐
       /// </summary>
       [Display(Name ="是否今日推荐")]
       [Column(TypeName="sbyte")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public sbyte DailyRecommend { get; set; }

       /// <summary>
       ///推荐排序
       /// </summary>
       [Display(Name ="推荐排序")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? OrderNo { get; set; }

       /// <summary>
       ///是否启用
       /// </summary>
       [Display(Name ="是否启用")]
       [Column(TypeName="sbyte")]
       [Editable(true)]
       public sbyte? Enable { get; set; }

       /// <summary>
       ///创建人Id
       /// </summary>
       [Display(Name ="创建人Id")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///发布人
       /// </summary>
       [Display(Name ="发布人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Editable(true)]
       public string Creator { get; set; }

       /// <summary>
       ///发布时间
       /// </summary>
       [Display(Name ="发布时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
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
       [Editable(true)]
       public DateTime? ModifyDate { get; set; }

       
    }
}