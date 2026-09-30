using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.DbSqlSugar;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Tenancy;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public static class ApplicationServiceBaseSearchExtensions
    {

        public static (ISugarQueryable<TEntity> queryable, Dictionary<string, QueryOrderBy> orderbyDic) BuildPageDataQuery<TEntity, TRepository>(
           this PageDataOptions options,
           ServiceBase<TEntity, TRepository> service,
           bool useTenancy = true, bool logicDel = true)
            where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {

            //生成查询条件与数据权限过滤
            ISugarQueryable<TEntity> queryable = service.ValidatePageOptions(options, useTenancy);

            //获取排序字段
            var properties = typeof(TEntity).GetProperties();
            Dictionary<string, QueryOrderBy> orderbyDic = service.GetPageDataSort(options, properties);
            if (service.QueryRelativeExpression != null)
            {
                queryable = service.QueryRelativeExpression.Invoke(queryable);
            }
            //过滤逻辑删除
            if (logicDel)
            {
                queryable = queryable.FilterLogicDel();
            }
            return (queryable, orderbyDic);
        }

        public static ISugarQueryable<TEntity> ValidatePageOptions<TEntity, TRepository>(
            this ServiceBase<TEntity, TRepository> service,
            PageDataOptions options,
            bool useTenancy = true)
            where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            if (options.Rows <= 0)
            {
                options.Rows = 30;
            }
            List<SearchParameters> searchParametersList = options.GetSearchParameters();
            service.QueryRelativeList?.Invoke(searchParametersList);
            ISugarQueryable<TEntity> queryable = null;
            if (useTenancy && options.Value?.ToString() != "viewflow")
            {
                queryable = GetSearchQueryable(service);
            }
            else
            {
                queryable = service.repository.DbContext.Set<TEntity>();
            }
            queryable = options.ConvertQueryFilter(queryable);
            //options.TableName = typeof(TEntity).Name;
            return queryable;
        }
        /// <summary>
        ///  自定义原生查询sql或多租户(查询、导出)
        /// </summary>
        /// <returns></returns>
        private static ISugarQueryable<TEntity> GetSearchQueryable<TEntity, TRepository>(ServiceBase<TEntity, TRepository> service)
               where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            if (!string.IsNullOrEmpty(service.QuerySql))
            {
                var customerQueryable = service.repository.DbContext.SqlQueryable<TEntity>(service.QuerySql);
                service.QuerySql = null;
                return service.GetSearchQueryable(customerQueryable);
            }
            var query = service.repository.DbContext.Set<TEntity>(false);
            if (!service.IsMultiTenancy)
            {
                return query;
            }
            return service.GetSearchQueryable(query);
        }
        public static ISugarQueryable<TEntity> GetSearchQueryable<TEntity, TRepository>(
           this ServiceBase<TEntity, TRepository> service,
           ISugarQueryable<TEntity> queryable)
           where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            string tableName = typeof(TEntity).GetEntityTableName();
            string sql = TenancyManager<TEntity>.GetSearchQueryable(tableName);
            if (!string.IsNullOrEmpty(sql))
            {
                return service.repository.DbContext.SqlQueryable<TEntity>(sql);
            }
            return queryable;
        }
        public static ISugarQueryable<TEntity> GetSearchQueryable<TEntity>(this PageDataOptions options,
            bool useTenancy = true, bool logicDel = true) where TEntity : class, new()
        {
            var queryable = options.ConvertQueryFilter<TEntity>();
            if (logicDel)
            {
                queryable = queryable.FilterLogicDel();
            }
            return queryable;
        }

        public static List<SearchParameters> GetSearchParameters(this PageDataOptions options)
        {
            List<SearchParameters> searchParametersList = [];
            if (options.Filter != null && options.Filter.Count > 0)
            {
                searchParametersList.AddRange(options.Filter);
            }
            else if (!string.IsNullOrEmpty(options.Wheres))
            {
                try
                {
                    searchParametersList = options.Wheres.DeserializeObject<List<SearchParameters>>();
                    options.Filter = searchParametersList;
                }
                catch { }
            }
            return searchParametersList;
        }
        public static ISugarQueryable<TEntity> ConvertQueryFilter<TEntity>(this PageDataOptions options, ISugarQueryable<TEntity> queryable = null)
        where TEntity : class, new()
        {
            queryable ??= DbManger.Db.Set<TEntity>();
            List<SearchParameters> searchParametersList = options.GetSearchParameters();
            if (searchParametersList == null)
            {
                return queryable;
            }
            var TProperties = typeof(TEntity).GetProperties();
            Expression<Func<TEntity, bool>> BuildExpression(SearchParameters x)
            {
                // 空或null值查询条件
                if (Enum.TryParse(x.DisplayType, ignoreCase: true, out LinqExpressionType filterType))
                {
                    if (filterType.CheckFilterNullExpression())
                    {
                        return x.Name.CreateExpression<TEntity>(null, filterType);
                    }
                }
                if (string.IsNullOrEmpty(x.Value))
                {
                    return null;
                }
                LinqExpressionType expressionType = x.DisplayType.GetLinqCondition();
                //多个字段or查询
                if (x.Fields?.Count > 0)
                {
                    Expression<Func<TEntity, bool>> express = null;
                    foreach (var field in x.Fields)
                    {
                        PropertyInfo orProperty = TProperties
                            .Where(c => c.Name.Equals(field, StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();
                        var exp = field.CreateExpression<TEntity>(x.Value, expressionType);
                        if (express == null)
                        {
                            express = exp;
                        }
                        else
                        {
                            express = express.Or(exp);
                        }
                    }
                    return express;
                }

                PropertyInfo property = TProperties.Where(c => c.Name.Equals(x.Name, StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();
                //字段null处理
                if (property == null) return null;

                //移除查询的值与数据库类型不匹配的数据
                object[] values = property.ValidationValueForDbType(x.Value.Split(',')).Where(q => q.Item1).Select(s => s.Item3).ToArray();
                if (values == null || values.Length == 0)
                {
                    return null;
                }


                return (LinqExpressionType.In == expressionType || LinqExpressionType.NotIn == expressionType)
                    ? x.Name.CreateExpression<TEntity>(values, expressionType)
                    : x.Name.CreateExpression<TEntity>(x.Value, expressionType);
            }

            ISugarQueryable<TEntity> ApplyLegacy(ISugarQueryable<TEntity> q, List<SearchParameters> list)
            {
                //判断列的数据类型数字，日期的需要判断值的格式是否正确
                for (int i = 0; i < list.Count; i++)
                {
                    var expr = BuildExpression(list[i]);
                    if (expr == null) continue;
                    q = q.Where(expr);
                }
                return q;
            }

            // 如没有分组配置，则完全走原来的 AND 逻辑
            bool hasGroup = searchParametersList.Any(x => !string.IsNullOrEmpty(x?.Group));
            if (!hasGroup)
            {
                return ApplyLegacy(queryable, searchParametersList);
            }

            // 1) 先用原逻辑处理“非分组”的条件（保持行为一致）
            queryable = ApplyLegacy(queryable, searchParametersList.Where(x => string.IsNullOrEmpty(x?.Group)).ToList());

            // 2) 分组条件：组内按 JoinType 顺序组合；组与组之间 AND
            var grouped = searchParametersList
                .Where(x => !string.IsNullOrEmpty(x?.Group))
                .GroupBy(x => x.Group, StringComparer.CurrentCultureIgnoreCase);

            foreach (var g in grouped)
            {
                Expression<Func<TEntity, bool>> groupExpr = null;
                foreach (var item in g)
                {
                    var one = BuildExpression(item);
                    if (one == null) continue;
                    groupExpr = groupExpr == null ? one : (item.Or ? groupExpr.Or(one) : groupExpr.And(one));
                }
                if (groupExpr != null)
                {
                    queryable = queryable.Where(groupExpr);
                }
            }
            return queryable;
        }
        private const string _asc = "asc";
        /// <summary>
        /// 生成排序字段
        /// </summary>
        /// <param name="pageData"></param>
        /// <param name="propertyInfo"></param>

        public static Dictionary<string, QueryOrderBy> GetPageDataSort<TEntity, TRepository>(
             this ServiceBase<TEntity, TRepository> service,
             PageDataOptions pageData,
             PropertyInfo[] propertyInfo = null)
              where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            if (service.OrderByExpression != null)
            {
                return service.OrderByExpression.GetExpressionToDic();
            }
            return pageData.GetSort(propertyInfo);
        }


        public static Dictionary<string, QueryOrderBy> GetTypeSort<TEntity>(this PageDataOptions pageData) where TEntity : class
        {
            return pageData.GetSort(typeof(TEntity).GetProperties());
        }
        public static Dictionary<string, QueryOrderBy> GetSort(this PageDataOptions pageData, PropertyInfo[] propertyInfo = null)
        {
            propertyInfo ??= [];
            if (!string.IsNullOrEmpty(pageData.Sort))
            {
                Dictionary<string, QueryOrderBy> sortDic = new Dictionary<string, QueryOrderBy>();
                //多个排序字段{id:asc,date:desc}
                if (pageData.Sort.Contains('{'))
                {
                    var dicSort = pageData.Sort.DeserializeObject<Dictionary<string, string>>();
                    foreach (var item in dicSort)
                    {
                        sortDic[item.Key] = item.Value?.ToLower() == _asc ? QueryOrderBy.Asc : QueryOrderBy.Desc;
                    }
                    return sortDic;
                }
                if (pageData.Sort.Contains(','))
                {
                    var sortArr = pageData.Sort.Split(",").Where(x => propertyInfo.Any(c => c.Name == x)).Select(s => s).Distinct().ToList();

                    foreach (var name in sortArr)
                    {
                        sortDic[name] = pageData.Order?.ToLower() == _asc ? QueryOrderBy.Asc : QueryOrderBy.Desc;
                    }
                    return sortDic;
                }
                else if (propertyInfo.Any(x => x.Name == pageData.Sort))
                {
                    return new Dictionary<string, QueryOrderBy>() { {
                            pageData.Sort,
                            pageData.Order?.ToLower() == _asc? QueryOrderBy.Asc: QueryOrderBy.Desc
                     } };
                }
            }
            //如果没有排序字段，则使用主键作为排序字段

            PropertyInfo property = propertyInfo.GetKeyProperty();
            //如果主键不是自增类型则使用appsettings.json中CreateMember->DateField配置的创建时间作为排序
            if (property.PropertyType == typeof(int) || property.PropertyType == typeof(long))
            {
                if (!propertyInfo.Any(x => x.Name.ToLower() == pageData.Sort))
                {
                    pageData.Sort = propertyInfo.GetKeyName();
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(AppSetting.CreateMember.DateField)
                    && propertyInfo.Any(x => x.Name == AppSetting.CreateMember.DateField))
                {
                    pageData.Sort = AppSetting.CreateMember.DateField;
                }
                else
                {
                    pageData.Sort = propertyInfo.GetKeyName();
                }
            }
            return new Dictionary<string, QueryOrderBy>() {
                {
                    pageData.Sort,
                    pageData.Order?.ToLower() == _asc? QueryOrderBy.Asc: QueryOrderBy.Desc
                }
            };
        }
        public static ServiceBase<TEntity, TRepository> InvokeResult<TEntity, TRepository>(
         this ServiceBase<TEntity, TRepository> service,
         PageGridData<TEntity> gridData)
          where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            service.GetPageDataOnExecuted?.Invoke(gridData);
            return service;
        }
        public static async Task<object> InvokeSummaryExpressAsync<TEntity, TRepository>(
        this ServiceBase<TEntity, TRepository> service,
        ISugarQueryable<TEntity> queryable)
        where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            if (service.SummaryExpress != null)
            {
                return service.InvokeSummaryExpress(queryable.Clone());
            }
            if (service.SummaryExpressAsync != null)
            {
                return await service.SummaryExpressAsync.Invoke(queryable.Clone());
            }
            return null;
        }

        public static object InvokeSummaryExpress<TEntity, TRepository>(
           this ServiceBase<TEntity, TRepository> service,
           ISugarQueryable<TEntity> queryable)
           where TEntity : BaseEntity, new() where TRepository : IRepository<TEntity>
        {
            if (service.SummaryExpress != null)
            {
                return service.SummaryExpress.Invoke(queryable.Clone());
            }
            return null;
        }

        /// <summary>
        /// 映射指定权限的字段不查询数据库
        /// </summary>
        /// <param name="queryable"></param>
        /// <returns></returns>
        public static List<TEntity> FilterQueryableAuthFields<TEntity>(this ISugarQueryable<TEntity> queryable) where TEntity : class
        {
            return queryable.ToList();
        }
        /// <summary>
        /// 字段权限
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="queryable"></param>
        /// <returns></returns>
        public static Task<List<TEntity>> FilterQueryableAuthFieldsAsync<TEntity>(this ISugarQueryable<TEntity> queryable) where TEntity : class
        {
            return queryable.ToListAsync();
        }
    }
}
