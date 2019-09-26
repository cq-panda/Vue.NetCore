using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.System.Services;

namespace VOL.System.IServices
{
    public partial interface ISys_RoleService
    {

        Task<WebResponseContent> GetUserTreePermission(int role_Id);

        Task<WebResponseContent> GetCurrentUserTreePermission();

        Task<WebResponseContent> GetCurrentTreePermission();

        Task<WebResponseContent> SavePermission(List<UserPermissions> userPermissions,int roleId);
        /// <summary>
        /// 获取角色下所有的角色
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        Task<List<RoleNodes>> GetAllChildren(int roleId);

        /// <summary>
        /// 获取角色下所有的角色Id
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        Task<List<int>> GetAllChildrenRoleId(int roleId);
    }
}

