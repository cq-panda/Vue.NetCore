using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using VOL.Core.BaseProvider;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Infrastructure;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_DictionaryService
    {
        protected override void Init(IRepository<Sys_Dictionary> repository)
        {
        }
        /// <summary>
        /// 代码生成器获取所有字典项编号(超级管理权限)
        /// </summary>
        /// <returns></returns>
        public async Task<List<string>> GetBuilderDictionary()
        {
            return await repository.FindAsync(x => 1 == 1, s => s.DicNo);
        }

        public List<Sys_Dictionary> Dictionaries
        {
            get { return DictionaryManager.Dictionaries; }
        }

        public async Task<object> GetVueDictionary(string[] dicNos)
        {
            if (dicNos == null || dicNos.Count() == 0) return new string[] { };
            var dicConfig = await Task.FromResult(
                      DictionaryManager.GetDictionaries(dicNos, false).Select(s => new
                      {
                          dicNo = s.DicNo,
                          config = s.Config,
                          dbSql = s.DbSql,
                          list = s.Sys_DictionaryList.OrderByDescending(o => o.OrderNo)
                           .Select(list => new { key = list.DicValue, value = list.DicName })
                      }).ToList());

            object GetSourceData(string dicNo, string dbSql, object data)
            {
                //  2020.05.01增加根据用户信息加载字典数据源sql
                dbSql = DictionaryHandler.GetCustomDBSql(dicNo, dbSql);
                if (string.IsNullOrEmpty(dbSql))
                {
                    return data as object;
                }
                return repository.DapperContext.QueryList<object>(dbSql, null);
            }
            return dicConfig.Select(item => new
            {
                item.dicNo,
                item.config,
                data = GetSourceData(item.dicNo, item.dbSql, item.list)
            }).ToList();
        }


        /// <summary>
        /// 通过远程搜索
        /// </summary>
        /// <param name="dicNo"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<object> GetSearchDictionary(string dicNo, string value)
        {
            if (string.IsNullOrEmpty(dicNo) || string.IsNullOrEmpty(value))
            {
                return null;
            }
            //  2020.05.01增加根据用户信息加载字典数据源sql
            string sql = Dictionaries.Where(x => x.DicNo == dicNo).FirstOrDefault()?.DbSql;
            sql = DictionaryHandler.GetCustomDBSql(dicNo, sql);
            if (string.IsNullOrEmpty(sql))
            {
                return null;
            }
            sql = $"SELECT * FROM ({sql}) AS t WHERE value LIKE @value";
            return await Task.FromResult(repository.DapperContext.QueryList<object>(sql, new { value = "%" + value + "%" }));
        }

        /// <summary>
        /// 表单设置为远程查询，重置或第一次添加表单时，获取字典的key、value
        /// </summary>
        /// <param name="dicNo"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<object> GetRemoteDefaultKeyValue(string dicNo, string key)
        {
            return await Task.FromResult(1);
            //if (string.IsNullOrEmpty(dicNo) || string.IsNullOrEmpty(key))
            //{
            //    return null;
            //}
            //string sql = Dictionaries.Where(x => x.DicNo == dicNo).FirstOrDefault()?.DbSql;
            //if (string.IsNullOrEmpty(sql))
            //{
            //    return null;
            //}
            //sql = $"SELECT * FROM ({sql}) AS t WHERE t.key = @key";
            //return await Task.FromResult(repository.DapperContext.QueryFirst<object>(sql, new { key }));
        }


        /// <summary>
        ///  table加载数据后刷新当前table数据的字典项(适用字典数据量比较大的情况)
        /// </summary>
        /// <param name="keyData"></param>
        /// <returns></returns>
        public object GetTableDictionary(Dictionary<string, object[]> keyData)
        {
            // 2020.08.06增加pgsql获取数据源
            if (DBType.Name == DbCurrentType.PgSql.ToString())
            {
                return GetPgSqlTableDictionary(keyData);
            }
            var dicInfo = Dictionaries.Where(x => keyData.ContainsKey(x.DicNo) && !string.IsNullOrEmpty(x.DbSql))
                .Select(x => new { x.DicNo, x.DbSql })
                .ToList();
            List<object> list = new List<object>();
            string keySql = DBType.Name == DbCurrentType.MySql.ToString() ? "t.key" : "t.[key]";
            dicInfo.ForEach(x =>
            {
                if (keyData.TryGetValue(x.DicNo, out object[] data))
                {
                    //  2020.05.01增加根据用户信息加载字典数据源sql
                    string sql = DictionaryHandler.GetCustomDBSql(x.DicNo, x.DbSql);
                    sql = $"SELECT * FROM ({sql}) AS t WHERE " +
                   $"{keySql}" +
                   $" in @data";
                    list.Add(new { key = x.DicNo, data = repository.DapperContext.QueryList<object>(sql, new { data }) });
                }
            });
            return list;
        }

        /// <summary>
        ///  2020.08.06增加pgsql获取数据源
        /// </summary>
        /// <param name="keyData"></param>
        /// <returns></returns>
        public object GetPgSqlTableDictionary(Dictionary<string, object[]> keyData)
        {
            var dicInfo = Dictionaries.Where(x => keyData.ContainsKey(x.DicNo) && !string.IsNullOrEmpty(x.DbSql))
                .Select(x => new { x.DicNo, x.DbSql })
                .ToList();
            List<object> list = new List<object>();

            dicInfo.ForEach(x =>
            {
                if (keyData.TryGetValue(x.DicNo, out object[] data))
                {
                    string sql = DictionaryHandler.GetCustomDBSql(x.DicNo, x.DbSql);
                    sql = $"SELECT * FROM ({sql}) AS t WHERE t.key=any(@data)";
                    list.Add(new { key = x.DicNo, data = repository.DapperContext.QueryList<object>(sql, new { data = data.Select(s => s.ToString()).ToList() }) });
                }
            });
            return list;
        }


        public override PageGridData<Sys_Dictionary> GetPageData(PageDataOptions pageData)
        {
            //增加查询条件
            base.QueryRelativeExpression = (IQueryable<Sys_Dictionary> fun) =>
            {
                return fun.Where(x => 1 == 1);
            };
            return base.GetPageData(pageData);
        }
        public override WebResponseContent Update(SaveModel saveDataModel)
        {
            if (saveDataModel.MainData.DicKeyIsNullOrEmpty("DicNo")
                || saveDataModel.MainData.DicKeyIsNullOrEmpty("Dic_ID"))
                return base.Add(saveDataModel);
            //判断修改的字典编号是否在其他ID存在
            string dicNo = saveDataModel.MainData["DicNo"].ToString().Trim();
            if (base.repository.Exists(x => x.DicNo == dicNo && x.Dic_ID != saveDataModel.MainData["Dic_ID"].GetInt()))
                return new WebResponseContent().Error($"字典编号:{ dicNo}已存在。!");

            base.UpdateOnExecuting = (Sys_Dictionary dictionary, object addList, object editList, List<object> obj) =>
            {
                List<Sys_DictionaryList> listObj = new List<Sys_DictionaryList>();
                listObj.AddRange(addList as List<Sys_DictionaryList>);
                listObj.AddRange(editList as List<Sys_DictionaryList>);

                WebResponseContent _responseData = CheckKeyValue(listObj);
                if (!_responseData.Status) return _responseData;

                dictionary.DbSql = SqlFilters(dictionary.DbSql);
                return new WebResponseContent(true);
            };
            return RemoveCache(base.Update(saveDataModel));

        }


        private WebResponseContent CheckKeyValue(List<Sys_DictionaryList> dictionaryLists)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (dictionaryLists == null || dictionaryLists.Count == 0) return webResponse.OK();

            if (dictionaryLists.GroupBy(g => g.DicName).Any(x => x.Count() > 1))
                return webResponse.Error("【字典项名称】不能有重复的值");

            if (dictionaryLists.GroupBy(g => g.DicValue).Any(x => x.Count() > 1))
                return webResponse.Error("【字典项Key】不能有重复的值");

            return webResponse.OK();
        }

        private static string SqlFilters(string source)
        {
            if (string.IsNullOrEmpty(source)) return source;

            //   source = source.Replace("'", "''");
            source = Regex.Replace(source, "-", "", RegexOptions.IgnoreCase);
            //去除执行SQL语句的命令关键字
            source = Regex.Replace(source, "insert", "", RegexOptions.IgnoreCase);
            // source = Regex.Replace(source, "sys.", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "update", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "delete", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "drop", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "truncate", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "declare", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "xp_cmdshell", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "/add", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "net user", "", RegexOptions.IgnoreCase);
            //去除执行存储过程的命令关键字 
            source = Regex.Replace(source, "exec", "", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "execute", "", RegexOptions.IgnoreCase);
            //去除系统存储过程或扩展存储过程关键字
            source = Regex.Replace(source, "xp_", "x p_", RegexOptions.IgnoreCase);
            source = Regex.Replace(source, "sp_", "s p_", RegexOptions.IgnoreCase);
            //防止16进制注入
            source = Regex.Replace(source, "0x", "0 x", RegexOptions.IgnoreCase);

            return source;
        }
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            if (saveDataModel.MainData.DicKeyIsNullOrEmpty("DicNo")) return base.Add(saveDataModel);

            string dicNo = saveDataModel.MainData["DicNo"].ToString();
            if (base.repository.Exists(x => x.DicNo == dicNo))
                return new WebResponseContent().Error("字典编号:" + dicNo + "已存在");

            base.AddOnExecuting = (Sys_Dictionary dic, object obj) =>
            {
                WebResponseContent _responseData = CheckKeyValue(obj as List<Sys_DictionaryList>);
                if (!_responseData.Status) return _responseData;

                dic.DbSql = SqlFilters(dic.DbSql);
                return new WebResponseContent(true);
            };
            return RemoveCache(base.Add(saveDataModel));
        }

        public override WebResponseContent Del(object[] keys, bool delList = false)
        {
            //delKeys删除的key
            base.DelOnExecuting = (object[] delKeys) =>
            {
                return new WebResponseContent(true);
            };
            //true将子表数据同时删除
            return RemoveCache(base.Del(keys, true));
        }

        private WebResponseContent RemoveCache(WebResponseContent webResponse)
        {
            if (webResponse.Status)
            {
                CacheContext.Remove(DictionaryManager.Key);
            }
            return webResponse;
        }
    }
}

