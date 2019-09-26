using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Enums
{
    public enum ApiPINType
    {
        ///1、注册(用户注册验证码)
        ///2、忘记密码(修改密码验证码)
        ///3、验证码登录(身份验证验证码)
        ///4、修改密码(修改密码验证码)

        Register=1,
        ForgetPwd=2,
        LoginAuth=3,
        ModifyPwd=4

    }
}
