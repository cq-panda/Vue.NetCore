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
    public partial class vApp_QuestionReplyMeService : ServiceBase<vApp_QuestionReplyMe, IvApp_QuestionReplyMeRepository>, IvApp_QuestionReplyMeService, IDependency
    {
        public vApp_QuestionReplyMeService(IvApp_QuestionReplyMeRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IvApp_QuestionReplyMeService Instance
        {
           get { return AutofacContainerModule.GetService<IvApp_QuestionReplyMeService>(); }
        }
    }
}

