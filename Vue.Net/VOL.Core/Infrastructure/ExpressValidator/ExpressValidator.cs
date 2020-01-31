using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using VOL.Core.Extensions;
using VOL.Entity.DomainModels;

namespace VOL.Core.Infrastructure
{
    public class ExpressValidator : ExpressValidatorCollection
    {
        //public static Dictionary<ValidatorGroup, string[]> validatorCollection = new Dictionary<ValidatorGroup, string[]>();
        //public static string[] GetValidatorCollection(ValidatorGroup validatorGroup)
        //{
        //    return validatorCollection[validatorGroup];
        //}
        //public static void InitValidatorCollection()
        //{
        //    Expression<Func<Sys_User, object>> loginExpress = x => new { x.UserPwd, x.UserName };
        //}
        //private Dictionary<ValidatorGroup, string[]> Add<T>(ValidatorGroup validatorGroup, Expression<Func<T, object>> loginExpress)
        //{
        //    validatorCollection.Add(validatorGroup, loginExpress.GetExpressionToArray());
        //    return validatorCollection;
        //}
    }


}
