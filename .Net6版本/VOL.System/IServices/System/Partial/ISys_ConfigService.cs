/*
*所有关于Sys_Config类的业务代码接口应在此处编写
*/
using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
namespace VOL.System.IServices
{
    public partial interface ISys_ConfigService
    {
        Task<WebResponseContent> GetSysInfo();
    }
}
