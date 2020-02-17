using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace VOL.Entity.DomainModels
{
    public class LoginInfo
    {

        [Display(Name = "用户名")]
        [MaxLength(50)]
        [Required(ErrorMessage = "用户名不能为空")]
        public string UserName { get; set; }
        [MaxLength(50)]
        [Display(Name = "密码")]
        [Required(ErrorMessage = "密码不能为空")]
        public string PassWord { get; set; }
        [MaxLength(6)]
        [Display(Name = "验证码")]
        [Required(ErrorMessage = "验证码不能为空")]
        public string VerificationCode { get; set; }
    }
}
