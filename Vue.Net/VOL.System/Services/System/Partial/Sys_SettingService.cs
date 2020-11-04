/*
 *所有关于Sys_Setting类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_SettingService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using VOL.Core.Services;
using System;

namespace VOL.System.Services
{
    public partial class Sys_SettingService
    {


        public async Task<WebResponseContent> GetSystemSetting()
        {
            WebResponseContent webResponse = new WebResponseContent();
            var setting = await repository.FindAsyncFirst(f => f.Id == 1);
            if (setting == null) return webResponse.Error("没有获取到提交的参数");
            try
            {
                webResponse.OK("获取成功", setting);
            }
            catch (Exception ex)
            {
                webResponse.Error(ex.Message);
            }
            finally
            {
                Logger.Info($"获取系统设置,{(webResponse.Status ? "成功" : "失败")}{webResponse.Message}");
            }
            return webResponse;

        }


        public async Task<WebResponseContent> Save(Sys_Setting setting)
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (setting == null) return webResponse.Error("没有获取到提交的参数");
            try
            {
                webResponse = setting.ValidationEntity(x => new { x.Id, x.Login_EnableVerificaCode });
                if (!webResponse.Status) return webResponse;
                Sys_Setting syssetting = await repository.FindAsyncFirst(x => x.Id == setting.Id);
                if (!syssetting.IsNullOrEmpty())
                {
                    repository.Update(setting.SetModifyDefaultVal(), p => new
                    {
                        p.Id,
                        p.Login_EnableVerificaCode,
                        p.PlatformName,
                        p.Modifier,
                        p.ModifyID,
                        p.ModifyDate
                    });
                    await repository.SaveChangesAsync();
                    webResponse.OK("保存成功", setting);
                }
                else
                {
                    webResponse.Error("保存失败，未查询到系统设置");
                }
            }
            catch (Exception ex)
            {
                webResponse.Error(ex.Message);
            }
            finally
            {
                Logger.Info($"系统设置,{(webResponse.Status ? "成功" : "失败")}{webResponse.Message}");
            }
            return webResponse;
        }
    }
}
