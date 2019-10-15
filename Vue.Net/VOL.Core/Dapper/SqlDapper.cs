
using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using VOL.Core.DBManager;
using VOL.Core.Extensions;
using VOL.Core.Utilities;


namespace VOL.Core.Dapper
{
    public class SqlDapper : ISqlDapper
    {
        private string _connectionString;
        private IDbConnection _connection { get; set; }
        public IDbConnection Connection
        {
            get
            {
                if (_connection == null)
                {
                    _connection = DBServerProvider.GetDbConnection(_connectionString);
                }
                return _connection;
            }
        }
        public SqlDapper()
        {
            _connectionString = DBServerProvider.GetConnectionString();
        }
        /// <summary>
        ///      string mySql = "Data Source=132.232.2.109;Database=mysql;User 
        ///      ID=root;Password=mysql;pooling=true;CharSet=utf8;port=3306;sslmode=none";
        ///  this.conn = new MySql.Data.MySqlClient.MySqlConnection(mySql);
        /// </summary>
        /// <param name="connKeyName"></param>
        public SqlDapper(string connKeyName)
        {
            _connectionString = DBServerProvider.GetConnectionString(connKeyName);
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
        public List<T> QueryList<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class
        {
            return Execute((conn, dbTransaction) =>
             {
                 return conn.Query<T>(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text).ToList();
             }, beginTransaction);
        }
        public T QueryFirst<T>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false) where T : class
        {
            List<T> list = QueryList<T>(cmd, param, commandType: commandType ?? CommandType.Text, beginTransaction: beginTransaction).ToList();
            return list.Count == 0 ? null : list[0];
        }
        public object ExecuteScalar(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute<object>((conn, dbTransaction) =>
            {
                return conn.ExecuteScalar(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text);
            }, beginTransaction);
        }

        public int ExcuteNonQuery(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute<int>((conn, dbTransaction) =>
            {
                return conn.Execute(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text);
            }, beginTransaction);
        }
        public IDataReader ExecuteReader(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute<IDataReader>((conn, dbTransaction) =>
            {
                return conn.ExecuteReader(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text);
            }, beginTransaction, false);
        }
        public SqlMapper.GridReader QueryMultiple(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            return Execute((conn, dbTransaction) =>
            {
                return conn.QueryMultiple(cmd, param, dbTransaction, commandType: commandType ?? CommandType.Text);
            }, beginTransaction, false);
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
            using (SqlMapper.GridReader reader = QueryMultiple(cmd, param, commandType, beginTransaction))
            {
                return (reader.Read<T1>().ToList(), reader.Read<T2>().ToList());
            }
        }

        public (List<T1>, List<T2>, List<T3>) QueryMultiple<T1, T2, T3>(string cmd, object param, CommandType? commandType = null, bool beginTransaction = false)
        {
            using (SqlMapper.GridReader reader = QueryMultiple(cmd, param, commandType, beginTransaction))
            {
                return (reader.Read<T1>().ToList(), reader.Read<T2>().ToList(), reader.Read<T3>().ToList());
            }
        }


        private T Execute<T>(Func<IDbConnection, IDbTransaction, T> func, bool beginTransaction = false, bool disposeConn = true)
        {
            IDbTransaction dbTransaction = null;
            if (beginTransaction)
            {
                Connection.Open();
                dbTransaction = Connection.BeginTransaction();
            }
            try
            {
                T reslutT = func(Connection, dbTransaction);
                dbTransaction?.Commit();
                return reslutT;
            }
            catch (Exception ex)
            {
                dbTransaction?.Rollback();
                Connection.Dispose();
                throw ex;
            }
            finally
            {
                if (disposeConn)
                {
                    Connection.Dispose();
                }
            }
        }
        public bool Add<T>(T entity)
        {
            return AddRange<T>(new T[] { entity });
        }
        public bool AddRange<T>(IEnumerable<T> entities)
        {
            return true;
        }
        public bool Update<T>(T entity, Expression<Func<T, object>> updateFileds = null)
        {
            return UpdateRange<T>(new T[] { entity }, updateFileds);
        }
        public bool UpdateRange<T>(IEnumerable<T> entities, Expression<Func<T, object>> updateFileds = null)
        {
            return true;
        }

