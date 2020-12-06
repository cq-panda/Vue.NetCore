/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 */
using System.Threading.Tasks;
using VOL.Core.BaseProvider;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Entity.ViewModels;

namespace Business.IServices
{
    public partial interface IPersonal_CertificatesService : IService<Personal_Certificates>
    {
        Task<WebResponseContent> OCR(Personal_Certificates personal_Certificates);
        Task<WebResponseContent> SaveOCRInfo(IDCardInfo idCardOCR);
    }
}
