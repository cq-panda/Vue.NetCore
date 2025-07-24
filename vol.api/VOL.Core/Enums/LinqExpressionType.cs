using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Enums
{
    public enum LinqExpressionType
    {
        Equal = 0,//=
        NotEqual = 1,//!=
        GreaterThan,//>
        LessThan,//<
        ThanOrEqual,//>=
        LessThanOrEqual,//<=
        In,
        NotIn,
        Contains,//Contains
        Like,//Contains
        LikeStart,
        LikeEnd,
        NotLike,
        NotContains//NotContains
    }
}
