//using Microsoft.AspNetCore.Authorization;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.EntityFrameworkCore.Internal;
//using Microsoft.EntityFrameworkCore.Query;
//using Microsoft.EntityFrameworkCore.Query.Internal;
//using Remotion.Linq.Parsing.Structure;
//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Linq;
//using System.Linq.Expressions;
//using System.Reflection;
//using System.Text;
//using System.Threading.Tasks;
//using VOL.Core.Const;
//using VOL.Core.Enums;
//using VOL.Core.Extensions;
//using VOL.Core.Services;
//using VOL.Core.Utilities;
//using VOL.Entity.DomainModels;
//using VOL.System.IServices;
//using VOL.System.Repositories;
//using VOL.System.Services;
//using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
//using RSystem = System;

//namespace VOL.System.Controllers
//{
//    public class testController : Controller
//    {

//        private ISys_MenuService Service;
//        public testController(ISys_MenuService service)
//        {
//            this.Service = service;
//        }
//        [AllowAnonymous]
//        public IActionResult Dic(string d)
//        {
//            object obj = Sys_DictionaryService.Instance.GetVueDictionary(new string[] { });
//            return Content("11");
//        }
//        [AllowAnonymous]
//        public IActionResult Sql(string d)
//        {
//            string sql = "";
//            sql = Sys_LogRepository.GetService.DbContext.Set<App_News>().Where(x => 1 == 1).ToSql();
//            return Content(sql);
//        }
//        [AllowAnonymous]
//        public IActionResult dt(string d)
//        {
//            string dts = VOL.Core.Utilities.HttpContext.Current.Request.Headers[ApiConfigOptions.ActionDate];
//            bool rr = DateTime.TryParse(d, out DateTime result);
//            DataTable dataTable = new DataTable();
//            dataTable.Columns.Add("str", typeof(string));
//            dataTable.Columns.Add("dt", typeof(DateTime));

//            DataRow row = dataTable.NewRow();
//            row["str"] = "xxxxxxxxxxxxxx114";
//            row["dt"] = (rr ? result : DateTime.Now).ToString("yyy-MM-dd HH:mm:ss");

//            dataTable.Rows.Add(row);


//            return Json(new { dt1 = DateTime.Parse(dts.ToString()), dt2 = DateTime.Now, tb = dataTable.Rows[0]["dt"].ToString() + "," + DataTableToCsv(dataTable) });
//        }
//        private string DataTableToCsv(DataTable table)
//        {
//            //以半角逗号（即,）作分隔符，列为空也要表达其存在。
//            //列内容如存在半角逗号（即,）则用半角引号（即""）将该字段值包含起来。
//            //列内容如存在半角引号（即"）则应替换成半角双引号（""）转义，并用半角引号（即""）将该字段值包含起来。
//            StringBuilder sb = new StringBuilder();
//            DataColumn colum;

//            foreach (DataRow row in table.Rows)
//            {
//                for (int i = 0; i < table.Columns.Count; i++)
//                {
//                    colum = table.Columns[i];
//                    if (i != 0) sb.Append(",");
//                    if (colum.DataType == typeof(string) && row[colum].ToString().Contains(","))
//                    {
//                        sb.Append("\"" + row[colum].ToString().Replace("\"", "\"\"") + "\"");
//                    }
//                    else if (colum.DataType == typeof(DateTime))
//                    {
//                        bool b = DateTime.TryParse(row[colum].ToString(), out DateTime dt);
//                        sb.Append(b ? dt.ToString("yyyy-MM-dd HH:mm:ss") : "");
//                    }
//                    else sb.Append(row[colum].ToString());
//                }
//                sb.AppendLine();
//            }

//            return sb.ToString();
//        }
//        //  

//        [AllowAnonymous]
//        public IActionResult Path()
//        {
//            string sqllog = ($"Download/ExcelExport/SqlLog/").MapPath();

//            try
//            {
//                sqllog += "w1.csv";
//                RSystem.IO.File.WriteAllText(sqllog, "WriteAllText", Encoding.UTF8);
//            }
//            catch (Exception ex)
//            {
//                sqllog += ex.Message;
//            }
//            string w2 = ($"Download/ExcelExport/SqlLog/").MapPath();

//            try
//            {
//                FileHelper.WriteFile(w2, "w2.csv", "w2");
//            }
//            catch (Exception ex)
//            {

//                w2 += ex.Message;
//            }

//            return Content(sqllog + ",,," + w2);
//        }


//        [AllowAnonymous]
//        public IActionResult C()
//        {

//            //List<string> arr = new string[] { "侩牛小编", "b" }.ToList();
//            //ParameterExpression parameter = typeof(App_News).GetExpressionParameter();
//            //var constant2 = Expression.Property(parameter, "Creator");
//            //MethodInfo method = typeof(List<string>).GetMethod("Contains");

