/*
*所有关于Sys_Setting类的业务代码接口应在此处编写
*/
using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace VOL.System.IServices
{
    public partial interface ISys_SettingService
    {
        Task<WebResponseContent> Save(Sys_Setting setting);

        Task<WebResponseContent> GetSystemSetting();
    }
}
