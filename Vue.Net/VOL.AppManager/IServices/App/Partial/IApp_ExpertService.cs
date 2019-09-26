using VOL.Core.BaseProvider;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using System.Threading.Tasks;

namespace VOL.AppManager.IServices
{
    public partial interface IApp_ExpertService
    {
        Task<ApiResponseContent> ApiQueryByPage(string bizContent);
        Task<object> ApiQueryByPage(int pageIndex);
    }
 }

