using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.Dapper;
using VOL.Core.EFDbContext;
using VOL.Core.Enums;
using VOL.Core.Utilities;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public interface IRepository<TEntity> where TEntity : BaseEntity
    {

        /// <summary>
        /// EF DBContext
        /// </summary>
        VOLContext DbContext { get; }

        ISqlDapper DapperContext { get; }
        /// <summary>
        /// 执行事务。将在执行的方法带入Action
        /// </summary>
        /// <param name="action"></param>
        /// <returns></returns>
        WebResponseContent DbContextBeginTransaction(Func<WebResponseContent> action);

    
        /// <summary>
        /// 通过条件查询数据
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        List<TEntity> Find(Expression<Func<TEntity, bool>> where);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="predicate"></param>
        /// <param name="orderBySelector">排序字段,数据格式如:
        ///  orderBy = x => new Dictionary<object, bool>() {
        ///          { x.BalconyName,QueryOrderBy.Asc},
        ///          { x.TranCorpCode1,QueryOrderBy.Desc}
        ///         };
        /// 
        /// </param>
        /// <returns></returns>
        TEntity FindFirst(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy = null);



        /// <summary>
        /// 
        /// </summary>
        /// <param name="predicate">where条件</param>
        /// <param name="orderBy">排序字段,数据格式如:
        ///  orderBy = x => new Dictionary<object, bool>() {
        ///          { x.BalconyName,QueryOrderBy.Asc},
        ///          { x.TranCorpCode1,QueryOrderBy.Desc}
        ///         };
        /// </param>
        /// <returns></returns>
        IQueryable<TEntity> FindAsIQueryable(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy = null);
        /// <summary>
        /// 通过条件查询数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="predicate">查询条件</param>
        /// <param name="selector">返回类型如:Find(x => x.UserName == loginInfo.userName, p => new { uname = p.UserName });</param>
        /// <returns></returns>
        List<T> Find<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector);



        /// <summary>
        /// 根据条件，返回查询的类
        /// </summary>
        /// <typeparam name="TFind"></typeparam>
        /// <param name="predicate"></param>
        /// <returns></returns>
        List<TFind> Find<TFind>(Expression<Func<TFind, bool>> predicate) where TFind : class;

        Task<TFind> FindAsyncFirst<TFind>(Expression<Func<TFind, bool>> predicate) where TFind : class;

        Task<TEntity> FindAsyncFirst(Expression<Func<TEntity, bool>> predicate);

        Task<List<TFind>> FindAsync<TFind>(Expression<Func<TFind, bool>> predicate) where TFind : class;
        Task<TEntity> FindFirstAsync(Expression<Func<TEntity, bool>> predicate);

        Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate);

        Task<List<T>> FindAsync<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector);

        Task<T> FindFirstAsync<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector);

        /// <summary>
        /// 多条件查询
        /// </summary>
        /// <typeparam name="Source"></typeparam>
        /// <param name="sources">要查询的多个条件的数据源</param>
        /// <param name="predicate">生成的查询条件</param>
        /// <returns></returns>
        List<TEntity> Find<Source>(IEnumerable<Source> sources,
            Func<Source, Expression<Func<TEntity, bool>>> predicate)
            where Source : class;
        /// <summary>
        /// 多条件查询
        /// </summary>
        /// <typeparam name="Source"></typeparam>
        /// <param name="sources">要查询的多个条件的数据源</param>
        /// <param name="predicate">生成的查询条件</param>
        /// <param name="selector">自定义返回结果</param>
        /// <returns></returns>
        List<TResult> Find<Source, TResult>(IEnumerable<Source> sources,
            Func<Source, Expression<Func<TEntity, bool>>> predicate,
            Expression<Func<TEntity, TResult>> selector)
            where Source : class;

        /// <summary>
        /// 多条件查询
        /// </summary>
        /// <typeparam name="Source"></typeparam>
        /// <param name="sources">要查询的多个条件的数据源</param>
        /// <param name="predicate">生成的查询条件</param>
        /// <returns></returns>
        IQueryable<TEntity> FindAsIQueryable<Source>(IEnumerable<Source> sources,
            Func<Source, Expression<Func<TEntity, bool>>> predicate)
            where Source : class;

        Task<bool> ExistsAsync(Expression<Func<TEntity, bool>> predicate);

        bool Exists(Expression<Func<TEntity, bool>> predicate);

        bool Exists<TExists>(Expression<Func<TExists, bool>> predicate) where TExists : class;

        Task<bool> ExistsAsync<TExists>(Expression<Func<TExists, bool>> predicate) where TExists : class;

        IIncludableQueryable<TEntity, TProperty> Include<TProperty>(Expression<Func<TEntity, TProperty>> incluedProperty);
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="pageIndex"></param>
        /// <param name="pagesize"></param>
        /// <param name="rowcount"></param>
        /// <param name="predicate"></param>
        /// <param name="orderBy">
        /// 通过多个字段排序Expression<Func<TEntity, Dictionary<object, bool>>>
        ///  orderBy = x => new Dictionary<object, bool>() {
        ///          { x.BalconyName,QueryOrderBy.Asc},
        ///          { x.TranCorpCode1,QueryOrderBy.Desc}
        ///         };
        /// <param name="selectorResult">查询返回的对象</param>
        /// <returns></returns>
        List<TResult> QueryByPage<TResult>(int pageIndex, int pagesize, out int rowcount, Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBySelector, Expression<Func<TEntity, TResult>> selectorResult, bool returnRowCount = true);

        List<TResult> QueryByPage<TResult>(int pageIndex, int pagesize, Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy, Expression<Func<TEntity, TResult>> selectorResult = null);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pagesize"></param>
        /// <param name="rowcount"></param>
        /// <param name="predicate"></param>
        /// <param name="orderBy"></param>
        ///         /// 通过多个字段排序Expression<Func<TEntity, Dictionary<object, bool>>>
        ///  orderBy = x => new Dictionary<object, bool>() {
        ///          { x.BalconyName,QueryOrderBy.Asc},
        ///          { x.TranCorpCode1,QueryOrderBy.Desc}
        ///         };
        /// <returns></returns>
        List<TEntity> QueryByPage(int pageIndex, int pagesize, out int rowcount, Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy, bool returnRowCount = true);

        IQueryable<TFind> IQueryablePage<TFind>(int pageIndex, int pagesize, out int rowcount, Expression<Func<TFind, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy, bool returnRowCount = true) where TFind : class;


        IQueryable<TEntity> IQueryablePage(IQueryable<TEntity> queryable, int pageIndex, int pagesize, out int rowcount, Dictionary<string, QueryOrderBy> orderBy, bool returnRowCount = true);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="properties">指定更新字段:x=>new {x.Name,x.Enable}</param>
        /// <param name="saveChanges">是否保存</param>
        /// <returns></returns>

        int Update(TEntity entity, Expression<Func<TEntity, object>> properties, bool saveChanges = false);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="properties">指定更新字段:x=>new {x.Name,x.Enable}</param>
        /// <param name="saveChanges">是否保存</param>
        /// <returns></returns>
        int Update<TSource>(TSource entity, Expression<Func<TSource, object>> properties, bool saveChanges = false) where TSource : class;

        int Update<TSource>(TSource entity, bool saveChanges = false) where TSource : class;

        int Update<TSource>(TSource entity, string[] properties, bool saveChanges = false) where TSource : class;

        int UpdateRange<TSource>(IEnumerable<TSource> entities, bool saveChanges = false) where TSource : class;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="properties">指定更新字段:x=>new {x.Name,x.Enable}</param>
        /// <param name="saveChanges">是否保存</param>
        /// <returns></returns>
        int UpdateRange<TSource>(IEnumerable<TSource> models, Expression<Func<TSource, object>> properties, bool saveChanges = false) where TSource : class;

        int UpdateRange<TSource>(IEnumerable<TSource> entities, string[] properties, bool saveChanges = false) where TSource : class;


        /// <summary>
        ///修改时同时对明细的添加、删除、修改
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateDetail">是否修改明细</param>
        /// <param name="delNotExist">是否删除明细不存在的数据</param>
        /// <param name="updateMainFields">主表指定修改字段</param>
        /// <param name="updateDetailFields">明细指定修改字段</param>
        /// <param name="saveChange">是否保存</param>
        /// <returns></returns>
        WebResponseContent UpdateRange<Detail>(TEntity entity,
            bool updateDetail = false,
            bool delNotExist = false,
            Expression<Func<TEntity, object>> updateMainFields = null,
            Expression<Func<Detail, object>> updateDetailFields = null,
            bool saveChange = false) where Detail : class;

        void Delete(TEntity model, bool saveChanges=false);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="keys"></param>
        /// <param name="delList">是否将子表的数据也删除</param>
        /// <returns></returns>
        int DeleteWithKeys(object[] keys, bool delList = false);

        void Add(TEntity entities, bool SaveChanges = false);
        void AddRange(IEnumerable<TEntity> entities, bool SaveChanges = false);

        Task AddAsync(TEntity entities);
        Task AddRangeAsync(TEntity entities);

        void AddRange<T>(IEnumerable<T> entities, bool saveChanges = false)
           where T : class;


       void BulkInsert(IEnumerable<TEntity> entities, bool setOutputIdentity = false);

        int SaveChanges();

        Task<int> SaveChangesAsync();



        int ExecuteSqlCommand(string sql, params SqlParameter[] sqlParameters);

        List<TEntity> FromSql(string sql, params SqlParameter[] sqlParameters);

        /// <summary>
        /// 执行sql
        /// 使用方式 FormattableString sql=$"select * from xx where name ={xx} and pwd={xx1} "，
        /// FromSqlInterpolated内部处理sql注入的问题，直接在{xx}写对应的值即可
        /// 注意：sql必须 select * 返回所有TEntity字段，
        /// </summary>
        /// <param name="formattableString"></param>
        /// <returns></returns>
        IQueryable<TEntity> FromSqlInterpolated([System.Diagnostics.CodeAnalysis.NotNull] FormattableString sql);
      
    }
}
