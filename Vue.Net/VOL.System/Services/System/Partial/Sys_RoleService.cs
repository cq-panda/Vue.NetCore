using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.UserManager;
using VOL.Core.Utilities;
using VOL.Entity;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_RoleService
    {

        public override PageGridData<Sys_Role> GetPageData(PageDataOptions pageData)
        {
            //角色Id=1默认为超级管理员角色，界面上不显示此角色
            QueryRelativeExpression = (IQueryable<Sys_Role> queryable) =>
            {
                return queryable.Where(x => x.Role_Id > 1);
            };
            return base.GetPageData(pageData);
        }
        /// <summary>
        /// 编辑权限时，获取当前用户的所有菜单权限
        /// </summary>
        /// <returns></returns>
        public async Task<WebResponseContent> GetCurrentUserTreePermission()
        {
            return await GetUserTreePermission(UserContext.Current.RoleId);
        }

        /// <summary>
        /// 编辑权限时，获取指定角色的所有菜单权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> GetUserTreePermission(int roleId)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (roleId != 1)
            {
                if (!(await GetAllChildren(UserContext.Current.RoleId)).Exists(x => x.Id == roleId))
                {
                    return webResponse.Error("没有权限获取此角色的权限信息");
                }
            }
            //获取用户权限
            List<Permissions> permissions = UserContext.Current.GetPermissions(roleId);
            //权限用户权限查询所有的菜单信息
            List<Sys_Menu> menus = await Task.Run(() => Sys_MenuService.Instance.GetUserMenuList(roleId));
            //获取当前用户权限如:(Add,Search)对应的显示文本信息如:Add：添加，Search:查询
            var data = menus.Select(x => new UserPermissions
            {
                Id = x.Menu_Id,
                Pid = x.ParentId,
                Text = x.MenuName,
                Actions = GetActions(x.Menu_Id, x.Actions, permissions, roleId)
            });
            return webResponse.OK(null, data);
        }

        private List<Sys_Actions> GetActions(int menuId, List<Sys_Actions> menuActions, List<Permissions> permissions, int roleId)
        {
            if (UserContext.IsRoleIdSuperAdmin(roleId))
            {
                return menuActions;
            }

            return menuActions.Where(p => permissions
                 .Exists(w => menuId == w.Menu_Id
                 && w.UserAuthArr.Contains(p.Value)))
                  .ToList();
        }

        private List<RoleNodes> rolesChildren = new List<RoleNodes>();

        /// <summary>
        /// 编辑权限时获取当前用户下的所有角色与当前用户的菜单权限
        /// </summary>
        /// <returns></returns>
        public async Task<WebResponseContent> GetCurrentTreePermission()
        {
            WebResponseContent webResponse = await GetCurrentUserTreePermission();
            int roleId = UserContext.Current.RoleId;
            return new WebResponseContent().OK(null, new
            {
                tree = webResponse.Data,
                roles = await GetAllChildren(roleId)
            });
        }

        private List<RoleNodes> roles = null;
        /// <summary>
        /// 此处将所有角色添加到缓存中，待开发....
        /// 获取当前角色下的所有角色
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public async Task<List<RoleNodes>> GetAllChildren(int roleId)
        {
            roles = await repository
              .FindAsync(
              x => x.Enable == 1 && x.Role_Id > 1,
              s => new RoleNodes() { Id = s.Role_Id, ParentId = s.ParentId, RoleName = s.RoleName });
            if (roleId == 1)
            {
                return roles;
            }
            rolesChildren = GetChildren(roleId);
            return roles;
        }


        public async Task<List<int>> GetAllChildrenRoleId(int roleId)
        {
            return (await GetAllChildren(roleId)).Select(x => x.Id).ToList();
        }

        /// <summary>
        /// 递归获取所有子节点权限
        /// </summary>
        /// <param name="roleId"></param>
        private List<RoleNodes> GetChildren(int roleId)
        {
            roles.ForEach(x =>
            {
                if (x.ParentId == roleId)
                {
                    rolesChildren.Add(x);
                    GetChildren(x.Id);
                }
            });
            return rolesChildren;
        }

        /// <summary>
        /// 保存角色权限
        /// </summary>
        /// <param name="userPermissions"></param>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> SavePermission(List<UserPermissions> userPermissions, int roleId)
        {
            WebResponseContent webResponse = new WebResponseContent();
            string message = "";
            try
            {
                UserInfo user = UserContext.Current.UserInfo;
                if (!(await GetAllChildren(user.Role_Id)).Exists(x => x.Id == roleId))
                    return webResponse.Error("没有权限修改此角色的权限信息");
                //当前用户的权限
                List<Permissions> permissions = UserContext.Current.Permissions;

                List<int> originalMeunIds = new List<int>();
                //被分配角色的权限
                List<Sys_RoleAuth> roleAuths = await repository.FindAsync<Sys_RoleAuth>(x => x.Role_Id == roleId);
                List<Sys_RoleAuth> updateAuths = new List<Sys_RoleAuth>();
                foreach (UserPermissions x in userPermissions)
                {
                    Permissions per = permissions.Where(p => p.Menu_Id == x.Id).FirstOrDefault();
                    //不能分配超过当前用户的权限
                    if (per == null) continue;
                    //per.UserAuthArr.Contains(a.Value)校验权限范围
                    string[] arr = x.Actions == null || x.Actions.Count == 0
                      ? new string[0]
                      : x.Actions.Where(a => per.UserAuthArr.Contains(a.Value))
                      .Select(s => s.Value).ToArray();

                    //如果当前权限没有分配过，设置Auth_Id默认为0，表示新增的权限
                    var auth = roleAuths.Where(r => r.Menu_Id == x.Id).Select(s => new { s.Auth_Id, s.AuthValue, s.Menu_Id }).FirstOrDefault();
                    string newAuthValue = string.Join(",", arr);
                    //权限没有发生变化则不处理
                    if (auth == null || auth.AuthValue != newAuthValue)
                    {
                        updateAuths.Add(new Sys_RoleAuth()
                        {
                            Role_Id = roleId,
                            Menu_Id = x.Id,
                            AuthValue = string.Join(",", arr),
                            Auth_Id = auth == null ? 0 : auth.Auth_Id,
                            ModifyDate = DateTime.Now,
                            Modifier = user.UserTrueName,
                            CreateDate = DateTime.Now,
                            Creator = user.UserTrueName
                        });
                    }
                    else
                    {
                        originalMeunIds.Add(auth.Menu_Id);
                    }

                }
                //更新权限
                repository.UpdateRange(updateAuths.Where(x => x.Auth_Id > 0), x => new
                {
                    x.Menu_Id,
                    x.AuthValue,
                    x.Modifier,
                    x.ModifyDate
                });
                //新增的权限
                repository.AddRange(updateAuths.Where(x => x.Auth_Id <= 0));

                //获取权限取消的权限
                int[] authIds = roleAuths.Where(x => userPermissions.Select(u => u.Id)
                 .ToList().Contains(x.Menu_Id) || originalMeunIds.Contains(x.Menu_Id))
                .Select(s => s.Auth_Id)
                .ToArray();
                List<Sys_RoleAuth> delAuths = roleAuths.Where(x => x.AuthValue != "" && !authIds.Contains(x.Auth_Id)).ToList();
                delAuths.ForEach(x =>
                {
                    x.AuthValue = "";
                });
                //将取消的权限设置为""
                repository.UpdateRange(delAuths, x => new
                {
                    x.Menu_Id,
                    x.AuthValue,
                    x.Modifier,
                    x.ModifyDate
                });

                int addCount = updateAuths.Where(x => x.Auth_Id <= 0).Count();
                int updateCount = updateAuths.Where(x => x.Auth_Id > 0).Count();
                await repository.SaveChangesAsync();

                string _version = DateTime.Now.ToString("yyyyMMddHHMMssfff");
                //标识缓存已更新
                base.CacheContext.Add(roleId.GetRoleIdKey(), _version);

                webResponse.OK($"保存成功：新增加配菜单权限{addCount}条,更新菜单{updateCount}条,删除权限{delAuths.Count()}条");
            }
            catch (Exception ex)
            {
                message = "异常信息：" + ex.Message + ex.StackTrace + ",";
            }
            finally
            {
                Logger.Info($"权限分配置:{message}{webResponse.Message}");
            }

            return webResponse;
        }


        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            AddOnExecuting = (Sys_Role role, object obj) =>
            {
                return ValidateRoleName(role, x => x.RoleName == role.RoleName);
            };
            return RemoveCache(base.Add(saveDataModel));
        }

        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            return RemoveCache(base.Del(keys, delList));
        }

        private WebResponseContent ValidateRoleName(Sys_Role role, Expression<Func<Sys_Role, bool>> predicate)
        {
            WebResponseContent responseContent = new WebResponseContent(true);
            if (repository.Exists(predicate))
            {
                return responseContent.Error($"角色名【{role.RoleName}】已存在,请设置其他角色名");
            }
            return responseContent;
        }

        public override WebResponseContent Update(SaveModel saveModel)
        {
            UpdateOnExecuting = (Sys_Role role, object obj1, object obj2, List<object> obj3) =>
            {
                return ValidateRoleName(role, x => x.RoleName == role.RoleName && x.Role_Id != role.Role_Id);
            };
            return RemoveCache(base.Update(saveModel));
        }
        private WebResponseContent RemoveCache(WebResponseContent webResponse)
        {
            if (webResponse.Status)
            {
                RoleContext.Refresh();
            }
            return webResponse;
        }
    }

    public class RoleNodes
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string RoleName { get; set; }
    }
    public class UserPermissions
    {
        public int Id { get; set; }
        public int Pid { get; set; }
        public string Text { get; set; }
        public List<Sys_Actions> Actions { get; set; }
    }
}
