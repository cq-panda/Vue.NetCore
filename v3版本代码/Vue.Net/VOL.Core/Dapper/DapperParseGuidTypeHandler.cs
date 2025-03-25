using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace VOL.Core.Dapper
{
    public class DapperParseGuidTypeHandler : SqlMapper.TypeHandler<Guid?>
    {
        public override void SetValue(IDbDataParameter parameter, Guid? guid)
        {
            parameter.Value = guid.ToString();
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
}
