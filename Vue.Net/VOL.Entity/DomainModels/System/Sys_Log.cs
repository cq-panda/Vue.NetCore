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
    [EntityAttribute(TableCnName = "系统日志")]
    public class Sys_Log:BaseEntity
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
       ///开始时间
       /// </summary>
       [Display(Name ="开始时间")]
       [Column(TypeName="datetime")]
       public DateTime? BeginDate { get; set; }

       /// <summary>
       ///请求地址
       /// </summary>
       [Display(Name ="请求地址")]
       [MaxLength(30000)]
       [Column(TypeName="varchar(30000)")]
       public string Url { get; set; }

       /// <summary>
       ///日志类型
       /// </summary>
       [Display(Name ="日志类型")]
       [MaxLength(50)]
       [Column(TypeName="varchar(50)")]
       public string LogType { get; set; }

       /// <summary>
       ///响应状态
       /// </summary>
       [Display(Name ="响应状态")]
       [Column(TypeName="int")]
       public int? Success { get; set; }

       /// <summary>
       ///时长(毫秒)
       /// </summary>
       [Display(Name ="时长(毫秒)")]
       [Column(TypeName="int")]
       public int? ElapsedTime { get; set; }

       /// <summary>
       ///请求参数
       /// </summary>
       [Display(Name ="请求参数")]
       [MaxLength(10000)]
       [Column(TypeName="nvarchar(10000)")]
       public string RequestParameter { get; set; }

       /// <summary>
       ///响应参数
       /// </summary>
       [Display(Name ="响应参数")]
       [MaxLength(10000)]
       [Column(TypeName="nvarchar(10000)")]
       public string ResponseParameter { get; set; }

       /// <summary>
       ///异常信息
       /// </summary>
       [Display(Name ="异常信息")]
       [MaxLength(10000)]
       [Column(TypeName="nvarchar(10000)")]
       public string ExceptionInfo { get; set; }

       /// <summary>
       ///用户IP
       /// </summary>
       [Display(Name ="用户IP")]
       [MaxLength(100)]
       [Column(TypeName="varchar(100)")]
       public string UserIP { get; set; }

       /// <summary>
       ///服务器IP
       /// </summary>
       [Display(Name ="服务器IP")]
       [MaxLength(100)]
       [Column(TypeName="varchar(100)")]
       public string ServiceIP { get; set; }

       /// <summary>
       ///浏览器类型
       /// </summary>
       [Display(Name ="浏览器类型")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       public string BrowserType { get; set; }

       /// <summary>
       ///用户ID
       /// </summary>
       [Display(Name ="用户ID")]
       [Column(TypeName="int")]
       public int? User_Id { get; set; }

       /// <summary>
       ///用户名称
       /// </summary>
       [Display(Name ="用户名称")]
       [MaxLength(30000)]
       [Column(TypeName="varchar(30000)")]
       public string UserName { get; set; }

       /// <summary>
       ///角色ID
       /// </summary>
       [Display(Name ="角色ID")]
       [Column(TypeName="int")]
       public int? Role_Id { get; set; }

       /// <summary>
       ///结束时间
       /// </summary>
       [Display(Name ="结束时间")]
       [Column(TypeName="datetime")]
       public DateTime? EndDate { get; set; }

       
    }
}
