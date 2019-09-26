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
    public partial class App_QuestionService : ServiceBase<App_Question, IApp_QuestionRepository>, IApp_QuestionService, IDependency
    {
        public App_QuestionService(IApp_QuestionRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IApp_QuestionService Instance
        {
           get { return AutofacContainerModule.GetService<IApp_QuestionService>(); }
        }
    }
}

