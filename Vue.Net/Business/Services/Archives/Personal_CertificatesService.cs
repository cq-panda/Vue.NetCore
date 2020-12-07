/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下Personal_CertificatesService与IPersonal_CertificatesService中编写
 */
using Business.IRepositories;
using Business.IServices;
using Microsoft.AspNetCore.Hosting;
using System.Threading.Tasks;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Entity.ViewModels;

namespace Business.Services
{
    public partial class Personal_CertificatesService : ServiceBase<Personal_Certificates, IPersonal_CertificatesRepository>, IPersonal_CertificatesService, IDependency
    {
        private readonly IWebHostEnvironment _hostingEnvironment;
        public Personal_CertificatesService(IPersonal_CertificatesRepository repository, IWebHostEnvironment hostingEnvironment)
             : base(repository) 
        { 
           Init(repository);
            this._hostingEnvironment = hostingEnvironment;
        }
        public static IPersonal_CertificatesService Instance
        {
           get { return AutofacContainerModule.GetService<IPersonal_CertificatesService>(); }
        }
    }
}
