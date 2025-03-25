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
    [Entity(TableCnName = "数据采集",TableName = "FormCollectionObject")]
    public class FormCollectionObject:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="FormCollectionId")]
       [Column(TypeName="uniqueidentifier")]
       [Required(AllowEmptyStrings=false)]
       public Guid FormCollectionId { get; set; }

       /// <summary>
       ///表单ID
       /// </summary>
       [Display(Name ="表单ID")]
       [Column(TypeName="uniqueidentifier")]
       [Editable(true)]
       public Guid? FormId { get; set; }

       /// <summary>
       ///标题
       /// </summary>
       [Display(Name ="标题")]
       [Column(TypeName="nvarchar(max)")]
       [Editable(true)]
       public string Title { get; set; }

       /// <summary>
       ///表单数据
       /// </summary>
       [Display(Name ="表单数据")]
       [Column(TypeName="nvarchar(max)")]
       [Editable(true)]
       public string FormData { get; set; }

       /// <summary>
       ///提交人
       /// </summary>
       [Display(Name ="提交人")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Creator { get; set; }

       /// <summary>
       ///提交时间
       /// </summary>
       [Display(Name ="提交时间")]
       [Column(TypeName="datetime")]
       public DateTime? CreateDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="CreateID")]
       [Column(TypeName="int")]
       public int? CreateID { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="Modifier")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       public string Modifier { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyDate")]
       [Column(TypeName="datetime")]
       public DateTime? ModifyDate { get; set; }

       /// <summary>
       ///
       /// </summary>
       [Display(Name ="ModifyID")]
       [Column(TypeName="int")]
       public int? ModifyID { get; set; }

       
    }
}