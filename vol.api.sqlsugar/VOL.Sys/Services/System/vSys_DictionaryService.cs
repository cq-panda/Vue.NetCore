/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.Sys.IRepositories;
using VOL.Sys.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.Sys.Services
{
    public partial class vSys_DictionaryService : ServiceBase<vSys_Dictionary, IvSys_DictionaryRepository>, IvSys_DictionaryService, IDependency
    {
        public vSys_DictionaryService(IvSys_DictionaryRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IvSys_DictionaryService Instance
        {
           get { return AutofacContainerModule.GetService<IvSys_DictionaryService>(); }
        }
    }
}

