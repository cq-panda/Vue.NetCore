using Newtonsoft.Json.Linq;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DbContext;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.UserManager;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public static class ApplicationServiceBaseUpdateOrAddExtensions
    {
        private static MethodInfo ConvertDetailDataMethod
        {
            get
            {
                return typeof(ApplicationServiceBaseUpdateOrAddExtensions)
                    .GetMethods(BindingFlags.NonPublic | BindingFlags.Static)
                    .First(m => m.Name == nameof(ConvertDetailData));
            }
        }
        public static (WebResponseContent res, TEntity entity) GetAddEntityData<TEntity, TRepository>(
             this SaveModel saveDataModel, ServiceBase<TEntity, TRepository> service)
             where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            WebResponseContent baseWebResponse = new();
            if (service.AddOnExecute != null)
            {
                baseWebResponse = service.AddOnExecute(saveDataModel);
                if (service.ResponseIsError) return (baseWebResponse, null);
            }
            if ((saveDataModel?.MainData?.Count ?? 0) == 0)
                return (baseWebResponse.Set(ResponseType.ParametersLack, false), null);

            saveDataModel.DetailData = saveDataModel.DetailData?.Where(x => x.Count > 0).ToList();
            Type type = typeof(TEntity);
            saveDataModel.MainData
                .SetDataVersionDefaultValue(saveDataModel.DataVersionField) //数据版本号管理
                .SetAuditDefaultValue<TEntity>()//审批字段默认值
                .SetLogicDelValue<TEntity>()   //设置默认创建人信息                       
                .SetCreateDefaultVal(); //设置默认逻辑删除值

            string validReslut = type.ValidateDicInEntity(saveDataModel.MainData, true, false, ApplicationServiceBaseConfig.UserIgnoreFields);
            if (!string.IsNullOrEmpty(validReslut)) return (baseWebResponse.Error(validReslut), null);

            //设置主键默认值
            saveDataModel.MainData.SetPrimaryKeyDefaultValue<TEntity>();
            //实体转换与租户设置
            TEntity mainEntity = saveDataModel.MainData.DicToEntity<TEntity>();

            baseWebResponse = ValidationEntityUnique(mainEntity, true);
            if (!baseWebResponse.Status) return (baseWebResponse, null);

            baseWebResponse = saveDataModel.ConvertDetailEntity(service, mainEntity, true);
            //if (CheckResponseResult()) return baseWebResponse;
            return (baseWebResponse, mainEntity);
        }
        public static (WebResponseContent res, TEntity entity) GetUpdateEntityData<TEntity, TRepository>(
         this SaveModel saveDataModel, ServiceBase<TEntity, TRepository> service)
         where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            WebResponseContent baseWebResponse = new();
            if (service.UpdateOnExecute != null)
            {
                baseWebResponse = service.UpdateOnExecute(saveDataModel);
                if (service.ResponseIsError) return (baseWebResponse, null);
            }
            if ((saveDataModel?.MainData?.Count ?? 0) == 0)
                return (baseWebResponse.Set(ResponseType.ParametersLack, false), null);

            saveDataModel.DetailData = saveDataModel.DetailData?.Where(x => x.Count > 0).ToList();
            Type type = typeof(TEntity);
            saveDataModel.MainData.SetModifyDefaultVal(); //设置编辑人信息

            string validReslut = type.ValidateDicInEntity(
                saveDataModel.MainData,
                true,
                false,
                ApplicationServiceBaseConfig.UserIgnoreFields,
                requireAllField: false);
            if (!string.IsNullOrEmpty(validReslut)) return (baseWebResponse.Error(validReslut), null);

            TEntity mainEntity = saveDataModel.MainData.DicToEntity<TEntity>();


            baseWebResponse = ValidationEntityUnique(mainEntity, false);
            if (!baseWebResponse.Status) return (baseWebResponse, null);

            //检查版本号
            baseWebResponse = service.ValidationDataVersion(mainEntity, saveDataModel);
            if (service.ResponseIsError) return (baseWebResponse, null);
            baseWebResponse = saveDataModel.ConvertDetailEntity(service, mainEntity, false);
            // if (service.CheckResponseResult()) return baseWebResponse;
            return (baseWebResponse, mainEntity);
        }

        public static WebResponseContent ConvertDetailEntity<TEntity, TRepository>(
            this SaveModel saveModel, ServiceBase<TEntity, TRepository> service,
            TEntity mainEntity,
           bool isAdd = true)
            where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            service.MultipleTableEntity = new ApplicationServiceBaseMultipleTableEntity();
            WebResponseContent webResponse = new(true);
            var detailTypes = typeof(TEntity).GetCustomAttribute<EntityAttribute>().DetailTable;
            //1级表(主表)
            int lv = 1;
            if ((saveModel.DetailData != null && saveModel.DetailData.Count > 0) || saveModel.DelKeys?.Count > 0)
            {
                saveModel.DetailData ??= [];
                var generic = ConvertDetailDataMethod.MakeGenericMethod(typeof(TEntity), detailTypes[0]);
                webResponse = generic.Invoke(null, [mainEntity, saveModel, saveModel.DetailData, saveModel.DelKeys, service.MultipleTableEntity, isAdd, lv]) as WebResponseContent;
            }
            return webResponse;
        }

        /// <summary>
        /// 明细表校验与转换
        /// </summary>
        /// <typeparam name="TMain"></typeparam>
        /// <typeparam name="TDetail"></typeparam>
        /// <param name="dic"></param>
        /// <param name="delKeys"></param>
        /// <returns></returns>
        private static WebResponseContent ConvertDetailData<TMain, TDetail>(
            TMain mainEntity,
            SaveModel saveModel,
            List<Dictionary<string, object>> dic,
            List<object> delKeys,
            ApplicationServiceBaseMultipleTableEntity multipleTableEntity,
            bool isAdd = true,
            int lv = 1)
            where TMain : class
            where TDetail : class
        {
            //二级子表如果是新建的对象，三级表不应该再调用添加
            WebResponseContent webResponse = new();
            Type detailType = typeof(TDetail);
            var subDetailTypes = detailType.GetCustomAttribute<EntityAttribute>().DetailTable ?? [];
            var ignoreSubRowFields = subDetailTypes.Select(s => s.Name).ToList();
            //获取主表主键验证
            string foreignKey = typeof(TMain).GetForeignKey(detailType.Name);
            //isAdd &&
            if (!string.IsNullOrEmpty(foreignKey))
            {
                ignoreSubRowFields.Add(foreignKey);
            }
            string msg = detailType.ValidateDicInEntity(dic, true, false, ignoreSubRowFields.ToArray(),requireAllField:isAdd);
            if (!string.IsNullOrEmpty(msg))
            {
                return webResponse.Error($"{detailType.GetEntityTableCnName()}:{msg}");
            }
            List<TDetail> list = [];
            if (!multipleTableEntity.Data.TryGetValue(detailType, out EntityData entityData))
            {
                entityData = new EntityData();
                multipleTableEntity.Data[detailType] = entityData;
            }
            //删除的数据
            entityData.DelKeys = delKeys;
            //三细明细表传的是null值
            if (mainEntity==null)
            {
                return webResponse.OK();
            }
            var mainKeyProperty = typeof(TMain).GetKeyProperty();
            var mainKeyValue = mainKeyProperty.GetValue(mainEntity);
            foreach (var item in dic)
            {
                bool detailIsAdd = isAdd || item.IsTypeAdd(detailType);
                //新增数据
                if (detailIsAdd)
                {
                    item.SetLogicDelValue<TDetail>()
                    .SetCreateDefaultVal()
                    //设置自定义主表主键字段的值
                    .SetPrimaryKeyDefaultValue<TDetail>(foreignKey, mainKeyValue);
                }
                else
                {
                    //记录编辑的字段
                    if (entityData.UpdateFields.Count == 0)
                    {
                        entityData.UpdateFields = [.. FilterUpdateFields(detailType, item.Select(s => s.Key))];
                    }
                    //编辑数据
                    item.SetModifyDefaultVal();
                }
                TDetail detailData = item.DicToEntity<TDetail>(); ;
                list.Add(detailData);
                //添加的数据
                if (detailIsAdd)
                {
                    entityData.AddList.Add(detailData);
                    //二级主表为添加的数据时
                    if (isAdd && lv > 1)
                    {
                        entityData.InsertDb = false;
                    }
                }
                else
                {  //编辑的数据
                    entityData.UpdateList.Add(detailData);
                }
            }
            if (list?.Count>0)
            {
                //给主表写入明细表对象(二级明细表是添加的数据，三级明细表应该标记不手动写入数据库)
                var property = typeof(TMain).GetProperty(detailType.GetEntityTableName(false));
                property?.SetValue(mainEntity, list);
            }
            return webResponse.OK();
        }

        private static WebResponseContent ValidationEntityHasDetail(Type detailType, string table)
        {
            WebResponseContent webResponse = new();
            if (detailType == null)
            {
                return webResponse.Error($"未找到明细表[{table}]配置,请重新配置主表的明细表，再点生成model");
            }
            return webResponse.OK();
        }

        private static (List<Dictionary<string, object>> list, WebResponseContent res) ConvertObjectToDic(object value, Type type)
        {
            WebResponseContent webResponse = new();
            List<Dictionary<string, object>> list = new();
            if (value==null)
            {
                return (list, webResponse.OK()); 
            }
            string keyName = type.GetKeyName();
            foreach (JObject jObject in (JArray)value)
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                foreach (var property in jObject.Properties())
                {
                    dic[property.Name] = property.Value.ToObject<object>();
                }
                string result = type.ValidateDicInEntity(dic, removeNotContains: false, removerKey: false,requireAllField:!dic.ContainsKey(keyName));
                if (!string.IsNullOrEmpty(result))
                {
                    return (list, webResponse.Error($"{type.GetEntityTableCnName()}:{result}"));
                }
                list.Add(dic);
            }
            return (list, webResponse.OK());
        }


        private static string[] FilterUpdateFields(Type entityType, IEnumerable<string> rawFields)
        {
            var props = entityType.GetProperties();
            var keyName = entityType.GetKeyName();
            // 只更新：实体真实存在的普通字段（排除主键/集合导航/前端辅助字段）
            var safe = rawFields
                .Where(f => !string.IsNullOrWhiteSpace(f))
                .Where(f => !f.Equals(keyName, StringComparison.OrdinalIgnoreCase))
                .Where(f => !f.Equals("elementIndex", StringComparison.OrdinalIgnoreCase))
                .Where(f => props.Any(p => p.Name == f && p.PropertyType.Name != "List`1"))
                .ToList();
            return [.. safe];
        }

        private static MethodInfo[] DetailTypedMethods =>
            typeof(ApplicationServiceBaseUpdateOrAddExtensions).GetMethods(BindingFlags.NonPublic | BindingFlags.Static);



        public static WebResponseContent ValidationDataVersion<TEntity, TRepository>(
            this ServiceBase<TEntity, TRepository> service,
            TEntity entity,
            SaveModel saveModel)
            where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            WebResponseContent webResponse = new(true);
            if (string.IsNullOrEmpty(saveModel.DataVersionField) || string.IsNullOrEmpty(saveModel.DataVersionValue))
                return webResponse;
            var versionProperty = typeof(TEntity).GetProperty(saveModel.DataVersionField);
            if (versionProperty == null)
                return webResponse;
            var keyProperty = typeof(TEntity).GetKeyProperty();
            object keyValue = keyProperty.GetValue(entity);
            var where = keyProperty.Name.CreateExpression<TEntity>(keyValue, LinqExpressionType.Equal);
            var selectExpression = saveModel.DataVersionField.GetExpression<TEntity, string>();
            string dataVersionValue = service.repository.FindAsIQueryable(where).Select(selectExpression).FirstOrDefault();
            if (string.IsNullOrEmpty(dataVersionValue))
                return webResponse;
            if (dataVersionValue != saveModel.DataVersionValue)
                return webResponse.Error("数据已发生变化,请刷新页面后重新编辑");
            string value = Guid.NewGuid().ToString();
            versionProperty.SetValue(entity, value);
            saveModel.MainData[saveModel.DataVersionField] = value;
            return webResponse;
        }
        /// <summary>
        /// 获取更新前的原始数据
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        public static Expression<Func<TEntity, bool>> GetUpdateBeforeActionLogDbDataFilterExpression<TEntity>(this SaveModel saveDataModel) where TEntity : class
        {
            bool isActionLog = typeof(TEntity).IsTableActionLog();
            if (!isActionLog) return null;
            var property = typeof(TEntity).GetKeyProperty();
            object mainKeyVal = saveDataModel.MainData[property.Name];
            Expression<Func<TEntity, bool>> expression = property.Name.CreateExpression<TEntity>(mainKeyVal.ToString(), LinqExpressionType.Equal);
            return expression;
        }
        /// <summary>
        /// 校验字段唯一
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="entity"></param>
        /// <returns></returns>
        private static WebResponseContent ValidationEntityUnique<TEntity>(TEntity entity, bool isAdd) where TEntity : class, new()
        {
            WebResponseContent webResponse = new WebResponseContent();
            var uniqueFields = TableColumnContext.Data.Where(x => x.TableName == typeof(TEntity).Name && x.IsUnique == 1).Select(s => new { s.ColumnName, s.ColumnCnName }).ToList();
            if (uniqueFields.Count == 0)
            {
                return webResponse.OK();
            }
            foreach (var item in uniqueFields)
            {
                var property = typeof(TEntity).GetProperty(item.ColumnName);
                if (property == null) continue;

                string value = property.GetValue(entity)?.ToString();
                if (value == null) continue;
                List<SearchParameters> searches =
                [
                    new SearchParameters()
                    {
                        Name=item.ColumnName,
                        Value=value
                    },
                ];
                if (!isAdd)
                {
                    var keyProperty = typeof(TEntity).GetKeyProperty();
                    searches.Add(new SearchParameters()
                    {
                        Name = keyProperty.Name,
                        Value = keyProperty.GetValue(entity).ToString(),
                        DisplayType = "!="
                    });
                }
                var param = new PageDataOptions()
                {
                    Filter = searches,
                    Page = 1,
                    Rows = 1
                };
                if (param.GetSearchQueryable<TEntity>().Any())
                {
                    return webResponse.Error($"字段[{item.ColumnCnName}]值[{value}]已存在");
                }
            }
            return webResponse.OK();
        }

        /// <summary>
        /// 明细表更新
        /// </summary>
        /// <param name="entityData"></param>
        /// <param name="dbContext"></param>
        /// <param name="detailType">明细实体类型</param>
        public static void UpdateDetail(this EntityData entityData, BaseDbContext dbContext, Type detailType)
        {
            if (entityData.UpdateList == null || entityData.UpdateList.Count == 0) return;
            DetailTypedMethods.First(m => m.Name == nameof(UpdateDetailTyped) && m.IsGenericMethodDefinition)
                .MakeGenericMethod(detailType)
                .Invoke(null, [entityData, dbContext.SqlSugarClient]);
        }
        private static void UpdateDetailTyped<T>(EntityData entityData, ISqlSugarClient sqlSugarClient) where T : class, new()
        {
            var list = entityData.UpdateList.Cast<T>().ToList();
            sqlSugarClient.Updateable<T>(list).UpdateColumns(entityData.UpdateFields.ToArray()).ExecuteCommand();
        }
        /// <summary>
        /// 明细表更新
        /// </summary>
        public static async Task<int> UpdateDetailAsync(this EntityData entityData, BaseDbContext dbContext, Type detailType)
        {
            if (entityData.UpdateList == null || entityData.UpdateList.Count == 0) return 0;
            return await (DetailTypedMethods.First(m => m.Name == nameof(UpdateDetailTypedAsync) && m.IsGenericMethodDefinition)
                .MakeGenericMethod(detailType)
                .Invoke(null, [entityData, dbContext.SqlSugarClient]) as Task<int>);
        }


        private static Task<int> UpdateDetailTypedAsync<T>(EntityData entityData, ISqlSugarClient sqlSugarClient) where T : class, new()
        {
            var list = entityData.UpdateList.Cast<T>().ToList();
            return sqlSugarClient.Updateable<T>(list).UpdateColumns(entityData.UpdateFields.ToArray()).ExecuteCommandAsync();
        }


        /// <summary>
        /// 明细批量插入
        /// </summary>
        public static void InsertDetail(this EntityData entityData, BaseDbContext dbContext, Type detailType)
        {
            if (entityData.AddList == null || entityData.AddList.Count == 0) return;
            DetailTypedMethods.First(m => m.Name == nameof(InsertDetailTyped) && m.IsGenericMethodDefinition)
                .MakeGenericMethod(detailType)
                .Invoke(null, [entityData, dbContext]);
        }

        /// <summary>
        /// 明细批量插入（异步）
        /// </summary>
        public static async Task InsertDetailAsync(this EntityData entityData, BaseDbContext dbContext, Type detailType)
        {
            if (entityData.AddList == null || entityData.AddList.Count == 0) return;
            await (DetailTypedMethods.First(m => m.Name == nameof(InsertDetailTypedAsync) && m.IsGenericMethodDefinition)
                .MakeGenericMethod(detailType)
                .Invoke(null, [entityData, dbContext]) as Task);
        }
        private static void InsertDetailTyped<T>(EntityData entityData, BaseDbContext dbContext) where T : class, new()
        {
            var list = entityData.AddList.Cast<T>().ToList();

            bool isIdentit = IsIdentityType(typeof(T).GetKeyProperty());
            //非自增直接保存
            if (!isIdentit)
            {
                dbContext.SqlSugarClient.Insertable<T>(list).ExecuteCommand();
            }
            foreach (var entity in list)
            {
                //自增主键，InsertNavDetail调用写入数据库
                dbContext.InsertNavDetail(entity, isIdentit);
            }
        }

        private static async Task<bool> InsertDetailTypedAsync<T>(EntityData entityData, BaseDbContext dbContext) where T : class, new()
        {
            var list = entityData.AddList.Cast<T>().ToList();
            bool isIdentit = IsIdentityType(typeof(T).GetKeyProperty());
            //非自增直接保存
            if (!isIdentit)
            {
                await dbContext.SqlSugarClient.Insertable<T>(list).ExecuteCommandAsync();
            }

            foreach (var entity in list)
            {
                //自增主键，InsertNavDetail调用写入数据库
                await dbContext.InsertNavDetailAsync(entity, isIdentit);
            }
            return true;
        }
        /// <summary>
        /// 新建时主从表一起写入
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dbContext"></param>
        /// <param name="mainEntity"></param>
        /// <param name="insertMainData">是否保存主表数据</param>
        /// <returns></returns>
        public static bool InsertNavDetail<T>(this BaseDbContext dbContext, T mainEntity, bool insertMainData = true) where T : class, new()
        {
            if (insertMainData)
            {
                dbContext.SqlSugarClient.AddWithSetIdentity(mainEntity, true);
            }
            Type[] detailTypes = GetDetailTypes<T>();
            foreach (Type detailType in detailTypes)
            {
                GetInsertNavDetailMemberInfo(nameof(InsertNavDetailPair))
                .MakeGenericMethod(typeof(T), detailType)
                .Invoke(null, [mainEntity, dbContext]);
            }
            return true;
        }
        private static MethodInfo GetInsertNavDetailMemberInfo(string name)
        {
            return typeof(ApplicationServiceBaseUpdateOrAddExtensions)
                   .GetMethods(BindingFlags.NonPublic | BindingFlags.Static)
                   .First(m => m.Name == name && m.IsGenericMethodDefinition);
        }
        public static async Task<bool> InsertNavDetailAsync<T>(this BaseDbContext dbContext, T mainEntity, bool insertMainData = true) where T : class, new()
        {
            if (insertMainData)
            {
                dbContext.SqlSugarClient.AddWithSetIdentity(mainEntity, true);
            }
            Type[] detailTypes = GetDetailTypes<T>();
            foreach (Type detailType in detailTypes)
            {
                await (GetInsertNavDetailMemberInfo(nameof(InsertNavDetailPairAsync))
                 .MakeGenericMethod(typeof(T), detailType)
                 .Invoke(null, [mainEntity, dbContext]) as Task<bool>);
            }
            return true;
        }
        private static async Task<bool> InsertNavDetailPairAsync<TMain, TDetail>(TMain mainEntity, BaseDbContext dbContext)
          where TMain : class
          where TDetail : class, new()
        {
            List<TDetail> list = GetDetails<TMain, TDetail>(mainEntity);
            if (list == null || list.Count == 0) return true;

            var sugarClient = dbContext.SqlSugarClient;
            PropertyInfo detailKeyProp = typeof(TDetail).GetKeyProperty();
            if (IsIdentityType(detailKeyProp))
            {
                foreach (TDetail row in list)
                {
                    await sugarClient.Insertable(row).ExecuteReturnEntityAsync();
                }
            }
            else
            {
                await sugarClient.Insertable(list).ExecuteCommandAsync();
            }
            //三级明细表
            if (!HasDetail<TDetail>()) return true;
            foreach (TDetail row in list)
            {
                await dbContext.InsertNavDetailAsync(row, false);
            }
            return true;
        }

        private static void InsertNavDetailPair<TMain, TDetail>(TMain mainEntity, BaseDbContext dbContext)
            where TMain : class
            where TDetail : class, new()
        {
            List<TDetail> list = GetDetails<TMain, TDetail>(mainEntity);
            if (list == null || list.Count == 0) return;

            var sugarClient = dbContext.SqlSugarClient;
            PropertyInfo detailKeyProp = typeof(TDetail).GetKeyProperty();
            if (IsIdentityType(detailKeyProp))
            {
                foreach (TDetail row in list)
                {
                    sugarClient.Insertable(row).ExecuteReturnEntity();
                }
            }
            else
            {
                sugarClient.Insertable(list).ExecuteCommand();
            }
            //三级明细表
            if (!HasDetail<TDetail>()) return;
            foreach (TDetail row in list)
            {
                dbContext.InsertNavDetail(row, false);
            }
        }

        private static List<TDetail> GetDetails<TMain, TDetail>(TMain mainEntity)
        {
            PropertyInfo detailProperty = typeof(TMain).GetProperty(typeof(TDetail).GetEntityTableName(false));
            List<TDetail> list = detailProperty.GetValue(mainEntity) as List<TDetail>;
            if (list == null || list.Count == 0) return null;

            //主表主键
            PropertyInfo mainKeyProp = typeof(TMain).GetKeyProperty();
            //与主表关联主键字段
            string foreignKey = typeof(TMain).GetForeignKey(typeof(TDetail).Name);
            //明细表与主表主键关联字段
            PropertyInfo fkProp = typeof(TDetail).GetProperty(foreignKey);
            if (IsIdentityType(mainKeyProp))
            {
                object mainKeyVal = mainKeyProp?.GetValue(mainEntity);
                foreach (TDetail row in list)
                {
                    fkProp.SetValue(row, mainKeyVal.ChangeType(fkProp.PropertyType));
                }
            }
            return list;
        }
        /// <summary>
        /// 是否自增
        /// </summary>
        /// <param name="property"></param>
        /// <returns></returns>
        private static bool IsIdentityType(PropertyInfo property)
        {
            return property.PropertyType == typeof(int) || (property.PropertyType == typeof(long) && !AppSetting.EnableSnowFlakeID);
        }

        private static bool HasDetail<T>() where T : class
        {
            return GetDetailTypes<T>().Length > 0;
        }

        public static Type[] GetDetailTypes<T>() where T : class
        {
            return GetDetailTypes(typeof(T));
        }


        public static Type[] GetDetailTypes(this Type mainType)
        {
            return mainType.GetCustomAttribute<EntityAttribute>()?.DetailTable ?? []; ;
        }
    }
}
