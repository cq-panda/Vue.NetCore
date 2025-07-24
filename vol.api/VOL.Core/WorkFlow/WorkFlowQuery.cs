using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.WorkFlow
{
    public static class WorkFlowQuery
    {
        public static IQueryable<Detail> FlowQuery<Detail>(this IQueryable<Detail> query) where Detail : class
        {
            return query;
        }
    }
}
