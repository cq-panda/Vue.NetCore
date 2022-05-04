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
    [Entity(TableCnName = "启用图片支持")]
    public class App_Expert:BaseEntity
    {
        /// <summary>
       ///主键ID
       /// </summary>
       [Key]
       [Display(Name ="主键ID")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int ExpertId { get; set; }

       /// <summary>
       ///申请人帐号Id
       /// </summary>
       [Display(Name ="申请人帐号Id")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? User_Id { get; set; }

       /// <summary>
       ///专家名称
       /// </summary>
       [Display(Name ="专家名称")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Editable(true)]
       public string ExpertName { get; set; }

       /// <summary>
       ///专家头像
       /// </summary>
       [Display(Name ="专家头像")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string HeadImageUrl { get; set; }

       /// <summary>
       ///申请人帐号
       /// </summary>
       [Display(Name ="申请人帐号")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Editable(true)]
       public string UserName { get; set; }

       /// <summary>
       ///申请人
       /// </summary>
       [Display(Name ="申请人")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       public string UserTrueName { get; set; }

       /// <summary>
       ///审核状态
       /// </summary>
       [Display(Name ="审核状态")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int AuditStatus { get; set; }

       /// <summary>
       ///审核人
       /// </summary>
       [Display(Name ="审核人")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Editable(true)]
       public string Auditor { get; set; }

       /// <summary>
       ///是否启用
       /// </summary>
       [Display(Name ="是否启用")]
       [Column(TypeName="tinyint")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public byte Enable { get; set; }

       /// <summary>
       ///真实姓名
       /// </summary>
       [Display(Name ="真实姓名")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Editable(true)]
       public string ReallyName { get; set; }

       /// <summary>
       ///身份证号
       /// </summary>
       [Display(Name ="身份证号")]
       [MaxLength(18)]
       [Column(TypeName="nvarchar(18)")]
       [Editable(true)]
       public string IDNumber { get; set; }

       /// <summary>
       ///电话
       /// </summary>
       [Display(Name ="电话")]
       [MaxLength(11)]
       [Column(TypeName="nvarchar(11)")]
       [Editable(true)]
       public string PhoneNo { get; set; }

       /// <summary>
       ///学历
       /// </summary>
       [Display(Name ="学历")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       public string Education { get; set; }

       /// <summary>
       ///职业
       /// </summary>
       [Display(Name ="职业")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       public string Professional { get; set; }

       /// <summary>
       ///所在公司
       /// </summary>
       [Display(Name ="所在公司")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       public string Company { get; set; }

       /// <summary>
       ///服务地区
       /// </summary>
       [Display(Name ="服务地区")]
       [MaxLength(50)]
       [Column(TypeName="nvarchar(50)")]
       [Editable(true)]
       public string City { get; set; }

       /// <summary>
       ///擅长领域
       /// </summary>
       [Display(Name ="擅长领域")]
       [MaxLength(800)]
       [Column(TypeName="nvarchar(800)")]
       [Editable(true)]
       public string SpecialField { get; set; }

       /// <summary>
       ///个人简介
       /// </summary>
       [Display(Name ="个人简介")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string Resume { get; set; }

       /// <summary>
       ///资质证书
       /// </summary>
       [Display(Name ="资质证书")]
       [MaxLength(2500)]
       [Column(TypeName="nvarchar(2500)")]
       [Editable(true)]
       public string  Certificate { get; set; }

       /// <summary>
       ///审核人Id
       /// </summary>
       [Display(Name ="审核人Id")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AuditId { get; set; }

       /// <summary>
       ///审核时间
       /// </summary>
       [Display(Name ="审核时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? AuditDate { get; set; }

       /// <summary>
       ///创建人Id
       /// </summary>
       [Display(Name ="创建人Id")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? CreateID { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Editable(true)]
       public string Creator { get; set; }

       /// <summary>
       ///申请时间
       /// </summary>
       [Display(Name ="申请时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///修改人ID
       /// </summary>
       [Display(Name ="修改人ID")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? ModifyID { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Editable(true)]
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