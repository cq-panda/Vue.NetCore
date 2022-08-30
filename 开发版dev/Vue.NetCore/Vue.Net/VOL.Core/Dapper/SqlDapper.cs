﻿
using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Const;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Utilities;


namespace VOL.Core.Dapper
{
    public class SqlDapper : ISqlDapper
    {
        private string _connectionString;
        private int? commandTimeout = null;
        private DbCurrentType _dbCurrentType;
        public SqlDapper()
        {
            _connectionString = DBServerProvider.GetConnectionString();
        }
        public SqlDapper(string connKeyName, DbCurrentType dbCurrentType)
        {
            _dbCurrentType = dbCurrentType;
            _connectionString = DBServerProvider.GetConnectionString(connKeyName);
        }
        public SqlDapper(string connKeyName)
        {
            _connectionString = DBServerProvider.GetConnectionString(connKeyName);
        }

        private bool _transaction { get; set; }

        private IDbConnection _transactionConnection = null;

        /// <summary>
        /// 超时时间(秒)
        /// </summary>
        /// <param name="timeout"></param>
        /// <returns></returns>
        public ISqlDapper SetTimout(int timeout)
        {
            this.commandTimeout = timeout;
            return this;
        }


        private T Execute<T>(Func<IDbConnection, IDbTransaction, T> func, bool beginTransaction = false)
        {
            if (_transaction)
            {
                return func(_transactionConnection, dbTransaction);
            }
            if (beginTransaction)
            {
                return ExecuteTransaction(func);
            }
            using (var connection = DBServerProvider.GetDbConnection(_connectionString, _dbCurrentType))
            {
                return func(connection, dbTransaction);
            }
        }

        private T ExecuteTransaction<T>(Func<IDbConnection, IDbTransaction, T> func)
        {
            using (_transactionConnection = DBServerProvider.GetDbConnection(_connectionString, _dbCurrentType))
            {
                try
                {
                    _transactionConnection.Open();
                    dbTransaction = _transactionConnection.BeginTransaction();
                    T reslutT = func(_transactionConnection, dbTransaction);
                    dbTransaction.Commit();
                    return reslutT;
                }
                catch (Exception ex)
                {
                    dbTransaction?.Rollback();
                    throw ex;
                }
                finally
                {
                    dbTransaction?.Dispose();
                }
            }
        }

        private async Task<T> ExecuteAsync<T>(Func<IDbConnection, IDbTransaction, Task<T>> funcAsync, bool beginTransaction = false)
        {
            if (_transaction)
            {
                return await funcAsync(_transactionConnection, dbTransaction);
            }
            if (beginTransaction)
            {
                return await ExecuteTransactionAsync(funcAsync);
            }
            using (var connection = DBServerProvider.GetDbConnection(_connectionString))
            {
                T reslutT = await funcAsync(connection, dbTransaction);
                if (!_transaction && dbTransaction != null)
                {
                    dbTransaction.Commit();
                }
                return reslutT;
            }
        }

        private async Task<T> ExecuteTransactionAsync<T>(Func<IDbConnection, IDbTransaction, Task<T>> funcAsync)
        {
            using (var connection = DBServerProvider.GetDbConnection(_connectionString))
            {
                try
                {
                    connection.Open();
                    dbTransaction = connection.BeginTransaction();
                    T reslutT = await funcAsync(connection, dbTransaction);
                    if (!_transaction && dbTransaction != null)
                    {
                        dbTransaction.Commit();
                    }
                    return reslutT;
                }
                catch (Exception ex)
                {
                    dbTransaction?.Rollback();
                    throw ex;
                }
            }
        }

