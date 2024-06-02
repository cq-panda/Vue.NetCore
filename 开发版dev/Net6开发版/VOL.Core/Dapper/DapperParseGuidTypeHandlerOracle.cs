using Dapper;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.Dapper
{
    public class DapperParseGuidTypeHandlerOracle : TypeHandlerBase<Guid>
    {
        public override void SetValue(IDbDataParameter parameter, Guid value)
        {
            //SetOracleDbTypeOnParameter(parameter, "Raw", 16);
            parameter.Value = value.ToString();
        }

        public override Guid Parse(object value)
        {
            return Guid.Parse(value.ToString());
        }
    }

    public class DapperParseGuidNullTypeHandlerOracle : TypeHandlerBase<Guid?>
    {
        public override void SetValue(IDbDataParameter parameter, Guid? value)
        {
            if (value != null)
            {
                parameter.Value = value.ToString();
            }
        }

        public override Guid? Parse(object value)
        {
            if (value == null || value.ToString() == "")
            {
                return null;
            }
            if (value.GetType() == typeof(string))
            {
                return new Guid((string)value);
            }
            return (Guid)value;
        }
    }

    public abstract class TypeHandlerBase<T> : SqlMapper.TypeHandler<T>
    {
        private class DictionaryKey
        {
            public Type ParameterType { get; set; }
            public string OracleTypeName { get; set; }
        }

        private class DictionaryKeyComparer : IEqualityComparer<DictionaryKey>
        {
            public bool Equals(DictionaryKey x, DictionaryKey y)
            {
                if (x == null && y != null) return false;
                if (x != null && y != null) return false;

                return x.ParameterType == y.ParameterType && x.OracleTypeName.Equals(y.OracleTypeName);
            }

            public int GetHashCode(DictionaryKey obj)
            {
                return 17 + obj.ParameterType.GetHashCode() * 23 + obj.OracleTypeName.GetHashCode() * 31;
            }
        }

        private static readonly ConcurrentDictionary<DictionaryKey, Action<IDbDataParameter>> OracleDbTypeProperty =
            new ConcurrentDictionary<DictionaryKey, Action<IDbDataParameter>>(new DictionaryKeyComparer());

        protected void SetOracleDbTypeOnParameter(IDbDataParameter parameter, string oracleTypeName, int? length = null)
        {
            var setter = OracleDbTypeProperty.GetOrAdd(new DictionaryKey { ParameterType = parameter.GetType(), OracleTypeName = oracleTypeName }, CreateSetTypeAction);
            setter(parameter);
            if (length.HasValue)
            {
                parameter.Size = length.Value;
            }
        }


        private static Action<IDbDataParameter> CreateSetTypeAction(DictionaryKey key)
        {
            Type enumType = key.ParameterType.Assembly.GetType($"{key.ParameterType.Namespace}.OracleDbType");
            var enumValue = Enum.Parse(enumType, key.OracleTypeName);
            var inputVariable = Expression.Parameter(typeof(IDbDataParameter));
            var convertExpression = Expression.Convert(inputVariable, key.ParameterType);

            var expression = Expression.Assign(
                Expression.PropertyOrField(convertExpression, "OracleDbType"),
                Expression.Constant(enumValue));

            return Expression.Lambda<Action<IDbDataParameter>>(expression, inputVariable).Compile();
        }
    }

}
