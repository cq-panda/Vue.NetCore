/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹ISys_ConfigurationRepository编写接口
 */
using System.Threading.Tasks;
using VOL.Core.Enums;

namespace VOL.System.IRepositories
{
    /// <summary>
    /// 配置提供器接口
    /// </summary>
    public partial interface ISys_ConfigurationRepository
    {
        /// <summary>
        /// 获取配置Json值
        /// </summary>
        /// <param name="type"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        Task<string> GetJson(string code);

        /// <summary>
        /// 保存配置Json值
        /// </summary>
        /// <param name="type"></param>
        /// <param name="code"></param>
        /// <param name="json"></param>
        /// <returns></returns>
        Task<bool> SaveJson(string code, string json);
    }
}
