using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;

namespace VOL.System.IServices
{
    public partial interface ISys_DictionaryService
    {
        /// <summary>
        /// 代码生成器获取所有字典项(超级管理权限)
        /// </summary>
        /// <returns></returns>
       Task<List<string>> GetBuilderDictionary();
        Task<object> GetVueDictionary(string[] dicNos);
    }
 }

