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
    [EntityAttribute(TableCnName = "图片上传记录")]
    public class Sys_ImageLibrary:BaseEntity
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
       [Display(Name ="Enable")]
       [Column(TypeName="tinyint")]
       public byte? Enable { get; set; }

       /// <summary>
       ///文件
       /// </summary>
       [Display(Name ="文件")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       public string ImageUrls { get; set; }

       /// <summary>
       ///文件来源
       /// </summary>
       [Display(Name ="文件来源")]
       [Column(TypeName="int")]
       public int? SourceType { get; set; }

       /// <summary>
       ///视频封面
       /// </summary>
       [Display(Name ="视频封面")]
       [MaxLength(500)]
       [Column(TypeName="varchar(500)")]
       [Required(AllowEmptyStrings=false)]
       public string Cover { get; set; }

       /// <summary>
       ///文件类型
       /// </summary>
       [Display(Name ="文件类型")]
       [Column(TypeName="int")]
       public int? FileType { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///上传人
       /// </summary>
       [Display(Name ="上传人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       public string Creator { get; set; }

       /// <summary>
       ///上传时间
       /// </summary>
       [Display(Name ="上传时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///备注 
       /// </summary>
       [Display(Name ="备注 ")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Remark { get; set; }

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