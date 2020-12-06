/*
*所有关于Sys_Configuration类的业务代码接口应在此处编写
*/
using VOL.Core.Utilities;
using System.Threading.Tasks;
using VOL.Entity.DomainModels.System;

namespace VOL.System.IServices
{
    public partial interface ISys_ConfigurationService
    {
        /// <summary>
        /// 获取配置信息
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        Task<WebResponseContent> GetAsync(int id);

        /// <summary>
        /// 获取配置列表
        /// </summary>
        /// <returns></returns>
        WebResponseContent GetConfigList();

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<WebResponseContent> UpdateAsync(ConfigInfo configInfo);

        Task<WebResponseContent> GetTableDataAsync();

        Task<WebResponseContent> UpdateExportColumnsAsync(ConfigInfo configInfo);
    }
}
