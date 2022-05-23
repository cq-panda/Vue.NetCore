using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;
using System.Xml.Linq;

namespace VOL.Core.Extensions
{

    public static class ObjectExtension
    {

        public static bool DicKeyIsNullOrEmpty(this Dictionary<string, object> dic, string key)
        {
            if (dic == null)
                return true;
            if (!dic.ContainsKey(key)) return true;
            object value = dic[key];
            if (value == null || value.ToString() == "")
            {
                return true;
            }
            return false;
        }
        public static Dictionary<string, object> ReaderToDictionary(this IDataReader Reader)
        {
            List<Dictionary<string, object>> rowList = Reader.ReaderToDictionaryList();
            return rowList.Count() > 0 ? rowList[0] : null;
        }
        /// <summary>
        /// IDataReader转换成DictionaryList
        /// </summary>
        /// <param name="Reader"></param>
        /// <returns></returns>
        public static List<Dictionary<string, object>> ReaderToDictionaryList(this IDataReader Reader)
        {
            List<Dictionary<string, object>> rowList = new List<Dictionary<string, object>>();
            try
            {
                while (Reader.Read())
                {
                    Dictionary<string, object> row = new Dictionary<string, object>(StringComparer.OrdinalIgnoreCase);
                    for (var fieldCount = 0; fieldCount < Reader.FieldCount; fieldCount++)
                    {
                        row.Add(Reader.GetName(fieldCount), Reader[fieldCount]);
                    }
                    rowList.Add(row);
                }
            }
            catch (Exception ex) { throw ex; }
            finally
            {
                Reader.Close();
                Reader.Dispose();
            }
            return rowList;
        }

        public static T DicToEntity<T>(this Dictionary<string, object> dic)
        {
            return new List<Dictionary<string, object>>() { dic }.DicToList<T>().ToList()[0];
        }
        public static List<T> DicToList<T>(this List<Dictionary<string, object>> dicList)
        {
            return dicList.DicToIEnumerable<T>().ToList();
        }
        public static object DicToList(this List<Dictionary<string, object>> dicList, Type type)
        {
            return typeof(ObjectExtension).GetMethod("DicToList")
               .MakeGenericMethod(new Type[] { type })
               .Invoke(typeof(ObjectExtension), new object[] { dicList });
        }

