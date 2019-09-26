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
    public partial class vApp_QuestionMyReplyService : ServiceBase<vApp_QuestionMyReply, IvApp_QuestionMyReplyRepository>, IvApp_QuestionMyReplyService, IDependency
    {
        public vApp_QuestionMyReplyService(IvApp_QuestionMyReplyRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IvApp_QuestionMyReplyService Instance
        {
           get { return AutofacContainerModule.GetService<IvApp_QuestionMyReplyService>(); }
        }
    }
}

