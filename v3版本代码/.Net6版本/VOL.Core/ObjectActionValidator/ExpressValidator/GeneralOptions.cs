using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.ObjectActionValidator
{
    /// <summary>
    /// 普通参数配置
    /// </summary>
    public class GeneralOptions
    {

        /// <summary>
        /// 自定义验证
        /// </summary>
        /// <param name="generalName"></param>
        /// <param name="customValidator"></param>
        public GeneralOptions(ValidatorGeneral generalName, string CNName, Func<object, ObjectValidatorResult> customValidator)
        {
            this.CNName = CNName;
            this.CustomValidator = customValidator;
            this.Name = generalName.ToString().ToLower();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="generalName">普通参数的名字，与方法参数名字必须一致（不分大小写）,可以直接在ValidatorGeneral上添加</param>
        public GeneralOptions(ValidatorGeneral generalName, string CNName)
        {
            this.Name = generalName.ToString().ToLower();
            this.CNName = CNName;
            this.ParamType = ParamType.String;
        }
        public GeneralOptions(ValidatorGeneral generalName, string CNName, ParamType type)
        {
            this.Name = generalName.ToString().ToLower();
            this.CNName = CNName;
            this.ParamType = ParamType.String;
        }
        public GeneralOptions(ValidatorGeneral generalName, string CNName, int? min, int? max)
        {
            this.Name = generalName.ToString().ToLower();
            this.CNName = CNName;
            this.ParamType = ParamType.String;
            this.Min = min;
            this.Max = max;
        }

        public GeneralOptions(ValidatorGeneral generalName, string CNName, ParamType type, int? min, int? max)
        {
            this.Name = generalName.ToString().ToLower();
            this.CNName = CNName;
            this.ParamType = type;
            this.Min = min;
            this.Max = max;
        }

        public Func<object, ObjectValidatorResult> CustomValidator;
        /// <summary>
        /// 方法上的参数名字
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 中文名字,参数校验错误的提示文字
        /// </summary>
        public string CNName { get; set; }
        /// <summary>
        /// 参数类型，目前只列出了这几种,不够自己再加
        /// </summary>
        public ParamType ParamType { get; set; }
        /// <summary>
        /// 数字为最小值,字符串为最小长度
        /// </summary>
        public int? Min { get; set; }
        /// <summary>
        /// 数字为最大值,字符串为最大长度
        /// </summary>
        public int? Max { get; set; }

    }
    public enum ParamType
    {
        Int,
        //Long,
        //Byte,
        Bool,
        String,
        DateTime,
        Decimal,
        Guid
    }
}
