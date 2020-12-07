using VOL.Core.Configuration.ConfigModel;

namespace VOL.Core.Configuration
{
    /// <summary>
    /// 配置变更事件
    /// </summary>
    public interface IConfigChangeEvent<in TConfig> where TConfig : IConfig
    {
        /// <summary>
        /// 变更事件
        /// </summary>
        /// <param name="newConfig"></param>
        /// <param name="oldConfig"></param>
        void OnChanged(TConfig newConfig, TConfig oldConfig);
    }
}
