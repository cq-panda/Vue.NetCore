using Newtonsoft.Json;
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
using SqlSugar;
using VOL.Entity.SystemModels;

namespace VOL.Entity.DomainModels
{
    [Entity(TableCnName = "用户管理",TableName = "Sys_User",ApiInput = typeof(ApiSys_UserInput),ApiOutput = typeof(ApiSys_UserOutput))]
    public partial class Sys_User:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
       [Key]
       [Display(Name ="User_Id")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int User_Id { get; set; }

       /// <summary>
       ///帐号
       /// </summary>
       [Display(Name ="帐号")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string UserName { get; set; }

       /// <summary>
       ///姓名
       /// </summary>
       [Display(Name ="姓名")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string UserTrueName { get; set; }

       /// <summary>
       ///性别
       /// </summary>
       [Display(Name ="性别")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? Gender { get; set; }

       /// <summary>
       ///头像
       /// </summary>
       [Display(Name ="头像")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string HeadImageUrl { get; set; }

       /// <summary>
       ///不用
       /// </summary>
       [Display(Name ="不用")]
       [Column(TypeName="int")]
       public int? Dept_Id { get; set; }

       /// <summary>
       ///不用
       /// </summary>
       [Display(Name ="不用")]
       [MaxLength(150)]
       [Column(TypeName="nvarchar(150)")]
       [Editable(true)]
       public string DeptName { get; set; }

       /// <summary>
       ///角色
       /// </summary>
       [Display(Name ="角色")]
       [Column(TypeName="int")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public int Role_Id { get; set; }

       /// <summary>
       ///不用
       /// </summary>
       [Display(Name ="不用")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       public string RoleName { get; set; }

       /// <summary>
       ///Token
       /// </summary>
       [Display(Name ="Token")]
       [MaxLength(500)]
       [Column(TypeName="nvarchar(500)")]
       [Editable(true)]
       public string Token { get; set; }

       /// <summary>
       ///类型
       /// </summary>
       [Display(Name ="类型")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? AppType { get; set; }

       /// <summary>
       ///组织构架
       /// </summary>
       [Display(Name ="组织构架")]
       [MaxLength(2000)]
       [Column(TypeName="nvarchar(2000)")]
       [Editable(true)]
       public string DeptIds { get; set; }

       /// <summary>
       ///密码
       /// </summary>
       [Display(Name ="密码")]
       [MaxLength(200)]
       [JsonIgnore]       [SugarColumn(NoSerialize = true)]
       [Column(TypeName="nvarchar(200)")]
       public string UserPwd { get; set; }

       /// <summary>
       ///注册时间
       /// </summary>
       [Display(Name ="注册时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///手机用户
       /// </summary>
       [Display(Name ="手机用户")]
       [Column(TypeName="int")]
       public int? IsRegregisterPhone { get; set; }

       /// <summary>
       ///手机号
       /// </summary>
       [Display(Name ="手机号")]
       [MaxLength(11)]
       [Column(TypeName="nvarchar(11)")]
       public string PhoneNo { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Tel")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       public string Tel { get; set; }

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
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string Creator { get; set; }

       /// <summary>
       ///是否可用
       /// </summary>
       [Display(Name ="是否可用")]
       [Column(TypeName="tinyint")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public byte Enable { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///审核状态
       /// </summary>
       [Display(Name ="审核状态")]
       [Column(TypeName="int")]
       public int? AuditStatus { get; set; }

       /// <summary>
       ///审核人
       /// </summary>
       [Display(Name ="审核人")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string Auditor { get; set; }

       /// <summary>
       ///审核时间
       /// </summary>
       [Display(Name ="审核时间")]
       [Column(TypeName="datetime")]
       public DateTime? AuditDate { get; set; }

       /// <summary>
       ///最后登陆时间
       /// </summary>
       [Display(Name ="最后登陆时间")]
       [Column(TypeName="datetime")]
       public DateTime? LastLoginDate { get; set; }

       /// <summary>
       ///最后密码修改时间
       /// </summary>
       [Display(Name ="最后密码修改时间")]
       [Column(TypeName="datetime")]
       public DateTime? LastModifyPwdDate { get; set; }

       /// <summary>
       ///地址
       /// </summary>
       [Display(Name ="地址")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       public string Address { get; set; }

       /// <summary>
       ///电话
       /// </summary>
       [Display(Name ="电话")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Mobile { get; set; }

       /// <summary>
       ///Email
       /// </summary>
       [Display(Name ="Email")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       public string Email { get; set; }

       /// <summary>
       ///备注
       /// </summary>
       [Display(Name ="备注")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Editable(true)]
       public string Remark { get; set; }

       /// <summary>
       ///排序号
       /// </summary>
       [Display(Name ="排序号")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? OrderNo { get; set; }

       
    }
}