//            //ConstantExpression constant1 = Expression.Constant(arr);
//            //var e3 = Expression.Call(constant1, method, constant2);
//            //Expression<Func<App_News, bool>> ex = Expression.Lambda<Func<App_News, bool>>(e3, parameter);
//            //var obj = Sys_LogRepository.GetService.DbContext.Set<App_News>().Where(ex).ToList();

//            string[] arr = new string[] { "a", "bb" };
//            Expression<Func<App_News, bool>> exxxx = "BigImageUrls".CreateExpression<App_News>(arr, LinqExpressionType.Contains);
//            var obj2222 = Sys_LogRepository.GetService.DbContext.Set<App_News>().Where(exxxx).ToList();

//            //创建节点变量如p=>的节点p
//            ParameterExpression parameter = typeof(App_News).GetExpressionParameter();
//            //创建节点的属性p=>p.name 属性name
//            MemberExpression constant2 = Expression.Property(parameter, "BigImageUrls");
//            MethodInfo method = typeof(List<string>).GetMethod("Contains");

//            ConstantExpression constant1 = Expression.Constant(arr);

//            //创建一个表示调用带参数的方法的：new string[]{"1","a"}.Contains("a");
//            var e3 = Expression.Call(constant1, method, constant2);
//            //创建委托p=>new string[]{"1","a"}.Contains(p.name);
//            Expression<Func<App_News, bool>> ex = Expression.Lambda<Func<App_News, bool>>(e3, parameter);

//            var obj = Sys_LogRepository.GetService.DbContext.Set<App_News>().Where(ex).Select(s => new { }).ToList();

//            return Content("11");
//        }

//        public IActionResult Send()
//        {
//            //string tableName = "App_Question";
//            //AuditType audit = AuditType.App_Question;
//            //   return Json(BeefSDKRequest.SendAliAuditSTK(tableName, audit));
//            int PINType = 1;
//            return Json(BeefSDKRequest.SendAliSTK(new { PIN = 123345, PINType = PINType, PhoneNo = "18612119023" }));
//        }

//        [AllowAnonymous]
//        public async Task<IActionResult> MySql()
//        {
//            List<DapperMySql> list = await Task.Run(() => Sys_LogRepository.GetService.DapperContext.QueryList<DapperMySql>("select * from MySqlTb;", null));
//            return Json(list);
//        }

//        [AllowAnonymous]
//        public async Task<IActionResult> Tran(int n)
//        {
//            string msg = "";
//            try
//            {
//                msg = await Task.Run(() => Sys_LogRepository.GetService.DapperContext.ExecuteScalar("sp_UPDLOCKTEST", new { n = n }, CommandType.StoredProcedure).ToString());
//            }
//            catch (Exception ex)
//            {
//                msg += ex.Message + ex.Source;
//            }
//            finally
//            {
//                LoggerService.Write(Core.Enums.LoggerType.System, "t", "t", "t", 0, null);
//            }

//            return Json(new { t = msg + "," + 2 + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ssss") });
//        }


//        [AllowAnonymous]
//        public async Task<IActionResult> Index1(int? r)
//        {
//            string msg = null;

//            Dictionary<string, object> dictionary = new Dictionary<string, object>();
//            try
//            {
//                dictionary = await Task.Run(() => Service.CacheService.Get<Dictionary<string, object>>("CityList"));
//            }
//            catch (Exception ex)
//            {
//                msg = ex.Message + ex.Source;
//            }
//            finally
//            {
//                LoggerService.Write(Core.Enums.LoggerType.System, "2", "2", "2", 0, null);
//            }

//            return Json(new { t = dictionary.Count + "," + 2 + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ssss") });
//        }

//        //[AllowAnonymous]
//        //public async Task<IActionResult> Index(int? r)
//        //{
//        //    string msg = null;
//        //    List<Sys_Log> list = new List<Sys_Log>();

//        //    try
//        //    {
//        //        if (r == 2)
//        //        {
//        //            return Json(new { t = "222" + msg + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ssss") });
//        //        }

//        //        int n = new Random().Next(50, 100000);
//        //        list = await Task.Run(() => Sys_LogRepository.GetService.DapperContext.QueryList<Sys_Log>($"SELECT id,LogType,RequestParameter,ResponseParameter,Success,UserIP,User_Id FROM dbo.Sys_Log WITH(NOLOCK) WHERE id BETWEEN { n - 30} AND {n} ", null));
//        //        if (r == 1)
//        //        {

//        //            var obj = Sys_LogRepository.GetService.Find(x => x.Id > n - 30 && x.Id < n, s => new { s.Id, s.RequestParameter, s.ResponseParameter, s.BeginDate, s.ElapsedTime });
//        //        }
//        //    }
//        //    catch (Exception ex)
//        //    {
//        //        msg = ex.Message + ex.StackTrace;
//        //    }
//        //    finally
//        //    {
//        //        LoggerService.Write(Core.Enums.LoggerType.System, null, $"{list?.Count}", msg, 0, null);
//        //    }

