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
    public class Pagination
    {
        [Display(Name = "分页数量")]
        public int Page { get; set; }

        [Display(Name = "搜索内容")]
        [MaxLength(200)]
        [Column(TypeName = "nvarchar(200)")]
        public string Content { get; set; }

        [Display(Name = "二级分类ID")]

        [Column(TypeName = "int")]
        public int SecondClassifyId { get; set; }

        [Display(Name = "一级导航分类ID")]

        [Column(TypeName = "int")]
        public int ClassifyId { get; set; }

        /// <summary>
        /// 行情指数的日期
        /// </summary>

        public int DateRange { get; set; }
        public string Ids { get; set; }
    }
}
