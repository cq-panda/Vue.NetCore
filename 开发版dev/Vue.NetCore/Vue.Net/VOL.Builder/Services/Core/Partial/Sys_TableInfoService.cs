using DairyStar.Builder.Utility;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Const;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Entity.DomainModels.Sys;
using VOL.Entity.SystemModels;

namespace DairyStar.Builder.Services
{
    public partial class Sys_TableInfoService
    {
        private int totalWidth = 0;
        private int totalCol = 0;
        private string webProject = null;
        private string apiNameSpace = null;
        private string startName = "";
        private string StratName
        {
            get
            {
                if (startName == "")
                {
                    startName = WebProject.Substring(0, webProject.IndexOf('.'));
                }
                return startName;
            }
        }
        private string WebProject
        {
            get
            {
                if (webProject != null)
                    return webProject;
                webProject = ProjectPath.GetLastIndexOfDirectoryName(".WebApi") ?? ProjectPath.GetLastIndexOfDirectoryName("Api") ?? ProjectPath.GetLastIndexOfDirectoryName(".Web");
                if (webProject == null)
                {
                    throw new Exception("未获取到以.WebApi结尾的项目名称,无法创建页面");
                }
                return webProject;
            }
        }
        private string ApiNameSpace
        {
            get
            {
                if (apiNameSpace != null)
                    return apiNameSpace;
                apiNameSpace = ProjectPath.GetLastIndexOfDirectoryName(".WebApi");
                if (apiNameSpace == null)
                {
                    throw new Exception("未获取到以.WebApi,无法创建Api控制器");
                }
                return apiNameSpace;
            }
        }

        /// <summary>
        /// 获取生成配置的树开菜单
        /// </summary>
        /// <returns></returns>
        public async Task<(string, string)> GetTableTree()
        {
            var treeData = await repository.FindAsIQueryable(x => 1 == 1)
                .Select(c => new
                {
                    id = c.Table_Id,
                    pId = c.ParentId,
                    parentId = c.ParentId,
                    name = c.ColumnCNName,
                    orderNo = c.OrderNo
                }).OrderByDescending(c => c.orderNo).ToListAsync();
            var treeList = treeData.Select(a => new
            {
                a.id,
                a.pId,
                a.parentId,
                a.name,
                isParent = treeData.Select(x => x.pId).Contains(a.id)
            });
            string startsWith = WebProject.Substring(0, WebProject.IndexOf('.'));
            return (treeList.Count() == 0 ? "[]" : treeList.Serialize() ?? "", ProjectPath.GetProjectFileName(startsWith));
            ;

        }

        /// <summary>
        /// 2020.05.17增加mysql获取表结构时区分当前所在数据库
        /// </summary>
        /// <returns></returns>
        private string GetMysqlTableSchema()
        {
            try
            {
                string dbName = DBServerProvider.GetConnectionString().Split("Database=")[1].Split(";")[0]?.Trim();
                if (!string.IsNullOrEmpty(dbName))
                {
                    dbName = $" and table_schema = '{dbName}' ";
                }
                return dbName;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"获取mysql数据库名异常:{ex.Message}");
                return "";
            }
        }

        /// <summary>
        /// 获取Mysql表结构信息
        /// 2020.06.14增加对mysql数据类型double区分
        /// </summary>
        /// <returns></returns>
        private string GetMySqlModelInfo()
        {
            return $@"SELECT
DISTINCT
           CONCAT(NUMERIC_PRECISION,',',NUMERIC_SCALE) as Prec_Scale,
        CASE
                 WHEN data_type IN( 'BIT', 'BOOL','bit', 'bool') THEN
                'bool'
                 WHEN data_type in('smallint','SMALLINT') THEN 'short'
				WHEN data_type in('tinyint', 'TINYINT') THEN 'sbyte'
                WHEN data_type IN('MEDIUMINT','mediumint', 'int','INT','year', 'Year') THEN
                'int'
                WHEN data_type in ( 'BIGINT','bigint') THEN
                'bigint'
                WHEN data_type IN('FLOAT',  'DECIMAL','float', 'decimal') THEN
                'decimal'
							 WHEN data_type IN( 'DOUBLE', 'double') THEN
                'double'
                WHEN data_type IN('CHAR', 'VARCHAR', 'TINY TEXT', 'TEXT', 'MEDIUMTEXT', 'LONGTEXT', 'TINYBLOB', 'BLOB', 'MEDIUMBLOB', 'LONGBLOB', 'Time','char', 'varchar', 'tiny text', 'text', 'mediumtext', 'longtext', 'tinyblob', 'blob', 'mediumblob', 'longblob', 'time') THEN
                'nvarchar'
                WHEN data_type IN('Date', 'DateTime', 'TimeStamp','date', 'datetime', 'timestamp') THEN
                'datetime' ELSE 'nvarchar'
            END AS ColumnType, Column_Name AS ColumnName
            FROM
                information_schema.COLUMNS
            WHERE
                table_name = ?tableName {GetMysqlTableSchema()};";
        }


        /// <summary>
        /// 获取SqlServer表结构信息
        /// </summary>
        /// <returns></returns>
        private string GetSqlServerModelInfo()
        {
            return $@"
	SELECT CASE WHEN t.ColumnType IN ('DECIMAL','smallmoney','money') THEN 
                    CONVERT(VARCHAR(30),t.Prec)+','+CONVERT(VARCHAR(30),t.Scale)  ELSE ''
                     END 
                    AS Prec_Scale,t.ColumnType,t.ColumnName
                      FROM (
                    SELECT col.prec AS  'Prec',col.scale AS 'Scale',t.name AS ColumnType,col.name AS ColumnName FROM          dbo.syscolumns col
                                                LEFT  JOIN dbo.systypes t ON col.xtype = t.xusertype
                                                INNER JOIN dbo.sysobjects obj ON col.id = obj.id
                                                                                 AND obj.xtype IN ('U','V')
                                                                                 AND obj.status >= 0
                                                LEFT  JOIN dbo.syscomments comm ON col.cdefault = comm.id
                                                LEFT  JOIN sys.extended_properties ep ON col.id = ep.major_id
                                                                                  AND col.colid = ep.minor_id
                                                                                  AND ep.name = 'MS_Description'
                                                LEFT  JOIN sys.extended_properties epTwo ON obj.id = epTwo.major_id
                                                                                  AND epTwo.minor_id = 0
                                                                                  AND epTwo.name = 'MS_Description'
                                      WHERE     obj.name =@tableName) AS t";
        }
        /// <summary>
        /// 获取PgSQl表结构信息
        /// </summary>
        /// <returns></returns>
        private string GetPgSqlModelInfo()
        {
            throw new Exception("开发中");
            //            return $@"
            //	SELECT DISTINCT
            //    a.attnum as num,
            //    a.attname as name,
            //    format_type(a.atttypid, a.atttypmod) as typ,
            //    a.attnotnull as notnull, 
            //    com.description as comment,
            //    coalesce(i.indisprimary,false) as primary_key,
            //    def.adsrc as default
            //FROM pg_attribute a 
            //JOIN pg_class pgc ON pgc.oid = a.attrelid
            //LEFT JOIN pg_index i ON 
            //    (pgc.oid = i.indrelid AND i.indkey[0] = a.attnum)
            //LEFT JOIN pg_description com on 
            //    (pgc.oid = com.objoid AND a.attnum = com.objsubid)
            //LEFT JOIN pg_attrdef def ON 
            //    (a.attrelid = def.adrelid AND a.attnum = def.adnum)
            //WHERE a.attnum > 0 AND pgc.oid = a.attrelid
            //AND pg_table_is_visible(pgc.oid)
            //AND NOT a.attisdropped
            //AND pgc.relname = @tableName  -- Your table name here
            //ORDER BY a.attnum;";
        }

