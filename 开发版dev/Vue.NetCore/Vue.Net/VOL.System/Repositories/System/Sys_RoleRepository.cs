﻿/*
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.System.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.System.Repositories
{
    public partial class Sys_RoleRepository : RepositoryBase<Sys_Role>, ISys_RoleRepository
    {
        public Sys_RoleRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static ISys_RoleRepository Instance
        {
            get { return AutofacContainerModule.GetService<ISys_RoleRepository>(); }
        }
    }
}

