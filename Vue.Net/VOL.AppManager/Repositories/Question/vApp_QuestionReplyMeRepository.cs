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
    public partial class vApp_QuestionReplyMeRepository : RepositoryBase<vApp_QuestionReplyMe>, IvApp_QuestionReplyMeRepository
    {
        public vApp_QuestionReplyMeRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static IvApp_QuestionReplyMeRepository Instance
        {
            get { return AutofacContainerModule.GetService<IvApp_QuestionReplyMeRepository>(); }
        }
    }
}

