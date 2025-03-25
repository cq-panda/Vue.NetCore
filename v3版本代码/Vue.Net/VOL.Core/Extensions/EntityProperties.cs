using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.DomainModels;
/*
* jxx 2017-08-09 
* 通用实体属操作
*/

namespace VOL.Core.Extensions
{
    public static class EntityProperties
    {
        public static IQueryable<T> Where<T>(this IQueryable<T> queryable, [NotNull] Expression<Func<T, object>> field, string value)
        {
            if (value == null)
            {
                value = "";
            }
            return queryable.Where(field.GetExpressionPropertyFirst<T>().CreateExpression<T>(value, LinqExpressionType.Equal));
        }

        public static IQueryable<T> Where<T>(this IQueryable<T> queryable, string field, string value)
        {
            if (value == null)
            {
                value = "";
            }
            return queryable.Where(field.CreateExpression<T>(value, LinqExpressionType.Equal));
        }

        public static IQueryable<T> Where<T>(this IQueryable<T> queryable, string field, string[] values)
        {
            if (values == null || values.Length == 0)
            {
                return queryable.Where(x => false);
            }
            return queryable.Where(field.CreateExpression<T>(values, LinqExpressionType.In));
        }

        public static IQueryable<T> WhereIF<T>(this IQueryable<T> queryable,bool checkCondition, Expression<Func<T, bool>> predicate)
        {
            if (checkCondition)
            {
                return queryable.Where(predicate);
            }
            return queryable;
        }
        /// <summary>
        /// 如果值为null则不生成条件
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="queryable"></param>
        /// <param name="field"></param>
        /// <param name="value"></param>
        /// <param name="linqExpression"></param>
        /// <returns></returns>
        public static IQueryable<T> WhereNotEmpty<T>(this IQueryable<T> queryable, string field, string value, LinqExpressionType linqExpression = LinqExpressionType.Equal)
        {
            if (string.IsNullOrEmpty(value) || string.IsNullOrEmpty(field)) return queryable;
            return queryable.Where(field.CreateExpression<T>(value, linqExpression));
        }

        public static IQueryable<T> WhereNotEmpty<T>(this IQueryable<T> queryable, [NotNull] Expression<Func<T, object>> field, string value, LinqExpressionType linqExpression = LinqExpressionType.Equal)
        {
            if (string.IsNullOrEmpty(value)) return queryable;
            return queryable.Where(field.GetExpressionPropertyFirst<T>().CreateExpression<T>(value, linqExpression));
        }

        public static string GetExpressionPropertyFirst<TEntity>(this Expression<Func<TEntity, object>> properties)
        {
            string[] arr = properties.GetExpressionProperty();
            if (arr.Length > 0)
                return arr[0];
            return "";
        }
        /// <summary>
        /// 获取对象里指定成员名称
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="properties"> 格式 Expression<Func<entityt, object>> exp = x => new { x.字段1, x.字段2 };或x=>x.Name</param>
        /// <returns></returns>
        public static string[] GetExpressionProperty<TEntity>(this Expression<Func<TEntity, object>> properties)
        {
            if (properties == null)
                return new string[] { };
            if (properties.Body is NewExpression)
                return ((NewExpression)properties.Body).Members.Select(x => x.Name).ToArray();
            if (properties.Body is MemberExpression)
                return new string[] { ((MemberExpression)properties.Body).Member.Name };
            if (properties.Body is UnaryExpression)
                return new string[] { ((properties.Body as UnaryExpression).Operand as MemberExpression).Member.Name };
            throw new Exception("未实现的表达式");
        }
        public static string ValidateHashInEntity(this Type typeinfo, Dictionary<string, object> dic)
        {
            return typeinfo.ValidateDicInEntity(dic, false);
        }

        public static void RemoveNotExistColumns(this Type typeinfo, List<string> cols)
        {

        }

        /// <summary>
        /// 获取所有字段的名称 
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <returns></returns>
        public static List<string> GetAtrrNames(this Type typeinfo)
        {
            return typeinfo.GetProperties().Select(c => c.Name).ToList();
        }
        public static void IsExistColumns(this Type typeinfo)
        {

        }
        public static Dictionary<string, string> GetColumType(this PropertyInfo[] properties)
        {
            return properties.GetColumType(false);
        }
        public static Dictionary<string, string> GetColumType(this PropertyInfo[] properties, bool containsKey)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();
            foreach (PropertyInfo property in properties)
            {
                if (!containsKey && property.IsKey())
                {
                    continue;
                }
                var keyVal = GetColumnType(property, true);
                dictionary.Add(keyVal.Key, keyVal.Value);
            }
            return dictionary;
        }

