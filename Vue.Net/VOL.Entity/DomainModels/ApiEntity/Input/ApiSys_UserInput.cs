using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Entity;

namespace VOL.Entity.DomainModels
{
    public class ApiSys_UserInput
    {
        /// <summary>
       ///用户名
       /// </summary>
       [Display(Name ="用户名")]
       [MaxLength(100)]
       [Column(TypeName="nvarchar(100)")]
       [Editable(true)]
       [Required(AllowEmptyStrings=false)]
       public string UserName { get; set; }

       /// <summary>
       ///密码
       /// </summary>
       [Display(Name ="密码")]
       [MaxLength(200)]
       [Column(TypeName="nvarchar(200)")]
       [Required(AllowEmptyStrings=false)]
       public string UserPwd { get; set; }

       /// <summary>
       ///手机号
       /// </summary>
       [Display(Name ="手机号")]
       [MaxLength(11)]
       [Column(TypeName="nvarchar(11)")]
       [Required(AllowEmptyStrings=false)]
       public string PhoneNo { get; set; }

       
    }
}