using System;
using System.Linq;
using System.Reflection;

// ReSharper disable once CheckNamespace
namespace VOL.Core.Extensions
{
    /// <summary>
    /// 类型扩展
    /// </summary>
    public static class TypeExtensions
    {
        /// <summary>
        /// 判断属性是否是静态的
        /// </summary>
        /// <param name="property"></param>
        /// <returns></returns>
        public static bool IsStatic(this PropertyInfo property) => (property.GetMethod ?? property.SetMethod).IsStatic;

        /// <summary>
        /// 判断指定类型是否实现于该类型
        /// </summary>
        /// <param name="serviceType"></param>
        /// <param name="implementType"></param>
        /// <returns></returns>
        public static bool IsImplementType(this Type serviceType, Type implementType)
        {
            //泛型
            if (serviceType.IsGenericType)
            {
                if (serviceType.IsInterface)
                {
                    var interfaces = implementType.GetInterfaces();
                    if (interfaces.Any(m => m.IsGenericType && m.GetGenericTypeDefinition() == serviceType))
                    {
                        return true;
                    }
                }
                else
                {
                    if (implementType.BaseType != null && implementType.BaseType.IsGenericType && implementType.BaseType.GetGenericTypeDefinition() == serviceType)
                    {
                        return true;
                    }
                }
            }
            else
            {
                if (serviceType.IsInterface)
                {
                    var interfaces = implementType.GetInterfaces();
                    if (interfaces.Any(m => m == serviceType))
                        return true;
                }
                else
                {
                    if (implementType.BaseType != null && implementType.BaseType == serviceType)
                        return true;
                }
            }
            return false;
        }

        /// <summary>
        /// 判断是否继承自指定的泛型
        /// </summary>
        /// <param name="type"></param>
        /// <param name="generic"></param>
        /// <returns></returns>
        public static bool IsSubclassOfGeneric(this Type type, Type generic)
        {
            while (type != null && type != typeof(object))
            {
                var cur = type.IsGenericType ? type.GetGenericTypeDefinition() : type;
                if (generic == cur)
                {
                    return true;
                }
                type = type.BaseType;
            }
            return false;
        }

        /// <summary>
        /// 判断是否可空类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsNullable(this Type type)
        {
            return type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>);
        }

        /// <summary>
        /// 判断是否是String类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsString(this Type type)
        {
            return type == TypeConst.String;
        }

        /// <summary>
        /// 判断是否是Byte类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsByte(this Type type)
        {
            return type == TypeConst.Byte;
        }

        /// <summary>
        /// 判断是否是Char类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsChar(this Type type)
        {
            return type == TypeConst.Char;
        }

        /// <summary>
        /// 判断是否是Short类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsShort(this Type type)
        {
            return type == TypeConst.Short;
        }

        /// <summary>
        /// 判断是否是Int类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsInt(this Type type)
        {
            return type == TypeConst.Int;
        }

        /// <summary>
        /// 判断是否是Long类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsLong(this Type type)
        {
            return type == TypeConst.Long;
        }

        /// <summary>
        /// 判断是否是Float类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsFloat(this Type type)
        {
            return type == TypeConst.Float;
        }

        /// <summary>
        /// 判断是否是Double类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsDouble(this Type type)
        {
            return type == TypeConst.Double;
        }

        /// <summary>
        /// 判断是否是Decimal类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsDecimal(this Type type)
        {
            return type == TypeConst.Decimal;
        }

        /// <summary>
        /// 判断是否是DateTime类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsDateTime(this Type type)
        {
            return type == TypeConst.DateTime;
        }

        /// <summary>
        /// 判断是否是Guid类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsGuid(this Type type)
        {
            return type == TypeConst.Guid;
        }

        /// <summary>
        /// 判断是否是Bool类型
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsBool(this Type type)
        {
            return type == TypeConst.Bool;
        }
    }

    /// <summary>
    /// 类型常量
    /// </summary>
    public class TypeConst
    {
        /// <summary>
        /// String
        /// </summary>
        public static readonly Type String = typeof(string);

        /// <summary>
        /// Byte
        /// </summary>
        public static readonly Type Byte = typeof(byte);

        /// <summary>
        /// Char
        /// </summary>
        public static readonly Type Char = typeof(char);

        /// <summary>
        /// Short
        /// </summary>
        public static readonly Type Short = typeof(short);

        /// <summary>
        /// Int
        /// </summary>
        public static readonly Type Int = typeof(int);

        /// <summary>
        /// Long
        /// </summary>
        public static readonly Type Long = typeof(long);

        /// <summary>
        /// Float
        /// </summary>
        public static readonly Type Float = typeof(float);

        /// <summary>
        /// Double
        /// </summary>
        public static readonly Type Double = typeof(double);

        /// <summary>
        /// Decimal
        /// </summary>
        public static readonly Type Decimal = typeof(decimal);

        /// <summary>
        /// DateTime
        /// </summary>
        public static readonly Type DateTime = typeof(DateTime);

        /// <summary>
        /// Guid
        /// </summary>
        public static readonly Type Guid = typeof(Guid);

        /// <summary>
        /// Bool
        /// </summary>
        public static readonly Type Bool = typeof(bool);
    }
}
