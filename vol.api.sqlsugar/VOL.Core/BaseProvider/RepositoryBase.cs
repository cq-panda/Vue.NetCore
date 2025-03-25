using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Storage;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using VOL.Core.DbContext;
using VOL.Core.DBManager;
using VOL.Core.DbSqlSugar;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public abstract class RepositoryBase<TEntity> where TEntity : BaseEntity, new()
    {
        public RepositoryBase(VOLContext dbContext)
        {
            this.DefaultDbContext = dbContext;
        }

        private VOLContext DefaultDbContext { get; set; }
        public VOLContext VOLContext
        {
            get
            {
                return DefaultDbContext;
            }
        }

        public virtual ISqlSugarClient DbContext
        {
            get { return DefaultDbContext.SqlSugarClient; }
        }

        public virtual ISqlSugarClient SqlSugarClient
        {
            get
            {
                return DefaultDbContext.SqlSugarClient;
            }
        }
        private ISugarQueryable<TEntity> DBSet
        {
            get { return VOLContext.Set<TEntity>(); }
        }

        /// <summary>
        /// 执行事务
        /// </summary>
        /// <param name="action">如果返回false则回滚事务(可自行定义规则)</param>
        /// <returns></returns>
        public virtual WebResponseContent DbContextBeginTransaction(Func<WebResponseContent> action)
        {
            WebResponseContent webResponse = new WebResponseContent();
            try
            {
                DbContext.Ado.BeginTran();

                webResponse = action();
                if (webResponse.Status)
                {
                    DbContext.Ado.CommitTran();
                }
                else
                {
                    DbContext.Ado.RollbackTran();

                }
                return webResponse;
            }
            catch (Exception ex)
            {
                DbContext.Ado.RollbackTran();
                return new WebResponseContent().Error(ex.Message + ex.InnerException + ex.StackTrace);
            }
        }

        public virtual bool Exists<TExists>(Expression<Func<TExists, bool>> predicate, bool filterDeleted = true) where TExists : class
        {
            return VOLContext.Set<TExists>(filterDeleted).Any(predicate);
        }

        public virtual Task<bool> ExistsAsync<TExists>(Expression<Func<TExists, bool>> predicate, bool filterDeleted = true) where TExists : class
        {
            return VOLContext.Set<TExists>(filterDeleted).AnyAsync(predicate);
        }

        public virtual bool Exists(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return VOLContext.Set<TEntity>(filterDeleted).Any(predicate);
        }

        public virtual Task<bool> ExistsAsync(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return VOLContext.Set<TEntity>(filterDeleted).AnyAsync(predicate);
        }
      
        public virtual ISugarQueryable<TEntity> WhereIF(bool checkCondition, Expression<Func<TEntity, bool>> predicate)
        {
            if (checkCondition)
            {
                return VOLContext.Set<TEntity>().Where(predicate);
            }
            return VOLContext.Set<TEntity>();
        }

        public virtual ISugarQueryable<T> WhereIF<T>(bool checkCondition, Expression<Func<T, bool>> predicate) where T : class
        {
            if (checkCondition)
            {
                return VOLContext.Set<T>().Where(predicate);
            }
            return VOLContext.Set<T>();
        }


        public virtual List<TFind> Find<TFind>(Expression<Func<TFind, bool>> predicate, bool filterDeleted = true) where TFind : class
        {
            return VOLContext.Set<TFind>(filterDeleted).Where(predicate).ToList();
        }

        public virtual Task<TFind> FindAsyncFirst<TFind>(Expression<Func<TFind, bool>> predicate, bool filterDeleted = true) where TFind : class
        {
            return FindAsISugarQueryable(predicate, filterDeleted).FirstOrDefaultAsync();
        }

        public virtual Task<TEntity> FindAsyncFirst(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return FindAsISugarQueryable<TEntity>(predicate, filterDeleted).FirstOrDefaultAsync();
        }

        public virtual Task<List<TFind>> FindAsync<TFind>(Expression<Func<TFind, bool>> predicate, bool filterDeleted = true) where TFind : class
        {
            return FindAsISugarQueryable<TFind>(predicate, filterDeleted).ToListAsync();
        }

        public virtual Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return FindAsISugarQueryable(predicate, filterDeleted).ToListAsync();
        }

        public virtual Task<TEntity> FindFirstAsync(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return FindAsISugarQueryable(predicate, filterDeleted).FirstOrDefaultAsync();
        }

        public virtual Task<List<T>> FindAsync<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector, bool filterDeleted = true)
        {
            return FindAsISugarQueryable(predicate, filterDeleted).Select(selector).ToListAsync();
        }

        public virtual Task<T> FindFirstAsync<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector, bool filterDeleted = true)
        {
            return FindAsISugarQueryable(predicate, filterDeleted).Select(selector).FirstOrDefaultAsync();
        }

        private ISugarQueryable<TFind> FindAsISugarQueryable<TFind>(Expression<Func<TFind, bool>> predicate, bool filterDeleted = true) where TFind : class
        {
            return VOLContext.Set<TFind>(filterDeleted).Where(predicate);
        }


        public virtual List<T> Find<T>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, T>> selector, bool filterDeleted = true)
        {
            return VOLContext.Set<TEntity>(filterDeleted).Where(predicate).Select(selector).ToList();
        }
        /// <summary>
        /// 单表查询
        /// </summary>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public virtual List<TEntity> Find(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return FindAsISugarQueryable(predicate, filterDeleted).ToList();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="predicate"></param>
        /// <param name=""></param>
        /// <param name="orderBy">排序字段</param>
        /// <returns></returns>
        public virtual TEntity FindFirst(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return VOLContext.Set<TEntity>(filterDeleted).Where(predicate).FirstOrDefault();
        }


        public ISugarQueryable<TEntity> FindAsIQueryable(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy = null)
        {
            //if (orderBy != null)
            //    return DbContext.Set<TEntity>().Where(predicate).GetISugarQueryableOrderBy(orderBy.GetExpressionToDic());
            return DbContext.Set<TEntity>().Where(predicate);
        }

        public ISugarQueryable<TEntity> Include<TProperty>(Expression<Func<TEntity, TProperty>> incluedProperty)
        {
            return DbContext.Set<TEntity>().Includes(incluedProperty);
        }

        /// <summary>
        /// 通过条件查询返回指定列的数据(将TEntity映射到匿名或实体T)
        ///var result = Sys_UserRepository.GetInstance.Find(x => x.UserName == loginInfo.userName, p => new { uname = p.UserName });
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TKey"></typeparam>
        /// <param name="pageIndex"></param>
        /// <param name="pagesize"></param>
        /// <param name="rowcount"></param>
        /// <param name="predicate">查询条件</param>
        /// <param name="orderBySelector">多个排序字段key为字段，value为升序/降序</param>
        /// <returns></returns>
        public virtual ISugarQueryable<TFind> IQueryablePage<TFind>(int pageIndex, int pagesize, out int rowcount, Expression<Func<TFind, bool>> predicate, Expression<Func<TEntity, Dictionary<object, QueryOrderBy>>> orderBy, bool returnRowCount = true) where TFind : class
        {
            pageIndex = pageIndex <= 0 ? 1 : pageIndex;
            pagesize = pagesize <= 0 ? 10 : pagesize;
            if (predicate == null)
            {
                predicate = x => 1 == 1;
            }
            var _db = DbContext.Set<TFind>();
            rowcount = returnRowCount ? _db.Count(predicate) : 0;
            return DbContext.Set<TFind>().Where(predicate)
                .GetISugarQueryableOrderBy(orderBy.GetExpressionToDic())
                .Skip((pageIndex - 1) * pagesize)
                .Take(pagesize);
        }

        /// <summary>
        /// 分页排序
        /// </summary>
        /// <param name="queryable"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pagesize"></param>
        /// <param name="rowcount"></param>
        /// <param name="orderBy"></param>
        /// <returns></returns>
        public virtual ISugarQueryable<TEntity> IQueryablePage(ISugarQueryable<TEntity> queryable, int pageIndex, int pagesize, out int rowcount, Dictionary<string, QueryOrderBy> orderBy, bool returnRowCount = true)
        {
            pageIndex = pageIndex <= 0 ? 1 : pageIndex;
            pagesize = pagesize <= 0 ? 10 : pagesize;
            rowcount = returnRowCount ? queryable.Count() : 0;
            return queryable.GetISugarQueryableOrderBy<TEntity>(orderBy)
                .Skip((pageIndex - 1) * pagesize)
                .Take(pagesize);
        }



        /// <summary>
        /// 更新表数据
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="saveChanges">是否保存</param>
        /// <param name="properties">格式 Expression<Func<entityt, object>> expTree = x => new { x.字段1, x.字段2 };</param>
        public virtual int Update(TEntity entity, Expression<Func<TEntity, object>> properties, bool saveChanges = false)
        {
            return Update<TEntity>(entity, properties, saveChanges);
        }

        public virtual int Update<TSource>(TSource entity, Expression<Func<TSource, object>> properties, bool saveChanges = false) where TSource : class, new()
        {
            return UpdateRange<TSource>(new List<TSource>
            {
                entity
            }, properties, saveChanges);
        }


        public virtual int Update<TSource>(TSource entity, string[] properties, bool saveChanges = false) where TSource : class, new()
        {
            return UpdateRange<TSource>(new List<TSource>() { entity }, properties, saveChanges);
        }
        public virtual int Update<TSource>(TSource entity, bool saveChanges = false) where TSource : class, new()
        {
            return UpdateRange<TSource>(new List<TSource>() { entity }, new string[0], saveChanges);
        }
        public virtual int UpdateRange<TSource>(IEnumerable<TSource> entities, Expression<Func<TSource, object>> properties, bool saveChanges = false) where TSource : class, new()
        {
            return UpdateRange<TSource>(entities, properties?.GetExpressionProperty(), saveChanges);
        }
        public virtual int UpdateRange<TSource>(IEnumerable<TSource> entities, bool saveChanges = false) where TSource : class, new()
        {
            return UpdateRange<TSource>(entities, new string[0], saveChanges);
        }

        /// <summary>
        /// 更新表数据
        /// </summary>
        /// <param name="models"></param>
        /// <param name="properties">格式 Expression<Func<entityt, object>> expTree = x => new { x.字段1, x.字段2 };</param>
        public int UpdateRange<TSource>(IEnumerable<TSource> entities, string[] properties, bool saveChanges = false) where TSource : class, new()
        {
            return DbContext.UpdateRange(entities, properties, saveChanges);
        }




        /// <summary>
        ///
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="updateDetail">是否修改明细</param>
        /// <param name="delNotExist">是否删除明细不存在的数据</param>
        /// <param name="updateMainFields">主表指定修改字段</param>
        /// <param name="updateDetailFields">明细指定修改字段</param>
        /// <param name="saveChange">是否保存</param>
        /// <returns></returns>
        public virtual WebResponseContent UpdateRange<Detail>(TEntity entity,
            bool updateDetail = false,
            bool delNotExist = false,
            Expression<Func<TEntity, object>> updateMainFields = null,
            Expression<Func<Detail, object>> updateDetailFields = null,
            bool saveChange = false) where Detail : class, new()
        {
            WebResponseContent webResponse = new WebResponseContent();
            Update(entity, updateMainFields);
            string message = "";
            if (updateDetail)
            {
                PropertyInfo[] properties = typeof(TEntity).GetProperties();
                PropertyInfo detail = properties.Where(x => x.PropertyType.Name == "List`1").ToList().FirstOrDefault();
                if (detail != null)
                {
                    PropertyInfo key = properties.GetKeyProperty();
                    object obj = detail.GetValue(entity);
                    Type detailType = typeof(TEntity).GetCustomAttribute<EntityAttribute>().DetailTable[0];
                    message = UpdateDetail<Detail>(obj as List<Detail>, key.Name, key.GetValue(entity), updateDetailFields, delNotExist);
                }
            }
            if (!saveChange) return webResponse.OK();

            DbContext.SaveChanges();
            return webResponse.OK("修改成功,明细" + message, entity);
        }
        private string UpdateDetail<TDetail>(List<TDetail> list,
            string keyName,
            object keyValue,
            Expression<Func<TDetail, object>> updateDetailFields = null,
            bool delNotExist = false) where TDetail : class, new()
        {
            if (list == null) return "";
            PropertyInfo property = typeof(TDetail).GetKeyProperty();
            string detailKeyName = property.Name;
            var details = DbContext.Set<TDetail>();
            Expression<Func<TDetail, object>> selectExpression = detailKeyName.GetExpression<TDetail, object>();
            Expression<Func<TDetail, bool>> whereExpression = keyName.CreateExpression<TDetail>(keyValue, LinqExpressionType.Equal);
            //这里有问题， Expression<Func<TDetail, object>>会转换为查询所有字段20231020
            //List<object> detailKeys = details.Where(whereExpression).Select(selectExpression).ToList();

            List<object> detailKeys = details.Where(whereExpression).ToList().Select(selectExpression.Compile()).ToList();
            //获取主键默认值
            string keyDefaultVal = property.PropertyType
                .Assembly
                .CreateInstance(property.PropertyType.FullName).ToString();
            int addCount = 0;
            int editCount = 0;
            int delCount = 0;
            PropertyInfo mainKeyProperty = typeof(TDetail).GetProperty(keyName);
            List<object> keys = new List<object>();
            list.ForEach(x =>
            {
                var set = DbContext.Set<TDetail>();
                object val = property.GetValue(x);
                //主键是默认值的为新增的数据
                if (val.ToString() == keyDefaultVal)
                {
                    x.SetCreateDefaultVal();
                    //设置主表的值，也可以不设置
                    mainKeyProperty.SetValue(x, keyValue);
                    DbContext.Insertable(x).AddQueue();
                    addCount++;
                }
                else//修改的数据
                {
                    //获取所有修改的key,如果从数据库查来的key,不在修改中的key，则为删除的数据
                    keys.Add(val);
                    x.SetModifyDefaultVal();
                    Update<TDetail>(x, updateDetailFields);
                    //  repository.DbContext.Entry<TDetail>(x).State = EntityState.Modified;
                    editCount++;
                }
            });
            //删除
            if (delNotExist)
            {
                detailKeys.Where(x => !keys.Contains(x)).ToList().ForEach(d =>
                {
                    delCount++;
                    TDetail detail = Activator.CreateInstance<TDetail>();
                    property.SetValue(detail, d);
                    DbContext.Deleteable<TDetail>(detail).AddQueue();
                    for (int i = 0; i < list.Count(); i++)
                    {
                        if (property.GetValue(list[i]) == d)
                        {
                            list.RemoveAt(i);
                        }
                    }
                });
            }
            return $"修改[{editCount}]条,新增[{addCount}]条,删除[{delCount}]条";
        }

        public virtual void Delete(TEntity model, bool saveChanges = false)
        {
            DbContext.Deleteable(model).AddQueue();
            if (saveChanges)
            {
                DbContext.SaveChanges();
            }
        }

        public virtual void Delete<T>(T model, bool saveChanges) where T : class, new()
        {
            DbContext.Deleteable(model).AddQueue();
            if (saveChanges)
            {
                DbContext.SaveChanges();
            }
        }
        /// <summary>
        /// 通过主键批量删除
        /// </summary>
        /// <param name="keys">主键key</param>
        /// <param name="delList">是否连明细一起删除</param>
        /// <returns></returns>
        public virtual int DeleteWithKeys(object[] keys, bool saveChange = false)
        {
            var keyPro = typeof(TEntity).GetKeyProperty();
            foreach (var key in keys.Distinct())
            {
                TEntity entity = Activator.CreateInstance<TEntity>();
                keyPro.SetValue(entity, key.ChangeType(keyPro.PropertyType));
                DbContext.Deleteable(entity).AddQueue();
                // DbContext.Entry<TEntity>(entity).State = EntityState.Deleted;
            }
            if (saveChange)
            {
                DbContext.SaveChanges();
            }
            return keys.Length;
        }

        /// <summary>
        /// 写入数据并设置自增
        /// </summary>
        /// <param name="entity"></param>
        public virtual void AddWithSetIdentity(TEntity entity)
        {
            //var keyProperty = typeof(TEntity).GetKeyProperty();
            //int id = DbContext.Insertable(entity).ExecuteReturnIdentity();
            //keyProperty.SetValue(id, entity);
            DbContext.Insertable(entity).ExecuteReturnEntity();
        }
        public virtual void AddWithSetIdentity<T>(T entity) where T : class, new()
        {
            DbContext.Insertable(entity).ExecuteReturnEntity();
        }
        public virtual void Add(TEntity entities, bool saveChanges = false)
        {
            AddRange(new List<TEntity>() { entities }, saveChanges);
        }

        public virtual void Add<T>(T entities, bool saveChanges = false) where T : class, new()
        {
            DbContext.Insertable(entities).AddQueue();
            if (saveChanges) DbContext.SaveChanges();
        }

        public virtual void AddRange(List<TEntity> entities, bool saveChanges = false)
        {
            DbContext.Insertable(entities).AddQueue();
            //DbContext.Insertable(entities).ExecuteReturnIdentity();
            if (saveChanges) DbContext.SaveChanges();
        }


        public virtual void AddRange<T>(List<T> entities, bool saveChanges = false) where T : class, new()
        {
            DbContext.Insertable(entities).AddQueue();
            if (saveChanges) DbContext.SaveChanges();
        }






        public virtual int SaveChanges()
        {
            return VOLContext.SaveChanges();
        }

        public virtual Task<int> SaveChangesAsync()
        {
            return VOLContext.SqlSugarClient.SaveChangesAsync();
        }

        public virtual int ExecuteSqlCommand(string sql, params SugarParameter[] SugarParameters)
        {
            return DbContext.Ado.ExecuteCommand(sql, SugarParameters);
            //  return DbContext.Database.ExecuteSqlRaw(sql, SugarParameters);
        }

        public virtual List<TEntity> FromSql(string sql, params SugarParameter[] SugarParameters)
        {
            return DbContext.Ado.SqlQuery<TEntity>(sql, SugarParameters).ToList();
        }

        /// <summary>
        /// 执行sql
        /// 使用方式 FormattableString sql=$"select * from xx where name ={xx} and pwd={xx1} "，
        /// FromSqlInterpolated内部处理sql注入的问题，直接在{xx}写对应的值即可
        /// 注意：sql必须 select * 返回所有TEntity字段，
        /// </summary>
        /// <param name="formattableString"></param>
        /// <returns></returns>
        //public virtual ISugarQueryable<TEntity> FromSqlInterpolated([NotNull] FormattableString sql)
        //{
        //    //DBSet.FromSqlInterpolated(sql).Select(x => new { x,xxx}).ToList();
        //    return DbContext.Ado.SqlQuery<TEntity>(sql);
        //}

        /// <summary>
        /// 取消上下文跟踪
        /// </summary>
        /// <param name="entity"></param>
        public virtual void Detached(TEntity entity)
        {
            // DbContext.Entry(entity).State = EntityState.Detached;
        }
        public virtual void DetachedRange(IEnumerable<TEntity> entities)
        {
            //foreach (var entity in entities)
            //{
            //    DbContext.Entry(entity).State = EntityState.Detached;
            //}
        }
    }
}
