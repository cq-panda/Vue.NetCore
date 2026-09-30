using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.Enums;

namespace VOL.Core.Extensions
{

    public static class IdentityCode
    {
        /// <summary>
        /// 创建自增单据号
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity">实体对象</param>
        /// <param name="codeField">要设置单据号的字段</param>
        /// <param name="preCode">单据号前缀,如：{TC}{2023}{0001}</param>
        /// <param name="dateFieldExpression">日期字段，用于按周期筛选数据</param>
        /// <param name="cycleType">单据号周期类型，默认每日</param>
        /// <param name="serialLength">流水号位数，默认4位</param>
        /// <returns>生成的单据号</returns>
        /// <example>
        /// 单条生成（默认每日4位流水号）：
        /// <code>
        /// Sys_Order order = new Sys_Order();
        /// // 结果：SO202606080001
        /// order.Create(x => x.OrderNo, "SO", x => x.CreateDate);
        /// </code>
        /// 每月重置流水号：
        /// <code>
        /// // 结果：SO2026060001
        /// order.Create(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Month);
        /// </code>
        /// 每年重置流水号：
        /// <code>
        /// // 结果：SO20260001
        /// order.Create(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Year);
        /// </code>
        /// 自定义流水号位数：
        /// <code>
        /// // 结果：SO20260608000001
        /// order.Create(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Day, 6);
        /// </code>
        /// </example>
        public static string Create<T>(this T entity,
            Expression<Func<T, object>> codeField,
            string preCode = "Code",
            Expression<Func<T, object>> dateFieldExpression = null,
            IdentityCodeCycleType cycleType = IdentityCodeCycleType.Day,
            int serialLength = 4
            ) where T : class
        {
            return new[] { entity }.CreateList(codeField, preCode, dateFieldExpression, cycleType, serialLength).FirstOrDefault();
        }

        /// <summary>
        /// 批量创建自增单据号（只查询一次数据库，依次递增）
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities">实体集合</param>
        /// <param name="codeField">要设置单据号的字段</param>
        /// <param name="preCode">单据号前缀,如：{TC}{2023}{0001}</param>
        /// <param name="dateFieldExpression">日期字段，用于按周期筛选数据</param>
        /// <param name="cycleType">单据号周期类型，默认每日</param>
        /// <param name="serialLength">流水号位数，默认4位</param>
        /// <returns>生成的单据号列表</returns>
        /// <example>
        /// 批量生成（默认每日4位流水号）：
        /// <code>
        /// List<Sys_Order> orders = new List<Sys_Order> { order1, order2, order3 };
        /// // 结果：SO202606080001、SO202606080002、SO202606080003
        /// orders.CreateList(x => x.OrderNo, "SO", x => x.CreateDate);
        /// </code>
        /// 每月重置流水号：
        /// <code>
        /// // 结果：SO2026060001、SO2026060002
        /// orders.CreateList(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Month);
        /// </code>
        /// 每年重置流水号：
        /// <code>
        /// // 结果：SO20260001、SO20260002
        /// orders.CreateList(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Year);
        /// </code>
        /// 自定义流水号位数：
        /// <code>
        /// // 结果：SO20260608000001、SO20260608000002
        /// orders.CreateList(x => x.OrderNo, "SO", x => x.CreateDate, IdentityCodeCycleType.Day, 6);
        /// </code>
        /// </example>
        public static List<string> CreateList<T>(this IEnumerable<T> entities,
            Expression<Func<T, object>> codeField,
            string preCode = "Code",
            Expression<Func<T, object>> dateFieldExpression = null,
            IdentityCodeCycleType cycleType = IdentityCodeCycleType.Day,
            int serialLength = 4
            ) where T : class
        {
            var entityList = entities?.ToList() ?? new List<T>();
            if (entityList.Count == 0)
            {
                return new List<string>();
            }

            string dateField;
            if (dateFieldExpression == null)
            {
                dateField = AppSetting.CreateMember.DateField;
            }
            else
            {
                dateField = dateFieldExpression.GetExpressionPropertyFirst();
            }

            var codeFieldName = codeField.GetExpressionPropertyFirst();
            DateTime cycleStartDate = GetCycleStartDate(cycleType);
            var dateCondition = dateField.CreateExpression<T>(cycleStartDate, LinqExpressionType.ThanOrEqual);
            var codeCondition = codeFieldName.CreateExpression<T>(preCode, LinqExpressionType.LikeStart);
            var condition = dateCondition.And(codeCondition);

            string orderNo = DBServerProvider.DbContext.Set<T>().Where(condition)
                .OrderByDescending(codeField)
                .Select(codeField)
                .FirstOrDefault()
                ?.ToString();

            if (serialLength < 1)
            {
                serialLength = 4;
            }

            int startNo = string.IsNullOrEmpty(orderNo) ? 1 : orderNo.Substring(orderNo.Length - serialLength).GetInt() + 1;
            string prefix = $"{preCode}{GetDatePart(cycleType)}";
            string serialFormat = $"D{serialLength}";

            var property = typeof(T).GetProperty(codeFieldName);

            var rules = new List<string>(entityList.Count);
            for (int i = 0; i < entityList.Count; i++)
            {
                string rule = prefix + (startNo + i).ToString(serialFormat);
                property.SetValue(entityList[i], rule);
                rules.Add(rule);
            }

            return rules;
        }

        private static DateTime GetCycleStartDate(IdentityCodeCycleType cycleType)
        {
            DateTime now = DateTime.Now;
            switch (cycleType)
            {
                case IdentityCodeCycleType.Year:
                    return new DateTime(now.Year, 1, 1);
                case IdentityCodeCycleType.Month:
                    return new DateTime(now.Year, now.Month, 1);
                default:
                    return (DateTime)now.ToString("yyyy-MM-dd").GetDateTime();
            }
        }

        private static string GetDatePart(IdentityCodeCycleType cycleType)
        {
            switch (cycleType)
            {
                case IdentityCodeCycleType.Year:
                    return DateTime.Now.ToString("yyyy");
                case IdentityCodeCycleType.Month:
                    return DateTime.Now.ToString("yyyyMM");
                default:
                    return DateTime.Now.ToString("yyyyMMdd");
            }
        }
    }
}
