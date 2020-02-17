using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using VOL.Core.Extensions;
using VOL.Entity.DomainModels;

namespace VOL.Core.ObjectActionValidator
{
    /// <summary>
    /// 对方法指定属性校验,此处配置完成就不用每处都写if esle判断值是合法
    /// 与自带模型校验相比，此处可以通过表达式校验指定字段，也不用担心model字段变化后还去手动修改配置的问题
    /// 目前只支持普通属性，不支持复杂类型
    /// </summary>
    public static class ValidatorContainer
    {
        /// <summary>
        /// model校验配置
        /// 方法参数名必须与枚举名称一致（不区分大小写）,如：public void Test(LoginInfo login)
        /// 表达式是model必须要验证的字段，如果不填，默认验证整个model
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection UseMethodsModelParameters(this IServiceCollection services)
        {
            //登陆方法校验参数,只验证密码与用户名
            ValidatorModel.Login.Add<LoginInfo>(x => new { x.PassWord, x.UserName });

            //只验证LoginInfo的密码字段必填
            ValidatorModel.LoginOnlyPassWord.Add<LoginInfo>(x => new { x.PassWord });

            return services;
        }
        /// <summary>
        ///  普通属性校验
        /// 方法上添加[ObjectGeneralValidatorFilter(ValidatorGeneral.xxx)]即可进行参数自动验证
        /// ValidatorGeneral为枚举(也是方法的参数名)，自己需要校验的参数在枚举上添加
        /// ValidatorGeneral.xxx.Add() 配置自己的验证规则
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection UseMethodsGeneralParameters(this IServiceCollection services)
        {
            //配置用户名最多30个字符
            ValidatorGeneral.UserName.Add("用户名", 30);

            //方法参数名为newPwd，直接在方法加上[ObjectGeneralValidatorFilter(ValidatorGeneral.NewPwd)]进行参数验证
            //如果newPwd为空会提示：新密码不能为空
            //6,50代表newPwd参数最少6个字符，最多50个符
            //其他需要验证的参数同样配置即可
            ValidatorGeneral.NewPwd.Add("新密码", 6, 50);

            //如果OldPwd为空会提示：旧密码不能为空
            ValidatorGeneral.OldPwd.Add("旧密码");

            //校验手机号码格式
            ValidatorGeneral.PhoneNo.Add("手机号码", (object value) =>
            {
                ObjectValidatorResult validatorResult = new ObjectValidatorResult(true);
                if (!value.ToString().IsPhoneNo())
                {
                    validatorResult = validatorResult.Error("请输入正确的手机号码");
                }
                return validatorResult;
            });

            //测试验证字符长度为6-10
            ValidatorGeneral.Local.Add("所在地",6,10);

            //测试验证数字范围
            ValidatorGeneral.Qty.Add("存货量",ParamType.Int, 200, 500);

            return services;
        }
    }
    //方法参数是实体配置验证字段
    public enum ValidatorModel
    {
        Login,
        LoginOnlyPassWord//只验证密码
    }
    /// <summary>
    /// 方法普通参数名配置(枚举的名字必须与参数名字一样，不区分大小写)
    /// 通过在方法加上[ObjectGeneralValidatorFilter(ValidatorGeneral.UserName, ValidatorGeneral.PassWord)]指定要验证的参数
    /// </summary>
    public enum ValidatorGeneral
    {
        UserName,
        OldPwd,
        NewPwd,
        PhoneNo,
        Local,//测试验证字符长度
        Qty//测试 验证值大小
    }
}
