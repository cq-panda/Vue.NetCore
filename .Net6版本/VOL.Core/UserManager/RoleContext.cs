using System;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.CacheManager;
using VOL.Core.DBManager;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Entity.DomainModels;

namespace VOL.Core.UserManager
{
    public static class RoleContext
    {

        private static object _RoleObj = new object();
        private static string _RoleVersionn = "";
        public const string Key = "inernalRole";

        private static List<RoleNodes> _roles { get; set; }
        public static List<RoleNodes> GetAllRoleId()
        {
            ICacheService cacheService = AutofacContainerModule.GetService<ICacheService>();
            //每次比较缓存是否更新过，如果更新则重新获取数据
            if (_roles != null && _RoleVersionn == cacheService.Get(Key))
            {
                return _roles;
            }
            lock (_RoleObj)
            {
                if (_RoleVersionn != "" && _roles != null && _RoleVersionn == cacheService.Get(Key)) return _roles;
                _roles = DBServerProvider.DbContext
                  .Set<Sys_Role>()
                   .Where(x => x.Enable == 1)
                   .Select(s => new RoleNodes() { Id = s.Role_Id, ParentId = s.ParentId, RoleName = s.RoleName })
             .ToList();

                string cacheVersion = cacheService.Get(Key);
                if (string.IsNullOrEmpty(cacheVersion))
                {
                    cacheVersion = DateTime.Now.ToString("yyyyMMddHHMMssfff");
                    cacheService.Add(Key, cacheVersion);
                }
                else
                {
                    _RoleVersionn = cacheVersion;
                }
            }
            return _roles;
        }

        public static void Refresh()
        {
            AutofacContainerModule.GetService<ICacheService>().Remove(Key);
        }
        /// <summary>
        /// 
        /// 获取当前角色下的所有角色(不包括自己的角色)
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public static List<RoleNodes> GetAllChildren(int roleId)
        {
            if (roleId <= 0) return null;
            var roles = GetAllRoleId();
            if (UserContext.IsRoleIdSuperAdmin(roleId)) return roles;
            Dictionary<int, bool> completedRoles = new Dictionary<int, bool>();
            List<RoleNodes> rolesChildren = new List<RoleNodes>();
            var list= GetChildren(roles, rolesChildren, roleId, completedRoles);
            //2021.07.11增加无限递归异常数据移除当前节点
            if (list.Any(x=>x.Id==roleId))
            {
                return list.Where(x => x.Id != roleId).ToList();
            }
            return list;
        }
        public static List<int> GetAllChildrenIds(int roleId)
        {
            return GetAllChildren(roleId)?.Select(x => x.Id)?.ToList();
        }
        /// <summary>
        /// 递归获取所有子节点权限
        /// </summary>
        /// <param name="roleId"></param>
        private static List<RoleNodes> GetChildren(List<RoleNodes> roles, List<RoleNodes> rolesChildren, int roleId, Dictionary<int, bool> completedRoles)
        {
            //2021.07.11修复不能获取三级以下角色的问题
            roles.ForEach(x =>
            {
                if (x.ParentId == roleId)
                {
                    if (completedRoles.TryGetValue(x.Id, out bool isWrite))
                    {
                        if (!isWrite)
                        {
                            roles.Where(x => x.Id == roleId).FirstOrDefault().ParentId = 0;
                            Logger.Error($"获取子角色异常RoleContext,角色id:{x.Id}");
                            Console.WriteLine($"获取子角色异常RoleContext,角色id:{x.Id}");
                            completedRoles[x.Id] = true;
                        }
                        return;
                    }
                    if (!rolesChildren.Any(c => c.Id == x.Id))
                    {
                        rolesChildren.Add(x);
                    }
                    completedRoles.Add(x.Id, false);
                    GetChildren(roles, rolesChildren, x.Id, completedRoles);
                }
            });
            return rolesChildren;
        }
        /// <summary>
        /// 获取当前角色下的所有用户
        /// </summary>
        /// <returns></returns>
        public static IQueryable<int> GetCurrentAllChildUser()
        {
            var roles = GetAllChildrenIds(UserContext.Current.RoleId);
            if (roles == null)
            {
                throw new Exception("未获取到当前角色");
            }
            return DBServerProvider.DbContext
                  .Set<Sys_User>()
                  .Where(u => roles.Contains(u.Role_Id)).Select(s => s.User_Id);

        }
    }
    public class RoleNodes
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string RoleName { get; set; }
    }
}
