/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下App_ReportPriceService与IApp_ReportPriceService中编写
 */
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class App_ReportPriceService : ServiceBase<App_ReportPrice, IApp_ReportPriceRepository>, IApp_ReportPriceService, IDependency
    {
        public App_ReportPriceService(IApp_ReportPriceRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IApp_ReportPriceService Instance
        {
           get { return AutofacContainerModule.GetService<IApp_ReportPriceService>(); }
        }
    }
}
