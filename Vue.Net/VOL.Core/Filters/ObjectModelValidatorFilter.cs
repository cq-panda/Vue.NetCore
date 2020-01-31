using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using VOL.Core.Extensions;
using VOL.Core.Infrastructure;
using VOL.Entity.DomainModels;

namespace VOL.Core.Filters
{
    public class ObjectModelValidatorFilter : Attribute
    {
        public ObjectModelValidatorFilter(ValidatorModel validatorGroup)
        {
            MethodsParameters = validatorGroup.GetModelParameters()?.Select(x => x.ToLower())?.ToArray();
        }
        public string[] MethodsParameters { get; }
    }
}