        private static readonly Dictionary<Type, string> entityMapDbColumnType = new Dictionary<Type, string>() {
                    {typeof(int),SqlDbTypeName.Int },
                    {typeof(int?),SqlDbTypeName.Int },
                    {typeof(long),SqlDbTypeName.BigInt },
                    {typeof(long?),SqlDbTypeName.BigInt },
                    {typeof(decimal),"decimal(18, 5)" },
                    {typeof(decimal?),"decimal(18, 5)"  },
                    {typeof(double),"decimal(18, 5)" },
                    {typeof(double?),"decimal(18, 5)" },
                    {typeof(float),"decimal(18, 5)" },
                    {typeof(float?),"decimal(18, 5)" },
                    {typeof(Guid),"UniqueIdentifier" },
                    {typeof(Guid?),"UniqueIdentifier" },
                    {typeof(byte),"tinyint" },
                    {typeof(byte?),"tinyint" },
                    {typeof(string),"nvarchar" }
        };
        /// <summary>
        /// 返回属性的字段及数据库类型
        /// </summary>
        /// <param name="property"></param>
        /// <param name="lenght">是否包括后字段具体长度:nvarchar(100)</param>
        /// <returns></returns>
        public static KeyValuePair<string, string> GetColumnType(this PropertyInfo property, bool lenght = false)
        {
            string colType = "";
            object objAtrr = property.GetTypeCustomAttributes(typeof(ColumnAttribute), out bool asType);
            if (asType)
            {
                colType = ((ColumnAttribute)objAtrr).TypeName.ToLower();
                if (!string.IsNullOrEmpty(colType))
                {
                    //不需要具体长度直接返回
                    if (!lenght)
                    {
                        return new KeyValuePair<string, string>(property.Name, colType);
                    }
                    if (colType == "decimal" || colType == "double" || colType == "float")
                    {
                        objAtrr = property.GetTypeCustomAttributes(typeof(DisplayFormatAttribute), out asType);
                        colType += "(" + (asType ? ((DisplayFormatAttribute)objAtrr).DataFormatString : "18,5") + ")";

                    }
                    ///如果是string,根据 varchar或nvarchar判断最大长度
                    if (property.PropertyType.ToString() == "System.String")
                    {
                        colType = colType.Split("(")[0];
                        objAtrr = property.GetTypeCustomAttributes(typeof(MaxLengthAttribute), out asType);
                        if (asType)
                        {
                            int length = ((MaxLengthAttribute)objAtrr).Length;
                            colType += "(" + (length < 1 || length > (colType.StartsWith("n") ? 8000 : 4000) ? "max" : length.ToString()) + ")";
                        }
                        else
                        {
                            colType += "(max)";
                        }
                    }
                    return new KeyValuePair<string, string>(property.Name, colType);
                }
            }
            if (entityMapDbColumnType.TryGetValue(property.PropertyType, out string value))
            {
                colType = value;
            }
            else
            {
                colType = SqlDbTypeName.NVarChar;
            }
            if (lenght && colType == SqlDbTypeName.NVarChar)
            {
                colType = "nvarchar(max)";
            }
            return new KeyValuePair<string, string>(property.Name, colType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="array">将数组转换成sql语句</param>
        /// <param name="fieldType">指定FieldType数据库字段类型</param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static string GetArraySql(this object[] array, FieldType fieldType)
        {
            if (array == null || array.Count() == 0)
            {
                return string.Empty;
            }
            string columnType = string.Empty;
            List<ArrayEntity> arrrayEntityList = array.Select(x => new ArrayEntity { column1 = x.ToString() }).ToList();
            return arrrayEntityList.GetEntitySql(false, null, null, null, fieldType);
        }
        /// <summary>
        ///<param name="sql">要执行的sql语句如：通过EntityToSqlTempName.Temp_Insert0.ToString()字符串占位，生成的的sql语句会把EntityToSqlTempName.Temp_Insert0.ToString()替换成生成的sql临时表数据
        ///    string sql = " ;DELETE FROM " + typeEntity.Name + " where " + typeEntity.GetKeyName() +
        ///      " in (select * from " + EntityToSqlTempName.Temp_Insert0.ToString() + ")";
        /// </param>
        /// </summary>
        /// <param name="array"></param>
        /// <param name="fieldType">指定生成的数组值的类型</param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static string GetArraySql(this object[] array, FieldType fieldType, string sql)
        {
            if (array == null || array.Count() == 0)
            {
                return string.Empty;
            }
            string columnType = string.Empty;
            List<ArrayEntity> arrrayEntityList = array.Select(x => new ArrayEntity { column1 = x.ToString() }).ToList();
            return arrrayEntityList.GetEntitySql(false, sql, null, null, fieldType);
        }
        public static string GetArraySql<T>(this object[] array, string sql)
        {
            return array.GetArraySql(typeof(T).GetFieldType(), sql);
        }
        /// <summary>
        /// 根据实体获取key的类型，用于update或del操作
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static FieldType GetFieldType(this Type typeEntity)
        {
            FieldType fieldType;
            string columnType = typeEntity.GetProperties().Where(x => x.Name == typeEntity.GetKeyName()).ToList()[0].GetColumnType(false).Value;
            switch (columnType)
            {
                case SqlDbTypeName.Int: fieldType = FieldType.Int; break;
                case SqlDbTypeName.BigInt: fieldType = FieldType.BigInt; break;
                case SqlDbTypeName.VarChar: fieldType = FieldType.VarChar; break;
                case SqlDbTypeName.UniqueIdentifier: fieldType = FieldType.UniqueIdentifier; break;
                default: fieldType = FieldType.NvarChar; break;
            }
            return fieldType;
        }
        public static string GetEntitySql<T>(this IEnumerable<T> entityList,
                  bool containsKey = false,
                  string sql = null,
                  Expression<Func<T, object>> ignoreFileds = null,
                  Expression<Func<T, object>> fixedColumns = null,
                  FieldType? fieldType = null
                  )
        {

            if (entityList == null || entityList.Count() == 0) return "";
            PropertyInfo[] propertyInfo = typeof(T).GetProperties().ToArray();
            if (propertyInfo.Count() == 0)
            {
                propertyInfo = entityList.ToArray()[0].GetType().GetGenericProperties().ToArray();
            }
            propertyInfo = propertyInfo.GetGenericProperties().ToArray();

            string[] arr = null;
            if (fixedColumns != null)
            {
                arr = fixedColumns.GetExpressionToArray();
                PropertyInfo keyProperty = typeof(T).GetKeyProperty();
                propertyInfo = propertyInfo.Where(x => (containsKey && x.Name == keyProperty.Name) || arr.Contains(x.Name)).ToArray();
            }
            if (ignoreFileds != null)
            {
                arr = ignoreFileds.GetExpressionToArray();
                propertyInfo = propertyInfo.Where(x => !arr.Contains(x.Name)).ToArray();
            }

            Dictionary<string, string> dictProperties = propertyInfo.GetColumType(containsKey);
            if (fieldType != null)
            {
                string realType = fieldType.ToString();
                if ((int)fieldType == 0 || (int)fieldType == 1)
                {
                    realType += "(max)";
                }
                dictProperties = new Dictionary<string, string> { { dictProperties.Select(x => x.Key).ToList()[0], realType } };
            }
            if (dictProperties.Keys.Count * entityList.Count() > 50 * 3000)
            {
                throw new Exception("写入数据太多,请分开写入。");
            }

            string cols = string.Join(",", dictProperties.Select(c => "[" + c.Key + "]" + " " + c.Value));
            StringBuilder declareTable = new StringBuilder();

            string tempTablbe = "#" + EntityToSqlTempName.TempInsert.ToString();

            declareTable.Append("CREATE TABLE " + tempTablbe + " (" + cols + ")");
            declareTable.Append("\r\n");

            //参数总数量
            int parCount = (dictProperties.Count) * (entityList.Count());
            int takeCount = 0;
            int maxParsCount = 2050;
            if (parCount > maxParsCount)
            {
                //如果参数总数量超过2100，设置每次分批循环写入表的大小
                takeCount = maxParsCount / dictProperties.Count;
            }

            int count = 0;
            StringBuilder stringLeft = new StringBuilder();
            StringBuilder stringCenter = new StringBuilder();
            StringBuilder stringRight = new StringBuilder();

            int index = 0;
            foreach (T entity in entityList)
            {
                //每1000行需要分批写入(数据库限制每批至多写入1000行数据)
                if (index == 0 || index >= 1000 || takeCount - index == 0)
                {
                    if (stringLeft.Length > 0)
                    {
                        declareTable.AppendLine(
                            stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                            stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                            stringRight.Remove(stringRight.Length - 1, 1).ToString());

                        stringLeft.Clear(); stringCenter.Clear(); stringRight.Clear();
                    }

                    stringLeft.AppendLine("exec sp_executesql N'SET NOCOUNT ON;");
                    stringCenter.Append("N'");

                    index = 0; count = 0;
                }
                stringLeft.Append(index == 0 ? "; INSERT INTO  " + tempTablbe + "  values (" : " ");
                index++;
                foreach (PropertyInfo property in propertyInfo)
                {
                    if (!containsKey && property.IsKey()) { continue; }
                    string par = "@v" + count;
                    stringLeft.Append(par + ",");
                    stringCenter.Append(par + " " + dictProperties[property.Name] + ",");
                    object val = property.GetValue(entity);
                    if (val == null)
                    {
                        stringRight.Append(par + "=NUll,");
                    }
                    else
                    {
                        stringRight.Append(par + "='" + val.ToString().Replace("'", "''''") + "',");
                    }
                    count++;
                }
                stringLeft.Remove(stringLeft.Length - 1, 1);
                stringLeft.Append("),(");
            }

            if (stringLeft.Length > 0)
            {
                declareTable.AppendLine(
                    stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                    stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                    stringRight.Remove(stringRight.Length - 1, 1).ToString());

                stringLeft.Clear(); stringCenter.Clear(); stringRight.Clear();
            }
            if (!string.IsNullOrEmpty(sql))
            {
                sql = sql.Replace(EntityToSqlTempName.TempInsert.ToString(), tempTablbe);
                declareTable.AppendLine(sql);
            }
            else
            {
                declareTable.AppendLine(" SELECT " + (string.Join(",", fixedColumns?.GetExpressionToArray() ?? new string[] { "*" })) + " FROM " + tempTablbe);
            }


            if (tempTablbe.Substring(0, 1) == "#")
            {
                declareTable.AppendLine("; drop table " + tempTablbe);
            }
            return declareTable.ToString();
        }


        /// <summary>
        ///此方法适用于数据量少,只有几列数据，不超过1W行，或几十列数据不超过1000行的情况下使用
        /// 大批量的数据考虑其他方式
        /// 將datatable生成sql語句，替換datatable作為參數傳入存儲過程
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public static string GetDataTableSql(this DataTable table)
        {
            Dictionary<string, string> dictCloumn = new Dictionary<string, string>();
            for (int i = 0; i < table.Columns.Count; i++)
            {
                dictCloumn.Add(table.Columns[i].ColumnName, "  nvarchar(max)");
            }


            //参数总数量
            int parCount = (dictCloumn.Count) * (table.Rows.Count);
            int takeCount = 0;
            int maxParsCount = 2050;
            if (parCount > maxParsCount)
            {
                //如果参数总数量超过2100，设置每次分批循环写入表的大小
                takeCount = maxParsCount / dictCloumn.Count;
            }

            if (dictCloumn.Keys.Count * table.Rows.Count > 50 * 3000)
            {
                throw new Exception("写入数据太多,请分开写入。");
            }

            string cols = string.Join(",", dictCloumn.Select(c => "[" + c.Key + "]" + " " + c.Value));
            StringBuilder declareTable = new StringBuilder();

            string tempTablbe = "#Temp_Insert0";
            declareTable.Append("CREATE TABLE " + tempTablbe + " (" + cols + ")");
            declareTable.Append("\r\n");
            int count = 0;
            StringBuilder stringLeft = new StringBuilder();
            StringBuilder stringCenter = new StringBuilder();
            StringBuilder stringRight = new StringBuilder();

            int index = 0;

            foreach (DataRow row in table.Rows)
            {
                //每1000行需要分批写入(数据库限制每批至多写入1000行数据)
                if (index == 0 || index >= 1000 || takeCount - index == 0)
                {
                    if (stringLeft.Length > 0)
                    {
                        declareTable.AppendLine(
                            stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                            stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                            stringRight.Remove(stringRight.Length - 1, 1).ToString());

                        stringLeft.Clear(); stringCenter.Clear(); stringRight.Clear();
                    }
                    //  sbLeft.AppendLine(" INSERT INTO  @toInsert0");
                    stringLeft.AppendLine("exec sp_executesql N'SET NOCOUNT ON;");
                    stringCenter.Append("N'");

                    index = 0; count = 0;
                }
                stringLeft.Append(index == 0 ? "; INSERT INTO  " + tempTablbe + "  values (" : " ");
                index++;
                foreach (KeyValuePair<string, string> keyValue in dictCloumn)
                {
                    string par = "@v" + count;
                    stringLeft.Append(par + ",");
                    stringCenter.Append(par + " " + keyValue.Value + ",");
                    object val = row[keyValue.Key];
                    if (val == null)
                    {
                        stringRight.Append(par + "=NUll,");
                    }
                    else
                    {
                        stringRight.Append(par + "='" + val.ToString().Replace("'", "''''") + "',");
                    }
                    count++;
                }
                stringLeft.Remove(stringLeft.Length - 1, 1);
                stringLeft.Append("),(");
            }




            if (stringLeft.Length > 0)
            {

                declareTable.AppendLine(
                    stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                    stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                    stringRight.Remove(stringRight.Length - 1, 1).ToString());

                stringLeft.Clear(); stringCenter.Clear(); stringRight.Clear();
            }
            declareTable.AppendLine(" SELECT * FROM " + tempTablbe);
            if (tempTablbe.Substring(0, 1) == "#")
            {
                declareTable.AppendLine("; drop table " + tempTablbe);
            }
            return declareTable.ToString();
        }



        public static string GetKeyName(this Type typeinfo)
        {
            return typeinfo.GetProperties().GetKeyName();
        }
        public static string GetKeyType(this Type typeinfo)
        {
            string keyType = typeinfo.GetProperties().GetKeyName(true);
            if (keyType == "varchar")
            {
                return "varchar(max)";
            }
            else if (keyType != "nvarchar")
            {
                return keyType;
            }
            else
            {
                return "nvarchar(max)";
            }
        }
        public static string GetKeyName(this PropertyInfo[] properties)
        {
            return properties.GetKeyName(false);
        }
        /// <summary>
        /// 获取key列名
        /// </summary>
        /// <param name="properties"></param>
        /// <param name="keyType">true获取key对应类型,false返回对象Key的名称</param>
        /// <returns></returns>
        public static string GetKeyName(this PropertyInfo[] properties, bool keyType)
        {
            string keyName = string.Empty;
            foreach (PropertyInfo propertyInfo in properties)
            {
                if (!propertyInfo.IsKey())
                    continue;
                if (!keyType)
                    return propertyInfo.Name;
                var attributes = propertyInfo.GetCustomAttributes(typeof(ColumnAttribute), false);
                //如果没有ColumnAttribute的需要单独再验证，下面只验证有属性的
                if (attributes.Length > 0)
                    return ((ColumnAttribute)attributes[0]).TypeName.ToLower();
                else
                    return GetColumType(new PropertyInfo[] { propertyInfo }, true)[propertyInfo.Name];
            }
            return keyName;
        }

        /// <summary>
        /// 获取主键字段
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static PropertyInfo GetKeyProperty(this Type entity)
        {
            return entity.GetProperties().GetKeyProperty();
        }
        public static PropertyInfo GetKeyProperty(this PropertyInfo[] properties)
        {
            return properties.Where(c => c.IsKey()).FirstOrDefault();
        }
        public static bool IsKey(this PropertyInfo propertyInfo)
        {
            object[] keyAttributes = propertyInfo.GetCustomAttributes(typeof(KeyAttribute), false);
            if (keyAttributes.Length > 0)
                return true;
            return false;
        }


        private static string[] _userEditFields { get; set; }

        private static string[] UserEditFields
        {
            get
            {
                if (_userEditFields != null) return _userEditFields;
                _userEditFields = AppSetting.CreateMember.GetType().GetProperties()
                     .Select(x => x.GetValue(AppSetting.ModifyMember)?.ToString()?.ToLower())
                     .Where(w => !string.IsNullOrEmpty(w)).ToArray();
                return _userEditFields;
            }
        }
        /// <summary>
        /// 获取实体所有可以编辑的列
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string[] GetEditField(this Type type)
        {
            Type editType = typeof(EditableAttribute);
            PropertyInfo[] propertyInfo = type.GetProperties();
            string keyName = propertyInfo.GetKeyName();
            return propertyInfo.Where(x => x.Name != keyName && (UserEditFields.Contains(x.Name.ToLower()) || x.ContainsCustomAttributes(editType))).Select(s => s.Name).ToArray();
        }


        /// <summary>
        /// 判断是否包含某个属性：
        /// 如 [Editable(true)]
        //  public string MO { get; set; }包含Editable
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool ContainsCustomAttributes(this PropertyInfo propertyInfo, Type type)
        {
            propertyInfo.GetTypeCustomAttributes(type, out bool contains);
            return contains;
        }

        public static List<PropertyInfo> ContainsCustomAttributes(this Type obj, Type containType)
        {
            List<PropertyInfo> proList = new List<PropertyInfo>();
            foreach (PropertyInfo pro in obj.GetProperties())
            {
                if (pro.GetTypeCustomAttributes(containType) != null)
                {
                    proList.Add(pro);
                }
            }
            return proList;
        }

        /// <summary>
        /// 获取PropertyInfo指定属性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this PropertyInfo propertyInfo, Type type, out bool asType)
        {
            object[] attributes = propertyInfo.GetCustomAttributes(type, false);
            if (attributes.Length == 0)
            {
                asType = false;
                return new string[0];
            }
            asType = true;
            return attributes[0];
        }

        /// <summary>
        /// 验证集合的属性
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entityList"></param>
        /// <param name="expression"></param>
        /// <returns></returns>
        public static WebResponseContent ValidationEntityList<T>(this List<T> entityList, Expression<Func<T, object>> expression = null)
        {
            WebResponseContent responseData = new WebResponseContent();
            foreach (T entity in entityList)
            {
                responseData = entity.ValidationEntity(expression);
                if (!responseData.Status)
                {
                    return responseData;
                }
            }
            responseData.Status = true;
            return responseData;
        }
        /// <summary>
        /// 指定需要验证的字段
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="expression">对指定属性进行验证x=>{x.Name,x.Size}</param>
        /// <returns></returns>
        public static WebResponseContent ValidationEntity<T>(this T entity, Expression<Func<T, object>> expression = null, Expression<Func<T, object>> validateProperties = null)
        {
            return ValidationEntity<T>(entity, expression?.GetExpressionProperty<T>(), validateProperties?.GetExpressionProperty<T>());
        }
        /// <summary>
        /// specificProperties=null并且validateProperties=null，对所有属性验证，只验证其是否合法，不验证是否为空(除属性标识指定了不能为空外)
        /// specificProperties!=null，对指定属性校验，并且都必须有值
        /// null并且validateProperties!=null，对指定属性校验，不判断是否有值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="specificProperties">验证指定的属性，并且非空判断</param>
        /// <param name="validateProperties">验证指定属性，只对字段合法性判断，不验证是否为空</param>
        /// <returns></returns>
        public static WebResponseContent ValidationEntity<T>(this T entity, string[] specificProperties, string[] validateProperties = null)
        {
            WebResponseContent responseData = new WebResponseContent();
            if (entity == null) return responseData.Error("对象不能为null");

            PropertyInfo[] propertyArray = typeof(T).GetProperties();
            //若T为object取不到属性
            if (propertyArray.Length == 0)
            {
                propertyArray = entity.GetType().GetProperties();
            }
            List<PropertyInfo> compareProper = new List<PropertyInfo>();

            //只验证数据合法性，验证非空
            if (specificProperties != null && specificProperties.Length > 0)
            {
                compareProper.AddRange(propertyArray.Where(x => specificProperties.Contains(x.Name)));
            }

            //只验证数据合法性，不验证非空
            if (validateProperties != null && validateProperties.Length > 0)
            {
                compareProper.AddRange(propertyArray.Where(x => validateProperties.Contains(x.Name)));
            }
            if (compareProper.Count() > 0)
            {
                propertyArray = compareProper.ToArray();
            }
            foreach (PropertyInfo propertyInfo in propertyArray)
            {
                object value = propertyInfo.GetValue(entity);
                //设置默认状态的值
                if (propertyInfo.Name == "Enable" || propertyInfo.Name == "AuditStatus")
                {
                    if (value == null)
                    {
                        propertyInfo.SetValue(entity, 0);
                        continue;
                    }
                }
                //若存在specificProperties并且属性为数组specificProperties中的值，校验时就需要判断是否为空
                var reslut = propertyInfo.ValidationProperty(value,
                    specificProperties != null && specificProperties.Contains(propertyInfo.Name) ? true : false
                    );
                if (!reslut.Item1)
                    return responseData.Error(reslut.Item2);
            }
            return responseData.OK();
        }

        /// <summary>
        /// 获取数据库类型，不带长度，如varchar(100),只返回的varchar
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static string GetSqlDbType(this PropertyInfo propertyInfo)
        {
            string dbType = propertyInfo.GetTypeCustomValue<ColumnAttribute>(x => new { x.TypeName });

            if (string.IsNullOrEmpty(dbType))
            {
                return dbType;
            }
            dbType = dbType.ToLower();
            if (dbType.Contains(SqlDbTypeName.NVarChar))
            {
                dbType = SqlDbTypeName.NVarChar;
            }
            else if (dbType.Contains(SqlDbTypeName.VarChar))
            {
                dbType = SqlDbTypeName.VarChar;
            }
            else if (dbType.Contains(SqlDbTypeName.NChar))
            {
                dbType = SqlDbTypeName.NChar;
            }
            else if (dbType.Contains(SqlDbTypeName.Char))
            {
                dbType = SqlDbTypeName.Char;
            }

            return dbType;
        }

        /// <summary>
        /// 验证数据库字段类型与值是否正确，
        /// </summary>
        /// <param name="propertyInfo">propertyInfo为当字段，当前字段必须有ColumnAttribute属性,
        /// 如字段:标识为数据库int类型[Column(TypeName="int")]  public int Id { get; set; }
        /// 如果是小数float或Decimal必须对propertyInfo字段加DisplayFormatAttribute属性
        /// </param>
        /// <param name="value"></param>
        /// <returns>IEnumerable<(bool, string, object)> bool成否校验成功,string校验失败信息,object,当前校验的值</returns>
        public static IEnumerable<(bool, string, object)> ValidationValueForDbType(this PropertyInfo propertyInfo, params object[] values)
        {
            string dbTypeName = propertyInfo.GetTypeCustomValue<ColumnAttribute>(c => c.TypeName);
            foreach (object value in values)
            {
                yield return dbTypeName.ValidationVal(value, propertyInfo);
            }
        }

        public static bool ValidationRquiredValueForDbType(this PropertyInfo propertyInfo, object value, out string message)
        {
            if (value == null || value?.ToString()?.Trim() == "")
            {
                message = $"{propertyInfo.GetDisplayName()}不能为空";
                return false;
            }
            var result = propertyInfo.GetProperWithDbType().ValidationVal(value, propertyInfo);
            message = result.Item2;
            return result.Item1;
        }

        private static readonly Dictionary<Type, string> ProperWithDbType = new Dictionary<Type, string>() {
            {  typeof(string),SqlDbTypeName.NVarChar },
            { typeof(DateTime),SqlDbTypeName.DateTime},
            {typeof(long),SqlDbTypeName.BigInt },
            {typeof(int),SqlDbTypeName.Int},
            { typeof(decimal),SqlDbTypeName.Decimal },
            { typeof(float),SqlDbTypeName.Float },
            { typeof(double),SqlDbTypeName.Double },
            {  typeof(byte),SqlDbTypeName.Int },//类型待完
            { typeof(Guid),SqlDbTypeName.UniqueIdentifier}
        };
        public static string GetProperWithDbType(this PropertyInfo propertyInfo)
        {
            bool result = ProperWithDbType.TryGetValue(propertyInfo.PropertyType, out string value);
            if (result)
            {
                return value;
            }
            return SqlDbTypeName.NVarChar;
        }

        /// <summary>
        /// 验证数据库字段类型与值是否正确，
        /// </summary>
        /// <param name="dbType">数据库字段类型(如varchar,nvarchar,decimal,不要带后面长度如:varchar(50))</param>
        /// <param name="value">值</param>
        /// <param name="propertyInfo">要验证的类的属性，若不为null，则会判断字符串的长度是否正确</param>
        /// <returns>(bool, string, object)bool成否校验成功,string校验失败信息,object,当前校验的值</returns>
        public static (bool, string, object) ValidationVal(this string dbType, object value, PropertyInfo propertyInfo = null)
        {
            if (string.IsNullOrEmpty(dbType))
            {
                dbType = propertyInfo != null ? propertyInfo.GetProperWithDbType() : SqlDbTypeName.NVarChar;
            }
            dbType = dbType.ToLower();
            string val = value?.ToString();
            //验证长度
            string reslutMsg = string.Empty;
            if (dbType == SqlDbTypeName.Int)
            {
                if (!value.IsInt())
                    reslutMsg = "只能为有效整数";
            }  //2021.10.12增加属性校验long类型的支持
            else if (dbType == SqlDbTypeName.BigInt)
            {
                if (!long.TryParse(val, out _))
                {
                    reslutMsg = "只能为有效整数";
                }
            }
            else if (dbType == SqlDbTypeName.DateTime
                || dbType == SqlDbTypeName.Date
                || dbType == SqlDbTypeName.SmallDateTime
                || dbType == SqlDbTypeName.SmallDate
                )
            {
                if (!value.IsDate())
                    reslutMsg = "必须为日期格式";
            }
            else if (dbType == SqlDbTypeName.Float || dbType == SqlDbTypeName.Decimal || dbType == SqlDbTypeName.Double)
            {
                //string formatString = string.Empty;
                //if (propertyInfo != null)
                //    formatString = propertyInfo.GetTypeCustomValue<DisplayFormatAttribute>(x => x.DataFormatString);
                //if (string.IsNullOrEmpty(formatString))
                //    throw new Exception("请对字段" + propertyInfo?.Name + "添加DisplayFormat属性标识");

                if (!val.IsNumber(null))
                {
                    // string[] arr = (formatString ?? "10,0").Split(',');
                    // reslutMsg = $"整数{arr[0]}最多位,小数最多{arr[1]}位";
                    reslutMsg = "不是有效数字";
                }
            }
            else if (dbType == SqlDbTypeName.UniqueIdentifier)
            {
                if (!val.IsGuid())
                {
                    reslutMsg = propertyInfo.Name + "Guid不正确";
                }
            }
            else if (propertyInfo != null
                && (dbType == SqlDbTypeName.VarChar
                || dbType == SqlDbTypeName.NVarChar
                || dbType == SqlDbTypeName.NChar
                || dbType == SqlDbTypeName.Char
                || dbType == SqlDbTypeName.Text))
            {

                //默认nvarchar(max) 、text 长度不能超过20000
                if (val.Length > 200000)
                {
                    reslutMsg = $"字符长度最多【200000】";
                }
                else
                {
                    int length = propertyInfo.GetTypeCustomValue<MaxLengthAttribute>(x => new { x.Length }).GetInt();
                    if (length == 0) { return (true, null, null); }
                    //判断双字节与单字段
                    else if (length < 8000 &&
                        ((dbType.Substring(0, 1) != "n"
                        && Encoding.UTF8.GetBytes(val.ToCharArray()).Length > length)
                         || val.Length > length)
                         )
                    {
                        reslutMsg = $"最多只能【{length}】个字符。";
                    }
                }
            }
            if (!string.IsNullOrEmpty(reslutMsg) && propertyInfo != null)
            {
                reslutMsg = propertyInfo.GetDisplayName() + reslutMsg;
            }
            return (reslutMsg == "" ? true : false, reslutMsg, value);
        }

        public static string GetDisplayName(this PropertyInfo property)
        {
            string displayName = property.GetTypeCustomValue<DisplayAttribute>(x => new { x.Name });
            if (string.IsNullOrEmpty(displayName))
            {
                return property.Name;
            }
            return displayName;
        }

        /// <summary>
        /// 验证每个属性的值是否正确
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="objectVal">属性的值</param>
        /// <param name="required">是否指定当前属性必须有值</param>
        /// <returns></returns>
        public static (bool, string, object) ValidationProperty(this PropertyInfo propertyInfo, object objectVal, bool required)
        {
            if (propertyInfo.IsKey()) { return (true, null, objectVal); }

            string val = objectVal == null ? "" : objectVal.ToString().Trim();

            string requiredMsg = string.Empty;
            if (!required)
            {
                var reuireVal = propertyInfo.GetTypeCustomValues<RequiredAttribute>(x => new { x.AllowEmptyStrings, x.ErrorMessage });
                if (reuireVal != null && !Convert.ToBoolean(reuireVal["AllowEmptyStrings"]))
                {
                    required = true;
                    requiredMsg = reuireVal["ErrorMessage"];
                }
            }
            //如果不要求为必填项并且值为空，直接返回
            if (!required && string.IsNullOrEmpty(val))
                return (true, null, objectVal);

            if ((required && val == string.Empty))
            {
                if (requiredMsg != "") return (false, requiredMsg, objectVal);
                string propertyName = propertyInfo.GetTypeCustomValue<DisplayAttribute>(x => new { x.Name });
                return (false, requiredMsg + (string.IsNullOrEmpty(propertyName) ? propertyInfo.Name : propertyName) + "不能为空", objectVal);
            }
            //列名
            string typeName = propertyInfo.GetSqlDbType();

            //如果没有ColumnAttribute的需要单独再验证，下面只验证有属性的
            if (typeName == null) { return (true, null, objectVal); }
            //验证长度
            return typeName.ValidationVal(val, propertyInfo);
        }
        /// <summary>
        /// 获取属性的指定属性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this MemberInfo member, Type type)
        {
            object[] obj = member.GetCustomAttributes(type, false);
            if (obj.Length == 0) return null;
            return obj[0];
        }

        /// <summary>
        /// 获取类的指定属性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this Type entity, Type type)
        {
            object[] obj = entity.GetCustomAttributes(type, false);
            if (obj.Length == 0) return null;
            return obj[0];
        }
        /// <summary>
        /// 获取类的多个指定属性的值
        /// </summary>
        /// <param name="member">当前类</param>
        /// <param name="type">指定的类</param>
        /// <param name="expression">指定属性的值 格式 Expression<Func<entityt, object>> exp = x => new { x.字段1, x.字段2 };</param>
        /// <returns>返回的是字段+value</returns>
        public static Dictionary<string, string> GetTypeCustomValues<TEntity>(this MemberInfo member, Expression<Func<TEntity, object>> expression)
        {
            var attr = member.GetTypeCustomAttributes(typeof(TEntity));
            if (attr == null)
            {
                return null;
            }

            string[] propertyName = expression.GetExpressionProperty();
            Dictionary<string, string> propertyKeyValues = new Dictionary<string, string>();

            foreach (PropertyInfo property in attr.GetType().GetProperties())
            {
                if (propertyName.Contains(property.Name))
                {
                    propertyKeyValues[property.Name] = (property.GetValue(attr) ?? string.Empty).ToString();
                }
            }
            return propertyKeyValues;
        }

        /// <summary>
        /// 获取类的单个指定属性的值(只会返回第一个属性的值)
        /// </summary>
        /// <param name="member">当前类</param>
        /// <param name="type">指定的类</param>
        /// <param name="expression">指定属性的值 格式 Expression<Func<entityt, object>> exp = x => new { x.字段1, x.字段2 };</param>
        /// <returns></returns>
        public static string GetTypeCustomValue<TEntity>(this MemberInfo member, Expression<Func<TEntity, object>> expression)
        {
            var propertyKeyValues = member.GetTypeCustomValues(expression);
            if (propertyKeyValues == null || propertyKeyValues.Count == 0)
            {
                return null;
            }
            return propertyKeyValues.First().Value ?? "";
        }
        /// <summary>
        /// 判断hash的列是否为对应的实体，并且值是否有效
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <param name="dic"></param>
        /// <param name="removeNotContains">移除不存在字段</param>
        /// <returns></returns>
        public static string ValidateDicInEntity(this Type typeinfo, Dictionary<string, object> dic, bool removeNotContains, string[] ignoreFields = null)
        {
            return typeinfo.ValidateDicInEntity(dic, removeNotContains, true, ignoreFields);
        }

        public static string ValidateDicInEntity(this Type type, List<Dictionary<string, object>> dicList, bool removeNotContains, bool removerKey, string[] ignoreFields = null)
        {
            PropertyInfo[] propertyInfo = type.GetProperties();
            string reslutMsg = string.Empty;
            foreach (Dictionary<string, object> dic in dicList)
            {
                reslutMsg = type.ValidateDicInEntity(dic, propertyInfo, removeNotContains, removerKey, ignoreFields);
                if (!string.IsNullOrEmpty(reslutMsg))
                    return reslutMsg;
            }
            return reslutMsg;
        }
        public static string ValidateDicInEntity(this Type type, Dictionary<string, object> dic, bool removeNotContains, bool removerKey, string[] ignoreFields = null)
        {
            return type.ValidateDicInEntity(dic, null, removeNotContains, removerKey, ignoreFields);
        }
        /// <summary>
        /// 判断hash的列是否为对应的实体，并且值是否有效
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <param name="dic"></param>
        /// <param name="removeNotContains">移除不存在字段</param>
        /// <param name="removerKey">移除主键</param>
        /// <returns></returns>
        private static string ValidateDicInEntity(this Type typeinfo, Dictionary<string, object> dic, PropertyInfo[] propertyInfo, bool removeNotContains, bool removerKey, string[] ignoreFields = null)
        {
            if (dic == null || dic.Count == 0) { return "参数无效"; }
            if (propertyInfo == null)
                propertyInfo = typeinfo.GetProperties().Where(x => x.PropertyType.Name != "List`1").ToArray();
            if (removeNotContains)
            {
                // 不存在的字段直接移除
                dic.Where(x => !propertyInfo.Any(p => p.Name == x.Key)).Select(s => s.Key).ToList().ForEach(f =>
                {
                    dic.Remove(f);
                });
            }
            string keyName = typeinfo.GetKeyName();
            //移除主键
            if (removerKey)
            {
                dic.Remove(keyName);
            }
            foreach (PropertyInfo property in propertyInfo)
            {
                //忽略与主键的字段不做验证
                if (property.Name == keyName || (ignoreFields != null && ignoreFields.Contains(property.Name)))
                    continue;

                //不在编辑中的列，是否也要必填
                if (!dic.ContainsKey(property.Name))
                {
                    //移除主键默认为新增数据，将不在编辑列中的有默认值的数据设置为默认值
                    //如果为true默认为添加功能，添加操作所有不能为空的列也必须要提交
                    if (property.GetCustomAttributes(typeof(RequiredAttribute)).Count() > 0
                        && property.PropertyType != typeof(int)
                        && property.PropertyType != typeof(long)
                        && property.PropertyType != typeof(byte)
                        && property.PropertyType != typeof(decimal)
                        )
                    {
                        return property.GetTypeCustomValue<DisplayAttribute>(x => x.Name) + "为必须提交项";
                    }
                    continue;
                }
                bool isEdit = property.ContainsCustomAttributes(typeof(EditableAttribute));
                //不是编辑列的直接移除,并且不是主键
                //removerKey=true，不保留主键，直接移除
                //removerKey=false,保留主键，属性与主键不同的直接移除
                //  if (!isEdit && (removerKey || (!removerKey && property.Name != keyName)))
                if (!isEdit)
                {
                    if (property.GetCustomAttributes(typeof(RequiredAttribute)).Count() > 0)
                    {
                        return property.GetTypeCustomValue<DisplayAttribute>(x => x.Name) + "没有配置好Model为编辑列";
                    }
                    dic.Remove(property.Name);
                    continue;
                }
                ////移除忽略的不保存的数据
                //if (property.ContainsCustomAttributes(typeof(JsonIgnoreAttribute)))
                //{
                //    hash.Remove(property.Name);
                //    continue;
                //}
                //验证数据类型,不验证是否为空
                var result = property.ValidationProperty(dic[property.Name], false);
                if (!result.Item1)
                    return result.Item2;

                //将所有空值设置为null
                if (dic[property.Name] != null && dic[property.Name].ToString() == string.Empty)
                    dic[property.Name] = null;
            }
            return string.Empty;
        }
        /// <summary>
        /// 获取表带有EntityAttribute属性的真实表名
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string GetEntityTableName(this Type type)
        {
            Attribute attribute = type.GetCustomAttribute(typeof(EntityAttribute));
            if (attribute != null && attribute is EntityAttribute)
            {
                return (attribute as EntityAttribute).TableName ?? type.Name;
            }
            return type.Name;
        }
        /// <summary>
        /// 获取表带有EntityAttribute属性的表中文名
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string GetEntityTableCnName(this Type type)
        {
            Attribute attribute = type.GetCustomAttribute(typeof(EntityAttribute));
            if (attribute != null && attribute is EntityAttribute)
            {
                return (attribute as EntityAttribute).TableCnName;
            }
            return string.Empty;
        }

        /// <summary>
        /// 将实体映射到输出到ApiOutput实体上,如果没有输入实体，则返回null
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        //public static object MapToOutput<T>( this T entity, Type type = null)
        //{
        //    Type sourceType = typeof(T);
        //    //list转换
        //    if (sourceType is System.Collections.IList)
        //    {
        //        System.Collections.IList list = entity as System.Collections.IList;
        //        sourceType = list[0].GetType();
        //    }
        //    if (type == null)
        //    {
        //        EntityAttribute attribute = sourceType.GetCustomAttribute<EntityAttribute>();
        //        if (attribute == null || attribute.ApiOutput == null)
        //            return null;
        //        type = attribute.ApiOutput;
        //    }

        //    object outPutObject = Activator.CreateInstance(type);
        //    PropertyInfo[] outPutPropertyInfo = type.GetProperties();

        //    PropertyInfo[] propertyInfo = sourceType.GetProperties();
        //    foreach (var property in outPutPropertyInfo)
        //    {
        //        PropertyInfo info= propertyInfo.Where(x => x.Name == property.Name).FirstOrDefault();
        //        if (info!=null)
        //        {
        //            property.SetValue(outPutObject, info.GetValue(entity));
        //        }
        //    }
        //    return outPutObject;
        //}

        private static object MapToInstance(this Type reslutType, object sourceEntity, PropertyInfo[] sourcePro, PropertyInfo[] reslutPro, string[] sourceFilterField, string[] reslutFilterField, string mapType = null)
        {
            mapType = mapType ?? GetMapType(reslutType);
            if (sourcePro == null)
            {
                sourcePro = sourceEntity.GetType().GetProperties();
            }
            if (reslutPro == null)
            {
                reslutPro = reslutType.GetProperties(); ;
            }

            object newObj = Activator.CreateInstance(reslutType);

            if (mapType == "Dictionary")
            {
                if (sourceFilterField != null && sourceFilterField.Length > 0)
                {
                    sourcePro = sourcePro.Where(x => sourceFilterField.Contains(x.Name)).ToArray();
                }
                foreach (var property in sourcePro)
                {
                    (newObj as System.Collections.IDictionary).Add(property.Name, property.GetValue(sourceEntity));
                }
                return newObj;
            }

            if (reslutFilterField != null && reslutFilterField.Count() > 0)
            {
                reslutPro.Where(x => reslutFilterField.Contains(x.Name));
            }

            foreach (var property in reslutPro)
            {
                PropertyInfo info = sourcePro.Where(x => x.Name == property.Name).FirstOrDefault();
                if (!(info != null && info.PropertyType == property.PropertyType))
                    continue;
                property.SetValue(newObj, info.GetValue(sourceEntity));
            }
            return newObj;
        }
        private static string GetMapType(Type type)
        {
            return typeof(Dictionary<,>) == type ? "Dictionary" : "entity";
        }

        /// <summary>
        /// 将数据源映射到新的数据中,目前只支持List<TSource>映射到List<TResult>或TSource映射到TResult
        /// 目前只支持Dictionary或实体类型
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="resultExpression">只映射返回对象的指定字段,若为null则默认为全部字段</param>
        /// <param name="sourceExpression">只映射数据源对象的指定字段,若为null则默认为全部字段</param>
        /// <returns></returns>
        public static TResult MapToObject<TSource, TResult>(this TSource source, Expression<Func<TResult, object>> resultExpression,
            Expression<Func<TSource, object>> sourceExpression = null
            ) where TResult : class
        {
            if (source == null)
                return null;
            string[] sourceFilterField = sourceExpression == null ? typeof(TSource).GetProperties().Select(x => x.Name).ToArray() : sourceExpression.GetExpressionProperty();
            string[] reslutFilterField = resultExpression?.GetExpressionProperty();
            if (!(source is System.Collections.IList))
                return MapToInstance(typeof(TResult), source, null, null, sourceFilterField, reslutFilterField) as TResult;

            Type sourceType = null;
            Type resultType = null;
            System.Collections.IList sourceList = source as System.Collections.IList;
            sourceType = sourceList[0].GetType();
            resultType = (typeof(TResult)).GenericTypeArguments[0];

            System.Collections.IList reslutList = Activator.CreateInstance(typeof(TResult)) as System.Collections.IList;
            PropertyInfo[] sourcePro = sourceType.GetProperties();
            PropertyInfo[] resultPro = resultType.GetProperties();

            string mapType = GetMapType(resultType);
            for (int i = 0; i < sourceList.Count; i++)
            {
                var reslutobj = MapToInstance(resultType, sourceList[i], sourcePro, resultPro, sourceFilterField, reslutFilterField, mapType);
                reslutList.Add(reslutobj);
            }
            return reslutList as TResult;
        }

        /// <summary>
        /// 将一个实体的赋到另一个实体上,应用场景：
        /// 两个实体，a a1= new a();b b1= new b();  a1.P=b1.P; a1.Name=b1.Name;
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="result"></param>
        /// <param name="expression">指定对需要的字段赋值,格式x=>new {x.Name,x.P},返回的结果只会对Name与P赋值</param>
        public static void MapValueToEntity<TSource, TResult>(this TSource source, TResult result, Expression<Func<TResult, object>> expression = null) where TResult : class
        {
            if (source == null)
                return;
            string[] fields = expression?.GetExpressionToArray();
            PropertyInfo[] reslutPro = fields == null ? result.GetType().GetProperties() : result.GetType().GetProperties().Where(x => fields.Contains(x.Name)).ToArray();
            PropertyInfo[] sourcePro = source.GetType().GetProperties();
            foreach (var property in reslutPro)
            {
                PropertyInfo info = sourcePro.Where(x => x.Name == property.Name).FirstOrDefault();
                if (info != null && info.PropertyType == property.PropertyType)
                {
                    property.SetValue(result, info.GetValue(source));
                }
            }
        }

        /// <summary>
        /// 设置默认字段的值"CreateID", "Creator", "CreateDate"，"ModifyID", "Modifier", "ModifyDate"
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <param name="setType">true=新增设置"CreateID", "Creator", "CreateDate"值
        /// false=编辑设置"ModifyID", "Modifier", "ModifyDate"值
        /// </param>
        public static SaveModel SetDefaultVal(this SaveModel saveDataModel, TableDefaultColumns defaultColumns, UserInfo userInfo = null)
        {
            SetDefaultVal(saveDataModel.MainData, defaultColumns, userInfo);
            if (saveDataModel.DetailData != null && saveDataModel.DetailData.Count > 0)
            {
                foreach (var item in saveDataModel.DetailData)
                {
                    if (item.Count == 0) continue;
                    SetDefaultVal(item, defaultColumns, userInfo);
                }
            }
            return saveDataModel;
        }

        public static TSource SetCreateDefaultVal<TSource>(this TSource source, UserInfo userInfo = null)
        {
            return SetDefaultVal(source, AppSetting.CreateMember, userInfo);
        }
        public static TSource SetModifyDefaultVal<TSource>(this TSource source, UserInfo userInfo = null)
        {
            return SetDefaultVal(source, AppSetting.ModifyMember, userInfo);
        }
        /// <summary>
        /// 
        /// 设置默认字段的值如:"CreateID", "Creator", "CreateDate"，"ModifyID", "Modifier", "ModifyDate"
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <param name="setType">true=新增设置"CreateID", "Creator", "CreateDate"值
        /// false=编辑设置"ModifyID", "Modifier", "ModifyDate"值
        /// </param>
        private static TSource SetDefaultVal<TSource>(this TSource source, TableDefaultColumns defaultColumns, UserInfo userInfo = null)
        {
            userInfo = userInfo ?? ManageUser.UserContext.Current.UserInfo;
            foreach (PropertyInfo property in typeof(TSource).GetProperties())
            {
                string filed = property.Name.ToLower();
                if (filed == defaultColumns.UserIdField?.ToLower())
                    property.SetValue(source, userInfo.User_Id);

                if (filed == defaultColumns.UserNameField?.ToLower())
                    property.SetValue(source, userInfo.UserTrueName);

                if (filed == defaultColumns.DateField?.ToLower())
                    property.SetValue(source, DateTime.Now);
            }
            return source;
        }
        private static Dictionary<string, object> SetDefaultVal(this Dictionary<string, object> dic, TableDefaultColumns defaultColumns, UserInfo userInfo = null)
        {
            userInfo = userInfo ?? ManageUser.UserContext.Current.UserInfo;

            KeyValuePair<string, object> valuePair = dic.Where(x => x.Key.ToLower() == defaultColumns.UserIdField?.ToLower()).FirstOrDefault();

            if (valuePair.Key != null || defaultColumns.UserIdField != null)
            {
                dic[valuePair.Key ?? defaultColumns.UserIdField] = userInfo.User_Id;
            }

            valuePair = dic.Where(x => x.Key.ToLower() == defaultColumns.UserNameField?.ToLower()).FirstOrDefault();
            if (valuePair.Key != null || defaultColumns.UserNameField != null)
            {
                dic[valuePair.Key ?? defaultColumns.UserNameField] = userInfo.UserTrueName;
            }

            valuePair = dic.Where(x => x.Key.ToLower() == defaultColumns.DateField?.ToLower()).FirstOrDefault();
            if (valuePair.Key != null || defaultColumns.DateField != null)
            {
                dic[valuePair.Key ?? defaultColumns.DateField] = DateTime.Now;
            }

            return dic;
        }
        public static Dictionary<string, object> SetCreateDefaultVal(this Dictionary<string, object> dic)
        {
            return SetDefaultVal(dic, AppSetting.CreateMember);
        }
        public static Dictionary<string, object> SetModifyDefaultVal(this Dictionary<string, object> dic)
        {
            return SetDefaultVal(dic, AppSetting.ModifyMember);
        }
    }

    public class ArrayEntity
    {
        public string column1 { get; set; }
    }

    public enum FieldType
    {
        VarChar = 0,
        NvarChar,
        Int,
        BigInt,
        UniqueIdentifier
    }

    public enum EntityToSqlTempName
    {
        TempInsert = 0
    }
}
