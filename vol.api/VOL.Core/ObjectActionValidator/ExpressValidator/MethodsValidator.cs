using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Utilities;


namespace VOL.Core.ObjectActionValidator
{
    public static class MethodsValidator
    {
        /// <summary>
        /// 方法上的model校验配置
        /// </summary>
        public static Dictionary<string, string[]> ValidatorCollection { get; } = new Dictionary<string, string[]>();

        public static void Add<T>(this ValidatorModel validatorGroup, Expression<Func<T, object>> loginExpress = null)
        {
            if (!ValidatorCollection.TryAdd(validatorGroup.ToString().ToLower(),
                loginExpress == null
                ? typeof(T).GetGenericProperties().Select(x => x.Name).ToArray()
                : loginExpress.GetExpressionToArray()))
            {
                throw new Exception($"键{validatorGroup.ToString()}的表达式已经注册过了");
            }
        }
        /// <summary>
        /// 方法上的普通参数校验配置
        /// </summary>
        public static Dictionary<string, GeneralOptions> ValidatorGeneralCollection { get; } = new Dictionary<string, GeneralOptions>();

        /// <summary>
        /// 默认校验的是string类型
        /// </summary>
        /// <param name="general">普通参数名</param>
        /// <param name="CNName">校验错误时显示的提示名字</param>
        public static void Add(this ValidatorGeneral general, string CNName)
        {
            general.Add(CNName, ParamType.String, null, null);
        }
        public static void Add(this ValidatorGeneral general, string CNName, int? max)
        {
            general.Add(CNName, ParamType.String, null, max);
        }
        public static void Add(this ValidatorGeneral general, string CNName, ParamType type)
        {
            general.Add(CNName, type, null, null);
        }
        public static void Add(this ValidatorGeneral general, string CNName, ParamType type, int? max)
        {
            general.Add(CNName, type, null, max);
        }
        public static void Add(this ValidatorGeneral general, string CNName, int? min, int? max)
        {
            general.Add(CNName, ParamType.String, min, max);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="general">普通参数名</param>
        /// <param name="CNName">校验错误时显示的提示名字</param>
        /// <param name="type">参数类型</param>
        /// <param name="min">最大小度(最小值)</param>
        /// <param name="max">最大长度(最大值)</param>
        public static void Add(this ValidatorGeneral general, string CNName, ParamType type, int? min = null, int? max = null)
        {
            GeneralOptions options = new GeneralOptions(general, CNName, type, min, max);
            if (!ValidatorGeneralCollection.TryAdd(general.ToString().ToLower(), options))
            {
                throw new Exception($"键{general.ToString()}参数配置已经注入过了");
            }
        }
        /// <summary>
        /// 自定义验证
        /// </summary>
        /// <param name="general"></param>
        /// <param name="customValidator"></param>
        public static void Add(this ValidatorGeneral general, string CNName, Func<object, ObjectValidatorResult> customValidator)
        {
            GeneralOptions options = new GeneralOptions(general, CNName, customValidator);
            if (!ValidatorGeneralCollection.TryAdd(general.ToString().ToLower(), options))
            {
                throw new Exception($"键{general.ToString()}参数配置已经注入过了");
            }
        }



        /// <summary>
        /// 获取方法上绑定的model校验字段
        /// </summary>
        /// <param name="validatorGroup"></param>
        /// <returns></returns>
        public static string[] GetModelParameters(this ValidatorModel validatorGroup)
        {
            return validatorGroup.ToString().GetModelParameters();
        }
        /// <summary>
        /// 获取方法上绑定的model校验字段
        /// </summary>
        /// <param name="validatorGroup"></param>
        /// <returns></returns>
        public static string[] GetModelParameters(this string validatorGroup)
        {
            if (!ValidatorCollection.TryGetValue(validatorGroup.ToLower(), out string[] values))
            {
                Console.WriteLine($"未注册{validatorGroup}参数的表达式");
                throw new Exception($"未注册{validatorGroup}参数的表达式");
            }
            return values;
        }
        /// <summary>
        /// 获取方法上绑定校验字段的配置信息
        /// </summary>
        /// <param name="general"></param>
        /// <returns></returns>
        public static IEnumerable<GeneralOptions> GetGeneralOption(this ValidatorGeneral[] general)
        {
            return general.Select(x => x.ToString()).ToArray().GetGeneralOption();
        }
        /// <summary>
        /// 获取方法上绑定校验字段的配置信息
        /// </summary>
        /// <param name="general"></param>
        /// <returns></returns>
        public static IEnumerable<GeneralOptions> GetGeneralOption(this string[] generalName)
        {
            foreach (string item in generalName)
            {
                if (!ValidatorGeneralCollection.TryGetValue(item.ToLower(), out GeneralOptions options))
                {
                    throw new Exception($"未注册{generalName.ToString()}参数的配置");
                }
                yield return options;
            }
        }

        public static void ActionParamsValidator(this ActionExecutingContext context)
        {
            //普通参数校验
            context.GeneralValidator();

            //是否使用了model参数校验
            if (!context.ExistsActionModelValidator()) return;
            //判断当前model校验是否通垸
            ObjectModelValidatorState objectModel = context.HttpContext.GetService<ObjectModelValidatorState>();
            if (!objectModel.Status)
            {
                context.Result = new JsonResult(objectModel);
                return;
            }

            //判断是否提交了model参数
            if (!objectModel.HasModelContent)
            {
                context.Result = new JsonResult(new WebResponseContent().Error($"请提交参数"));
                return;
            }
        }

        /// <summary>
        /// 是否添加了ModelValidator实体校验
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public static bool ExistsActionModelValidator(this ActionExecutingContext context)
        {
            return context.ActionDescriptor.EndpointMetadata.Any(item => item is ObjectModelValidatorFilter);
        }
        /// <summary>
        /// 是否添加了ModelValidator实体校验
        /// </summary>
        /// <param name="actionContext"></param>
        /// <returns></returns>
        public static string[] GetModelValidatorParams(this ActionContext actionContext)
        {
            return (actionContext.ActionDescriptor
                     .EndpointMetadata
                     .Where(item => item is ObjectModelValidatorFilter)
                     .FirstOrDefault() as ObjectModelValidatorFilter)?.MethodsParameters;
        }
        /// <summary>
        /// model校验
        /// </summary>
        /// <param name="actionContext"></param>
        /// <param name="prefix"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        public static void ModelValidator(this ActionContext actionContext, string prefix, object model)
        {
            string[] parameters = actionContext.GetModelValidatorParams();
            //没有设置模型校验的直接返回
            if (parameters == null) return;
            if (model == null)
            {
                actionContext.ErrorResult("没有获取到参数");
                return;
            }
            //model==list未判断
            PropertyInfo[] properties = model.GetType().GetProperties().Where(x => parameters.Contains(x.Name.ToLower())).ToArray();
            foreach (var item in properties)
            {
                if (!item.ValidationRquiredValueForDbType(item.GetValue(model), out string message))
                {
                    actionContext.ErrorResult(message);
                    return;
                }
            }
            actionContext.OkModelResult();
        }

        /// <summary>
        /// 普通参数校验
        /// </summary>
        /// <param name="actionContext"></param>
        public static void GeneralValidator(this ActionExecutingContext actionContext)
        {
            if (actionContext.ActionDescriptor
             .EndpointMetadata
             .Where(item => item is ObjectGeneralValidatorFilter)
             .FirstOrDefault() is ObjectGeneralValidatorFilter objectGeneral)
            {
                foreach (GeneralOptions general in objectGeneral.MethodsParameters)
                {
                    if (actionContext.Result != null) return;
                    if (!actionContext.HttpContext.Request.Query.TryGetValue(general.Name, out StringValues value))
                    {
                        actionContext.ActionErrorResult($"请提交参数[{general.CNName}]");
                        return;
                    }
                    if (string.IsNullOrEmpty(value))
                    {
                        actionContext.ActionErrorResult($"参数[{general.CNName}]不能为空");
                        return;
                    }
                    //自定义验证
                    if (general.CustomValidator != null)
                    {
                        ObjectValidatorResult validatorResult = general.CustomValidator(value);
                        if (!validatorResult.Status)
                        {
                            actionContext.ActionErrorResult(validatorResult.Message);
                            return;
                        }
                        continue;
                    }
                    actionContext.ValidatorValue(general, value);
                }
            }
        }

        public static void ValidatorNumber(Type type, object value)
        {
            value.ChangeType(type);
        }
        public static void ValidatorValue(this ActionExecutingContext actionContext, GeneralOptions options, object model)
        {
            if (model == null)
            {
                actionContext.ActionErrorResult($"请提交参数{options.CNName}");
                return;
            }
            if (options.Min == null && options.Max == null) return;
            switch (options.ParamType)
            {
                //待完ParamType.Long,Byte类型
                case ParamType.Int:
                    //case ParamType.Long:
                    //case ParamType.Byte:
                    if (!int.TryParse(model.ToString(), out int _number))
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]必须是整数");
                        break;
                    }
                    if (options.Min != null && _number < options.Min)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不能小于[{options.Min}]");
                        break;
                    }
                    if (options.Max != null && _number > options.Max)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不能大于[{options.Max}]");
                    }
                    break;
                case ParamType.String:
                    string value = model.ToString();
                    if (options.Min != null && value.Length < options.Min)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]至少[{options.Min}]个字符");
                    }
                    if (options.Max != null && value.Length > options.Max)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]最多[{options.Max}]个字符");
                    }
                    break;
                //待完日期大小
                case ParamType.DateTime:
                    if (!DateTime.TryParse(model.ToString(),out _))
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]应该是日期格式");
                    }
                    break;
                //min,max应该是decimal类型，待完
                case ParamType.Decimal:
                    if (!decimal.TryParse(model.ToString(), out decimal _decimal))
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不是数字");
                        break;
                    }
                    if (options.Min != null && _decimal < options.Min)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不能小于[{options.Min}]");
                        break;
                    }
                    if (options.Max != null && _decimal > options.Max)
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不能大于[{options.Max}]");
                    }
                    break;
                case ParamType.Guid:
                    if (!Guid.TryParse(model.ToString(), out _))
                    {
                        actionContext.ActionErrorResult($"[{options.CNName}]不是Guid类型");
                    }
                    break;
                default:
                    break;
            }
        }

        public static void ActionErrorResult(this ActionExecutingContext actionContext, string message)
        {
            actionContext.Result = new JsonResult(new { Status = false, Message = message });
        }

        /// <summary>
        ///参数验证没有通过的直接返回校验结果
        /// </summary>
        /// <param name="actionContext"></param>
        /// <param name="message"></param>
        public static void ErrorResult(this ActionContext actionContext, string message)
        {
            ObjectModelValidatorState objectModel = actionContext.HttpContext.GetService<ObjectModelValidatorState>();
            if (!objectModel.Status)
            {
                return;
            }
            objectModel.Status = false;
            objectModel.Message = message;
        }
        public static void OkModelResult(this ActionContext actionContext)
        {
            ObjectModelValidatorState objectModel = actionContext.HttpContext.GetService<ObjectModelValidatorState>();
            objectModel.HasModelContent = true;
        }

    }
}
