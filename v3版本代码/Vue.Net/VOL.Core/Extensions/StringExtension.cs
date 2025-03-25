using System;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.ManageUser;

namespace VOL.Core.Extensions
{
    public static class StringExtension
    {
        public static bool _windows = RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
        public static string ReplacePath(this string path)
        {
            if (string.IsNullOrEmpty(path))
                return "";
            if (_windows)
                return path.Replace("/", "\\");
            return path.Replace("\\", "/");

        }
        private static DateTime dateStart = new DateTime(1970, 1, 1, 8, 0, 0);

        private static long longTime = 621355968000000000;

        private static int samllTime = 10000000;
        /// <summary>
        /// 获取时间戳 
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public static long GetTimeStamp(this DateTime dateTime)
        {
            return (dateTime.ToUniversalTime().Ticks - longTime) / samllTime;
        }
        /// <summary>
        /// 时间戳转换成日期
        /// </summary>
        /// <param name="timeStamp"></param>
        /// <returns></returns>
        public static DateTime GetTimeSpmpToDate(this object timeStamp)
        {
            if (timeStamp == null) return dateStart;
            DateTime dateTime = new DateTime(longTime + Convert.ToInt64(timeStamp) * samllTime, DateTimeKind.Utc).ToLocalTime();
            return dateTime;
        }
        public static string CreateHtmlParas(this string urlPath, int? userId = null)
        {
            if (string.IsNullOrEmpty(urlPath))
                return null;
            userId = userId ?? UserContext.Current.UserInfo.User_Id;
            return $"{urlPath}{(urlPath.IndexOf("?token") > 0 ? "&" : "?")}uid={userId}&rt_v={DateTime.Now.ToString("HHmmss")}";
            //  return urlPath + ((urlPath.IndexOf("?token") > 0 ? "&" : "?") + "uid=" + userId);
        }

        public static bool IsUrl(this string str)
        {
            if (string.IsNullOrEmpty(str))
                return false;
            string Url = @"(http://)?([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?";
            return Regex.IsMatch(str, Url);

        }
        /// <summary>
        /// 判断是不是正确的手机号码
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static bool IsPhoneNo(this string input)
        {
            if (string.IsNullOrEmpty(input))
                return false;
            if (input.Length != 11)
                return false;

            if (new Regex(@"^1[3578][01379]\d{8}$").IsMatch(input)
                || new Regex(@"^1[34578][01256]\d{8}").IsMatch(input)
                || new Regex(@"^(1[012345678]\d{8}|1[345678][0123456789]\d{8})$").IsMatch(input)
                )
                return true;
            return false;
        }

        public static string GetDBCondition(this string stringType)
        {
            string reslut = "";
            switch (stringType?.ToLower())
            {
                case HtmlElementType.droplist:
                case HtmlElementType.selectlist:
                case HtmlElementType.textarea:
                case HtmlElementType.checkbox:
                    reslut = HtmlElementType.Contains;
                    break;
                case HtmlElementType.thanorequal:
                    reslut = HtmlElementType.ThanOrEqual;
                    break;
                case HtmlElementType.lessorequal:
                    reslut = HtmlElementType.LessOrequal;
                    break;
                case HtmlElementType.gt:
                    reslut = HtmlElementType.GT;
                    break;
                case HtmlElementType.lt:
                    reslut = HtmlElementType.lt;
                    break;
                case HtmlElementType.like:
                    reslut = HtmlElementType.like;
                    break;
                case HtmlElementType.startswith:
                    reslut = HtmlElementType.startswith;
                    break;
                case HtmlElementType.endswith:
                    reslut = HtmlElementType.endswith;
                    break;
                default:
                    reslut = HtmlElementType.Equal;
                    break;
            }
            return reslut;
        }

