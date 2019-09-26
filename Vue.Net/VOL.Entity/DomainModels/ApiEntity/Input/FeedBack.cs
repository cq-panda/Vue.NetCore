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
    public class FeedBack
    {
        /// <summary>
        ///反馈内容
        /// </summary>
        [Display(Name = "反馈内容")]
        [MaxLength(1000)]
        [Column(TypeName = "nvarchar(1000)")]
        [Required(AllowEmptyStrings = false)]
        public string Content { get; set; }

        /// <summary>
        ///电话
        /// </summary>
        [Display(Name = "电话")]
        [MaxLength(15)]
        [Column(TypeName = "varchar(15)")]
        [Required(AllowEmptyStrings = false)]
        public string PhoneNo { get; set; }
    }
}
