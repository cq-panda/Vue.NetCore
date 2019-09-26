/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class vMyJoinMeetingService : ServiceBase<vMyJoinMeeting, IvMyJoinMeetingRepository>, IvMyJoinMeetingService, IDependency
    {
        public vMyJoinMeetingService(IvMyJoinMeetingRepository repository)
             : base(repository) 
        { 
           Init(repository);
        }
        public static IvMyJoinMeetingService Instance
        {
           get { return AutofacContainerModule.GetService<IvMyJoinMeetingService>(); }
        }
    }
}

