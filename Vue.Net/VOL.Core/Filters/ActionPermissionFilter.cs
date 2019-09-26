using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.AttributeManager;

namespace VOL.Core.Filters
{
    /// <summary>
    /// 1、控制器或controller设置了AllowAnonymousAttribute直接返回
    /// 2、TableName、TableAction 同时为null，SysController为false的，只判断是否登陆
    /// 3、TableName、TableAction 都不null根据表名与action判断是否有权限
    /// 4、SysController为true，通过httpcontext获取表名与action判断是否有权限
    /// 5、Roles对指定角色验证
    /// </summary>
    public class ActionPermissionFilter : IAsyncActionFilter
    {
        private WebResponseContent ResponseContent { get; set; }
        private ActionPermissionRequirement ActionPermission;
        private UserContext _userContext { get; set; }
        // private ResponseType responseType;
        public ActionPermissionFilter(ActionPermissionRequirement actionPermissionRequirement, UserContext userContext)
        {
            this.ResponseContent = new WebResponseContent();
            this.ActionPermission = actionPermissionRequirement;
            _userContext = userContext;
        }
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if ((await OnActionExecutionPermission(context)).Status)
            {
                await next();
                return;
            }
            FilterResponse.SetActionResult(context, ResponseContent);
        }
        private async Task<WebResponseContent> OnActionExecutionPermission(ActionExecutingContext context)
        {
            
            if (context.Filters.Any(item => item is IAllowAnonymousFilter)
                || UserContext.Current.IsSuperAdmin
                )
                return ResponseContent.OK();

            //演示环境除了admin帐号，其他帐号都不能增删改等操作
            if (!_userContext.IsSuperAdmin&& AppSetting.GlobalFilter.Enable 
                &&AppSetting.GlobalFilter.Actions.Contains(((Microsoft.AspNetCore.Mvc.Controllers.ControllerActionDescriptor)context.ActionDescriptor).ActionName))
            {
                return ResponseContent.Error(AppSetting.GlobalFilter.Message);
            }

            //如果没有指定表的权限，则默认为代码生成的控制器，优先获取PermissionTableAttribute指定的表，如果没有数据则使用当前控制器的名作为表名权限
            if (ActionPermission.SysController)
            {
                object[] permissionArray = ((Microsoft.AspNetCore.Mvc.Controllers.ControllerActionDescriptor)context.ActionDescriptor)?.ControllerTypeInfo.GetCustomAttributes(typeof(PermissionTableAttribute), false);
                if (permissionArray == null || permissionArray.Length == 0)
                {
                    ActionPermission.TableName = ((Microsoft.AspNetCore.Mvc.Controllers.ControllerActionDescriptor)context.ActionDescriptor).ControllerName;
                }
                else
                {
                    ActionPermission.TableName = (permissionArray[0] as PermissionTableAttribute).Name;
                }
                if (string.IsNullOrEmpty(ActionPermission.TableName))
                {
                    //responseType = ResponseType.ParametersLack;
                    return ResponseContent.Error(ResponseType.ParametersLack);
                }
            }

            //如果没有给定权限，不需要判断
            if (string.IsNullOrEmpty(ActionPermission.TableName)
                && string.IsNullOrEmpty(ActionPermission.TableAction)
                &&(ActionPermission.RoleIds==null|| ActionPermission.RoleIds.Length==0))
            {
                return ResponseContent.OK();
            }

            //是否限制的角色ID称才能访问
            //权限判断角色ID,
            if (ActionPermission.RoleIds != null && ActionPermission.RoleIds.Length>0)
            {
                if (ActionPermission.RoleIds.Contains(_userContext.UserInfo.Role_Id)) return ResponseContent.OK();
                //如果角色ID没有权限。并且也没控制器权限
                if (string.IsNullOrEmpty(ActionPermission.TableAction))
                {
                    return ResponseContent.Error(ResponseType.NoRolePermissions);
                } 
            }

            var actionAuth = await Task.Run(() => _userContext.GetPermissions(x => x.TableName.ToLower() == ActionPermission.TableName.ToLower())?.UserAuthArr);

            if (actionAuth == null
                 || actionAuth.Count() == 0
                 || !actionAuth.Contains(ActionPermission.TableAction))
            {
                Logger.Info(LoggerType.Authorzie, $"没有权限操作," +
                    $"用户ID{_userContext.UserId}:{_userContext.UserTrueName}," +
                    $"角色ID:{_userContext.RoleId}:{_userContext.UserInfo.RoleName}," +
                    $"操作权限{ActionPermission.TableName}:{ActionPermission.TableAction}");
                return ResponseContent.Error(ResponseType.NoPermissions);
            }
            return ResponseContent.OK();
        }
    }
}
