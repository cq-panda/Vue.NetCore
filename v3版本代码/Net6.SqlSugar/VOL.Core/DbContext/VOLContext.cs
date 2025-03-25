using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyModel;
using Microsoft.Extensions.Logging;
using SqlSugar;
using System;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using VOL.Core.DBManager;
using VOL.Core.DbSqlSugar;
using VOL.Core.Extensions;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.SystemModels;

namespace VOL.Core.DbContext
{
    public class VOLContext : DbContext, IDependency
    {
        public VOLContext() : base()
        {
            base.SqlSugarClient = DbManger.Db;
        }
        public VOLContext(string configId) : base()
        {
            base.SqlSugarClient = DbManger.GetConnection(configId);
        }
    }
}
