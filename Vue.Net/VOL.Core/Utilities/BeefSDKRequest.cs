
using VOL.Core.Const;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Services;
using VOL.Entity.System;
using Newtonsoft.Json;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace VOL.Core.Utilities
{
    public class BeefSDKRequest
    {

        /// <summary>
        /// 阿里云短信发送
        /// </summary>
        /// <param name="biz_Content"></param>
        /// <returns></returns>
        public static (bool, string) SendAliSTK(object biz_Content)
        {
            (bool, string) result = Send(biz_Content, "/api/AliyunSTK/Send");
            if (!result.Item1)
                return result;
            Dictionary<string, object> dictionary = JsonConvert.DeserializeObject<Dictionary<string, object>>(result.Item2);
            return ((bool)dictionary["Status"], dictionary["Message"].ToString());

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName">发送表名对应的提示模块</param>
        /// <param name="audit">默认为发送通知消息给管理员审核,6,7为审核通过/未通过</param>
        /// <param name="phoneNo">是否指定电话发送消息</param>
        /// <returns></returns>
        public static (bool, string) SendAliAuditSTK(string tableName, AuditType audit = AuditType.Notice, string phoneNo = null)
        {
            //获取所有审核权限的人发送APP消息通知 
            string msg = null;
            List<string> list = new List<string>();
            Enum.TryParse(tableName, out AuditType auditType);
            switch (auditType)
            {
                case AuditType.App_Question:
                    msg = "提问";
                    break;
                case AuditType.App_Expert:
                    msg = "专家申请认证";
                    break;
                case AuditType.App_ReportPrice:
                    msg = "上报肉牛价格";
                    break;
            }
            if (string.IsNullOrEmpty(phoneNo))
            {
                list = DBServerProvider.GetSqlDapper().QueryList<string>($"SELECT PhoneNo FROM [vAuditUser] WHERE TableName='{tableName}'", null).Where(x => x.IsPhoneNo()).ToList();
                if (list.Count == 0)
                {
                    return (false, "没有分配审核帐号");
                }
            }
            else
            {
                list.Add(phoneNo);
            }

            return SendAliSTK(new Dictionary<string, object>() {
                { "PhoneNo", string.Join(',', list) },
                { "PINType",(int)audit }, //模板类型5,审核给管理员通知,6提示审核通过，7，审核失败
                { "Msg",msg}
            });
        }

        /// <summary>
        /// 获取通用上传的配置和临时令牌
        /// </summary>
        /// <returns></returns>
        public static (bool, string) GetBaiduBceSTS()
        {
            return Send("BeefBce", "/api/BceAuth/GetCommonUploadConfigAndSTS");
        }

        public static (bool, string) UMSendMessage(bool sendAll, PostUMengJson mengJson, Dictionary<string, string> headersDic = null)
        {
            string url;
            if (!sendAll)
            {
                url = "/api/umSend/PushByAlias";
            }
            else
            {
                url = "/api/umSend/PushByAllUser";
            }
            return Send(mengJson, url, headersDic);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz_Content"> 参数如,发送短信的电话与发送类型new {PhoneNo="128888888",SendType=1}</param>
        /// <param name="actionPath">action地址"/api/AliyunSTK/Send"</param>
        public static (bool, string) Send(object biz_Content, string actionPath, Dictionary<string, string> headersDic = null)
        {
            DateTime DateStart = new DateTime(1970, 1, 1, 8, 0, 0);
            Dictionary<String, String> DicParameters = new Dictionary<String, String>();
            DicParameters.Add("apiKey", SDKOptions.ApiKey);
            DicParameters.Add("timestamp", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));//时间戳

            string url = SDKOptions.Url + actionPath;
            DicParameters.Add("biz_content", JsonConvert.SerializeObject(biz_Content));
            DicParameters.Add("v", "1.0");
            string sign = Signature(DicParameters, SDKOptions.PrivateKey);//生成验签
            DicParameters.Add("sign", sign);
            System.Net.WebRequest wReq = System.Net.WebRequest.Create(SDKOptions.Url + actionPath);
            wReq.ContentType = "application/json";
            wReq.Method = "POST";
            string postdata = JsonConvert.SerializeObject(DicParameters);

            if (headersDic != null)
            {
                foreach (KeyValuePair<string, string> kv in headersDic)
                {
                    wReq.Headers.Add(kv.Key, kv.Value);
                }
            }


            byte[] bytes = Encoding.UTF8.GetBytes(postdata);
            string exMsg = null;
            string reslutMsg = null;
            try
            {
                using (Stream sendStream = wReq.GetRequestStream())
                {
                    sendStream.Write(bytes, 0, bytes.Length);
                }
                System.Net.WebResponse wResp = wReq.GetResponse();
                System.IO.Stream respStream = wResp.GetResponseStream();
                using (System.IO.StreamReader reader = new System.IO.StreamReader(respStream, Encoding.GetEncoding("utf-8")))
                {
                    reslutMsg = reader.ReadToEnd();
                    return (true, reslutMsg);
                }
            }
            catch (Exception ex)
            {
                exMsg = ex.Message + ex.StackTrace + ex.Source;
                return (false, ex.Message);
            }
        }



        private static string Signature(Dictionary<string, string> DicParameters, string private_key)
        {
            StringBuilder SortString = new StringBuilder();
            SortString.Append(private_key);
            foreach (var item in DicParameters.OrderBy(c => c.Key))
            {
                SortString.Append(item.Key).Append(item.Value);
            }
            SortString.Append(private_key);
            return MD5Encrypt32(SortString.ToString()).ToUpper();

        }
        private static string MD5Encrypt32(string Par)
        {
            StringBuilder EncryptResult = new StringBuilder();
            using (MD5 md5 = MD5.Create())
            {
                byte[] ByteArray = md5.ComputeHash(Encoding.UTF8.GetBytes(Par));
                for (int i = 0; i < ByteArray.Length; i++)
                {
                    EncryptResult.Append(ByteArray[i].ToString("X2"));
                }
            }
            return EncryptResult.ToString(); ;
        }
    }
}
