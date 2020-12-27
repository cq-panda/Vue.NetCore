using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_MenuService
    {
        /// <summary>
        /// 菜单静态化处理，每次获取菜单时先比较菜单是否发生变化，如果发生变化从数据库重新获取，否则直接获取_menus菜单
        /// </summary>
        private static List<Sys_Menu> _menus { get; set; }

        /// <summary>
        /// 从数据库获取菜单时锁定的对象
        /// </summary>
        private static object _menuObj = new object();

        /// <summary>
        /// 当前服务器的菜单版本
        /// </summary>
        private static string _menuVersionn = "";

        private const string _menuCacheKey = "inernalMenu";

        /// <summary>
        /// 编辑修改菜单时,获取所有菜单
        /// </summary>
        /// <returns></returns>
        public async Task<object> GetMenu()
        {
            //  DBServerProvider.SqlDapper.q
            return (await repository.FindAsync(x => 1 == 1, a =>
             new
             {
                 id = a.Menu_Id,
                 parentId = a.ParentId,
                 name = a.MenuName,
                 a.OrderNo
             })).OrderByDescending(a => a.OrderNo)
                .ThenByDescending(q => q.parentId).ToList();

        }

        private List<Sys_Menu> GetAllMenu()
        {
            //每次比较缓存是否更新过，如果更新则重新获取数据
            if (_menuVersionn != "" && _menuVersionn == CacheContext.Get(_menuCacheKey))
            {
                return _menus ?? new List<Sys_Menu>();
            }
            lock (_menuObj)
            {
                if (_menuVersionn != "" && _menus != null) return _menus;
                //2020.12.27增加菜单界面上不显示，但可以分配权限
                _menus = repository.FindAsIQueryable(x => x.Enable == 1 || x.Enable == 2)
                    .OrderByDescending(a => a.OrderNo)
                    .ThenByDescending(q => q.ParentId).ToList();

                _menus.ForEach(x =>
                {
                    if (!string.IsNullOrEmpty(x.Auth) && x.Auth.Length > 10)
                    {
                        try
                        {
                            x.Actions = x.Auth.DeserializeObject<List<Sys_Actions>>();
                        }
                        catch { }
                    }
                    if (x.Actions == null) x.Actions = new List<Sys_Actions>();
                });

                string cacheVersion = CacheContext.Get(_menuCacheKey);
                if (string.IsNullOrEmpty(cacheVersion))
                {
                    cacheVersion = DateTime.Now.ToString("yyyyMMddHHMMssfff");
                    CacheContext.Add(_menuCacheKey, cacheVersion);
                }
                else
                {
                    _menuVersionn = cacheVersion;
                }
            }
            return _menus;
        }

        /// <summary>
        /// 获取当前用户有权限查看的菜单
        /// </summary>
        /// <returns></returns>
        public List<Sys_Menu> GetCurrentMenuList()
        {
            int roleId = UserContext.Current.RoleId;
            return GetUserMenuList(roleId);
        }


        public List<Sys_Menu> GetUserMenuList(int roleId)
        {
            if (UserContext.IsRoleIdSuperAdmin(roleId))
            {
                return GetAllMenu();
            }
            List<int> menuIds = UserContext.Current.GetPermissions(roleId).Select(x => x.Menu_Id).ToList();
            return GetAllMenu().Where(x => menuIds.Contains(x.Menu_Id)).ToList();
        }

        /// <summary>
        /// 获取当前用户所有菜单与权限
        /// </summary>
        /// <returns></returns>
        public async Task<object> GetCurrentMenuActionList()
        {
            return await GetMenuActionList(UserContext.Current.RoleId);
        }

        /// <summary>
        /// 根据角色ID获取菜单与权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public async Task<object> GetMenuActionList(int roleId)
        {
            //2020.12.27增加菜单界面上不显示，但可以分配权限
            if (UserContext.IsRoleIdSuperAdmin(roleId))
            {
                return await Task.Run(() => GetAllMenu().Select(x =>
                new
                {
                    id = x.Menu_Id,
                    name = x.MenuName,
                    url = x.Url,
                    parentId = x.ParentId,
                    icon = x.Icon,
                    x.Enable,
                    permission = x.Actions.Select(s => s.Value).ToArray()
                }).ToList());
            }

            var menu = from a in UserContext.Current.Permissions
                       join b in GetAllMenu()
                       on a.Menu_Id equals b.Menu_Id
                       orderby b.OrderNo descending
                       select new
                       {
                           id = a.Menu_Id,
                           name = b.MenuName,
                           url = b.Url,
                           parentId = b.ParentId,
                           icon = b.Icon,
                           b.Enable,
                           permission = a.UserAuthArr
                       };
            return menu.ToList();
        }

        /// <summary>
        /// 新建或编辑菜单
        /// </summary>
        /// <param name="menu"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> Save(Sys_Menu menu)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (menu == null) return webResponse.Error("没有获取到提交的参数");
            if (menu.Menu_Id > 0 && menu.Menu_Id == menu.ParentId) return webResponse.Error("父级ID不能是当前菜单的ID");
            try
            {
                webResponse = menu.ValidationEntity(x => new { x.MenuName, x.TableName });
                if (!webResponse.Status) return webResponse;
                if (menu.TableName != "/" && menu.TableName != ".")
                {
                    Sys_Menu sysMenu = await repository.FindAsyncFirst(x => x.TableName == menu.TableName);
                    if (sysMenu != null)
                    {
                        if ((menu.Menu_Id > 0 && sysMenu.Menu_Id != menu.Menu_Id)
                            || menu.Menu_Id <= 0)
                        {
                            return webResponse.Error($"视图/表名【{menu.TableName}】已被其他菜单使用");
                        }
                    }
                }

                if (menu.Menu_Id <= 0)
                {
                    repository.Add(menu.SetCreateDefaultVal());
                }
                else
                {
                    //2020.05.07新增禁止选择上级角色为自己
                    if (menu.Menu_Id == menu.ParentId)
                    {
                        return WebResponseContent.Instance.Error($"父级id不能为自己");
                    }
                    if (repository.Exists(x => x.ParentId == menu.Menu_Id && menu.ParentId == x.Menu_Id))
                    {
                        return WebResponseContent.Instance.Error($"不能选择此父级id，选择的父级id与当前菜单形成依赖关系");
                    }
                    repository.Update(menu.SetModifyDefaultVal(), p => new
                    {
                        p.ParentId,
                        p.MenuName,
                        p.Url,
                        p.Auth,
                        p.OrderNo,
                        p.Icon,
                        p.Enable,
                        p.TableName,
                        p.ModifyDate,
                        p.Modifier
                    });
                }
                await repository.SaveChangesAsync();
                _menuVersionn = DateTime.Now.ToString("yyyyMMddHHMMssfff");
                _menus = null;
                webResponse.OK("保存成功", menu);
            }
            catch (Exception ex)
            {
                webResponse.Error(ex.Message);
            }
            finally
            {
                Logger.Info($"表:{menu.TableName},菜单：{menu.MenuName},权限{menu.Auth},{(webResponse.Status ? "成功" : "失败")}{webResponse.Message}");
            }
            return webResponse;

        }

        /// <summary>
        /// 编辑菜单时，获取菜单信息
        /// </summary>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public async Task<object> GetTreeItem(int menuId)
        {
            var sysMenu = (await base.repository.FindAsync(x => x.Menu_Id == menuId))
                .Select(
                p => new
                {
                    p.Menu_Id,
                    p.ParentId,
                    p.MenuName,
                    p.Url,
                    p.Auth,
                    p.OrderNo,
                    p.Icon,
                    p.Enable,
                    p.CreateDate,
                    p.Creator,
                    p.TableName,
                    p.ModifyDate
                }).FirstOrDefault();
            return sysMenu;
        }
    }
}

