using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Core.Enums;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.ManageUser;
using VOL.Core.Const;
using VOL.System.Repositories;

namespace VOL.AppManager.Services
{
    public partial class App_ExpertService
    {
        public async Task<ApiResponseContent> ApiQueryByPage(string bizContent)
        {
            ApiResponseContent apiResponse = new ApiResponseContent();
            (string, Pagination, bool) result = base.ApiValidateInput<Pagination>(bizContent, x => new { x.Page });
            if (!result.Item3)
                return apiResponse.Set(ResponseType.Other, result.Item1);
            apiResponse.Data = await Task.Run(() => ApiQueryByPage(result.Item2.Page));
            return apiResponse.OK();
        }
        public async Task<object> ApiQueryByPage(int pageIndex)
        {
            int userId = UserContext.Current.UserInfo.User_Id;
            return await Task.Run(() => repository.QueryByPage<object>(pageIndex, ApiConfigOptions.ApiPageSize, out int rowCount,
                c => c.Enable == 1 && c.AuditStatus == 1,
                q => new Dictionary<object, QueryOrderBy>() { { q.ExpertId, QueryOrderBy.Desc } },
            s => new
            {
                s.ExpertId,
                ExpertName = s.ExpertName ?? s.ReallyName,
                HeadImageUrl = s.HeadImageUrl ?? ApiConfigOptions.DefaultHeadImageUrl,
                s.Professional,
                s.Company
            }));
        }

        private string GetpPhoneNo(int userId)
        {
            if (userId <= 0)
                return null;

            Sys_User user = Sys_UserRepository.Instance.FindFirst(x => x.User_Id == userId);
            if (user == null)
                return null;

            if (user.PhoneNo.IsPhoneNo())
                return user.PhoneNo;

            if (user.UserName.IsPhoneNo())
                return user.UserName;

            return null;
        }

        //public override WebResponseContent Audit(Dictionary<string, string> dictionary)
        //{
        //    base.AuditOnMethodExecuted = (App_Expert expert) =>
        //    {
        //        expert = base.repository.FindFirst(x => x.ExpertId == expert.ExpertId);
        //        string phoneNo = null;
        //        if (expert != null && expert.PhoneNo.IsPhoneNo())
        //        {
        //            phoneNo = expert.PhoneNo;
        //        }
        //        else
        //        {
        //            phoneNo = GetpPhoneNo(expert.User_Id??0);
        //        }
        //        if (phoneNo != null)
        //        {
        //            BeefSDKRequest.SendAliAuditSTK(typeof(App_Expert).Name, expert.AuditStatus==1? AuditType.Succes:AuditType.Fail, phoneNo);
        //        }
        //        return new WebResponseContent()
        //        {
        //            Status = true
        //        };
        //    };
        //    return base.Audit(dictionary);
        //}

    }
}

