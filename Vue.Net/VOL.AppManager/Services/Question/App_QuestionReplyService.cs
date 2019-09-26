/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class App_QuestionReplyService : ServiceBase<App_QuestionReply, IApp_QuestionReplyRepository>, IApp_QuestionReplyService, IDependency
    {
        public App_QuestionReplyService(IApp_QuestionReplyRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IApp_QuestionReplyService Instance
        {
           get { return AutofacContainerModule.GetService<IApp_QuestionReplyService>(); }
        }
    }
}