        public static LinqExpressionType GetLinqCondition(this string stringType)
        {
            LinqExpressionType linqExpression;
            switch (stringType)
            {
                case HtmlElementType.Contains:
                    linqExpression = LinqExpressionType.In;
                    break;
                case HtmlElementType.ThanOrEqual:
                    linqExpression = LinqExpressionType.ThanOrEqual;
                    break;
                case HtmlElementType.LessOrequal:
                    linqExpression = LinqExpressionType.LessThanOrEqual;
                    break;
                case HtmlElementType.GT:
                    linqExpression = LinqExpressionType.GreaterThan;
                    break;
                case HtmlElementType.lt:
                    linqExpression = LinqExpressionType.LessThan;
                    break;
                case HtmlElementType.like:
                    linqExpression = LinqExpressionType.Contains;
                    break;
                default:
                    linqExpression = LinqExpressionType.Equal;
                    break;
            }
            return linqExpression;
        }

        public static bool GetGuid(this string guid, out Guid outId)
        {
            Guid emptyId = Guid.Empty;
            return Guid.TryParse(guid, out outId);
        }

        public static bool IsGuid(this string guid)
        {
            Guid newId;
            return guid.GetGuid(out newId);
        }

        public static bool IsInt(this object obj)
        {
            if (obj == null)
                return false;
            bool reslut = Int32.TryParse(obj.ToString(), out int _number);
            return reslut;

        }
        public static bool IsDate(this object str)
        {
            return str.IsDate(out _);
        }
        public static bool IsDate(this object str, out DateTime dateTime)
        {
            dateTime = DateTime.Now;
            if (str == null || str.ToString() == "")
            {
                return false;
            }
            return DateTime.TryParse(str.ToString(), out dateTime);
        }
        /// <summary>
        /// 根据传入格式判断是否为小数
        /// </summary>
        /// <param name="str"></param>
        /// <param name="formatString">18,5</param>
        /// <returns></returns>
        public static bool IsNumber(this string str, string formatString)
        {
            if (string.IsNullOrEmpty(str)) return false;

            return Regex.IsMatch(str, @"^[+-]?\d*[.]?\d*$");
            //int precision = 32;
            //int scale = 5;
            //try
            //{
            //    if (string.IsNullOrEmpty(formatString))
            //    {
            //        precision = 10;
            //        scale = 2;
            //    }
            //    else
            //    {
            //        string[] numbers = formatString.Split(',');
            //        precision = Convert.ToInt32(numbers[0]);
            //        scale = numbers.Length == 0 ? 2 : Convert.ToInt32(numbers[1]);
            //    }
            //}
            //catch { };
            //return IsNumber(str, precision, scale);
        }
        /**/
        /// <summary>
        /// 判断一个字符串是否为合法数字(指定整数位数和小数位数)
        /// </summary>
        /// <param name="str">字符串</param>
        /// <param name="precision">整数位数</param>
        /// <param name="scale">小数位数</param>
        /// <returns></returns>
        public static bool IsNumber(this string str, int precision, int scale)
        {
            if ((precision == 0) && (scale == 0))
            {
                return false;
            }
            string pattern = @"(^\d{1," + precision + "}";
            if (scale > 0)
            {
                pattern += @"\.\d{0," + scale + "}$)|" + pattern;
            }
            pattern += "$)";
            return  Regex.IsMatch(str, pattern);
        }


        public static bool IsNullOrEmpty(this object str)
        {
            if (str == null)
                return true;
            return str.ToString() == "";
        }


        public static int GetInt(this object obj)
        {
            if (obj == null)
                return 0;
            int.TryParse(obj.ToString(), out int _number);
            return _number;

        }