        /// <summary>
        /// 2020.06.15增加Dapper事务处理
        /// <param name="action"></param>
        /// <param name="error"></param>
        public void BeginTransaction(Func<ISqlDapper, bool> action, Action<Exception> error)
        {
            _transaction = true;
            using (var connection = DBServerProvider.GetDbConnection(_connectionString, _dbCurrentType))
            {
                try
                {
                    _transactionConnection = connection;
                    _transactionConnection.Open();
                    dbTransaction = _transactionConnection.BeginTransaction();
                    bool result = action(this);
                    if (result)
                    {
                        dbTransaction?.Commit();
                    }
                    else
                    {
                        dbTransaction?.Rollback();
                    }
                }
                catch (Exception ex)
                {
                    dbTransaction?.Rollback();
                    error(ex);
                }
                finally
                {
                    _transaction = false;
                    dbTransaction?.Dispose();
                }
            }
        }

        /// <summary>
        /// var p = new object();
        //        p.Add("@a", 11);
        //p.Add("@b", dbType: DbType.Int32, direction: ParameterDirection.Output);
        //p.Add("@c", dbType: DbType.Int32, direction: ParameterDirection.ReturnValue);
        //        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cmd"></param>
        /// <param name="param"></param>
        /// <param name="commandType"></param>
        /// <returns></returns>
        public List<T> QueryList<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.Query<T>(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout).ToList();
            }, beginTransaction);
        }
        public async Task<IEnumerable<T>> QueryListAsync<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.QueryAsync<T>(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public async Task<T> QueryFirstAsync<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.QueryFirstOrDefaultAsync<T>(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }


        public T QueryFirst<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.QueryFirstOrDefault<T>(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public async Task<dynamic> QueryDynamicFirstAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.QueryFirstOrDefaultAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public dynamic QueryDynamicFirst(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.QueryFirstOrDefault(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public async Task<dynamic> QueryDynamicListAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.QueryAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public List<dynamic> QueryDynamicList(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.Query(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout).ToList();
            }, beginTransaction);
        }


        public async Task<object> ExecuteScalarAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.ExecuteScalarAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public object ExecuteScalar(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.ExecuteScalar(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public async Task<int> ExcuteNonQueryAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                return await conn.ExecuteAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }

        public int ExcuteNonQuery(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute<int>((conn, dbTransaction) =>
            {
                return conn.Execute(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }
        public IDataReader ExecuteReader(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute<IDataReader>((conn, dbTransaction) =>
            {
                return conn.ExecuteReader(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }


        public SqlMapper.GridReader QueryMultiple(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout);
            }, beginTransaction);
        }


        public async Task<(IEnumerable<T1>, IEnumerable<T2>)> QueryMultipleAsync<T1, T2>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (await reader.ReadAsync<T1>(), await reader.ReadAsync<T2>());
                }
            }, beginTransaction);
        }

        /// <summary>
        /// 获取output值 param.Get<int>("@b");
        /// </summary>
        /// <typeparam name="T1"></typeparam>
        /// <param name="cmd"></param>
        /// <param name="param"></param>
        /// <param name="commandType"></param>
        /// <param name="dbTransaction"></param>
        /// <returns></returns>
        public (List<T1>, List<T2>) QueryMultiple<T1, T2>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<T1>().ToList(), reader.Read<T2>().ToList());
                }
            }, beginTransaction);
        }

        public async Task<(IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (await reader.ReadAsync(), await reader.ReadAsync());
                }
            }, beginTransaction);
        }

        public (List<dynamic>, List<dynamic>) QueryDynamicMultiple(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read().ToList(), reader.Read().ToList());
                }
            }, beginTransaction);
        }


        public async Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>)> QueryMultipleAsync<T1, T2, T3>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (await reader.ReadAsync<T1>(), await reader.ReadAsync<T2>(), await reader.ReadAsync<T3>());
                }
            }, beginTransaction);
        }


        public (List<T1>, List<T2>, List<T3>) QueryMultiple<T1, T2, T3>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<T1>().ToList(), reader.Read<T2>().ToList(), reader.Read<T3>().ToList());
                }
            }, beginTransaction);
        }

        public async Task<(IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync2(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>()
                    );
                }
            }, beginTransaction);
        }

        public (List<dynamic>, List<dynamic>) QueryDynamicMultiple2(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (
                        reader.Read<dynamic>().ToList(),
                        reader.Read<dynamic>().ToList()
                    );
                }
            }, beginTransaction);
        }

        public async Task<(IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync3(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>()
                    );
                }
            }, beginTransaction);
        }


        public (List<dynamic>, List<dynamic>, List<dynamic>) QueryDynamicMultiple3(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList()
                    );
                }
            }, beginTransaction);
        }


        public async Task<(IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>, IEnumerable<dynamic>)> QueryDynamicMultipleAsync5(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>(),
                    await reader.ReadAsync<dynamic>()
                    );
                }
            }, beginTransaction);
        }

        public (List<dynamic>, List<dynamic>, List<dynamic>, List<dynamic>, List<dynamic>) QueryDynamicMultiple5(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList(),
                    reader.Read<dynamic>().ToList()
                    );
                }
            }, beginTransaction);
        }

        public async Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>)> QueryMultipleAsync<T1, T2, T3, T4>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (await reader.ReadAsync<T1>(),
                    await reader.ReadAsync<T2>(),
                    await reader.ReadAsync<T3>(),
                    await reader.ReadAsync<T4>()
                    );
                }
            }, beginTransaction);
        }

        public (List<T1>, List<T2>, List<T3>, List<T4>) QueryMultiple<T1, T2, T3, T4>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<T1>().ToList(),
                    reader.Read<T2>().ToList(),
                    reader.Read<T3>().ToList(),
                    reader.Read<T4>().ToList()
                    );
                }
            }, beginTransaction);
        }


        public async Task<(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>)> QueryMultipleAsync<T1, T2, T3, T4, T5>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return await ExecuteAsync(async (conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = await conn.QueryMultipleAsync(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (await reader.ReadAsync<T1>(),
                    await reader.ReadAsync<T2>(),
                    await reader.ReadAsync<T3>(),
                    await reader.ReadAsync<T4>(),
                    await reader.ReadAsync<T5>()
                    );
                }
            }, beginTransaction);
        }

        public (List<T1>, List<T2>, List<T3>, List<T4>, List<T5>) QueryMultiple<T1, T2, T3, T4, T5>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                using (SqlMapper.GridReader reader = conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text, commandTimeout: commandTimeout))
                {
                    return (reader.Read<T1>().ToList(),
                    reader.Read<T2>().ToList(),
                    reader.Read<T3>().ToList(),
                    reader.Read<T4>().ToList(),
                    reader.Read<T5>().ToList()
                    );
                }
            }, beginTransaction);
        }
        IDbTransaction dbTransaction = null;



        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="addFileds">指定插入的字段</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        public int Add<T>(T entity, Expression<Func<T, object>> addFileds = null, bool beginTransaction = false)
        {
            return AddRange<T>(new T[] { entity }, addFileds, beginTransaction);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities"></param>
        /// <param name="addFileds">指定插入的字段</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        public int AddRange<T>(IEnumerable<T> entities, Expression<Func<T, object>> addFileds = null, bool beginTransaction = true)
        {
            Type entityType = typeof(T);
            var key = entityType.GetKeyProperty();
            if (key == null)
            {
                throw new Exception("实体必须包括主键才能批量更新");
            }
            string[] columns;

            //指定插入的字段
            if (addFileds != null)
            {
                columns = addFileds.GetExpressionToArray();
            }
            else
            {
                var properties = entityType.GetGenericProperties();
                if (key.PropertyType != typeof(Guid))
                {
                    properties = properties.Where(x => x.Name != key.Name).ToArray();
                }
                columns = properties.Select(x => x.Name).ToArray();
            }
            string sql = null;
            if (DBType.Name == DbCurrentType.MySql.ToString())
            {
                //mysql批量写入待优化
                sql = $"insert into {entityType.GetEntityTableName()}({string.Join(",", columns)})" +
                 $"values(@{string.Join(",@", columns)});";
            }
            else if (DBType.Name == DbCurrentType.PgSql.ToString())
            {
                //todo pgsql批量写入 待检查是否正确
                sql = $"insert into {entityType.GetEntityTableName()}({"\"" + string.Join("\",\"", columns) + "\""})" +
                    $"values(@{string.Join(",@", columns)});";
            }
            else
            {
                //sqlserver通过临时表批量写入
                sql = $"insert into {entityType.GetEntityTableName()}({string.Join(",", columns)})" +
                 $"select {string.Join(",", columns)}  from  {EntityToSqlTempName.TempInsert};";
                //2020.11.21修复sqlserver批量写入主键类型判断错误
                sql = entities.GetEntitySql(key.PropertyType == typeof(Guid), sql, null, addFileds, null);
            }
            return Execute<int>((conn, dbTransaction) =>
            {
                //todo pgsql待实现
                return conn.Execute(sql, (DBType.Name == DbCurrentType.MySql.ToString() || DBType.Name == DbCurrentType.PgSql.ToString()) ? entities.ToList() : null, dbTransaction);
            }, beginTransaction);
        }


        /// <summary>
        /// sqlserver使用的临时表参数化批量更新，mysql批量更新待发开
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity">实体必须带主键</param>
        /// <param name="updateFileds">指定更新的字段x=new {x.a,x.b}</param>
        /// <param name="beginTransaction">是否开启事务</param>
        /// <returns></returns>
        public int Update<T>(T entity, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false)
        {
            return UpdateRange<T>(new T[] { entity }, updateFileds, beginTransaction);
        }

        /// <summary>
        ///(根据主键批量更新实体) sqlserver使用的临时表参数化批量更新，mysql待优化
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entities">实体必须带主键</param>
        /// <param name="updateFileds">批定更新字段</param>
        /// <param name="beginTransaction"></param>
        /// <returns></returns>
        public int UpdateRange<T>(IEnumerable<T> entities, Expression<Func<T, object>> updateFileds = null, bool beginTransaction = false)
        {
            Type entityType = typeof(T);
            var key = entityType.GetKeyProperty();
            if (key == null)
            {
                throw new Exception("实体必须包括主键才能批量更新");
            }

            var properties = entityType.GetGenericProperties()
            .Where(x => x.Name != key.Name);
            if (updateFileds != null)
            {
                properties = properties.Where(x => updateFileds.GetExpressionToArray().Contains(x.Name));
            }

            if (DBType.Name == DbCurrentType.MySql.ToString())
            {
                List<string> paramsList = new List<string>();
                foreach (var item in properties)
                {
                    paramsList.Add(item.Name + "=@" + item.Name);
                }
                string sqltext = $@"UPDATE { entityType.GetEntityTableName()} SET {string.Join(",", paramsList)} WHERE {entityType.GetKeyName()} = @{entityType.GetKeyName()} ;";

                return ExcuteNonQuery(sqltext, entities, CommandType.Text, beginTransaction);
                // throw new Exception("mysql批量更新未实现");
            }
            string fileds = string.Join(",", properties.Select(x => $" a.{x.Name}=b.{x.Name}").ToArray());
            string sql = $"update  a  set {fileds} from  {entityType.GetEntityTableName()} as a inner join {EntityToSqlTempName.TempInsert.ToString()} as b on a.{key.Name}=b.{key.Name}";
            sql = entities.ToList().GetEntitySql(true, sql, null, updateFileds, null);
            return ExcuteNonQuery(sql, null, CommandType.Text, beginTransaction);
        }

        public int DelWithKey<T>(bool beginTransaction = false, params object[] keys)
        {
            Type entityType = typeof(T);
            var keyProperty = entityType.GetKeyProperty();
            if (keyProperty == null || keys == null || keys.Length == 0) return 0;

            IEnumerable<(bool, string, object)> validation = keyProperty.ValidationValueForDbType(keys);
            if (validation.Any(x => !x.Item1))
            {
                throw new Exception($"主键类型【{validation.Where(x => !x.Item1).Select(s => s.Item3).FirstOrDefault()}】不正确");
            }
            string tKey = entityType.GetKeyProperty().Name;
            FieldType fieldType = entityType.GetFieldType();
            string joinKeys = (fieldType == FieldType.Int || fieldType == FieldType.BigInt)
                 ? string.Join(",", keys)
                 : $"'{string.Join("','", keys)}'";
            string sql;
            // 2020.08.06增加pgsql删除功能
            if (DBType.Name == DbCurrentType.PgSql.ToString())
            {
                sql = $"DELETE FROM \"public\".\"{entityType.GetEntityTableName()}\" where \"{tKey}\" in ({joinKeys});";
            }
            else
            {
                sql = $"DELETE FROM {entityType.GetEntityTableName() } where {tKey} in ({joinKeys});";
            }

            return ExcuteNonQuery(sql, null);
        }
        /// <summary>
        /// 使用key批量删除
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="keys"></param>
        /// <returns></returns>
        public int DelWithKey<T>(params object[] keys)
        {
            return DelWithKey<T>(false, keys);
        }
        /// <summary>
        /// 通过Bulk批量插入
        /// </summary>
        /// <param name="table"></param>
        /// <param name="tableName"></param>
        /// <param name="sqlBulkCopyOptions"></param>
        /// <param name="dbKeyName"></param>
        /// <returns></returns>
        private int MSSqlBulkInsert(DataTable table, string tableName, SqlBulkCopyOptions sqlBulkCopyOptions = SqlBulkCopyOptions.UseInternalTransaction, string dbKeyName = null)
        {
            using (var Connection = DBServerProvider.GetDbConnection(_connectionString, _dbCurrentType))
            {
                if (!string.IsNullOrEmpty(dbKeyName))
                {
                    Connection.ConnectionString = DBServerProvider.GetConnectionString(dbKeyName);
                }
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(Connection.ConnectionString, sqlBulkCopyOptions))
                {
                    sqlBulkCopy.DestinationTableName = tableName;
                    sqlBulkCopy.BatchSize = table.Rows.Count;
                    for (int i = 0; i < table.Columns.Count; i++)
                    {
                        sqlBulkCopy.ColumnMappings.Add(table.Columns[i].ColumnName, table.Columns[i].ColumnName);
                    }
                    sqlBulkCopy.WriteToServer(table);
                    return table.Rows.Count;
                }
            }
        }
        public int BulkInsert<T>(List<T> entities, string tableName = null,
            Expression<Func<T, object>> columns = null,
            SqlBulkCopyOptions? sqlBulkCopyOptions = null)
        {
            DataTable table = entities.ToDataTable(columns, false);
            return BulkInsert(table, tableName ?? typeof(T).GetEntityTableName(), sqlBulkCopyOptions);
        }
        public int BulkInsert(DataTable table, string tableName, SqlBulkCopyOptions? sqlBulkCopyOptions = null, string fileName = null, string tmpPath = null)
        {
            if (!string.IsNullOrEmpty(tmpPath))
            {
                tmpPath = tmpPath.ReplacePath();
            }
            if (DBType.Name == "MySql")
            {
                return MySqlBulkInsert(table, tableName, fileName, tmpPath);
            }

            if (DBType.Name == "PgSql")
            {
                PGSqlBulkInsert(table, tableName);
                return table.Rows.Count;
            }
            return MSSqlBulkInsert(table, tableName, sqlBulkCopyOptions ?? SqlBulkCopyOptions.KeepIdentity);
        }

        /// <summary>
        ///大批量数据插入,返回成功插入行数
        ////
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="table">数据表</param>
        /// <returns>返回成功插入行数</returns>
        private int MySqlBulkInsert(DataTable table, string tableName, string fileName = null, string tmpPath = null)
        {
            if (table.Rows.Count == 0) return 0;
            tmpPath = tmpPath ?? FileHelper.GetCurrentDownLoadPath();
            int insertCount = 0;
            string csv = DataTableToCsv(table);
            string text = $"当前行:{table.Rows.Count}";
            MemoryStream stream = null;
            try
            {
                using (var Connection = DBServerProvider.GetDbConnection(_connectionString, _dbCurrentType))
                {
                    if (Connection.State == ConnectionState.Closed)
                    {
                        Connection.Open();
                    }
                    using (IDbTransaction tran = Connection.BeginTransaction())
                    {
                        MySqlBulkLoader bulk = new MySqlBulkLoader(Connection as MySqlConnection)
                        {
                            LineTerminator = "\n",
                            TableName = tableName,
                            CharacterSet = "UTF8"
                        };
                        if (csv.IndexOf("\n")>0)
                        {
                            csv = csv.Replace("\n", " ");
                        }
                        var array = Encoding.UTF8.GetBytes(csv);
                        using (stream = new MemoryStream(array))
                        {
                            stream = new MemoryStream(array);
                            bulk.SourceStream = stream; //File.OpenRead(fileName);
                            bulk.Columns.AddRange(table.Columns.Cast<DataColumn>().Select(colum => colum.ColumnName).ToList());
                            insertCount = bulk.Load();
                            tran.Commit();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return insertCount;
            //   File.Delete(path);
        }
        /// <summary>
        ///将DataTable转换为标准的CSV
        /// </summary>
        /// <param name="table">数据表</param>
        /// <returns>返回标准的CSV</returns>
        private string DataTableToCsv(DataTable table)
        {
            //以半角逗号（即,）作分隔符，列为空也要表达其存在。
            //列内容如存在半角逗号（即,）则用半角引号（即""）将该字段值包含起来。
            //列内容如存在半角引号（即"）则应替换成半角双引号（""）转义，并用半角引号（即""）将该字段值包含起来。
            StringBuilder sb = new StringBuilder();
            DataColumn colum;
            Type typeString = typeof(string);
            Type typeDate = typeof(DateTime);

            foreach (DataRow row in table.Rows)
            {
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    colum = table.Columns[i];
                    if (i != 0) sb.Append("\t");
                    if (colum.DataType == typeString && row[colum].ToString().Contains(","))
                    {
                        sb.Append(row[colum].ToString());
                    }
                    else if (colum.DataType == typeDate)
                    {
                        //centos系统里把datatable里的日期转换成了10/18/18 3:26:15 PM格式
                        bool b = DateTime.TryParse(row[colum].ToString(), out DateTime dt);
                        sb.Append(b ? dt.ToString("yyyy-MM-dd HH:mm:ss") : "");
                    }
                    else sb.Append(row[colum].ToString());
                }
                sb.Append("\n");
            }

            return sb.ToString();
        }
        /// <summary>
        /// 2020.08.07增加PGSQL批量写入
        /// </summary>
        /// <param name="table"></param>
        /// <param name="tableName"></param>
        private void PGSqlBulkInsert(DataTable table, string tableName)
        {
            List<string> columns = new List<string>();
            for (int i = 0; i < table.Columns.Count; i++)
            {
                columns.Add("\"" + table.Columns[i].ColumnName + "\"");
            }
            string copySql = $"copy \"public\".\"{tableName}\"({string.Join(',', columns)}) FROM STDIN (FORMAT BINARY)";
            using (var conn = new Npgsql.NpgsqlConnection(_connectionString))
            {
                conn.Open();
                using (var writer = conn.BeginBinaryImport(copySql))
                {
                    foreach (DataRow row in table.Rows)
                    {
                        writer.StartRow();
                        for (int i = 0; i < table.Columns.Count; i++)
                        {
                            writer.Write(row[i]);
                        }
                    }
                    writer.Complete();
                }
            }
        }

    }
}
