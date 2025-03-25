/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹MES_DefectiveProductDisposalRecordRepository编写代码
 */
using VOL.MES.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.DbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.MES.Repositories
{
    public partial class MES_DefectiveProductDisposalRecordRepository : RepositoryBase<MES_DefectiveProductDisposalRecord> , IMES_DefectiveProductDisposalRecordRepository
    {
    public MES_DefectiveProductDisposalRecordRepository(VOLContext dbContext)
    : base(dbContext)
    {

    }
    public static IMES_DefectiveProductDisposalRecordRepository Instance
    {
      get {  return AutofacContainerModule.GetService<IMES_DefectiveProductDisposalRecordRepository>(); } }
    }
}
