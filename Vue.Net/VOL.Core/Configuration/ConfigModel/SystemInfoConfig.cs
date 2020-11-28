using Newtonsoft.Json;
using System;
using VOL.Core.Configuration.ConfigModel;

namespace VOL.Core.Configuration
{
    /// <summary>
    /// 系统配置
    /// </summary>
    public class SystemInfoConfig : IConfig
    {
        /// <summary>
        /// 系统标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Logo文件路径
        /// </summary>
        public Logo[] Logo { get; set; }

        /// <summary>
        /// 版权声明
        /// </summary>
        public string Copyright { get; set; }

        /// <summary>
        /// 用户页(修改时间)
        /// </summary>
        public DateTime? ModifyDate { get; set; }
    }

    public class Logo
    {
        //使用小写名称配合前端
        public string name { get; set; }
        public string path { get; set; }
    }
}
