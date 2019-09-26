/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.AppManager.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Repositories
{
    public partial class App_ExpertQuestionRepository : RepositoryBase<App_ExpertQuestion>, IApp_ExpertQuestionRepository
    {
        public App_ExpertQuestionRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static IApp_ExpertQuestionRepository Instance
        {
            get { return AutofacContainerModule.GetService<IApp_ExpertQuestionRepository>(); }
        }
    }
}

