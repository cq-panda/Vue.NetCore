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
    [Entity(TableCnName = "省市列表")]
    public class vProvinceCity:BaseEntity
    {
        /// <summary>
       ///
       /// </summary>
       [Key]
       [Display(Name ="ProvinceId")]
       [Column(TypeName="int")]
       [Required(AllowEmptyStrings=false)]
       public int ProvinceId { get; set; }

       /// <summary>
       ///省编号
       /// </summary>
       [Display(Name ="省编号")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Required(AllowEmptyStrings=false)]
       public string ProvinceCode { get; set; }

       /// <summary>
       ///省
       /// </summary>
       [Display(Name ="省")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Required(AllowEmptyStrings=false)]
       public string ProvinceName { get; set; }

       /// <summary>
       ///市编号
       /// </summary>
       [Display(Name ="市编号")]
       [MaxLength(20)]
       [Column(TypeName="nvarchar(20)")]
       [Required(AllowEmptyStrings=false)]
       public string CityCode { get; set; }

       /// <summary>
       ///市
       /// </summary>
       [Display(Name ="市")]
       [MaxLength(30)]
       [Column(TypeName="nvarchar(30)")]
       [Required(AllowEmptyStrings=false)]
       public string CityName { get; set; }

       
    }
}