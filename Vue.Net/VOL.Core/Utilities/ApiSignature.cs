using VOL.Core.Enums;
using VOL.Entity.DomainModels;
using VOL.Entity.System;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace VOL.Core.Utilities
{
    public class ApiSignature
    {
        public static string Signature(Dictionary<string, string> DicParameters, string private_key)
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
        public static string MD5Encrypt32(string Par)
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

        public static void ComparisonSign(HttpRequest request, string ApiParameters, WebResponseContent responseData)
        {

            //ApiPostParameters PostParameters;
            ////try
            ////{
            ////    PostParameters = JsonConvert.DeserializeObject<ApiPostParameters>(ApiParameters);
            ////}
            ////catch (Exception ex)
            ////{
            ////  //  ApiResponseData.SetResponse(responseData, ApiResponseEnum.ParametersError);
            ////    return;
            ////}


            //DateTime? timestamp = DateTime.Now;//PostParameters.timestamp.GetDateTime();
            ////if (timestamp == null || (DateTime.Now - Convert.ToDateTime(timestamp)).TotalMinutes > 30)
            ////{
            ////    EnumToResponse.SetResponse(responseData, ResponseEnum.TimeStampInvalid);
            ////    return;
            ////}
            ////if (string.IsNullOrWhiteSpace(PostParameters.biz_content.ToString()))
            ////{
            ////    responseData.return_code = "107";
            ////    responseData.return_msg = "biz_content必填";
            ////    return;
            ////}
            //if (string.IsNullOrWhiteSpace(PostParameters.v))
            //{
            //   // ApiResponseData.SetResponse(responseData, ApiResponseEnum.VersionEmpty);
            //    return;
            //}

            //Dictionary<string, string> dicParameters = new Dictionary<string, string>();
            ////foreach (PropertyInfo property in PostParameters.GetType().GetProperties())
            ////{
            ////    object Val = property.GetValue(PostParameters);
            ////    if ((Val == null || Val.ToString() == "") && property.Name.ToLower() != "biz_content")
            ////    {
            ////        EnumToResponse.SetResponse(responseData, ResponseEnum.Other, property.Name + "无效");
            ////        return;
            ////    }
            ////    if (property.Name == "sign")
            ////    {
            ////        continue;
            ////    }
            ////    if (Val != null)
            ////    {
            ////        dicParameters.Add(property.Name, Val.ToString());
            ////    }
            ////}

            ////SqlParameter[] Paras = new SqlParameter[] {
            ////    new SqlParameter("@apiKey", PostParameters.apiKey)
            ////};
            ////object private_key = new SqlDatabase().ExecuteScalar(CommandType.Text,
            ////    "SELECT TOP 1 private_key FROM ApiUser WHERE apiKey=@apiKey", Paras);
            ////if (private_key == null || private_key.ToString() == "")
            ////{
            ////    EnumToResponse.SetResponse(responseData, ResponseEnum.ApiKeyInvalid);
            ////    return;
            ////}

            //return;
            //////验证加密码签名
            ////string Sign = Signature(dicParameters, private_key.ToString());
            ////if (PostParameters.sign != Sign)
            ////{
            ////    EnumToResponse.SetResponse(responseData, ResponseEnum.SignInvalid);
            ////    return;
            ////}

        }
    }
}
