using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace VOL.Core.Extensions
{
    /// <summary>
    /// 泛型扩展
    /// </summary>
    public static class GenericExtension
    {
        public static bool Equal<T>(this T x, T y)
        {
            return ((IComparable)(x)).CompareTo(y) == 0;
        }

        #region ToDictionary
        /// <summary>
        /// 将实体指定的字段写入字典
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <param name="expression"></param>
        /// <returns></returns>

        public static Dictionary<string, object> ToDictionary<T>(this T t, Expression<Func<T, object>> expression) where T : class
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            string[] fields = expression.GetExpressionToArray();
            PropertyInfo[] properties = expression == null ? t.GetType().GetProperties() : t.GetType().GetProperties().Where(x => fields.Contains(x.Name)).ToArray();

            foreach (var property in properties)
            {
                var value = property.GetValue(t, null);
                dic.Add(property.Name, value != null ? value.ToString() : "");
            }
            return dic;
        }

        public static Dictionary<string, string> ToDictionary<TInterface, T>(this TInterface t, Dictionary<string, string> dic = null) where T : class, TInterface
        {
            if (dic == null)
                dic = new Dictionary<string, string>();
            var properties = typeof(T).GetProperties();
            foreach (var property in properties)
            {
                var value = property.GetValue(t, null);
                if (value == null) continue;
                dic.Add(property.Name, value != null ? value.ToString() : "");
            }
            return dic;
        }

        #endregion


        public static DataTable ToDataTable<T>(this IEnumerable<T> source, Expression<Func<T, object>> columns = null, bool contianKey = true)
        {
            DataTable dtReturn = new DataTable();
            if (source == null) return dtReturn;

            PropertyInfo[] oProps = typeof(T).GetProperties()
                .Where(x => x.PropertyType.Name != "List`1").ToArray();
            if (columns != null)
            {
                string[] columnArray = columns.GetExpressionToArray();
                oProps = oProps.Where(x => columnArray.Contains(x.Name)).ToArray();
            }
            //移除自增主键
            PropertyInfo keyType = oProps.GetKeyProperty();// oProps.GetKeyProperty()?.PropertyType;
            if (!contianKey && keyType != null && (keyType.PropertyType == typeof(int) || keyType.PropertyType == typeof(long)))
            {
                oProps = oProps.Where(x => x.Name != keyType.Name).ToArray();
            }

            foreach (var pi in oProps)
            {
                var colType = pi.PropertyType;

                if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition() == typeof(Nullable<>)))
                {
                    colType = colType.GetGenericArguments()[0];
                }

                dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
            }
            foreach (var rec in source)
            {
                var dr = dtReturn.NewRow();
                foreach (var pi in oProps)
                {
                    dr[pi.Name] = pi.GetValue(rec, null) == null
                        ? DBNull.Value
                        : pi.GetValue
                            (rec, null);
                }
                dtReturn.Rows.Add(dr);
            }
            return dtReturn;
        }
    }
}
