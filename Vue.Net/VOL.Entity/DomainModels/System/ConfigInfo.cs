using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace VOL.Entity.DomainModels.System
{
    public class ConfigInfo
    {
        [Required(ErrorMessage = "唯一编码不能为空")]
        public int Id { get; set; }

        [Required(ErrorMessage = "配置内容不能为空")]
        public string Json { get; set; }
    }
}
