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
                   .Where(x =>true)
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
        /// 获取当前角色下的所有角色(包括自己的角色)
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public static List<RoleNodes> GetAllChildren(int roleId)
        {
            if (roleId <= 0) return new List<RoleNodes>() { };
            var roles = GetAllRoleId();
            if (UserContext.IsRoleIdSuperAdmin(roleId)) return roles;

            var list = GetChildren(roles, roleId);
            //if (list.Any(x => x.Id == roleId))
            //{
            //    return list.Where(x => x.Id != roleId).ToList();
            //}
            return list;
        }
        public static List<int> GetAllChildrenIds(int roleId)
        {
            var roleIds = GetAllChildren(roleId).Select(x => x.Id).ToList();
            roleIds.Add(roleId);
            return roleIds;
        }
        /// <summary>
        /// 获取所有子节点
        /// </summary>
        /// <param name="roleId"></param>
        private static List<RoleNodes> GetChildren(List<RoleNodes> roles, int roleId)
        {
            List<RoleNodes> rolesChildren = roles.Where(x => x.Id == roleId).Distinct().ToList();

            for (int i = 0; i < rolesChildren.Count; i++)
            {
                RoleNodes node = rolesChildren[i];
                var children = roles.Where(x => x.ParentId == node.Id && !rolesChildren.Any(c => c.Id == x.Id)).Distinct().ToList();
                rolesChildren.AddRange(children);
            }
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
