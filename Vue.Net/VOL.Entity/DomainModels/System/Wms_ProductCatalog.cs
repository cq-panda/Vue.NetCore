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
    
    public class Wms_ProductCatalog:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="id")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int id { get; set; }

       /// <summary>
       ///商品
       /// </summary>
       [Display(Name ="商品")]
       [MaxLength(8)]
       [Column(TypeName="nvarchar(8)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string CatalogCode { get; set; }

       /// <summary>
       ///商品
       /// </summary>
       [Display(Name ="商品")]
       [MaxLength(4)]
       [Column(TypeName="nvarchar(4)")]
       public string ParentCatalogCode { get; set; }

       /// <summary>
       ///分类名称
       /// </summary>
       [Display(Name ="分类名称")]
       [MaxLength(60)]
       [Column(TypeName="nvarchar(60)")]
       [Required(AllowEmptyStrings=false)]
       public string CatalogName { get; set; }

       /// <summary>
       ///药品类别
       /// </summary>
       [Display(Name ="药品类别")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Editable(true)]
       public string MedicineType { get; set; }

       /// <summary>
       ///排序号
       /// </summary>
       [Display(Name ="排序号")]
       [Column(TypeName="int")]
       [Editable(true)]
       public int? OrderNo { get; set; }

       /// <summary>
       ///描述
       /// </summary>
       [Display(Name ="描述")]
       [MaxLength(400)]
       [Column(TypeName="nvarchar(400)")]
       [Editable(true)]
       public string Remark { get; set; }

       /// <summary>
       ///创建人id
       /// </summary>
       [Display(Name ="创建人id")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int CreatorUserId { get; set; }

       /// <summary>
       ///创建人
       /// </summary>
       [Display(Name ="创建人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Required(AllowEmptyStrings=false)]
       public string Creator { get; set; }

       /// <summary>
       ///创建时间
       /// </summary>
       [Display(Name ="创建时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public DateTime CreationTime { get; set; }

       /// <summary>
       ///修改人id
       /// </summary>
       [Display(Name ="修改人id")]
       [Column(TypeName="int")]
       public int? LastModifierUserId { get; set; }

       /// <summary>
       ///修改人
       /// </summary>
       [Display(Name ="修改人")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       public string Modifier { get; set; }

       /// <summary>
       ///修改时间
       /// </summary>
       [Display(Name ="修改时间")]
       [Column(TypeName="datetime")]
       [Editable(true)]
       public DateTime? LastModificationTime { get; set; }

       
    }
}
