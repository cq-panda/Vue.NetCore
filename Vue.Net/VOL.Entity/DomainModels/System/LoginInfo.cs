using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace VOL.Entity.DomainModels
{
    public class LoginInfo
    {

        [Display(Name = "用户名")]
        [Required(ErrorMessage = "用户名不能为空")]
        public string UserName { get; set; }

        [Display(Name = "密码")]
        [Required(ErrorMessage = "密码不能为空")]
        public string PassWord { get; set; }

        [Display(Name = "验证码")]
        [Required(ErrorMessage = "验证码不能为空")]
        public string VerificationCode { get; set; }
    }
}
