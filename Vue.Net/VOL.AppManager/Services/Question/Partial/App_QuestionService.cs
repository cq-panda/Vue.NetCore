using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Extensions;
using System.Collections.Generic;
using VOL.AppManager.Repositories;
using VOL.Core.Enums;
using VOL.Core.Utilities;

namespace VOL.AppManager.Services
{
    public partial class App_QuestionService
    {

        public override WebResponseContent Update(SaveModel saveDataModel)
        {
            App_Question app_Question = null;
            bool sendMsg = false;
            base.UpdateOnExecuting = (App_Question question, object obj1, object obj2, List<object> list) =>
            {
                //专家提问保存的状态是审核通过，并且系统的状态是未审核的，说明是审核操作
                if (question.AuditStatus == 1)
                {
                    app_Question = base.repository.FindFirst(x => x.QuestionId == question.QuestionId && x.AuditStatus == 0 && x.QuestionId > 0);
                    if (app_Question != null && app_Question.ExpertId > 0)
                    {
                        sendMsg = true;
                    }
                }
                return new WebResponseContent() { Status = true };
            };
            WebResponseContent responseData = base.Update(saveDataModel);
            if (sendMsg)
            {
                int userId = App_ExpertRepository.Instance.Find(x => x.ExpertId == app_Question.ExpertId, s => s.User_Id).FirstOrDefault() ?? 0;
                if (userId > 0)
                {
                    //给专家发送提示消息
                    //Sys_MessageService.Instance.SendQuestionMessage(app_Question.Title,
                    //    app_Question.Creator,
                    //    app_Question.QuestionId,
                    //    userId,
                    //    UMSendType.AskMe);
                }
            }
            return responseData;
        }

        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            //base.AddOnMethodExecuted = (App_Question question, object obj) =>
            //{
            //    //获取所有审核权限的人发送APP消息通知 
            //    List<string> list = base.repository.DapperContext.QueryList<string>("SELECT PhoneNo FROM [vAuditUser] WHERE TableName='App_Question'", null).Where(x => x.IsPhoneNo()).ToList();
            //    if (list.Count>0)
            //    {
            //        BeefSDKRequest.SendAliAuditSTK(string.Join(',', list),AuditType.Question);
            //    }
            //    return new ResponseData() { Status = true };
            //};
            return base.Add(saveDataModel);
        }
    }
}

