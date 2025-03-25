/*
*所有关于Sys_QuartzOptions类的业务代码接口应在此处编写
*/
using VOL.Core.BaseProvider;
using VOL.Entity.DomainModels;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace VOL.System.IServices
{
    public partial interface ISys_QuartzOptionsService
    {

        /// <summary>
        /// 手动执行一次
        /// </summary>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        Task<object> Run(Sys_QuartzOptions taskOptions);
        /// <summary>
        /// 开启任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        Task<object> Start(Sys_QuartzOptions taskOptions);
        /// <summary>
        /// 暂停任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        Task<object> Pause(Sys_QuartzOptions taskOptions);

    }
}