        private WebResponseContent ExistsTable(string tableName, string tableTrueName)
        {
            WebResponseContent webResponse = new WebResponseContent(true);
            //如果是第一次创建model，此处反射获取到的是已经缓存过的文件，必须重新运行项目否则新增的文件无法做判断文件是否创建，需要重新做反射实际文件，待修改...
            var compilationLibrary = DependencyContext
                .Default
                .CompileLibraries
                .Where(x => !x.Serviceable && x.Type == "project");
            foreach (var _compilation in compilationLibrary)
            {
                try
                {
                    foreach (var entity in AssemblyLoadContext.Default
                .LoadFromAssemblyName(new AssemblyName(_compilation.Name))
                .GetTypes().Where(x => x.GetTypeInfo().BaseType != null
                    && x.BaseType == typeof(BaseEntity)))
                    {
                        if (entity.Name == tableTrueName && !string.IsNullOrEmpty(tableName) && tableName != tableTrueName)
                            return webResponse.Error($"实际表名【{tableTrueName }】已创建实体，不能创建别名【{tableName}】实体");

                        if (entity.Name != tableName)
                        {
                            var tableAttr = entity.GetCustomAttribute<TableAttribute>();
                            if (tableAttr != null && tableAttr.Name == tableTrueName)
                            {
                                return webResponse.Error($"实际表名【{tableTrueName }】已被【{entity.Name}】创建建实体,不能创建别名【{tableName}】实体,请将别名更换为【{entity.Name}】");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {

                    Console.WriteLine("查找文件异常：" + ex.Message);
                }
            }
            return webResponse;

        }

        /// <summary>
        /// 生成实体Model
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <returns></returns>
        public string CreateEntityModel(Sys_TableInfo sysTableInfo)
        {
            if (sysTableInfo == null
                || sysTableInfo.TableColumns == null
                || sysTableInfo.TableColumns.Count == 0)
                return "提交的配置数据不完整";

            WebResponseContent webResponse = ValidColumnString(sysTableInfo);
            if (!webResponse.Status)
                return webResponse.Message;

            string tableName = sysTableInfo.TableName;
            webResponse = ExistsTable(tableName, sysTableInfo.TableTrueName);
            if (!webResponse.Status)
            {
                return webResponse.Message;
            }
            if (!string.IsNullOrEmpty(sysTableInfo.TableTrueName) && sysTableInfo.TableTrueName != tableName)
            {
                tableName = sysTableInfo.TableTrueName;
            }

            string sql = "";
            switch (DBType.Name)
            {
                case "MySql":
                    sql = GetMySqlModelInfo();
                    break;
                case "PgSql":
                    sql = GetPgSqlModelInfo();
                    break;
                default:
                    sql = GetSqlServerModelInfo();
                    break;
            }
            List<TableColumnInfo> tableColumnInfoList = repository.DapperContext.QueryList<TableColumnInfo>(sql, new { tableName });
            List<Sys_TableColumn> list = sysTableInfo.TableColumns;
            string msg = CreateEntityModel(list, sysTableInfo, tableColumnInfoList, 1);
            if (msg != "")
                return msg;
            if (list.Any(c => c.ApiInPut > 0))
            {
                CreateEntityModel(list.Where(c => c.ApiInPut > 0).ToList(), sysTableInfo, tableColumnInfoList, 2);
            }
            if (list.Any(c => c.ApiOutPut > 0))
            {
                CreateEntityModel(list.Where(c => c.ApiOutPut > 0).ToList(), sysTableInfo, tableColumnInfoList, 3);
            }
            return "Model创建成功!";
        }

        /// <summary>
        /// 保存配置信息
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <returns></returns>
        public WebResponseContent SaveEidt(Sys_TableInfo sysTableInfo)
        {
            WebResponseContent webResponse = ValidColumnString(sysTableInfo);
            if (!webResponse.Status) return webResponse;
            //2020.05.07新增禁止选择上级角色为自己
            if (sysTableInfo.Table_Id == sysTableInfo.ParentId)
            {
                return WebResponseContent.Instance.Error($"父级id不能为自己");
            }
            if (sysTableInfo.TableColumns != null)
            {
                sysTableInfo.TableColumns.ForEach(x =>
                {
                    x.TableName = sysTableInfo.TableName;
                });
            }

            sysTableInfo.TableColumns?.ForEach(x =>
            {
                if (x.IsReadDataset == null)
                {
                    x.IsReadDataset = 0;
                }
            });
            return repository.UpdateRange<Sys_TableColumn>(sysTableInfo, true, true, null, null, true);
        }

        /// <summary>
        /// 将表结构重新同步到代码生成配置
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> SyncTable(string tableName)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (string.IsNullOrEmpty(tableName)) return webResponse.OK("表名不能为空");

            Sys_TableInfo tableInfo = repository.FindAsIQueryable(x => x.TableName == tableName)
          .Include(o => o.TableColumns).FirstOrDefault();
            if (tableInfo == null)
                return webResponse.Error("未获取到【" + tableName + "】的配置信息，请使用新建功能");
            if (!string.IsNullOrEmpty(tableInfo.TableTrueName) && tableInfo.TableTrueName != tableName)
            {
                tableName = tableInfo.TableTrueName;
            }

            string sql;
            if (DBType.Name.ToLower() == DbCurrentType.MySql.ToString().ToLower())
            {
                sql = GetMySqlStructure(tableName);
            }
            else if (DBType.Name.ToLower() == DbCurrentType.PgSql.ToString().ToLower())
            {
                throw new Exception("开发中");
            }
            else
            {
                sql = GetSqlServerStructure(tableName);
            }
            //获取表结构
            List<Sys_TableColumn> columns = repository.DapperContext
                  .QueryList<Sys_TableColumn>(sql, new { tableName });
            if (columns == null || columns.Count == 0)
                return webResponse.Error("未获取到【" + tableName + "】表结构信息，请确认表是否存在");


            //获取现在配置好的表结构
            List<Sys_TableColumn> detailList = tableInfo.TableColumns ?? new List<Sys_TableColumn>();
            List<Sys_TableColumn> addColumns = new List<Sys_TableColumn>();
            List<Sys_TableColumn> updateColumns = new List<Sys_TableColumn>();
            foreach (Sys_TableColumn item in columns)
            {
                Sys_TableColumn tableColumn = detailList.Where(x => x.ColumnName == item.ColumnName)
                    .FirstOrDefault();
                //新加的列
                if (tableColumn == null)
                {
                    item.TableName = tableInfo.TableName;
                    item.Table_Id = tableInfo.Table_Id;
                    addColumns.Add(item);
                    continue;
                }
                //修改了数据类库或字段长度
                if (item.ColumnType != tableColumn.ColumnType || item.Maxlength != tableColumn.Maxlength || (item.IsNull ?? 0) != (tableColumn.IsNull ?? 0))
                {
                    tableColumn.ColumnType = item.ColumnType;
                    tableColumn.Maxlength = item.Maxlength;
                    tableColumn.IsNull = item.IsNull;
                    updateColumns.Add(tableColumn);
                }
            }
            //删除的列
            List<Sys_TableColumn> delColumns = detailList.Where(a => !columns.Select(c => c.ColumnName).Contains(a.ColumnName)).ToList();
            if (addColumns.Count + delColumns.Count + updateColumns.Count == 0)
            {
                return webResponse.Error("【" + tableName + "】表结构未发生变化");
            }
            repository.AddRange(addColumns);
            repository.DbContext.Set<Sys_TableColumn>().RemoveRange(delColumns);
            repository.UpdateRange(updateColumns, x => new { x.ColumnType, x.Maxlength, x.IsNull });
            await repository.DbContext.SaveChangesAsync();

            return webResponse.OK($"新加字段【{addColumns.Count}】个,删除字段【{delColumns.Count}】,修改字段【{updateColumns.Count}】");
        }

        /// <summary>
        /// 生成Services/Repository与对应的Partial类
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="nameSpace"></param>
        /// <param name="foldername"></param>
        /// <param name="webController"></param>
        /// <param name="apiController"></param>
        /// <returns></returns>
        public string CreateServices(string tableName, string nameSpace, string foldername, bool webController, bool apiController)
        {
            var tableColumn = repository.FindAsyncFirst<Sys_TableColumn>(x => x.TableName == tableName).Result;

            if (tableColumn == null)
            {
                return $"没有查到{tableName}表信息";
            }

            if (string.IsNullOrEmpty(nameSpace) || string.IsNullOrEmpty(foldername))
            {
                return $"命名空间、项目文件夹都不能为空";
            }

            string domainContent = "";

            string frameworkFolder = ProjectPath.GetProjectDirectoryInfo()?.FullName;
            string[] splitArr = nameSpace.Split('.');
            string projectName = splitArr.Length > 1 ? splitArr[splitArr.Length - 1] : splitArr[0];
            string baseOptions = "\"" + projectName + "\"," + "\"" + foldername + "\"," + "\"" + tableName + "\"";

            if (apiController)
            {
                string apiPath = ProjectPath.GetProjectDirectoryInfo().GetDirectories().Where(x => x.Name.ToLower().EndsWith(".webapi")).FirstOrDefault()?.FullName;
                if (string.IsNullOrEmpty(apiPath))
                {
                    return "未找到webapi类库,请确认是存在weiapi类库命名以.webapi结尾";
                }
                apiPath += $"\\Controllers\\{projectName}\\";
                //生成Partial Api控制器
                if (!File.Exists($"{apiPath}Partial\\{tableName}Controller.cs"))
                {
                    string partialController = FileHelper.ReadFile(@"Template\\Controller\\ControllerApiPartial.html")
                       .Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
                    FileHelper.WriteFile($"{apiPath}Partial\\", tableName + "Controller.cs", partialController);
                }
                //生成Api控制器
                domainContent = FileHelper.ReadFile(@"Template\\Controller\\ControllerApi.html")
                    .Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName).Replace("{BaseOptions}", baseOptions);
                FileHelper.WriteFile(apiPath, tableName + "Controller.cs", domainContent);
            }

            //生成Repository类
            domainContent = FileHelper.ReadFile("Template\\Repositorys\\BaseRepository.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
            FileHelper.WriteFile(
           frameworkFolder + string.Format("\\{0}\\Repositories\\{1}\\", nameSpace, foldername)
                          , tableName + "Repository.cs", domainContent);
            //生成IRepository类
            domainContent = FileHelper.ReadFile("Template\\IRepositorys\\BaseIRepositorie.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
            FileHelper.WriteFile(
            frameworkFolder + string.Format("\\{0}\\IRepositories\\{1}\\", nameSpace, foldername),
                   "I" + tableName + "Repository.cs", domainContent);


            string path = $"{frameworkFolder}\\{nameSpace}\\IServices\\{ foldername}\\";

            string fileName = "I" + tableName + "Service.cs";

            //生成Partial  IService类
            if (!File.Exists(path + "Partial\\" + fileName))
            {
                domainContent = FileHelper.ReadFile("Template\\IServices\\IServiceBasePartial.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
                FileHelper.WriteFile(path + "Partial\\", fileName, domainContent);
            }

            //生成IService类
            domainContent = FileHelper.ReadFile("Template\\IServices\\IServiceBase.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
            FileHelper.WriteFile(path, fileName, domainContent);


            path = $"{frameworkFolder}\\{nameSpace}\\Services\\{ foldername}\\";
            fileName = tableName + "Service.cs";
            //生成Partial Service类
            domainContent = FileHelper.ReadFile("Template\\Services\\ServiceBasePartial.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
            if (!File.Exists(path + "Partial\\" + fileName))
            {
                domainContent = FileHelper.ReadFile("Template\\Services\\ServiceBasePartial.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{StartName}", StratName);
                FileHelper.WriteFile(path + "Partial\\", fileName, domainContent);
            }

            //生成Service类
            domainContent = FileHelper.ReadFile("Template\\Services\\ServiceBase.html")
                .Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName)
                .Replace("{StartName}", StratName);
            FileHelper.WriteFile(path, fileName, domainContent);


            if (webController)
            {
                path = $"{frameworkFolder}\\{nameSpace}\\Controllers\\{ foldername}\\";
                fileName = tableName + "Controller.cs";
                //生成Partial web控制器
                if (!File.Exists(path + "Partial\\" + fileName))
                {
                    domainContent = FileHelper.ReadFile("Template\\Controller\\ControllerPartial.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{BaseOptions}", baseOptions).Replace("{StartName}", StratName);
                    FileHelper.WriteFile(path + "Partial\\", tableName + "Controller.cs", domainContent);
                }

                //生成web控制器
                domainContent = FileHelper.ReadFile("Template\\Controller\\Controller.html").Replace("{Namespace}", nameSpace).Replace("{TableName}", tableName).Replace("{BaseOptions}", baseOptions).Replace("{StartName}", StratName);
                FileHelper.WriteFile(path, tableName + "Controller.cs", domainContent);
            }
            return "业务类创建成功!";
        }

        /// <summary>
        /// 获取界面查询字段
        /// </summary>
        /// <param name="panelHtml"></param>
        /// <param name="sysColumnList"></param>
        /// <param name="vue"></param>
        /// <param name="edit"></param>
        /// <returns></returns>
        private List<object> GetSearchData(List<List<PanelHtml>> panelHtml, List<Sys_TableColumn> sysColumnList, bool vue = false, bool edit = false)
        {
            if (edit)
            {
                GetPanelData(sysColumnList, panelHtml, x => x.EditRowNo, c => c.EditRowNo != null && c.EditRowNo > 0, false, q => q.EditRowNo, vue);
            }
            else
            {
                GetPanelData(sysColumnList, panelHtml, x => x.SearchRowNo, c => c.SearchRowNo != null, true, q => q.SearchRowNo, vue);
            }

            List<object> list = new List<object>();
            Func<PanelHtml, object> func = s => new { s.columnType, s.dataSource, s.displayType, s.text, s.require, s.id };
            if (vue)
                func = s => new { type = s.columnType, dataKey = s.displayType, title = s.text, required = s.require, field = s.id };
            panelHtml.ForEach(x =>
            {
                List<Dictionary<string, object>> keyValuePairs = new List<Dictionary<string, object>>();
                //List<KeyValuePair<string, object>> keyValuePairs = new List<KeyValuePair<string, object>>();
                x.ForEach(s =>
                {
                    Dictionary<string, object> keyValues = new Dictionary<string, object>();
                    if (vue)
                    {
                        //  keyValues.Add("columnType", s.columnType);
                        if (!string.IsNullOrEmpty(s.dataSource) && s.dataSource != "''")
                        {
                            keyValues.Add("dataKey", s.dataSource);
                        }
                        keyValues.Add("title", s.text);
                        if (s.require)
                        {
                            keyValues.Add("required", s.require);
                        }

                        keyValues.Add("field", s.id);
                        if (s.disabled)
                        {
                            keyValues.Add("disabled", true);
                        }
                        if (s.colSize > 0)
                        {
                            keyValues.Add("colSize", s.colSize);
                        }
                        if (!string.IsNullOrEmpty(s.displayType) && s.displayType != "''")
                        {
                            keyValues.Add("type", s.columnType == "img" ? s.columnType : s.displayType);
                        }
                    }
                    else
                    {
                        keyValues.Add("columnType", s.columnType);
                        if (!string.IsNullOrEmpty(s.dataSource))
                        {
                            keyValues.Add("dataSource", s.dataSource);
                        }
                        keyValues.Add("text", s.text);
                        if (s.require)
                        {
                            keyValues.Add("require", s.require);
                        }
                        keyValues.Add("id", s.id);
                    }
                    keyValuePairs.Add(keyValues);
                });
                list.Add(keyValuePairs);
                // list.Add(x.Select(func).ToList());
            });
            return list;
        }

        /// <summary>
        /// 生成Vue页面
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <param name="vuePath">为本地Vue项目Views所在的绝对路径:E:/web/myProject/Views</param>
        /// <returns></returns>
        public string CreateVuePage(Sys_TableInfo sysTableInfo, string vuePath)
        {
            if (string.IsNullOrEmpty(vuePath)) return "请设置Vue所在Views的绝对路径!";

            if (!FileHelper.DirectoryExists(vuePath)) return $"未找Vue项目路径{vuePath}!";

            if (sysTableInfo == null
              || sysTableInfo.TableColumns == null
              || sysTableInfo.TableColumns.Count == 0)
                return "提交的配置数据不完整";

            vuePath = vuePath.Trim().TrimEnd('/').TrimEnd('\\');

            List<Sys_TableColumn> sysColumnList = sysTableInfo.TableColumns;
            string[] eidtTye = new string[] { "select", "selectList", "drop", "dropList", "checkbox" };
            if (sysColumnList.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DropNo)))
            {
                return $"编辑类型为[{string.Join(',', eidtTye)}]时必须选择数据源";
            }
            if (sysColumnList.Exists(x => eidtTye.Contains(x.SearchType) && string.IsNullOrEmpty(x.DropNo)))
            {
                return $"查询类型为[{string.Join(',', eidtTye)}]时必须选择数据源";
            }
            StringBuilder sb = GetGridColumns(sysColumnList, sysTableInfo.ExpressField, false, true);
            if (sb.Length == 0) return "未获取到数据!";
            string columns = sb.ToString().Trim();
            columns = columns.Substring(0, columns.Length - 1);
            string key = sysColumnList.Where(c => c.IsKey == 1).Select(x => x.ColumnName).First() ?? "";

            var formFileds = sysColumnList.Where(c => c.EditRowNo != null && c.EditRowNo > 0)
                .OrderBy(o => o.EditRowNo)
                .ThenByDescending(t => t.OrderNo)
                .Select(x => new KeyValuePair<string, object>(x.ColumnName, x.SearchType == "checkbox" ? new string[0] : "" as object))
                .ToList().ToDictionary(x => x.Key, x => x.Value).Serialize();

            List<List<PanelHtml>> panelHtml = new List<List<PanelHtml>>();

            List<object> list = GetSearchData(panelHtml, sysColumnList, true);

            string pageContent = FileHelper.ReadFile("Template\\Page\\VueSearchPage.html");
            if (string.IsNullOrEmpty(pageContent))
            {
                return "未找到Template模板文件";
            }
            //  AppSetting.CurrentPath

            var searchFormFileds = sysColumnList
                .Where(c => c.SearchRowNo != null && c.SearchRowNo > 0)
                .Select(x => new KeyValuePair<string, object>(x.ColumnName, x.SearchType == "checkbox" ? new string[0] : "" as object))
                .ToList().ToDictionary(x => x.Key, x => x.Value).Serialize();

            pageContent = pageContent.Replace("#searchFormFileds", searchFormFileds)
                .Replace("#searchFormOptions", list.Serialize() ?? ""
                .Replace("},{", "},\r\n                               {")
                .Replace("],[", "],\r\n                              [")
                );
            panelHtml = new List<List<PanelHtml>>();
            string formOptions = GetSearchData(panelHtml, sysColumnList, true, true).Serialize() ?? "";

            string[] arr = sysTableInfo.Namespace.Split(".");
            string spaceFolder = (arr.Length > 1 ? arr[arr.Length - 1] : arr[0]).ToLower();

            pageContent = pageContent.Replace("#columns", columns).
                            Replace("#TableName", sysTableInfo.TableName).
                            Replace("#SortName", string.IsNullOrEmpty(sysTableInfo.SortName) ? key : sysTableInfo.SortName).
                            Replace("#key", key).
                            Replace("#Foots", " ").
                            Replace("#cnName", sysTableInfo.ColumnCNName).
                            Replace("#url", "/" + sysTableInfo.TableName + "/").
                            Replace("#folder", spaceFolder).
                            Replace("#editFormFileds", formFileds).
                            Replace("#editFormOptions", formOptions.
                            Replace("},{", "},\r\n                               {").
                            Replace("],[", "],\r\n                              ["));
            vuePath = vuePath.Replace("//", "\\").Trim('\\');



            //如果有明细，加载明细的数据
            if (!string.IsNullOrEmpty(sysTableInfo.DetailName))
            {
                Sys_TableInfo detailTable = repository.FindAsIQueryable(x => x.TableName == sysTableInfo.DetailName)
                    .Include(x => x.TableColumns).FirstOrDefault();
                if (detailTable == null)
                    return $"请先生成明细表{ sysTableInfo.DetailName}的配置!";
                if (detailTable.TableColumns == null || detailTable.TableColumns.Count == 0)
                    return $"明细表{ sysTableInfo.DetailName}没有列的信息,请确认是否有列数据或列数据是否被删除!";
                //明细列数据
                List<Sys_TableColumn> detailList = detailTable.TableColumns;
                //替换明细列数据
                sb = GetGridColumns(detailList, detailTable.ExpressField, true, true);
                key = detailList.Where(c => c.IsKey == 1).Select(x => x.ColumnName).First();
                columns = sb.ToString().Trim();
                columns = columns.Substring(0, columns.Length - 1);
                pageContent = pageContent.Replace("#detailColumns", columns).
                    Replace("#detailCnName", detailTable.CnName).
                    Replace("#detailKey", detailTable.TableColumns.Where(c => c.IsKey == 1).Select(x => x.ColumnName).First()).
                    Replace("#detailSortName", string.IsNullOrEmpty(detailTable.SortName) ? key : detailTable.SortName);
            }
            else
            {
                pageContent = pageContent.Replace("#detailColumns", "")
                    .Replace("#detailKey", "")
                    .Replace("#detailSortName", "");
            }



            //生成扩展逻辑页面(只创建一次)
            //获取view的上一级目录
            string srcPath = new DirectoryInfo(vuePath.MapPath()).Parent.FullName;
            string extensionPath = $"{srcPath}\\extension\\{spaceFolder}\\";
            //  sysTableInfo.TableName = sysTableInfo.TableName.ToLower();
            string exFileName = sysTableInfo.TableName + ".js";
            if (!FileHelper.FileExists(extensionPath + exFileName))
            {
                string exContent = FileHelper.ReadFile("Template\\Page\\VueExtension.html");
                FileHelper.WriteFile(extensionPath, exFileName, exContent);
            }
            //生成vue页面
            FileHelper.WriteFile($"{vuePath}\\{ spaceFolder}\\", sysTableInfo.TableName + ".vue", pageContent);

            //生成路由
            string routerPath = $"{srcPath}\\router\\viewGird.js";
            string routerContent = FileHelper.ReadFile(routerPath);
            if (!routerContent.Contains($"path: '/{sysTableInfo.TableName}'"))
            {
                string routerTemplate = FileHelper.ReadFile("Template\\Page\\router.html")
                 .Replace("#TableName", sysTableInfo.TableName)
                 .Replace("#folder", spaceFolder);
                routerContent = routerContent.Replace("]", routerTemplate);
                FileHelper.WriteFile($"{srcPath}\\router\\", "viewGird.js", routerContent);
            }
            return "页面创建成功!";
        }

        /// <summary>
        /// 生成前台页面(不是Vue页面)
        /// </summary>
        /// <param name="sysColumnList"></param>
        /// <param name="sysTableInfo"></param>
        /// <returns></returns>
        public string CreatePage(Sys_TableInfo sysTableInfo)
        {
            List<Sys_TableColumn> sysColumnList = sysTableInfo.TableColumns;
            List<List<PanelHtml>> panelHtml = new List<List<PanelHtml>>();
            List<object> list = GetSearchData(panelHtml, sysColumnList);
            string nameSpace = sysTableInfo.Namespace;
            string foldername = sysTableInfo.FolderName;
            string tableName = sysTableInfo.TableName;
            string columnCNName = sysTableInfo.ColumnCNName;
            string gridContent = FileHelper.ReadFile("Template\\Page\\gridParameters.html");
            string pageContent = FileHelper.ReadFile("Template\\Page\\SearchPage.html");

            pageContent = pageContent.Replace("{#gridParameters}", gridContent);
            pageContent = pageContent.Replace("{#searchHtml}", JsonConvert.SerializeObject(list).Replace("\"__", "").Replace("__\"", ""));

            panelHtml = new List<List<PanelHtml>>();

            //IsDisplay只有显示的才生成新增或编辑列(富文本编辑的除外)
            GetPanelData(sysColumnList, panelHtml, x => x.EditRowNo, c => c.EditRowNo != null && c.EditRowNo > 0 && (c.IsDisplay == 1 || c.ColumnName == sysTableInfo.RichText), false, q => q.EditRowNo);


            list = new List<object>();
            panelHtml.ForEach(x =>
            {
                List<Dictionary<string, object>> dicList = new List<Dictionary<string, object>>();
                x.ForEach(c =>
                {
                    if (!string.IsNullOrEmpty(sysTableInfo.UploadField) && c.id == sysTableInfo.UploadField)
                    {
                        c.displayType = "file";
                    }
                    if (!string.IsNullOrEmpty(sysTableInfo.RichText) && c.id == sysTableInfo.RichText)
                    {
                        c.displayType = "richText";
                    }
                    var dic = new Dictionary<string, object>() { {
                           "columnType",c.columnType
                        },{
                            "dataSource",c.dataSource
                        },{
                            "displayType",c.displayType
                        },{
                            "text",c.text
                        },{
                            "require",c.require
                        },{
                            "id",c.id
                        } };
                    if (c.colSize > 0)
                    {
                        dic.Add("colSize", c.colSize);
                    }
                    if (!string.IsNullOrEmpty(sysTableInfo.UploadField))
                    {
                        dic.Add("fileMaxCount", sysTableInfo.UploadMaxCount <= 0 ? 1 : sysTableInfo.UploadMaxCount);
                    }
                    if (c.disabled)
                    {
                        dic.Add("disabled", 1);
                    }
                    dicList.Add(dic);
                });
                list.Add(dicList);
            });
            pageContent = pageContent.Replace("{#editSource}", JsonConvert.SerializeObject(list).Replace("\"__", "").Replace("__\"", ""));
            pageContent = pageContent.Replace("{#uploader}",
                !string.IsNullOrEmpty(sysTableInfo.UploadField) ? "@{await Html.RenderPartialAsync(\"~/Views/Shared/Uploader.cshtml\");}" : "");

            pageContent = pageContent.Replace("{#ueditor}", !string.IsNullOrEmpty(sysTableInfo.RichText) ? "@{await Html.RenderPartialAsync(\"~/Views/Shared/Ueditor.cshtml\");}" : "");


            StringBuilder sb = GetGridColumns(sysColumnList, sysTableInfo.ExpressField, false);
            // bool sort = false;

            if (sb.Length == 0)
                return "未获取到数据!";
            //totalWidth:#totalWidth,totalShow:#totalS
            pageContent = pageContent.Replace("{#Width}", ",totalWidth:" + totalWidth + ",totalCol:" + totalCol);

            string dropValue = "";
            List<string> dropNos = new List<string>();
            if (sysColumnList.Exists(c => c.DropNo != null))
            {
                dropNos.AddRange(sysColumnList.Where(x => !string.IsNullOrEmpty(x.DropNo)).Select(x => x.DropNo).Distinct().ToList());
            }

            string key = sysColumnList.Where(c => c.IsKey == 1).Select(x => x.ColumnName).First();
            key = key ?? "";
            string[] splitArr = nameSpace.Split('.');
            nameSpace = splitArr[splitArr.Length - 1];
            string columns = sb.ToString().Trim();
            columns = columns.Substring(0, columns.Length - 1);
            pageContent = pageContent.Replace("{#columns}", columns).
                Replace("#TableName", tableName).
                Replace("#SortName", string.IsNullOrEmpty(sysTableInfo.SortName) ? key : sysTableInfo.SortName).
                Replace("#key", key).
                Replace("#Foots", " ").
                Replace("#cnName", columnCNName).
                Replace("#Url", "/" + tableName + "/GetPageData").
                //  Replace("#Url", "/" + NameSpace + "/PageData/GetSingleData").
                Replace("#NameSpace", panelHtml.Count == 0 ? "" : "/" + nameSpace).
                //文件(图片/视频上传)
                Replace("#fileLink", string.IsNullOrEmpty(sysTableInfo.UploadField) ? "false" : "true").
                //启用富文本编辑
                Replace("#richText", string.IsNullOrEmpty(sysTableInfo.RichText) ? "false" : "true");


            //如果有明细，加载明细的数据
            if (!string.IsNullOrEmpty(sysTableInfo.DetailName))
            {

                Sys_TableInfo detailTable = repository.Find(x => x.TableName == sysTableInfo.DetailName).FirstOrDefault();
                if (detailTable == null)
                    return $"请先生成明细表{ sysTableInfo.DetailName}的配置!";

                //  repository.DbContext.Set<Sys_TableColumn>().Select();
                //获取明细列数据
                List<Sys_TableColumn> detailList = repository.Find<Sys_TableColumn>(x => x.TableName == sysTableInfo.DetailName);
                if (detailList.Exists(c => !string.IsNullOrEmpty(c.DropNo)))
                {
                    dropNos.AddRange(detailList.Where(x => !string.IsNullOrEmpty(x.DropNo)).Select(x => x.DropNo).Distinct().ToList());
                }
                //替换明细列数据
                sb = GetGridColumns(detailList, detailTable.ExpressField, true);
                key = detailList.Where(c => c.IsKey == 1).Select(x => x.ColumnName).First();
                columns = sb.ToString().Trim();
                columns = columns.Substring(0, columns.Length - 1);
                gridContent = gridContent.Replace("{#columns}", columns)
                       .Replace("#TableName", detailTable.TableName)
                       .Replace("#key", key)
                       .Replace("#SortName", string.IsNullOrEmpty(sysTableInfo.SortName) ? key : sysTableInfo.SortName)
                       .Replace("#Foots", " ")
                       .Replace("#Url", "")
                       .Replace("#cnName", detailTable.ColumnCNName)
                       .Replace("#NameSpace", detailTable.Namespace)
                       .Replace("#fileLink", "false")
                       .Replace("#richText", "false");
                gridContent = gridContent.Replace("{#Width}", ",totalWidth:" + totalWidth + ",totalCol:" + totalCol);
            }
            else
            {
                gridContent = "''";
            }

            if (dropNos.Count > 0)
            {
                dropValue = "\"" + string.Join(",", dropNos.Distinct().ToList()) + "\"";
                dropValue = "@{ViewBag.dropDownIds = " + dropValue + ";}";
            }
            pageContent = pageContent.Replace("{#dropDownIds}", dropValue);

            string currentPath = "".MapPath();
            string publish = currentPath + "\\" + WebProject + ".dll";

            string projectPath = ProjectPath.GetProjectDirectoryInfo()?.FullName;
            if (string.IsNullOrEmpty(projectPath) && !FileHelper.FileExists(publish))
            {
                return "未找到" + WebProject + "文件路径";
            }
            string webPath = null;
            if (!string.IsNullOrEmpty(projectPath))
            {
                webPath = projectPath + "\\" + WebProject + "\\Views\\" + nameSpace + "\\" + foldername + "\\";
                pageContent = pageContent.Replace("{#gridDetailParameters}", gridContent);
                FileHelper.WriteFile(webPath, tableName + ".cshtml", pageContent);
            }
            //生成发布站点的页面
            if (FileHelper.FileExists(publish) && FileHelper.DirectoryExists(currentPath + "\\Views"))
            {
                webPath = currentPath + "\\Views\\" + nameSpace + "\\" + foldername + "\\";
                pageContent = pageContent.Replace("{#gridDetailParameters}", gridContent);
                FileHelper.WriteFile(webPath, tableName + ".cshtml", pageContent);
            }
            //生成api数据待完。。
            //string apiPath = projectPath + ApiNameSpace + "\\Controllers\\" + "\\" + nameSpace + foldername + "\\";

            return "页面创建成功!";
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableInfo"></param>
        /// <returns></returns>
        public string CreateExtensionPage(Sys_TableInfo tableInfo)
        {
            return "开发中。。。";
        }

        /// <summary>
        /// 获取Mysql表结构信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private string GetMySqlStructure(string tableName)
        {
            return $@"SELECT  DISTINCT
                    Column_Name AS ColumnName,
                     '{ tableName}'  as tableName,
	                Column_Comment AS ColumnCnName,
                        CASE
                          WHEN data_type IN( 'BIT', 'BOOL', 'bit', 'bool') THEN
                'bool'
		             WHEN data_type in('smallint','SMALLINT') THEN 'short'
								WHEN data_type in('tinyint','TINYINT') THEN 'sbyte'
                        WHEN data_type IN('MEDIUMINT','mediumint', 'int','INT','year', 'Year') THEN
                    'int'
                    WHEN data_type in ( 'BIGINT','bigint') THEN
                    'bigint'
                    WHEN data_type IN('FLOAT', 'DOUBLE', 'DECIMAL','float', 'double', 'decimal') THEN
                    'decimal'
                    WHEN data_type IN('CHAR', 'VARCHAR', 'TINY TEXT', 'TEXT', 'MEDIUMTEXT', 'LONGTEXT', 'TINYBLOB', 'BLOB', 'MEDIUMBLOB', 'LONGBLOB', 'Time','char', 'varchar', 'tiny text', 'text', 'mediumtext', 'longtext', 'tinyblob', 'blob', 'mediumblob', 'longblob', 'time') THEN
                    'string'
                    WHEN data_type IN('Date', 'DateTime', 'TimeStamp','date', 'datetime', 'timestamp') THEN
                    'DateTime' ELSE 'string'
                END AS ColumnType,
	              case WHEN CHARACTER_MAXIMUM_LENGTH>8000 THEN 0 ELSE CHARACTER_MAXIMUM_LENGTH end  AS Maxlength,
            CASE
                    WHEN COLUMN_KEY <> '' THEN  
                    1 ELSE 0
                END AS IsKey,
            CASE
                    WHEN Column_Name IN( 'CreateID', 'ModifyID', '' ) 
		            OR COLUMN_KEY<> '' THEN
                        0 ELSE 1
                        END AS IsDisplay,
		            1 AS IsColumnData,
                    120 AS ColumnWidth,
                    0 AS OrderNo,
                CASE
                        WHEN IS_NULLABLE = 'NO' THEN
                        0 ELSE 1
                    END AS IsNull,
	            CASE
                        WHEN COLUMN_KEY <> '' THEN
                        1 ELSE 0
                    END AS IsReadDataset
                FROM
                    information_schema.COLUMNS
                WHERE
                    table_name = ?tableName {GetMysqlTableSchema()}";
        }

        /// <summary>
        /// 获取SqlServer表结构信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private string GetSqlServerStructure(string tableName)
        {
            return $@"
            SELECT TableName,
                LTRIM(RTRIM(ColumnName)) AS ColumnName,
                ColumnCNName,
                CASE WHEN ColumnType = 'uniqueidentifier' THEN 'guid'
                     WHEN ColumnType IN('smallint', 'INT') THEN 'int'
                     WHEN ColumnType = 'BIGINT' THEN 'long'
                     WHEN ColumnType IN('CHAR', 'VARCHAR', 'NVARCHAR',
                                          'text', 'xml', 'varbinary', 'image')
                     THEN 'string'
                     WHEN ColumnType IN('tinyint')
                     THEN 'byte'

                       WHEN ColumnType IN('bit') THEN 'bool'
                     WHEN ColumnType IN('time', 'date', 'DATETIME', 'smallDATETIME')
                     THEN 'DateTime'
                     WHEN ColumnType IN('smallmoney', 'DECIMAL', 'numeric',
                                          'money') THEN 'decimal'
                     WHEN ColumnType = 'float' THEN 'float'
                     ELSE 'string '
                END ColumnType,
                    [Maxlength],
                IsKey,
                CASE WHEN ColumnName IN('CreateID', 'ModifyID', '')
                          OR IsKey = 1 THEN 0
                     ELSE 1
                END AS IsDisplay ,
				1 AS IsColumnData,

              CASE   WHEN ColumnType IN('time', 'date', 'DATETIME', 'smallDATETIME') THEN 150

                     WHEN ColumnName IN('Modifier', 'Creator') THEN 130

                     WHEN ColumnType IN('int', 'bigint') OR ColumnName IN('CreateID', 'ModifyID', '') THEN 80
                     WHEN[Maxlength] < 110 AND[Maxlength] > 60 THEN 120

                     WHEN[Maxlength] < 200 AND[Maxlength] >= 110 THEN 180

                     WHEN[Maxlength] > 200 THEN 220
                     ELSE 90
                   END AS ColumnWidth ,
                0 AS OrderNo,
                --CASE WHEN IsKey = 1 OR t.[IsNull]=0 THEN 0
                --     ELSE 1 END
                t.[IsNull] AS
                 [IsNull],
            CASE WHEN IsKey = 1 THEN 1 ELSE 0 END IsReadDataset,
            CASE WHEN IsKey!=1 AND t.[IsNull] = 0 THEN 0 ELSE NULL END AS EditColNo
        FROM    (SELECT obj.name AS TableName ,
                            col.name AS ColumnName ,
                            CONVERT(NVARCHAR(100),ISNULL(ep.[value], '')) AS ColumnCNName,
                            t.name AS ColumnType ,
                           CASE WHEN  col.length<1 THEN 0 ELSE  col.length END  AS[Maxlength],
                            CASE WHEN EXISTS (SELECT   1
                                               FROM dbo.sysindexes si
                                                        INNER JOIN dbo.sysindexkeys sik ON si.id = sik.id
                                                              AND si.indid = sik.indid
                                                        INNER JOIN dbo.syscolumns sc ON sc.id = sik.id
                                                              AND sc.colid = sik.colid
                                                        INNER JOIN dbo.sysobjects so ON so.name = si.name
                                                              AND so.xtype = 'PK'
                                               WHERE sc.id = col.id
                                                        AND sc.colid = col.colid)
                                 THEN 1
                                 ELSE 0
                            END AS IsKey ,
                            CASE WHEN col.isnullable = 1 THEN 1
                                 ELSE 0
                            END AS[IsNull],
                            col.colorder
                  FROM      dbo.syscolumns col
                            LEFT JOIN dbo.systypes t ON col.xtype = t.xusertype
                           INNER JOIN dbo.sysobjects obj ON col.id = obj.id

                                                            AND obj.xtype IN ( 'U','V')
                                                          --   AND obj.status >= 01
                            LEFT JOIN dbo.syscomments comm ON col.cdefault = comm.id
                            LEFT JOIN sys.extended_properties ep ON col.id = ep.major_id
                                                              AND col.colid = ep.minor_id
                                                              AND ep.name = 'MS_Description'
                            LEFT JOIN sys.extended_properties epTwo ON obj.id = epTwo.major_id
                                                              AND epTwo.minor_id = 0
                                                              AND epTwo.name = 'MS_Description'
                  WHERE obj.name = @tableName--表名
                ) AS t
            ORDER BY t.colorder";
        }

        /// <summary>
        /// 设置界面table td单元格的宽度
        /// </summary>
        /// <param name="columns"></param>
        private void SetMaxLength(List<Sys_TableColumn> columns)
        {
            columns.ForEach(x =>
            {
                if (x.ColumnName == "DateTime")
                {
                    x.ColumnWidth = 150;
                }
                else if (x.ColumnName == "Modifier" || x.ColumnName == "Creator")
                {
                    x.ColumnWidth = 130;
                }
                else if (x.ColumnName == "CreateID" || x.ColumnName == "ModifyID")
                {
                    x.ColumnWidth = 80;
                }
                else if (x.Maxlength > 200)
                {
                    x.ColumnWidth = 220;
                }
                else if (x.Maxlength > 110 && x.Maxlength <= 200)
                {
                    x.ColumnWidth = 180;
                }
                else if (x.Maxlength > 60 && x.Maxlength <= 110)
                {
                    x.ColumnWidth = 120;
                }
                else
                {
                    x.ColumnWidth = 90;
                }
            });
        }

        /// <summary>
        /// 初始化生成配置对应表的数据信息
        /// </summary>
        /// <param name="parentId"></param>
        /// <param name="tableName"></param>
        /// <param name="columnCNName"></param>
        /// <param name="nameSpace"></param>
        /// <param name="foldername"></param>
        /// <param name="tableId"></param>
        /// <param name="isTreeLoad"></param>
        /// <returns></returns>
        private int InitTable(int parentId, string tableName, string columnCNName, string nameSpace, string foldername, int tableId, bool isTreeLoad)
        {
            if (isTreeLoad)
                return tableId;
            if (string.IsNullOrEmpty(tableName))
                return -1;
            tableId = repository.Find(x => x.TableName == tableName, s => s.Table_Id).FirstOrDefault();
            if (tableId > 0)
                return tableId;
            bool isMySql = DBType.Name == DbCurrentType.MySql.ToString();
            Sys_TableInfo tableInfo = new Sys_TableInfo()
            {
                ParentId = parentId,
                ColumnCNName = columnCNName,
                CnName = columnCNName,
                TableName = tableName,
                Namespace = nameSpace,
                FolderName = foldername,
                Enable = 1
            };
            List<Sys_TableColumn> columns = repository.DapperContext
                .QueryList<Sys_TableColumn>(
                isMySql ? GetMySqlStructure(tableName) : GetSqlServerStructure(tableName),
                new { tableName });

            int orderNo = (columns.Count + 10) * 50;
            for (int i = 0; i < columns.Count; i++)
            {
                columns[i].OrderNo = orderNo;
                orderNo = orderNo - 50;
            }

            SetMaxLength(columns);
            base.Add<Sys_TableColumn>(tableInfo, columns, false);
            return tableInfo.Table_Id;
        }

        /// <summary>
        /// 界面加载表的配置信息
        /// </summary>
        /// <param name="parentId"></param>
        /// <param name="tableName"></param>
        /// <param name="columnCNName"></param>
        /// <param name="nameSpace"></param>
        /// <param name="foldername"></param>
        /// <param name="tableId"></param>
        /// <param name="isTreeLoad">true只加载表数据</param>
        /// <returns></returns>
        public object LoadTable(int parentId, string tableName, string columnCNName, string nameSpace, string foldername, int tableId, bool isTreeLoad)
        {
            if (!UserContext.Current.IsSuperAdmin && !isTreeLoad)
            {
                return new WebResponseContent().Error("只有超级管理员才能进行此操作");
            }
            tableId = InitTable(parentId, tableName?.Trim(), columnCNName, nameSpace, foldername, tableId, isTreeLoad);
            Sys_TableInfo tableInfo = repository
                .FindAsIQueryable(x => x.Table_Id == tableId)
                .Include(c => c.TableColumns)
                .FirstOrDefault();
            if (tableInfo.TableColumns != null)
            {
                tableInfo.TableColumns = tableInfo.TableColumns.OrderByDescending(x => x.OrderNo).ToList();
            }
            return new WebResponseContent().OK(null, tableInfo);
        }

        public async Task<WebResponseContent> DelTree(int table_Id)
        {
            if (table_Id == 0) return new WebResponseContent().Error("没有传入参数");
            Sys_TableInfo tableInfo = await repository.FindAsIQueryable(x => x.Table_Id == table_Id)
                .Include(c => c.TableColumns)
                .FirstOrDefaultAsync();
            if (tableInfo == null) return new WebResponseContent().OK();
            if (tableInfo.TableColumns != null && tableInfo.TableColumns.Count > 0)
            {
                return new WebResponseContent().Error("当前删除的节点存在表结构信息,只能删除空节点");
            }
            if (repository.Exists(x => x.ParentId == table_Id))
            {
                return new WebResponseContent().Error("当前删除的节点存在子节点，不能删除");
            }
            repository.Delete(tableInfo, true);
            return new WebResponseContent().OK();
        }

        /// <summary>
        /// 生成表格的columns的配置信息
        /// </summary>
        /// <param name="list"></param>
        /// <param name="expressField"></param>
        /// <param name="detail"></param>
        /// <param name="vue"></param>
        /// <returns></returns>
        private StringBuilder GetGridColumns(List<Sys_TableColumn> list, string expressField, bool detail, bool vue = false)
        {
            totalCol = 0;
            totalWidth = 0;
            StringBuilder sb = new StringBuilder();

            bool sort = false;
            foreach (Sys_TableColumn item in list.OrderByDescending(x => x.OrderNo))
            {
                if (item.IsColumnData == 0) { continue; }
                sb.Append("{field:'" + item.ColumnName + "',");
                sb.Append("title:'" + (string.IsNullOrEmpty(item.ColumnCnName) ? item.ColumnName : item.ColumnCnName) + "',");
                if (vue)
                {
                    string colType = item.ColumnType.ToLower();
                    if (item.IsImage == 1)
                    {
                        colType = "img";
                    }
                    else if (item.IsImage == 2)
                    {
                        colType = "excel";
                    }
                    else if (item.IsImage == 3)
                    {
                        colType = "file";
                    }
                    sb.Append("type:'" + colType + "',");
                    if (!string.IsNullOrEmpty(item.DropNo))
                    {
                        sb.Append("bind:{ key:'" + item.DropNo + "',data:[]},");
                    }
                    if (expressField != null && expressField.ToLower() == item.ColumnName.ToLower())
                    {
                        sb.Append("link:true,");
                    }
                }
                else
                {
                    sb.Append("datatype:'" + item.ColumnType + "',");
                }

                sb.Append("width:" + (item.ColumnWidth ?? 90) + ",");
                if (item.IsDisplay == 0)
                {
                    sb.Append("hidden:true,");
                }
                else
                {
                    totalCol++;
                    totalWidth += item.ColumnWidth == null ? 0 : Convert.ToInt32(item.ColumnWidth);
                }
                if (item.IsReadDataset == 1)
                {
                    sb.Append("readonly:true,");
                }
                //detail明细才启用表格编辑
                if (item.EditRowNo != null && item.EditRowNo > 0 && detail)//!string.IsNullOrEmpty(item.EditType))
                {
                    string editText = vue ? "edit" : "editor";
                    if (vue)
                    {
                        sb.Append("edit:{type:'" + item.EditType + "'},");
                    }
                    else
                    {

                        switch (item.EditType)
                        {
                            case "date":
                                sb.Append("editor:'datebox',");
                                break;
                            case "datetime":
                                sb.Append("editor:'datetimebox',");
                                break;
                            case "drop":
                            case "dropList":
                            case "select":
                            case "selectList":
                                if (!vue && !string.IsNullOrEmpty(item.DropNo))
                                {
                                    sb.Append(editText + ": { type: 'combobox', options: optionConfig" + item.DropNo + " },");
                                }
                                else
                                {
                                    sb.Append(editText + ": 'text',");
                                }
                                break;
                            default:
                                sb.Append(editText + ":'text',");
                                break;
                        }
                    }
                }
                if (!vue)
                {
                    //快速查看字段
                    if (expressField != null && expressField.ToLower() == item.ColumnName.ToLower())
                    {
                        sb.Append("formatter:function (val, row, index) { return $.fn.layOut('createViewField',{row:row,val:val,index:index})},");
                    }
                    else if (!string.IsNullOrEmpty(item.Script))
                    {
                        sb.Append("formatter:" + item.Script + ",");
                    }
                    else if (item.IsImage == 1)//启用图片
                    {
                        sb.Append("formatter:function (val, row, index) { return $.fn.layOut('createImageUrl',{row:row,key:'" + item.ColumnName + "'})},");
                    }
                    else if (!string.IsNullOrEmpty(item.DropNo) && !detail)
                    {
                        sb.AppendLine("formatter: function (val, row, index) {");
                        sb.AppendLine(string.Format("    return dataSource{0}.textFormatter(optionConfig{0}, val, row, index);", item.DropNo));
                        sb.AppendLine("    },");
                    }
                }

                if (item.IsNull == 0)
                {
                    sb.Append("require:true,");
                }

                if (item.ColumnType.ToLower() == "datetime" || (item.IsDisplay == 1 & !sort))
                {
                    sb.Append("align:'left',sortable:true},");
                    if (item.IsDisplay == 1)
                    {
                        sort = true;
                    }
                }
                else
                {
                    sb.Append("align:'left'},");
                }
                sb.AppendLine();
                sb.Append("                       ");
            }
            return sb;
        }

        /// <summary>
        /// 创建实体类
        /// </summary>
        /// <param name="sysColumn"></param>
        /// <param name="tableInfo"></param>
        /// <param name="createType">1、创建实体类,2创建apiinput类,3、创建apioutput类</param>
        private string CreateEntityModel(List<Sys_TableColumn> sysColumn, Sys_TableInfo tableInfo, List<TableColumnInfo> tableColumnInfoList, int createType)
        {
            string template = "";
            if (createType == 1)
            {
                template = "DomainModel.html";
            }
            else if (createType == 2)
            {
                template = "ApiInputDomainModel.html";
            }
            else
            {
                template = "ApiOutputDomainModel.html";
            }
            string domainContent = FileHelper.ReadFile("Template\\DomianModel\\" + template);

            StringBuilder AttributeBuilder = new StringBuilder();
            sysColumn = sysColumn.OrderByDescending(c => c.OrderNo).ToList();
            bool addIgnore = false;
            foreach (Sys_TableColumn column in sysColumn)
            {
                column.ColumnType = (column.ColumnType ?? "").Trim();
                AttributeBuilder.Append("/// <summary>");
                AttributeBuilder.Append("\r\n");
                AttributeBuilder.Append("       ///" + column.ColumnCnName + "");
                AttributeBuilder.Append("\r\n");
                AttributeBuilder.Append("       /// </summary>");
                AttributeBuilder.Append("\r\n");
                if (column.IsKey == 1) { AttributeBuilder.Append(@"       [Key]" + ""); AttributeBuilder.Append("\r\n"); }
                AttributeBuilder.Append("       [Display(Name =\"" + (
                    string.IsNullOrEmpty(column.ColumnCnName) ? column.ColumnName : column.ColumnCnName
                    ) + "\")]");
                AttributeBuilder.Append("\r\n");

                TableColumnInfo tableColumnInfo = tableColumnInfoList.Where(x => x.ColumnName.ToLower().Trim() == column.ColumnName.ToLower().Trim()).FirstOrDefault();
                if (tableColumnInfo != null && (tableColumnInfo.ColumnType == "varchar" && column.Maxlength > 8000)
                             || (tableColumnInfo.ColumnType == "nvarchar" && column.Maxlength > 4000))
                {
                    column.Maxlength = 0;
                }

                if (column.ColumnType == "string" && column.Maxlength > 0 && column.Maxlength < 8000)
                {

                    AttributeBuilder.Append("       [MaxLength(" + column.Maxlength + ")]");
                    AttributeBuilder.Append("\r\n");
                }
                //不是数据列的，返回页面数据前不包含此列的数据
                if (column.IsColumnData == 0 && createType == 1)
                {
                    addIgnore = true;
                    AttributeBuilder.Append("       [JsonIgnore]");
                    AttributeBuilder.Append("\r\n");
                }
                //[Column(TypeName="bigint")]如果与字段类型不同会产生异常

                if (tableColumnInfo != null)
                {
                    if (!string.IsNullOrEmpty(tableColumnInfo.Prec_Scale) && !tableColumnInfo.Prec_Scale.EndsWith(",0"))
                    {
                        AttributeBuilder.Append("       [DisplayFormat(DataFormatString=\"" + tableColumnInfo.Prec_Scale + "\")]");
                        AttributeBuilder.Append("\r\n");
                    }

                    if ((column.IsKey == 1 && (column.ColumnType == "string" || column.ColumnType == "uniqueidentifier")) ||
                        tableColumnInfo.ColumnType.ToLower() == "guid"
                        || (IsMysql() && column.ColumnType == "string" && column.Maxlength == 36))
                    {
                        tableColumnInfo.ColumnType = "uniqueidentifier";
                    }

                    string maxLength = string.Empty;
                    if (tableColumnInfo.ColumnType != "uniqueidentifier")
                    {
                        if (column.IsKey != 1 && column.ColumnType.ToLower() == "string")
                        {
                            //没有指定长度的字符串字段 ，如varchar,nvarchar，text等都默认生成varchar(max),nvarchar(max)
                            if (column.Maxlength <= 0
                                || (tableColumnInfo.ColumnType == "varchar" && column.Maxlength > 8000)
                                || (tableColumnInfo.ColumnType == "nvarchar" && column.Maxlength > 4000))
                            {
                                maxLength = "(max)";
                            }
                            else
                            {
                                maxLength = "(" + column.Maxlength + ")";
                            }

                        }
                    }
                    AttributeBuilder.Append("       [Column(TypeName=\"" + tableColumnInfo.ColumnType + maxLength + "\")]");
                    AttributeBuilder.Append("\r\n");


                    //if ((tableColumnInfo.ColumnType == "int" || tableColumnInfo.ColumnType == "bigint" || tableColumnInfo.ColumnType == "long") && column.ColumnType.ToLower() == "string")
                    if (tableColumnInfo.ColumnType == "int" || tableColumnInfo.ColumnType == "bigint" || tableColumnInfo.ColumnType == "long")
                    {
                        column.ColumnType = tableColumnInfo.ColumnType == "int" ? "int" : "long";
                    }
                    if (tableColumnInfo.ColumnType == "bool")
                    {
                        column.ColumnType = "bit";
                    }
                }

                if (column.EditRowNo != null)
                {
                    AttributeBuilder.Append("       [Editable(true)]");
                    AttributeBuilder.Append("\r\n");
                }
                // && column.ColumnType.ToLower() == "string"
                if (column.IsNull == 0 || (createType == 2 && column.ApiIsNull == 0))
                {
                    AttributeBuilder.Append("       [Required(AllowEmptyStrings=false)]");
                    AttributeBuilder.Append("\r\n");
                }
                string columnType = (column.ColumnType == "Date" ? "DateTime" : column.ColumnType).Trim();
                if (tableColumnInfo?.ColumnType?.ToLower() == "guid")
                {
                    columnType = "Guid";
                }
                if (column.ColumnType.ToLower() != "string" && column.IsNull == 1)
                {
                    columnType = columnType + "?";
                }
                //如果主键是string,则默认为是Guid或者使用的是mysql数据，字段类型是字符串并且长度是36则默认为是Guid
                if ((column.IsKey == 1
                    && (column.ColumnType == "string"
                       || column.ColumnType == "uniqueidentifier"))
                       || column.ColumnType == "guid"
                   || (IsMysql() && column.ColumnType == "string" && column.Maxlength == 36))
                {
                    columnType = "Guid" + (column.IsNull == 1 ? "?" : "");
                }
                AttributeBuilder.Append("       public " + columnType + " " + column.ColumnName + " { get; set; }");
                AttributeBuilder.Append("\r\n\r\n       ");
            }
            if (!string.IsNullOrEmpty(tableInfo.DetailName) && createType == 1)
            {
                AttributeBuilder.Append("[Display(Name =\"" + tableInfo.DetailCnName + "\")]");
                AttributeBuilder.Append("\r\n       ");
                //2019.12.20增加明细表属性的ForeignKey配置(EF Core 3.1配项)
                AttributeBuilder.Append("[ForeignKey(\"" + sysColumn.Where(x => x.IsKey == 1).FirstOrDefault().ColumnName + "\")]");
                AttributeBuilder.Append("\r\n       ");
                AttributeBuilder.Append("public List<" + tableInfo.DetailName + "> " + tableInfo.DetailName + " { get; set; }");
                AttributeBuilder.Append("\r\n");
            }
            if (addIgnore && createType == 1)
            {
                domainContent = "using Newtonsoft.Json;\r\n" + domainContent + "\r\n";
            }
            //获取的是本地开发代码所在目录，不是布后的目录
            string mapPath = ProjectPath.GetProjectDirectoryInfo()?.FullName; //new DirectoryInfo(("~/").MapPath()).Parent.FullName;
                                                                              //  string folderPath= string.Format("\\DairyStar.Framework.Core.\\DomainModels\\{0}\\", foldername);
            if (string.IsNullOrEmpty(mapPath))
            {
                return "未找到生成的目录!";
            }
            string[] splitArrr = tableInfo.Namespace.Split('.');
            //    foldername = splitArrr.Length == 2 ? splitArrr[1] : foldername;
            domainContent = domainContent.Replace("{TableName}", tableInfo.TableName).Replace("{AttributeList}", AttributeBuilder.ToString()).Replace("{StartName}", StratName);
            //  {AttributeManager}

            List<string> entityAttribute = new List<string>();
            entityAttribute.Add("TableCnName = \"" + tableInfo.ColumnCNName + "\"");
            if (!string.IsNullOrEmpty(tableInfo.TableTrueName))
            {
                entityAttribute.Add("TableName = \"" + tableInfo.TableTrueName + "\"");
            }
            if (!string.IsNullOrEmpty(tableInfo.DetailName) && createType == 1)
            {
                //  'typeof('+[1,2].join('),typeof(')+')'
                string typeArr = " new Type[] { typeof(" + string.Join("),typeof(", tableInfo.DetailName.Split(',')) + ")}";
                entityAttribute.Add("DetailTable = " + typeArr + "");
            }
            if (!string.IsNullOrEmpty(tableInfo.DetailCnName))
            {

                entityAttribute.Add("DetailTableCnName = \"" + tableInfo.DetailCnName + "\"");
            }
            if (!string.IsNullOrEmpty(tableInfo.DBServer) && createType == 1)
            {
                entityAttribute.Add("DBServer = \"" + tableInfo.DBServer + "\"");
            }

            if (createType == 1)
            {
                if (sysColumn.Any(x => x.ApiInPut > 0))
                {
                    entityAttribute.Add("ApiInput = typeof(Api" + tableInfo.TableName + "Input)");
                }
                if (sysColumn.Any(x => x.ApiOutPut > 0))
                {
                    entityAttribute.Add("ApiOutput = typeof(Api" + tableInfo.TableName + "Output)");
                }
            }
            string modelNameSpace = StratName + ".Entity";
            string tableAttr = string.Join(",", entityAttribute);
            if (tableAttr != "")
            {
                tableAttr = "[Entity(" + tableAttr + ")]";
            }
            //entityAttribute.Add("TableCnName = \"" + tableInfo.ColumnCNName + "\"");
            //if (!string.IsNullOrEmpty(tableInfo.TableTrueName) && tableInfo.TableName != tableInfo.TableTrueName)
            //{
            //    entityAttribute.Add("TableName = \"" + tableInfo.TableTrueName + "\"");
            //    entityAttribute.Add("Table(\"" + tableInfo.TableTrueName + "\")");
            //}
            if (!string.IsNullOrEmpty(tableInfo.TableTrueName) && tableInfo.TableName != tableInfo.TableTrueName)
            {
                string tableTrueName = tableInfo.TableTrueName;
                //2020.06.14 pgsql数据库，设置表名为小写(数据库创建表的时候也要使用小写)
                if (DBType.Name == DbCurrentType.PgSql.ToString())
                {
                    tableTrueName = tableTrueName.ToLower();
                }
                tableAttr = tableAttr + "\r\n[Table(\"" + tableInfo.TableTrueName + "\")]";
            }
            domainContent = domainContent.Replace("{AttributeManager}", tableAttr).Replace("{Namespace}", modelNameSpace);

            string folderName = tableInfo.FolderName;
            string tableName = tableInfo.TableName;
            if (createType == 2)
            {
                folderName = "ApiEntity\\Input";
                tableName = "Api" + tableInfo.TableName + "Input";
            }
            else if (createType == 3)
            {
                folderName = "ApiEntity\\OutPut";
                tableName = "Api" + tableInfo.TableName + "Output";
            }

            FileHelper.WriteFile(
                mapPath +
                string.Format(
                "\\" + modelNameSpace + "\\DomainModels\\{0}\\", folderName
                )
                , tableName + ".cs",
                domainContent);
            if (createType == 1)
            {
                string mappingConfiguration = FileHelper.
              ReadFile("Template\\DomianModel\\MappingConfiguration.html")
              .Replace("{TableName}", tableInfo.TableName).Replace("{Namespace}", modelNameSpace).Replace("{StartName}", StratName);
                FileHelper.WriteFile(
                    mapPath +
                    string.Format("\\" + modelNameSpace + "\\MappingConfiguration\\{0}\\"
                    , tableInfo.FolderName)
                    , tableInfo.TableName + "MapConfig.cs",
                    mappingConfiguration);
            }
            return "";
        }

        private static string[] formType = new string[] { "bigint", "int", "decimal", "float", "byte" };
        private string GetDisplayType(bool search, string searchType, string editType, string columnType)
        {
            string type = "";
            if (search)
            {
                type = searchType == "无" ? "" : searchType ?? "";
            }
            else
            {
                type = editType == "无" ? "" : editType ?? "";
            }
            if (type == "" && formType.Contains(columnType))
            {
                if (columnType == "decimal" || columnType == "float")
                {
                    type = "decimal";
                }
                else
                {
                    type = "number";
                }
            }
            return type;
        }

        private string GetDropString(string dropNo, bool vue)
        {
            if (string.IsNullOrEmpty(dropNo))
                return vue ? "''" : "__[]__";
            if (vue)
                return dropNo;
            return "__" + "optionConfig" + dropNo + "__";
        }

        /// <summary>
        /// 生成查询面板的数据对象结构
        /// </summary>
        /// <param name="list"></param>
        /// <param name="panelHtml"></param>
        /// <param name="keySelector"></param>
        /// <param name="predicate"></param>
        /// <param name="search"></param>
        /// <param name="orderBy"></param>
        /// <param name="vue"></param>
        private void GetPanelData(List<Sys_TableColumn> list, List<List<PanelHtml>> panelHtml, Func<Sys_TableColumn, int?> keySelector, Func<Sys_TableColumn, bool> predicate, bool search, Func<Sys_TableColumn, int?> orderBy, bool vue = false)
        {
            var whereReslut = list.Where(predicate).OrderBy(orderBy).ThenByDescending(c => c.OrderNo).ToList();
            foreach (var item in whereReslut.GroupBy(keySelector))
            {
                panelHtml.Add(item.OrderBy(c => search ? c.SearchColNo : c.EditColNo).Select(
                    x => new PanelHtml
                    {
                        text = x.ColumnCnName ?? x.ColumnName,
                        id = x.ColumnName,
                        displayType = GetDisplayType(search, x.SearchType, x.EditType, x.ColumnType),
                        require = !search && x.IsNull == 0 ? true : false,
                        columnType = vue && x.IsImage == 1 ? "img" : (x.ColumnType ?? "string").ToLower(),
                        disabled = !search && x.IsReadDataset == 1 ? true : false,
                        dataSource = GetDropString(x.DropNo, vue),
                        colSize = search && x.SearchType != "checkbox" ? 0 : (x.ColSize ?? 0)
                    }).ToList());
            }
        }


        private static bool IsMysql()
        {
            return DBType.Name.ToLower() == DbCurrentType.MySql.ToString().ToLower();
        }
        private WebResponseContent ValidColumnString(Sys_TableInfo tableInfo)
        {
            WebResponseContent webResponse = new WebResponseContent(true);
            if (tableInfo.TableColumns == null || tableInfo.TableColumns.Count == 0) return webResponse;

            if (!string.IsNullOrEmpty(tableInfo.DetailName))
            {
                Sys_TableColumn mainTableColumn = tableInfo.TableColumns
                     .Where(x => x.IsKey == 1)
                     // .Select(s => s.ColumnName)
                     .FirstOrDefault();
                if (mainTableColumn == null)
                    return webResponse.Error($"请勾选表[{tableInfo.TableName}]的主键");

                string key = mainTableColumn.ColumnName;

                //明细表外键列的配置信息
                Sys_TableColumn tableColumn = repository
                    .Find<Sys_TableColumn>(x => x.TableName == tableInfo.DetailName && x.ColumnName == key)
                    ?.FirstOrDefault();

                if (tableColumn == null)
                    return webResponse.Error($"明细表必须包括[{tableInfo.TableName}]主键字段[{key}]");

                if (mainTableColumn.ColumnType?.ToLower() != tableColumn.ColumnType?.ToLower())
                {
                    return webResponse.Error($"明细表的字段[{tableColumn.ColumnName}]类型必须与主表的主键的类型相同");
                }

                if (!IsMysql()) return webResponse;

                if (mainTableColumn.ColumnType?.ToLower() == "string"
                    && tableColumn.Maxlength != 36)
                {
                    return webResponse.Error($"主表主键类型为Guid，明细表[{tableInfo.DetailName}]配置的字段[{key}]长度必须是36，请重将明细表字段[{key}]长度设置为36，点击保存与生成Model");
                }


                //mysql如果主键使用的是guid，需要判断明细表的外键是否配置正确


            }

            //if (tableInfo.TableColumns.Exists(x => x.ColumnType == "string" && (x.Maxlength ?? 0) <= 0))
            //{
            //    webResponse.Error("数据类型为string的列，必须输入[列最大长度]的值");
            //}
            return webResponse;
        }


    }
    public class PanelHtml
    {
        public string text { get; set; }

        public string id { get; set; }
        public string displayType { get; set; }
        public string dataSource { get; set; }
        public string columnType { get; set; }
        public bool require { get; set; }
        public bool disabled { get; set; }
        public int colSize { get; set; }
        public int fileMaxCount { get; set; }
    }
}

