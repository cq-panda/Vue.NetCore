using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using VOL.Core.Enums;
using VOL.Core.Extensions;

namespace VOL.Core.WorkFlow
{
    public static class WorkFlowFilter
    {
        public static bool CheckFilter<T>(this List<FieldFilter> filters, List<T> entities, object where) where T : class
        {
            try
            {
                if (where != null)
                {
                    return entities.Any(((Func<T, bool>)where));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"流程表达式解析异常:" + ex.Message + ex.InnerException);
                if (filters!=null)
                {
                    //Nullable object must have a value.字段为null时
                    Func<T, bool> expression = filters.Create<T>().Compile();
                    return entities.AsQueryable().Any(expression);
                }
            }
            return false;
        }
        public static Expression<Func<T, bool>> Create<T>(this List<FieldFilter> filters) where T : class
        {
            if (filters == null)
            {
                return null;
            }
            filters = filters.Where(x => !string.IsNullOrEmpty(x.Field)).ToList();
            if (!filters.Any(x => !string.IsNullOrEmpty(x.Value)))
            {
                return null;
            }
            List<string> fields = typeof(T).GetProperties().Select(s => s.Name).ToList();
            Expression<Func<T, bool>> orFilter = null;
            Expression<Func<T, bool>> expression = x => true;
            foreach (var filter in filters)
            {
                if (string.IsNullOrEmpty(filter.Value))
                {
                    continue;
                }
                if (!fields.Contains(filter.Field))
                {
                    string msg = $"表【{typeof(T).GetEntityTableName()}】不存在字段【{filter.Field}】";
                    Console.WriteLine(msg);
                    throw new Exception(msg);
                }
                filter.Value = filter.Value.Trim();
                LinqExpressionType type = LinqExpressionType.Equal;
                switch (filter.FilterType)
                {
                    case "!=":
                        type = LinqExpressionType.NotEqual;
                        break;
                    case ">":
                        type = LinqExpressionType.GreaterThan;
                        break;
                    case ">=":
                        type = LinqExpressionType.ThanOrEqual;
                        break;
                    case "小于":
                    case "<":
                        type = LinqExpressionType.LessThan;
                        break;
                    case "<=":
                        type = LinqExpressionType.LessThanOrEqual;
                        break;
                    case "in":
                        type = LinqExpressionType.In;
                        break;
                    case "like":
                        type = LinqExpressionType.Contains;
                        break;
                    default:
                        break;
                }
                if (type == LinqExpressionType.In)
                {
                    var values = filter.Value.Split(",").Where(x => !string.IsNullOrEmpty(x)).ToList();
                    if (values.Count > 0)
                    {
                        expression = expression.And(filter.Field.CreateExpression<T>(values, type));
                    }
                }
                else if (filter.FilterType == "or")
                {
                    if (orFilter == null)
                    {
                        orFilter = x => false;
                    }
                    orFilter = orFilter.Or(filter.Field.CreateExpression<T>(filter.Value, LinqExpressionType.Equal,true));
                }
                else
                {
                    expression = expression.And(filter.Field.CreateExpression<T>(filter.Value, type,true));
                }
            }
            if (orFilter != null)
            {
                expression = expression.And(orFilter);
            }
            return expression;

        }
    }
}