        public static IEnumerable<T> DicToIEnumerable<T>(this List<Dictionary<string, object>> dicList)
        {
            foreach (Dictionary<string, object> dic in dicList)
            {
                T model = Activator.CreateInstance<T>();
                foreach (PropertyInfo property in model.GetType()
                    .GetProperties(BindingFlags.GetProperty | BindingFlags.Public | BindingFlags.Instance))
                {
                    if (!dic.TryGetValue(property.Name, out object value)) continue;
                    property.SetValue(model, value?.ToString().ChangeType(property.PropertyType), null);
                }
                yield return model;
            }
        }
        /// <summary>
        /// IDataReader转换成List
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="Reader"></param>
        /// <returns></returns>
        public static List<T> ReaderToList<T>(this IDataReader Reader)
        {
            List<string> objectField = new List<string>(Reader.FieldCount);
            for (int i = 0; i < Reader.FieldCount; i++)
            {
                objectField.Add(Reader.GetName(i).ToLower());
            }
            List<T> objectList = new List<T>();
            try
            {
                while (Reader.Read())
                {
                    T model = Activator.CreateInstance<T>();
                    foreach (PropertyInfo property in model.GetType()
                        .GetProperties(BindingFlags.GetProperty
                        | BindingFlags.Public
                        | BindingFlags.Instance))
                    {
                        if (!objectField.Contains(property.Name.ToLower())) { continue; }
                        if (Reader[property.Name].IsNullOrEmpty()) { continue; }
                        property.SetValue(model, Reader[property.Name].ToString().ChangeType(property.PropertyType), null);
                    }
                    objectList.Add(model);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Reader.Close();
                Reader.Dispose();
            }
            return objectList;
        }


        public static object ChangeType(this object convertibleValue, Type type)
        {
            if (null == convertibleValue) return null;

            try
            {
                if (type == typeof(Guid) || type == typeof(Guid?))
                {
                    string value = convertibleValue.ToString();
                    if (value == "") return null;
                    return Guid.Parse(value);
                }

                if (!type.IsGenericType) return Convert.ChangeType(convertibleValue, type);
                if (type.ToString() == "System.Nullable`1[System.Boolean]" || type.ToString() == "System.Boolean")
                {
                    if (convertibleValue.ToString() == "0")
                        return false;
                    return true;
                }
                Type genericTypeDefinition = type.GetGenericTypeDefinition();
                if (genericTypeDefinition == typeof(Nullable<>))
                {
                    return Convert.ChangeType(convertibleValue, Nullable.GetUnderlyingType(type));
                }
            }
            catch
            {
                return null;
            }
            return null;
        }
        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <typeparam name="T">转换的元素类型。</typeparam>
        /// <param name="list">集合。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>数据集。</returns>
        public static DataSet ToDataSet<T>(this IEnumerable<T> list, bool generic = true)
        {
            return ListToDataSet(list, generic);
        }

        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <param name="list">集合。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>数据集。</returns>
        public static DataSet ToDataSet(this IEnumerable list, bool generic = true)
        {
            return ListToDataSet(list, generic);
        }

        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <typeparam name="T">转换的元素类型。</typeparam>
        /// <param name="list">集合。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>数据集。</returns>
        public static DataSet ToDataSet<T>(this IEnumerable list, bool generic = true)
        {
            return ListToDataSet(list, typeof(T), generic);
        }

        /// <summary>
        /// 将实例转换为集合数据集。
        /// </summary>
        /// <typeparam name="T">实例类型。</typeparam>
        /// <param name="o">实例。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>数据集。</returns>
        public static DataSet ToListSet<T>(this T o, bool generic = true)
        {
            if (o is IEnumerable)
            {
                return ListToDataSet(o as IEnumerable, generic);
            }
            else
            {
                return ListToDataSet(new T[] { o }, generic);
            }
        }

        /// <summary>
        /// 将可序列化实例转换为XmlDocument。
        /// </summary>
        /// <typeparam name="T">实例类型。</typeparam>
        /// <param name="o">实例。</param>
        /// <returns>XmlDocument。</returns>
        public static XmlDocument ToXmlDocument<T>(this T o)
        {
            XmlDocument xmlDocument = new XmlDocument
            {
                InnerXml = o.ToListSet().GetXml()
            };
            return xmlDocument;
        }

        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <param name="list">集合。</param>
        /// <param name="t">转换的元素类型。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>转换后的数据集。</returns>
        private static DataSet ListToDataSet(IEnumerable list, Type t, bool generic)
        {
            DataSet ds = new DataSet("Data");
            if (t == null)
            {
                if (list != null)
                {
                    foreach (var i in list)
                    {
                        if (i == null)
                        {
                            continue;
                        }
                        t = i.GetType();
                        break;
                    }
                }
                if (t == null)
                {
                    return ds;
                }
            }
            ds.Tables.Add(t.Name);
            //如果集合中元素为DataSet扩展涉及到的基本类型时，进行特殊转换。
            if (t.IsValueType || t == typeof(string))
            {
                ds.Tables[0].TableName = "Info";
                ds.Tables[0].Columns.Add(t.Name);
                if (list != null)
                {
                    foreach (var i in list)
                    {
                        DataRow addRow = ds.Tables[0].NewRow();
                        addRow[t.Name] = i;
                        ds.Tables[0].Rows.Add(addRow);
                    }
                }
                return ds;
            }
            //处理模型的字段和属性。
            var fields = t.GetFields();
            var properties = t.GetProperties();
            foreach (var j in fields)
            {
                if (!ds.Tables[0].Columns.Contains(j.Name))
                {
                    if (generic)
                    {
                        ds.Tables[0].Columns.Add(j.Name, j.FieldType);
                    }
                    else
                    {
                        ds.Tables[0].Columns.Add(j.Name);
                    }
                }
            }
            foreach (var j in properties)
            {
                if (!ds.Tables[0].Columns.Contains(j.Name))
                {
                    if (generic)
                    {
                        ds.Tables[0].Columns.Add(j.Name, j.PropertyType);
                    }
                    else
                    {
                        ds.Tables[0].Columns.Add(j.Name);
                    }
                }
            }
            if (list == null)
            {
                return ds;
            }
            //读取list中元素的值。
            foreach (var i in list)
            {
                if (i == null)
                {
                    continue;
                }
                DataRow addRow = ds.Tables[0].NewRow();
                foreach (var j in fields)
                {
                    MemberExpression field = Expression.Field(Expression.Constant(i), j.Name);
                    LambdaExpression lambda = Expression.Lambda(field, new ParameterExpression[] { });
                    Delegate func = lambda.Compile();
                    object value = func.DynamicInvoke();
                    addRow[j.Name] = value;
                }
                foreach (var j in properties)
                {
                    MemberExpression property = Expression.Property(Expression.Constant(i), j);
                    LambdaExpression lambda = Expression.Lambda(property, new ParameterExpression[] { });
                    Delegate func = lambda.Compile();
                    object value = func.DynamicInvoke();
                    addRow[j.Name] = value;
                }
                ds.Tables[0].Rows.Add(addRow);
            }
            return ds;
        }

        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <typeparam name="T">转换的元素类型。</typeparam>
        /// <param name="list">集合。</param>
        /// <param name="generic">是否生成泛型数据集。</param>
        /// <returns>数据集。</returns>
        private static DataSet ListToDataSet<T>(IEnumerable<T> list, bool generic)
        {
            return ListToDataSet(list, typeof(T), generic);
        }

        /// <summary>
        /// 将集合转换为数据集。
        /// </summary>
        /// <param name="list">集合。</param>
        /// <param name="generic">是否转换为字符串形式。</param>
        /// <returns>转换后的数据集。</returns>
        private static DataSet ListToDataSet(IEnumerable list, bool generic)
        {
            return ListToDataSet(list, null, generic);
        }

        /// <summary>
        /// 获取DataSet第一表，第一行，第一列的值。
        /// </summary>
        /// <param name="ds">DataSet数据集。</param>
        /// <returns>值。</returns>
        public static object GetData(this DataSet ds)
        {
            if (
                ds == null
                || ds.Tables.Count == 0
                )
            {
                return string.Empty;
            }
            else
            {
                return ds.Tables[0].GetData();
            }
        }

        /// <summary>
        /// 获取DataTable第一行，第一列的值。
        /// </summary>
        /// <param name="dt">DataTable数据集表。</param>
        /// <returns>值。</returns>
        public static object GetData(this DataTable dt)
        {
            if (
                dt.Columns.Count == 0
                || dt.Rows.Count == 0
                )
            {
                return string.Empty;
            }
            else
            {
                return dt.Rows[0][0];
            }
        }

        /// <summary>
        /// 获取DataSet第一个匹配columnName的值。
        /// </summary>
        /// <param name="ds">数据集。</param>
        /// <param name="columnName">列名。</param>
        /// <returns>值。</returns>
        public static object GetData(this DataSet ds, string columnName)
        {
            if (
                ds == null
                || ds.Tables.Count == 0
                )
            {
                return string.Empty;
            }
            foreach (DataTable dt in ds.Tables)
            {
                object o = dt.GetData(columnName);
                if (!string.IsNullOrEmpty(o.ToString()))
                {
                    return o;
                }
            }
            return string.Empty;
        }

        /// <summary>
        /// 获取DataTable第一个匹配columnName的值。
        /// </summary>
        /// <param name="dt">数据表。</param>
        /// <param name="columnName">列名。</param>
        /// <returns>值。</returns>
        public static object GetData(this DataTable dt, string columnName)
        {
            if (string.IsNullOrEmpty(columnName))
            {
                return GetData(dt);
            }
            if (
                dt.Columns.Count == 0
                || dt.Columns.IndexOf(columnName) == -1
                || dt.Rows.Count == 0
                )
            {
                return string.Empty;
            }
            return dt.Rows[0][columnName];
        }

        /// <summary>
        /// 将object转换为string类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>string。</returns>
        public static string ToString(this object o, string t)
        {
            string info = string.Empty;
            if (o == null)
            {
                info = t;
            }
            else
            {
                info = o.ToString();
            }
            return info;
        }

        /// <summary>
        /// 将DateTime?转换为string类型信息。
        /// </summary>
        /// <param name="o">DateTime?。</param>
        /// <param name="format">标准或自定义日期和时间格式的字符串。</param>
        /// <param name="t">默认值。</param>
        /// <returns>string。</returns>
        public static string ToString(this DateTime? o, string format, string t)
        {
            string info = string.Empty;
            if (o == null)
            {
                info = t;
            }
            else
            {
                info = o.Value.ToString(format);
            }
            return info;
        }

        /// <summary>
        /// 将TimeSpan?转换为string类型信息。
        /// </summary>
        /// <param name="o">TimeSpan?。</param>
        /// <param name="format">标准或自定义时间格式的字符串。</param>
        /// <param name="t">默认值。</param>
        /// <returns>string。</returns>
        public static string ToString(this TimeSpan? o, string format, string t)
        {
            string info = string.Empty;
            if (o == null)
            {
                info = t;
            }
            else
            {
                info = o.Value.ToString(format);
            }
            return info;
        }



        /// <summary>
        /// 将object转换为byte类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>byte。</returns>
        public static byte ToByte(this object o, byte t = default(byte))
        {
            if (!byte.TryParse(o.ToString(string.Empty), out byte info))
            {
                info = t;
            }
            return info;
        }

        public static byte[] ToBytes(this object obj)
        {
            if (obj == null)
                return null;
            var bf = new BinaryFormatter();
            using (var ms = new MemoryStream())
            {
                bf.Serialize(ms, obj);
                return ms.ToArray();
            }
        }

        public static object ToObject(this byte[] source)
        {
            using (var memStream = new MemoryStream())
            {
                var bf = new BinaryFormatter();
                memStream.Write(source, 0, source.Length);
                memStream.Seek(0, SeekOrigin.Begin);
                var obj = bf.Deserialize(memStream);
                return obj;
            }
        }

        /// <summary>
        /// 将object转换为char类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>char。</returns>
        public static char ToChar(this object o, char t = default(char))
        {
            if (!char.TryParse(o.ToString(string.Empty), out char info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为int类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>int。</returns>
        public static int ToInt(this object o, int t = default(int))
        {
            if (!int.TryParse(o.ToString(string.Empty), out int info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为double类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>double。</returns>
        public static double ToDouble(this object o, double t = default(double))
        {
            double info;
            if (!double.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为decimal类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>decimal。</returns>
        public static decimal ToDecimal(this object o, decimal t = default(decimal))
        {
            decimal info;
            if (!decimal.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为float类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>float。</returns>
        public static float ToFloat(this object o, float t = default(float))
        {
            if (!float.TryParse(o.ToString(string.Empty), out float info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为long类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>long。</returns>
        public static long ToLong(this object o, long t = default(long))
        {
            long info;
            if (!long.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为bool类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>bool。</returns>
        public static bool ToBool(this object o, bool t = default(bool))
        {
            bool info;
            if (!bool.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为sbyte类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>sbyte。</returns>
        public static sbyte ToSbyte(this object o, sbyte t = default(sbyte))
        {
            sbyte info;
            if (!sbyte.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为short类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>short。</returns>
        public static short ToShort(this object o, short t = default(short))
        {
            short info;
            if (!short.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为ushort类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>ushort。</returns>
        public static ushort ToUShort(this object o, ushort t = default(ushort))
        {
            ushort info;
            if (!ushort.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为ulong类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>ulong。</returns>
        public static ulong ToULong(this object o, ulong t = default(ulong))
        {
            ulong info;
            if (!ulong.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为Enum[T]类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>Enum[T]。</returns>
        public static T ToEnum<T>(this object o, T t = default(T))
            where T : struct
        {
            if (!System.Enum.TryParse(o.ToString(string.Empty), out T info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为DateTime类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>DateTime。</returns>
        public static DateTime ToDateTime(this object o, DateTime t = default(DateTime))
        {
            if (t == default(DateTime))
            {
                t = new DateTime(1753, 1, 1);
            }
            DateTime info;
            if (!DateTime.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为TimeSpan类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>TimeSpan。</returns>
        public static TimeSpan ToTimeSpan(this object o, TimeSpan t = default(TimeSpan))
        {
            if (t == default(TimeSpan))
            {
                t = new TimeSpan(0, 0, 0);
            }
            TimeSpan info;
            if (!TimeSpan.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为Guid类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>Guid。</returns>
        public static Guid ToGuid(this object o, Guid t = default(Guid))
        {
            Guid info;
            if (!Guid.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            return info;
        }

        private static Regex BoolRegex = new Regex("(?<info>(true|false))", RegexOptions.IgnoreCase | RegexOptions.Singleline);

        /// <summary>
        /// 从object中获取bool类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>bool。</returns>
        public static bool GetBool(this string value)
        {
            bool.TryParse(value, out bool result);
            return result;
        }

        private static Regex IntRegex = new Regex("(?<info>-?\\d+)", RegexOptions.IgnoreCase | RegexOptions.Singleline);



        private static Regex DecimalRegex = new Regex("(?<info>-?\\d+(\\.\\d+)?)", RegexOptions.IgnoreCase | RegexOptions.Singleline);

        /// <summary>
        /// 从object中获取decimal类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>decimal。</returns>
        public static decimal? GetDecimal(this object o)
        {
            decimal info;
            if (!decimal.TryParse(DecimalRegex.Match(o.ToString(string.Empty)).Groups["info"].Value, out info))
            {
                return null;
            }
            return info;
        }



        /// <summary>
        /// 从object中获取正数信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>decimal。</returns>
        public static decimal? GetPositiveNumber(this object o)
        {
            decimal info;
            if (!decimal.TryParse(DecimalRegex.Match(o.ToString(string.Empty)).Groups["info"].Value, out info))
            {
                return null;
            }
            return Math.Abs(info);
        }

        private static Regex DateTimeRegex = new Regex("(?<info>(((\\d+)[/年-](0?[13578]|1[02])[/月-](3[01]|[12]\\d|0?\\d)[日]?)|((\\d+)[/年-](0?[469]|11)[/月-](30|[12]\\d|0?\\d)[日]?)|((\\d+)[/年-]0?2[/月-](2[0-8]|1\\d|0?\\d)[日]?))(\\s((2[0-3]|[0-1]\\d)):[0-5]\\d:[0-5]\\d)?)", RegexOptions.IgnoreCase | RegexOptions.Singleline);

        /// <summary>
        /// 从object中获取DateTime?类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>DateTime?。</returns>
        public static DateTime? GetDateTime1(this object o)
        {
            DateTime info;
            if (!DateTime.TryParse(DateTimeRegex.Match(o.ToString(string.Empty)).Groups["info"].Value.Replace("年", "-").Replace("月", "-").Replace("/", "-").Replace("日", ""), out info))
            {
                return null;
            }
            return info;
        }

        private static Regex TimeSpanRegex = new Regex("(?<info>-?(\\d+\\.(([0-1]\\d)|(2[0-3])):[0-5]\\d:[0-5]\\d)|((([0-1]\\d)|(2[0-3])):[0-5]\\d:[0-5]\\d)|(\\d+))", RegexOptions.IgnoreCase | RegexOptions.Singleline);

        /// <summary>
        /// 从object中获取TimeSpan?类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>TimeSpan?。</returns>
        public static TimeSpan? GetTimeSpan(this object o)
        {
            TimeSpan info;
            if (!TimeSpan.TryParse(TimeSpanRegex.Match(o.ToString(string.Empty)).Groups["info"].Value, out info))
            {
                return null;
            }
            return info;
        }

        private static Regex GuidRegex = new Regex("(?<info>\\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\\}{0,1})", RegexOptions.IgnoreCase | RegexOptions.Singleline);

        /// <summary>
        /// 从object中获取Guid?类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <returns>Guid?。</returns>
        public static Guid? GetGuid(this object o)
        {
            Guid info;
            if (!Guid.TryParse(GuidRegex.Match(o.ToString(string.Empty)).Groups["info"].Value, out info))
            {
                return null;
            }
            return info;
        }

        /// <summary>
        /// 将object转换为SqlServer中的DateTime?类型信息。
        /// </summary>
        /// <param name="o">object。</param>
        /// <param name="t">默认值。</param>
        /// <returns>DateTime?。</returns>
        public static DateTime? GetSqlDateTime(this object o, DateTime t = default(DateTime))
        {
            DateTime info;
            if (!DateTime.TryParse(o.ToString(string.Empty), out info))
            {
                info = t;
            }
            if (info < new DateTime(1753, 1, 1) || info > new DateTime(9999, 12, 31))
            {
                return null;
            }
            return info;
        }

        /// <summary>
        /// 读取XElement节点的文本内容。
        /// </summary>
        /// <param name="xElement">XElement节点。</param>
        /// <param name="t">默认值。</param>
        /// <returns>文本内容。</returns>
        public static string Value(this XElement xElement, string t = default(string))
        {
            if (xElement == null)
            {
                return t;
            }
            else
            {
                return xElement.Value;
            }
        }

        /// <summary>
        /// 获取与指定键相关的值。
        /// </summary>
        /// <typeparam name="TKey">键类型。</typeparam>
        /// <typeparam name="TValue">值类型。</typeparam>
        /// <param name="dictionary">表示键/值对象的泛型集合。</param>
        /// <param name="key">键。</param>
        /// <param name="t">默认值。</param>
        /// <returns>值。</returns>
        public static TValue GetValue<TKey, TValue>(this IDictionary<TKey, TValue> dictionary, TKey key, TValue t = default(TValue))
        {
            TValue value = default(TValue);
            if (dictionary == null || key == null)
            {
                return t;
            }
            if (!dictionary.TryGetValue(key, out value))
            {
                value = t;
            }
            return value;
        }

        /// <summary>
        /// 获取与指定键相关或者第一个的值。
        /// </summary>
        /// <typeparam name="TKey">键类型。</typeparam>
        /// <typeparam name="TValue">值类型。</typeparam>
        /// <param name="dictionary">表示键/值对象的泛型集合。</param>
        /// <param name="key">键。</param>
        /// <param name="t">默认值。</param>
        /// <returns>值。</returns>
        public static TValue GetFirstOrDefaultValue<TKey, TValue>(this IDictionary<TKey, TValue> dictionary, TKey key, TValue t = default(TValue))
        {
            TValue value = default(TValue);
            if (dictionary == null || key == null)
            {
                return t;
            }
            if (!dictionary.TryGetValue(key, out value))
            {
                if (dictionary.Count() == 0)
                {
                    value = t;
                }
                else
                {
                    value = dictionary.FirstOrDefault().Value;
                }
            }
            return value;
        }

        /// <summary>
        /// 获取具有指定 System.Xml.Linq.XName 的第一个（按文档顺序）子元素。
        /// </summary>
        /// <param name="xContainer">XContainer。</param>
        /// <param name="xName">要匹配的 System.Xml.Linq.XName。</param>
        /// <param name="t">是否返回同名默认值。</param>
        /// <returns>与指定 System.Xml.Linq.XName 匹配的 System.Xml.Linq.XElement，或者为 null。</returns>
        public static XElement Element(this XContainer xContainer, XName xName, bool t)
        {
            XElement info;
            if (xContainer == null)
            {
                info = null;
            }
            else
            {
                info = xContainer.Element(xName);
            }
            if (t && info == null)
            {
                info = new XElement(xName);
            }
            return info;
        }

        /// <summary>
        /// 按文档顺序返回此元素或文档的子元素集合。
        /// </summary>
        /// <param name="xContainer">XContainer。</param>
        /// <param name="t">是否返回非空默认值。</param>
        /// <returns>System.Xml.Linq.XElement 的按文档顺序包含此System.Xml.Linq.XContainer 的子元素，或者非空默认值。</returns>
        public static IEnumerable<XElement> Elements(this XContainer xContainer, bool t)
        {
            IEnumerable<XElement> info;
            if (xContainer == null)
            {
                info = null;
            }
            else
            {
                info = xContainer.Elements();
            }
            if (t && info == null)
            {
                info = new List<XElement>();
            }
            return info;
        }

        /// <summary>
        /// 按文档顺序返回此元素或文档的经过筛选的子元素集合。集合中只包括具有匹配 System.Xml.Linq.XName 的元素。
        /// </summary>
        /// <param name="xContainer">XContainer。</param>
        /// <param name="xName">要匹配的 System.Xml.Linq.XName。</param>
        /// <param name="t">是否返回非空默认值。</param>
        /// <returns>System.Xml.Linq.XElement 的按文档顺序包含具有匹配System.Xml.Linq.XName 的 System.Xml.Linq.XContainer 的子级，或者非空默认值。</returns>
        public static IEnumerable<XElement> Elements(this XContainer xContainer, XName xName, bool t)
        {
            IEnumerable<XElement> info;
            if (xContainer == null)
            {
                info = null;
            }
            else
            {
                info = xContainer.Elements(xName);
            }
            if (t && info == null)
            {
                info = new List<XElement>();
            }
            return info;
        }

        /// <summary>
        /// 删除html标签。
        /// </summary>
        /// <param name="html">输入的字符串。</param>
        /// <returns>没有html标签的字符串。</returns>
        public static string RemoveHTMLTags(this string html)
        {
            return Regex.Replace(Regex.Replace(Regex.Replace((html ?? string.Empty).Replace("&nbsp;", " ").Replace("\r\n", " ").Replace("\n", " ").Replace("\r", " ").Replace("\t", " "), "<\\/?[^>]+>", "\r\n"), "(\r\n)+", "\r\n"), "(\\s)+", " ").Trim();
        }

        /// <summary>
        /// 字符串转换为文件名。
        /// </summary>
        /// <param name="s">字符串。</param>
        /// <returns>文件名。</returns>
        public static string ToFileName(this string s)
        {
            return Regex.Replace(s.ToString(string.Empty), @"[\\/:*?<>|]", "_").Replace("\t", " ").Replace("\r\n", " ").Replace("\"", " ");
        }


        /// <summary>
        /// 获取默认非空字符串。
        /// </summary>
        /// <param name="s">首选默认非空字符串。</param>
        /// <param name="args">依次非空字符串可选项。</param>
        /// <returns>默认非空字符串。若无可选项则返回string.Empty。</returns>
        public static string DefaultStringIfEmpty(this string s, params string[] args)
        {
            if (string.IsNullOrEmpty(s))
            {
                return string.Empty;
            }
            foreach (string i in args)
            {
                if (!string.IsNullOrEmpty(i) && !string.IsNullOrEmpty(i.Trim()))
                {
                    return i;
                }
            }

            return (s ?? string.Empty);
        }

        /// <summary>
        /// 对 URL 字符串进行编码。
        /// </summary>
        /// <param name="s">要编码的文本。</param>
        /// <param name="regex">匹配要编码的文本。</param>
        /// <param name="encoding">指定编码方案的 System.Text.Encoding 对象。</param>
        /// <returns>一个已编码的字符串。</returns>
        public static string ToUrlEncodeString(this string s, Regex regex = default(Regex), Encoding encoding = null)
        {
            if (encoding == null)
            {
                encoding = Encoding.UTF8;
            }
            if (regex == null)
            {
                return HttpUtility.UrlEncode(s, encoding);
            }
            List<string> l = new List<string>();
            foreach (char i in s)
            {
                string t = i.ToString();
                l.Add(regex.IsMatch(t) ? HttpUtility.UrlEncode(t, encoding) : t);
            }
            return string.Join(string.Empty, l);
        }

        /// <summary>
        /// 对 URL 字符串进行编码。
        /// </summary>
        /// <param name="s">要编码的文本。</param>
        /// <param name="regex">匹配要编码的文本。</param>
        /// <param name="encoding">指定编码方案的 System.Text.Encoding 对象。</param>
        /// <returns>一个已编码的字符串。</returns>
        public static string ToUrlEncodeString(this string s, string regex, Encoding encoding = null)
        {
            return ToUrlEncodeString(s, new Regex(regex), encoding);
        }

        /// <summary>
        /// 将日期转换为UNIX时间戳字符串
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static string ToUnixTimeStamp(this DateTime date)
        {
            DateTime startTime = TimeZoneInfo.ConvertTimeToUtc(new DateTime(1970, 1, 1));
            string timeStamp = date.Subtract(startTime).Ticks.ToString();
            return timeStamp.Substring(0, timeStamp.Length - 7);
        }

        private static readonly Regex MobileRegex = new Regex("^1[3-9][0-9]\\d{4,8}$");
        private static readonly Regex EmailRegex = new Regex("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$");

        /// <summary>
        /// 判断当前字符串是否是移动电话号码
        /// </summary>
        /// <param name="mobile"></param>
        /// <returns></returns>
        public static bool IsMobile(this string mobile)
        {
            return MobileRegex.IsMatch(mobile);
        }
 
        /// <summary>
        /// 判断当前字符串是否为邮箱
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public static bool IsEmail(this string email)
        {
            return EmailRegex.IsMatch(email);
        }

    }



    /// <summary>
    /// 标记。
    /// </summary>
    public enum Flag
    {
        /// <summary>
        /// 默认。
        /// </summary>
        Default,

        /// <summary>
        /// 真。
        /// </summary>
        True,

        /// <summary>
        /// 假。
        /// </summary>
        False
    }
}
