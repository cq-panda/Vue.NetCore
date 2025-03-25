using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.System.IServices
{
    public partial interface ISys_MenuService
    {
        Task<object> GetMenu();
        List<Sys_Menu> GetCurrentMenuList();

        List<Sys_Menu> GetUserMenuList(int roleId);

        Task<object> GetCurrentMenuActionList();

        Task<object> GetMenuActionList(int roleId);
        Task<WebResponseContent> Save(Sys_Menu menu);

        Task<WebResponseContent> DelMenu(int menuId);


        Task<object> GetTreeItem(int menuId);
    }
}

