using Newtonsoft.Json;
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
    [EntityAttribute(TableCnName = "我加入的会议视图")]
    public class vMyJoinMeeting:BaseEntity
    {
        /// <summary>
       ///参加人Id
       /// </summary>
       [Display(Name ="参加人Id")]
       [Column(TypeName="int")]
       public int? CustomerId { get; set; }

       /// <summary>
       ///参加人
       /// </summary>
       [Display(Name ="参加人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string CustomerName { get; set; }

       /// <summary>
       ///参加时间
       /// </summary>
       [Display(Name ="参加时间")]
       [Column(TypeName="datetime")]
       public DateTime? JoinDate { get; set; }

       /// <summary>
       ///公司
       /// </summary>
       [Display(Name ="公司")]
       [MaxLength(250)]
       [Column(TypeName="nvarchar(250)")]
       public string Company { get; set; }

       /// <summary>
       ///电话
       /// </summary>
       [Display(Name ="电话")]
       [MaxLength(11)]
       [Column(TypeName="varchar(11)")]
       public string PhoneNo { get; set; }

       /// <summary>
       ///参加人数
       /// </summary>
       [Display(Name ="参加人数")]
       [Column(TypeName="int")]
       public int? Total { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="MeetingId")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int MeetingId { get; set; }

       /// <summary>
       ///会议标题
       /// </summary>
       [Display(Name ="会议标题")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string Title { get; set; }

       /// <summary>
       ///会议发布人
       /// </summary>
       [Display(Name ="会议发布人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       public string Author { get; set; }

       /// <summary>
       ///会议发布日期
       /// </summary>
       [Display(Name ="会议发布日期")]
       [Column(TypeName="datetime")]
       public DateTime? ReleaseDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="SmallImageUrl")]
       [MaxLength(500)]
       [JsonIgnore]
       [Column(TypeName="varchar(500)")]
       public string SmallImageUrl { get; set; }

       /// <summary>
       ///会议图片
       /// </summary>
       [Display(Name ="会议图片")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       public string ImageUrl { get; set; }

       /// <summary>
       ///会议截止日期
       /// </summary>
       [Display(Name ="会议截止日期")]
       [Column(TypeName="datetime")]
       public DateTime? MeetingEndDate { get; set; }

       /// <summary>
       ///会议地点
       /// </summary>
       [Display(Name ="会议地点")]
       [MaxLength(150)]
       [Column(TypeName="nvarchar(150)")]
       public string Location { get; set; }

       /// <summary>
       ///会议介绍
       /// </summary>
       [Display(Name ="会议介绍")]
       [MaxLength(1500)]
       [Column(TypeName="nvarchar(1500)")]
       public string Content { get; set; }

       /// <summary>
       ///会议是否载止
       /// </summary>
       [Display(Name ="会议是否载止")]
       [Column(TypeName="int")]
       public int? Expire { get; set; }

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
       [JsonIgnore]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(30)]
       [JsonIgnore]
       [Column(TypeName="nvarchar(30)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [JsonIgnore]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       
    }
}