//        //    return Json(new { t = msg + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ssss") });


//        //    //string[] arr = new string[] { "a') SELECT 1 --'", "b", "c", "fssafsa" };
//        //    //var db = DBServerProvider.GetEFDbContext("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;");
//        //    //db.Set<Sys_Menu>().Where(x => arr.Contains(x.Auth)).ToList();

//        //    ////IDbConnection dbConnection = new SqlConnection("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;");
//        //    ////List<Sys_User> list = dbConnection.Query<Sys_User>("SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User").ToList();
//        //    //string exms = "";
//        //    //try
//        //    //{
//        //    //    int User_Id = 3312;
//        //    //    string sql = "DELETE FROM dbo.Sys_User WHERE User_Id=@User_Id;;SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User ";
//        //    //    var quer = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;").QueryList<Sys_User>(sql, new { User_Id = User_Id });

//        //    //    string sql1 = "SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User;SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User";
//        //    //    (List<Dictionary<string, object>>, List<Dictionary<string, object>>) dic = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;")
//        //    //         .QueryMultiple<Dictionary<string, object>, Dictionary<string, object>>(sql1, null);

//        //    //    (List<KeyValuePair<string, object>>, List<KeyValuePair<string, object>>) dic1 = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;")
//        //    //                    .QueryMultiple<KeyValuePair<string, object>, KeyValuePair<string, object>>(sql1, null);


//        //    //    (List<object>, List<object>) dic12 = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;")
//        //    //            .QueryMultiple<object, object>(sql1, null);

//        //      //  string a = "";
//        //        //IDataReader reader = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;").ExecuteReader("SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User;SELECT  TOP 30 User_Id, Dept_Id, DeptName, Role_Id, RoleName, RoleData_Id, RoleDataName, UserName, UserPwd, UserTrueName, EnUserName, Address FROM dbo.Sys_User", new { User_Id = User_Id });

//        //        //while (reader.Read())
//        //        //{
//        //        //    object obj = reader[1];
//        //        //}

//        //        //var gridReader = new SqlDapper("Data Source=.;Initial Catalog=WMS;Persist Security Info=True;User ID=sa;Password=123;").QueryMultiple(sql, new { User_Id = User_Id });
//        //        //var list = gridReader.Read<Sys_User>().ToList();
//        //    }
//        //    catch (Exception ex)
//        //    {
//        //        exms = ex.Message;
//        //    }
//        //    return Json(new { t = exms + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ssss") });
//        //}

//    }

//    public static class IQueryableExtensions
//    {
//        private static readonly TypeInfo QueryCompilerTypeInfo = typeof(QueryCompiler).GetTypeInfo();

//        private static readonly FieldInfo QueryCompilerField = typeof(EntityQueryProvider).GetTypeInfo().DeclaredFields.First(x => x.Name == "_queryCompiler");

//        private static readonly PropertyInfo NodeTypeProviderField = QueryCompilerTypeInfo.DeclaredProperties.Single(x => x.Name == "NodeTypeProvider");

//        private static readonly MethodInfo CreateQueryParserMethod = QueryCompilerTypeInfo.DeclaredMethods.First(x => x.Name == "CreateQueryParser");

//        private static readonly FieldInfo DataBaseField = QueryCompilerTypeInfo.DeclaredFields.Single(x => x.Name == "_database");

//        private static readonly FieldInfo QueryCompilationContextFactoryField = typeof(Database).GetTypeInfo().DeclaredFields.Single(x => x.Name == "_queryCompilationContextFactory");

//        public static string ToSql<TEntity>(this IQueryable<TEntity> query) where TEntity : class
//        {
//            if (!(query is EntityQueryable<TEntity>) && !(query is InternalDbSet<TEntity>))
//            {
//                throw new ArgumentException("Invalid query");
//            }

//            object queryCompiler = QueryCompilerField.GetValue(query.Provider);
//            var nodeTypeProvider = (INodeTypeProvider)NodeTypeProviderField.GetValue(queryCompiler);
//            var parser = (IQueryParser)CreateQueryParserMethod.Invoke(queryCompiler, new object[] { nodeTypeProvider });
//            var queryModel = parser.GetParsedQuery(query.Expression);
//            var database = DataBaseField.GetValue(queryCompiler);
//            var queryCompilationContextFactory = (IQueryCompilationContextFactory)QueryCompilationContextFactoryField.GetValue(database);
//            var queryCompilationContext = queryCompilationContextFactory.Create(false);
//            var modelVisitor = (RelationalQueryModelVisitor)queryCompilationContext.CreateQueryModelVisitor();
//            modelVisitor.CreateQueryExecutor<TEntity>(queryModel);
//            var sql = modelVisitor.Queries.First().ToString();

//            return sql;
//        }
//    }
//    public class DapperMySql
//    {
//        public int Id { get; set; }
//        public string Proper { get; set; }
//        public string Name { get; set; }
//    }
//}
