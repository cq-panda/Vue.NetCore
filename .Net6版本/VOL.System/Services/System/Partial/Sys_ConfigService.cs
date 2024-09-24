/*
 *所有关于Sys_Config类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_ConfigService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.System.IRepositories;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.Extensions.Caching.Memory;
using VOL.Core.Const;
using System.Collections.Generic;

namespace VOL.System.Services
{
    public partial class Sys_ConfigService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISys_ConfigRepository _repository;//访问数据库

        [ActivatorUtilitiesConstructor]
        public Sys_ConfigService(
            ISys_ConfigRepository dbRepository,
            IHttpContextAccessor httpContextAccessor
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }

        WebResponseContent webResponse = new WebResponseContent();

        public override WebResponseContent Update(SaveModel saveModel)
        {
            UpdateOnExecuted = (Sys_Config sys_Config, object addList, object updateList, List<object> delKeys) =>
            {
                // 如果是CacheConst.KeyConfig的值，则清除缓存
                if (sys_Config.Sys_Flag == 1)
                {
                    IMemoryCache memoryCache = _httpContextAccessor.HttpContext.GetService<IMemoryCache>();
                    memoryCache.Remove($"{CacheConst.KeyConfig}{sys_Config.Con_Code}");
                }
                return webResponse.OK();
            };
            return base.Update(saveModel);
        }

        public async Task<WebResponseContent> GetSysInfo()
        {
            var sysCaptcha = await GetConfigValue<bool>(ConfigConst.SysCaptcha);

            return webResponse.OK(null, new
            {
                SysCaptcha = sysCaptcha
            });
        }


        /// <summary>
        /// 获取参数配置值
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public async Task<T> GetConfigValue<T>(string code)
        {
            if (string.IsNullOrWhiteSpace(code)) return default;
            IMemoryCache memoryCache = _httpContextAccessor.HttpContext.GetService<IMemoryCache>();
            var value = memoryCache.Get<string>($"{CacheConst.KeyConfig}{code}");
            if (string.IsNullOrEmpty(value))
            {
                var config = await _repository.FindAsyncFirst(u => u.Con_Code == code);
                value = config != null ? config.Con_Value : default;
                memoryCache.Set($"{CacheConst.KeyConfig}{code}", value);
            }
            if (string.IsNullOrWhiteSpace(value)) return default;
            return (T)Convert.ChangeType(value, typeof(T));
        }
    }
}
