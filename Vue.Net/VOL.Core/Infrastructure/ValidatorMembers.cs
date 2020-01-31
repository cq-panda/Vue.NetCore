using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using VOL.Core.Extensions;
using VOL.Entity.DomainModels;

namespace VOL.Core.Infrastructure
{
    /// <summary>
    /// 对方法指定属性校验,此处配置完成就不用每处都写if esle判断值是合法
    /// 与自带模型校验相比，此处可以通过表达式校验指定字段，也不用担心model字段变化后还去手动修改配置的问题
    /// 目前只支持普通属性，不支持复杂类型
    /// </summary>
    public static class ValidatorMembers
    {
        /// <summary>
        /// model校验配置
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection UseMethodsModelParameters(this IServiceCollection services)
        {
            /*方法参数名必须与枚举名称一致（不区分大小写）,如：public void Test(LoginInfo login)
             *表达式是model必须要验证的字段，如果不填，默认验证整个model
             */

            //登陆方法校验参数
            ValidatorModel.Login.Add<LoginInfo>(x => new { x.PassWord, x.UserName });
            return services;
        }
        public static IServiceCollection UseMethodsGeneralParameters(this IServiceCollection services)
        {
            /*方法上添加[ObjectGeneralValidatorFilter(ValidatorGeneral.xxx)]即可进行参数自动验证
             * ValidatorGeneral为枚举(也是方法的参数名)，自己需要校验的参数在枚举上添加
             * ValidatorGeneral.xxx.Add()配置自己的验证规则
            */

            //配置用户名最多30个字符
            ValidatorGeneral.UserName.Add("用户名",30);
            //方法参数名为newPwd，直接在方法加上[ObjectGeneralValidatorFilter(ValidatorGeneral.NewPwd)]进行参数验证
            //如果newPwd为空会提示：新密码不能为空
            //6,50代表newPwd参数最少6个字符，最多50个符
            //其他需要验证的参数同样配置即可
            ValidatorGeneral.NewPwd.Add("新密码", 6, 50);
            //如果OldPwd为空会提示：旧密码不能为空
            ValidatorGeneral.OldPwd.Add("旧密码");

            return services;
        }
    }
    //方法参数是实体配置验证字段
    public enum ValidatorModel
    {
        Login
    }
    /// <summary>
    /// 方法普通参数名配置(枚举的名字必须与参数名字一样，不区分大小写)
    /// 通过在方法加上[ObjectGeneralValidatorFilter(ValidatorGeneral.UserName, ValidatorGeneral.PassWord)]指定要验证的参数
    /// </summary>
    public enum ValidatorGeneral
    {
        UserName,
        OldPwd, 
        NewPwd
    }
}
