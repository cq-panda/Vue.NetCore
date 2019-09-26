using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity
{
    public class SectionPropertyAttribute : Attribute
    {
        /// <summary>
        /// 统计字段的类型
        /// </summary>
        public GridStatType StatType { get; set; }
    }
    public enum GridStatType
    {
        /// <summary>
        /// 求和
        /// </summary>
        SUM = 0,
        /// <summary>
        /// 求平均值
        /// </summary>
        AVG = 1
    }
}
