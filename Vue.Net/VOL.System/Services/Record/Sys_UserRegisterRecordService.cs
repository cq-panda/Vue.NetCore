/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_UserRegisterRecordService : ServiceBase<Sys_UserRegisterRecord, ISys_UserRegisterRecordRepository>, ISys_UserRegisterRecordService, IDependency
    {
        public Sys_UserRegisterRecordService(ISys_UserRegisterRecordRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static ISys_UserRegisterRecordService Instance
        {
           get { return AutofacContainerModule.GetService<ISys_UserRegisterRecordService>(); }
        }
    }
}