        /// <summary>
        /// 获取 object 中的枚举值
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        public static long GetLong(this object obj)
        {
            if (obj == null)
                return 0;

            try
            {
                return Convert.ToInt64(Convert.ToDouble(obj));
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 获取 object 中的 float
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>

        public static float GetFloat(this object obj)
        {
            if (System.DBNull.Value.Equals(obj) || null == obj)
                return 0;

            try
            {
                return float.Parse(obj.ToString());
            }
            catch
            {
                return 0;
            }
        }

        public static double GetDouble(this object obj)
        {
            if (System.DBNull.Value.Equals(obj) || null == obj)
                return 0;

            try
            {
                return Convert.ToDouble(obj);
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取 object 中的 decimal
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        public static decimal GetDecimal(this object obj)
        {
            if (System.DBNull.Value.Equals(obj) || null == obj)
                return 0;

            try
            {
                return Convert.ToDecimal(obj);
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 获取 object 中的 decimal
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        /// <remarks></remarks>
        public static dynamic GetDynamic(this object obj)
        {
            if (System.DBNull.Value.Equals(obj) || null == obj)
                return null;

            try
            {
                string str = obj.ToString();
                if (str.IsNumber(25, 15)) return Convert.ToDecimal(obj);
                else return str;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static DateTime? GetDateTime(this object obj)
        {
            if (System.DBNull.Value.Equals(obj) || null == obj)
                return null;
            bool result = DateTime.TryParse(obj.ToString(), out DateTime dateTime);
            if (!result)
                return null;
            return dateTime;
        }



        public static object ParseTo(this string str, string type)
        {
            switch (type)
            {
                case "System.Boolean":
                    return ToBoolean(str);
                case "System.SByte":
                    return ToSByte(str);
                case "System.Byte":
                    return ToByte(str);
                case "System.UInt16":
                    return ToUInt16(str);
                case "System.Int16":
                    return ToInt16(str);
                case "System.uInt32":
                    return ToUInt32(str);
                case "System.Int32":
                    return str.ToInt32();
                case "System.UInt64":
                    return ToUInt64(str);
                case "System.Int64":
                    return ToInt64(str);
                case "System.Single":
                    return ToSingle(str);
                case "System.Double":
                    return ToDouble(str);
                case "System.Decimal":
                    return ToDecimal(str);
                case "System.DateTime":
                    return ToDateTime(str);
                case "System.Guid":
                    return ToGuid(str);
            }
            throw new NotSupportedException(string.Format("The string of \"{0}\" can not be parsed to {1}", str, type));
        }

        public static sbyte? ToSByte(this string value)
        {
            sbyte value2;
            if (sbyte.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static byte? ToByte(this string value)
        {
            byte value2;
            if (byte.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static ushort? ToUInt16(this string value)
        {
            ushort value2;
            if (ushort.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static short? ToInt16(this string value)
        {
            if (short.TryParse(value, out short value2))
            {
                return value2;
            }
            return null;
        }

        public static uint? ToUInt32(this string value)
        {
            uint value2;
            if (uint.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static ulong? ToUInt64(this string value)
        {
            ulong value2;
            if (ulong.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static long? ToInt64(this string value)
        {
            long value2;
            if (long.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static float? ToSingle(this string value)
        {
            float value2;
            if (float.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static double? ToDouble(this string value)
        {
            double value2;
            if (double.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static decimal? ToDecimal(this string value)
        {
            decimal value2;
            if (decimal.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static bool? ToBoolean(this string value)
        {
            bool value2;
            if (bool.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }



        public static Guid? ToGuid(this string str)
        {
            Guid value;
            if (Guid.TryParse(str, out value))
            {
                return value;
            }
            return null;
        }

        public static DateTime? ToDateTime(this string value)
        {
            DateTime value2;
            if (DateTime.TryParse(value, out value2))
            {
                return value2;
            }
            return null;
        }

        public static int? ToInt32(this string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return null;
            }
            int value;
            if (int.TryParse(input, out value))
            {
                return value;
            }
            return null;
        }

        /// <summary>
        ///     替换空格字符
        /// </summary>
        /// <param name="input"></param>
        /// <param name="replacement">替换为该字符</param>
        /// <returns>替换后的字符串</returns>
        public static string ReplaceWhitespace(this string input, string replacement = "")
        {
            return string.IsNullOrEmpty(input) ? null : Regex.Replace(input, "\\s", replacement, RegexOptions.Compiled);
        }

        private static char[] randomConstant ={
        '0','1','2','3','4','5','6','7','8','9',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
      };
        /// <summary>
        /// 生成指定长度的随机数
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string GenerateRandomNumber(this int length)
        {
            System.Text.StringBuilder newRandom = new System.Text.StringBuilder(62);
            Random rd = new Random();
            for (int i = 0; i < length; i++)
            {
                newRandom.Append(randomConstant[rd.Next(62)]);
            }
            return newRandom.ToString();
        }

    }
}
