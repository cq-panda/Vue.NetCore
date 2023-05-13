/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下App_ExpertService与IApp_ExpertService中编写
 */
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class App_ExpertService : ServiceBase<App_Expert, IApp_ExpertRepository>, IApp_ExpertService, IDependency
    {
        public App_ExpertService(IApp_ExpertRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IApp_ExpertService Instance
        {
           get { return AutofacContainerModule.GetService<IApp_ExpertService>(); }
        }
    }
}
