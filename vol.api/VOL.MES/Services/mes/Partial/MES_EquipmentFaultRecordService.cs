/*
 *所有关于MES_EquipmentFaultRecord类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*MES_EquipmentFaultRecordService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.MES.IRepositories;

namespace VOL.MES.Services
{
    public partial class MES_EquipmentFaultRecordService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMES_EquipmentFaultRecordRepository _repository;//访问数据库

        [ActivatorUtilitiesConstructor]
        public MES_EquipmentFaultRecordService(
            IMES_EquipmentFaultRecordRepository dbRepository,
            IHttpContextAccessor httpContextAccessor
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }
  }
}
