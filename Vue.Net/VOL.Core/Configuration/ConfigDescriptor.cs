using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using VOL.Core.Configuration.ConfigModel;
using VOL.Core.Enums;

namespace VOL.Core.Configuration
{
    /// <summary>
    /// 配置描述符
    /// </summary>
    public class ConfigDescriptor
    {
        /// <summary>
        /// 实现类型
        /// </summary>
        public Type ImplementType { get; set; }

        /// <summary>
        /// 编码
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 变更事件列表
        /// </summary>
        public List<Type> ChangeEvents { get; set; } = new List<Type>();

        /// <summary>
        /// 实例
        /// </summary>
        [JsonIgnore]
        public IConfig Instance { get; set; }

    }
}
