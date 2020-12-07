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
    [Entity(TableCnName = "人员_证件管理",TableName = "Personal_Certificates")]
    public class Personal_Certificates:BaseEntity
    {
        /// <summary>
       ///编号
       /// </summary>
       [Key]
       [Display(Name ="编号")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int Id { get; set; }

       /// <summary>
       ///所属人员
       /// </summary>
       [Display(Name ="所属人员")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int PersonalId { get; set; }

       /// <summary>
       ///身份证信息
       /// </summary>
       [Display(Name ="身份证信息")]
       [Column(TypeName="nvarchar(max)")]
       public string IDCardInfo { get; set; }

       /// <summary>
       ///身份证照片
       /// </summary>
       [Display(Name ="身份证照片")]
       [Column(TypeName="nvarchar(max)")]
       public string IDCardImagePath { get; set; }

       /// <summary>
       ///描述
       /// </summary>
       [Display(Name ="描述")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Describe { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Creator { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///类型
       /// </summary>
       [Display(Name ="类型")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int CertificateType { get; set; }

       
    }
}