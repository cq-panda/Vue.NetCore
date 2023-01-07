using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Dapper;

namespace VOL.Core.Dapper
{
    public interface ISqlDapper
    {
        /// <summary>
        ///  超时时间(秒)2021.05.05
        /// </summary>
        /// <param name="timeout"></param>
        /// <returns></returns>
        ISqlDapper SetTimout(int timeout);
        void BeginTransaction(Func<ISqlDapper, bool> action, Action<Exception> error);
        List<T> QueryList<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<IEnumerable<T>> QueryListAsync<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        T QueryFirst<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class;

        Task<T> QueryFirstAsync<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class;

        Task<dynamic> QueryDynamicFirstAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        dynamic QueryDynamicFirst(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<dynamic> QueryDynamicListAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        List<dynamic> QueryDynamicList(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        object ExecuteScalar(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<object> ExecuteScalarAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        int ExcuteNonQuery(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<int> ExcuteNonQueryAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        IDataReader ExecuteReader(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);
        SqlMapper.GridReader QueryMultiple(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<(IEnumerable<T1>, IEnumerable<T2>)> QueryMultipleAsync<T1, T2>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<T1>, List<T2>) QueryMultiple<T1, T2>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>)> QueryMultipleAsync<T1, T2, T3>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<T1>, List<T2>, List<T3>) QueryMultiple<T1, T2, T3>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<(IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<dynamic>, List<dynamic>) QueryDynamicMultiple(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>)> QueryMultipleAsync<T1, T2, T3, T4>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<T1>, List<T2>, List<T3>, List<T4>) QueryMultiple<T1, T2, T3, T4>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>)> QueryMultipleAsync<T1, T2, T3, T4, T5>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<T1>, List<T2>, List<T3>, List<T4>, List<T5>) QueryMultiple<T1, T2, T3, T4, T5>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<(IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync2(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<dynamic>, List<dynamic>) QueryDynamicMultiple2(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        Task<(IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync3(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);

        (List<dynamic>, List<dynamic>, List<dynamic>) QueryDynamicMultiple3(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        Task<(IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync5(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);
        (List<dynamic>, List<dynamic>, List<dynamic>, List<dynamic>, List<dynamic>) QueryDynamicMultiple5(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false);


        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities"></param>
        /// <param name="updateFileds">指定插入的字段</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        int Add<T>(T entity, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false);
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities"></param>
        /// <param name="updateFileds">指定插入的字段</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        int AddRange<T>(IEnumerable<T> entities, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false);


        /// <summary>
        /// sqlserver使用的临时表参数化批量更新，mysql批量更新待发开
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity">实体必须带主键</param>
        /// <param name="updateFileds">指定更新的字段x=new {x.a,x.b}</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        int Update<T>(T entity, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false);

        /// <summary>
        /// sqlserver使用的临时表参数化批量更新，mysql批量更新待发开
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity">实体必须带主键</param>
        /// <param name="updateFileds">指定更新的字段x=new {x.a,x.b}</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        int UpdateRange<T>(IEnumerable<T> entities, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false);

        /// <summary>
        /// 使用key批量删除
        /// 调用方式：
        ///    List<int> keys = new List<int>();
        ///    DBServerProvider.SqlDapper.DelWithKey<Sys_Log, int>(keys);
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="keys"></param>
        /// <returns></returns>
        int DelWithKey<T, KeyType>(IEnumerable<KeyType> keys);
        /// <summary>
        ///  sqlserver批量写入
        /// 使用时DataTable table表字段顺序要和数据库字段顺序一致
        /// <summary>
        /// mysql批量写入
        /// </summary>
        /// <param name="table"></param>
        /// <param name="tableName"></param>
        /// <param name="tmpPath">默认当前下载路径</param>
        /// <param name="fileName">默认$"{DateTime.Now.ToString("yyyyMMddHHmmss")}.csv"</param>
        /// <returns></returns>
        int BulkInsert(DataTable table, string tableName, SqlBulkCopyOptions? sqlBulkCopyOptions = null, string fileName = null, string tmpPath = null);
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities"></param>
        /// <param name="tableName"></param>
        /// <param name="columns">所包含的列</param>
        /// <param name="sqlBulkCopyOptions"></param>
        /// <param name="fileName"></param>
        /// <param name="tmpPath"></param>
        /// <returns></returns>
        int BulkInsert<T>(List<T> entities, string tableName = null,
            Expression<Func<T, object>> columns = null,
            SqlBulkCopyOptions? sqlBulkCopyOptions = null);
    }
}