        public bool DelByKey<T>(params object[] keys)
        {
            return true;
        }
        private int MSSqlBulkInsert(DataTable table, string tableName, SqlBulkCopyOptions sqlBulkCopyOptions = SqlBulkCopyOptions.UseInternalTransaction, string dbKeyName = null)
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
        public int BulkInsert<T>(List<T> entities, string tableName = null,
            Expression<Func<T, object>> columns = null,
            SqlBulkCopyOptions? sqlBulkCopyOptions = null)
        {
            DataTable table = entities.ToDataTable(columns);
            return BulkInsert(table, tableName ?? typeof(T).GetEntityTableName(), sqlBulkCopyOptions);
        }
        public int BulkInsert(DataTable table, string tableName, SqlBulkCopyOptions? sqlBulkCopyOptions = null, string fileName = null, string tmpPath = null)
        {
            if (!string.IsNullOrEmpty(tmpPath))
            {
                tmpPath = tmpPath.ReplacePath();
            }
            if (Connection.GetType().Name == "MySqlConnection")
                return MySqlBulkInsert(table, tableName, fileName, tmpPath);
            return MSSqlBulkInsert(table, tableName, sqlBulkCopyOptions ?? SqlBulkCopyOptions.KeepIdentity);
        }

        /// <summary>
        ///大批量数据插入,返回成功插入行数
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="table">数据表</param>
        /// <returns>返回成功插入行数</returns>
        private int MySqlBulkInsert(DataTable table, string tableName, string fileName = null, string tmpPath = null)
        {
            if (table.Rows.Count == 0)
                return 0;
            tmpPath = tmpPath ?? FileHelper.GetCurrentDownLoadPath();
            fileName = fileName ?? $"{DateTime.Now.ToString("yyyyMMddHHmmss")}.csv";
            int insertCount = 0;
            string csv = DataTableToCsv(table);
            FileHelper.WriteFile(tmpPath, fileName, csv);
            string path = tmpPath + fileName;
            try
            {
                if (Connection.State == ConnectionState.Closed)
                    Connection.Open();
                using (IDbTransaction tran = Connection.BeginTransaction())
                {
                    MySqlBulkLoader bulk = new MySqlBulkLoader(Connection as MySqlConnection)
                    {
                        FieldTerminator = ",",
                        FieldQuotationCharacter = '"',
                        EscapeCharacter = '"',
                        LineTerminator = "\r\n",
                        FileName = path.ReplacePath(),
                        NumberOfLinesToSkip = 0,
                        TableName = tableName,
                    };
                    bulk.Columns.AddRange(table.Columns.Cast<DataColumn>().Select(colum => colum.ColumnName).ToList());
                    insertCount = bulk.Load();
                    tran.Commit();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Connection?.Dispose();
                Connection?.Close();
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
                    if (i != 0) sb.Append(",");
                    if (colum.DataType == typeString && row[colum].ToString().Contains(","))
                    {
                        sb.Append("\"" + row[colum].ToString().Replace("\"", "\"\"") + "\"");
                    }
                    else if (colum.DataType == typeDate)
                    {
                        //centos系统里把datatable里的日期转换成了10/18/18 3:26:15 PM格式
                        bool b = DateTime.TryParse(row[colum].ToString(), out DateTime dt);
                        sb.Append(b ? dt.ToString("yyyy-MM-dd HH:mm:ss") : "");
                    }
                    else sb.Append(row[colum].ToString());
                }
                sb.AppendLine();
            }

            return sb.ToString();
        }


    }
}
