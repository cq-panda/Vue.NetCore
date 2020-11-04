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
    [Entity(TableCnName = "人员档案",TableName = "Personal")]
    public class Personal:BaseEntity
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
       ///描述
       /// </summary>
       [Display(Name ="描述")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       public string Describe { get; set; }

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
       ///姓名
       /// </summary>
       [Display(Name ="姓名")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string Name { get; set; }

       /// <summary>
       ///血型
       /// </summary>
       [Display(Name ="血型")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? BloodType { get; set; }

       /// <summary>
       ///入伍时间
       /// </summary>
       [Display(Name ="入伍时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? TimeOfEnlistment { get; set; }

       /// <summary>
       ///军衔
       /// </summary>
       [Display(Name ="军衔")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? MilitaryRank { get; set; }

       /// <summary>
       ///专业
       /// </summary>
       [Display(Name ="专业")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Major { get; set; }

       /// <summary>
       ///职务
       /// </summary>
       [Display(Name ="职务")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Duty { get; set; }

       /// <summary>
       ///军事人员类别
       /// </summary>
       [Display(Name ="军事人员类别")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? CategoriesMilitaryPersonnel { get; set; }

       /// <summary>
       ///兵役状态
       /// </summary>
       [Display(Name ="兵役状态")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? MilitaryServiceStatus { get; set; }

       /// <summary>
       ///通讯地址
       /// </summary>
       [Display(Name ="通讯地址")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string PostalAddress { get; set; }

       /// <summary>
       ///户口所在地
       /// </summary>
       [Display(Name ="户口所在地")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string CensusRegister { get; set; }

       /// <summary>
       ///身高
       /// </summary>
       [Display(Name ="身高")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string Height { get; set; }

       /// <summary>
       ///户籍类型
       /// </summary>
       [Display(Name ="户籍类型")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? CensusRegisterTypes { get; set; }

       /// <summary>
       ///籍贯
       /// </summary>
       [Display(Name ="籍贯")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AncestralNativePlace { get; set; }

       /// <summary>
       ///民族
       /// </summary>
       [Display(Name ="民族")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Ethnicity { get; set; }

       /// <summary>
       ///政治面貌
       /// </summary>
       [Display(Name ="政治面貌")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? PoliticalStatus { get; set; }

       /// <summary>
       ///出生日期
       /// </summary>
       [Display(Name ="出生日期")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? DateOfBirth { get; set; }

       /// <summary>
       ///身份证号
       /// </summary>
       [Display(Name ="身份证号")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string IDCard { get; set; }

       /// <summary>
       ///年龄
       /// </summary>
       [Display(Name ="年龄")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Age { get; set; }

       /// <summary>
       ///性别
       /// </summary>
       [Display(Name ="性别")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int Gender { get; set; }

       /// <summary>
       ///是否集体户口
       /// </summary>
       [Display(Name ="是否集体户口")]
       [Column(TypeName="bit")]
       [Editable(true)]
       public bool? CollectiveHouseholdRegistration { get; set; }

       /// <summary>
       ///体重
       /// </summary>
       [Display(Name ="体重")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string Width { get; set; }

       /// <summary>
       ///婚姻状态
       /// </summary>
       [Display(Name ="婚姻状态")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? MaritalStatus { get; set; }

       /// <summary>
       ///手机号码
       /// </summary>
       [Display(Name ="手机号码")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string PhoneNumber { get; set; }

       /// <summary>
       ///照片
       /// </summary>
       [Display(Name ="照片")]
       [MaxLength(300)]
       [Column(TypeName="nvarchar(300)")]
       [Editable(true)]
       public string Photo { get; set; }

       /// <summary>
       ///微信
       /// </summary>
       [Display(Name ="微信")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Editable(true)]
       public string Wechat { get; set; }

       
    }
}