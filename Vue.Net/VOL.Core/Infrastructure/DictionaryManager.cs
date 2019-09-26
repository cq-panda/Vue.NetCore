using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.CacheManager;
using VOL.Core.DBManager;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.Core.Infrastructure
{
    public static class DictionaryManager
    {
        private static List<Sys_Dictionary> _dictionaries { get; set; }

        private static object _dicObj = new object();
        private static string _dicVersionn = "";
        public const string Key = "inernalDic";

        public static List<Sys_Dictionary> Dictionaries
        {
            get
            {
                return GetAllDictionary();
            }
        }

        public static List<Sys_Dictionary> GetDictionaries(IEnumerable<string> dicNos)
        {
            return Dictionaries.Where(x => dicNos.Contains(x.DicNo)).ToList();
        }

        public static Sys_Dictionary GetDictionary(string dicNo)
        {
            return Dictionaries.Where(x => x.DicNo == dicNo).FirstOrDefault();
        }

        /// <summary>
        /// 当出现多人请求字典数据时，此方法可能会出现延迟现象(自行根据实际处理)
        /// </summary>
        /// <returns></returns>
        private static List<Sys_Dictionary> GetAllDictionary()
        {
            ICacheService cacheService = AutofacContainerModule.GetService<ICacheService>();
            //每次比较缓存是否更新过，如果更新则重新获取数据
            if (_dictionaries != null && _dicVersionn == cacheService.Get(Key))
            {
                return _dictionaries;
            }

            lock (_dicObj)
            {
                if (_dicVersionn != "" && _dictionaries != null && _dicVersionn == cacheService.Get(Key)) return _dictionaries;
                _dictionaries = DBServerProvider.DbContext
                    .Set<Sys_Dictionary>()
                    .Where(x => x.Enable == 1)
                    .Include(c => c.Sys_DictionaryList).ToList();

                string cacheVersion = cacheService.Get(Key);
                if (string.IsNullOrEmpty(cacheVersion))
                {
                    cacheVersion = DateTime.Now.ToString("yyyyMMddHHMMssfff");
                    cacheService.Add(Key, cacheVersion);
                }
                else
                {
                    _dicVersionn = cacheVersion;
                }
            }
            return _dictionaries;
        }
    }
}
