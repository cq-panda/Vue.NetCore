/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下vProvinceCityService与IvProvinceCityService中编写
 */
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class vProvinceCityService : ServiceBase<vProvinceCity, IvProvinceCityRepository>, IvProvinceCityService, IDependency
    {
        public vProvinceCityService(IvProvinceCityRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IvProvinceCityService Instance
        {
           get { return AutofacContainerModule.GetService<IvProvinceCityService>(); }
        }
    }
}
