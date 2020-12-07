/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下PersonalService与IPersonalService中编写
 */
using Business.IRepositories;
using Business.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace Business.Services
{
    public partial class PersonalService : ServiceBase<Personal, IPersonalRepository>, IPersonalService, IDependency
    {
        public PersonalService(IPersonalRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IPersonalService Instance
        {
           get { return AutofacContainerModule.GetService<IPersonalService>(); }
        }
    }
}
