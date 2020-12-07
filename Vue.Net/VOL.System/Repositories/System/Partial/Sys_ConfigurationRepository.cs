/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹Sys_ConfigurationRepository编写代码
 */
using VOL.System.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System;
using VOL.Core.Extensions;
using VOL.Core.Enums;
using System.Threading.Tasks;

namespace VOL.System.Repositories
{
    public partial class Sys_ConfigurationRepository : RepositoryBase<Sys_Configuration>, ISys_ConfigurationRepository
    {

        public Sys_ConfigurationRepository(VOLContext dbContext)
            : base(dbContext)
        {

        }
        public static ISys_ConfigurationRepository Instance
        {
            get { return AutofacContainerModule.GetService<ISys_ConfigurationRepository>(); }
        }

        public async Task<string> GetJson(string code)
        {
            if (code.IsNull())
                return string.Empty;

            var entity = await FindAsyncFirst(f => f.Code == code);
            return entity == null ? string.Empty : entity.Value;
        }

        public async Task<bool> SaveJson(string code, string json)
        {
            if (code.IsNull())
                throw new NullReferenceException("编码不能为空");

            var entity = await FindAsyncFirst(f => f.Code == code) ?? new Sys_Configuration();

            entity.Code = code;
            entity.Value = json;

            if (entity.Id > 0)
            {
                Update(entity, true);
            }
            else
            {
                Add(entity, true);
            }
            return true;
        }
    }
}
