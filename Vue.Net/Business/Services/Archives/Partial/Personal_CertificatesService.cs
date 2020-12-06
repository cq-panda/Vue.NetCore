/*
 *所有关于Personal_Certificates类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Personal_CertificatesService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using TencentCloud.Common;
using TencentCloud.Common.Profile;
using TencentCloud.Ocr.V20181119;
using TencentCloud.Ocr.V20181119.Models;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Entity.ViewModels;

namespace Business.Services
{
    public partial class Personal_CertificatesService
    {

        public Personal_CertificatesService()
        {

        }

        /// <summary>
        /// 保存OCR信息
        /// </summary>
        /// <param name="idCardOCR"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> SaveOCRInfo(IDCardInfo idCardOCR)
        {
            WebResponseContent responseContent = new WebResponseContent();
            string error = "";
            try
            {
                var personal = await repository.DbContext.Set<Personal>().FirstAsync(f => f.Id == idCardOCR.personalID);
                if (personal.IsNullOrEmpty())
                {
                    return responseContent.Error("请关联所属人员");
                }
                var idCardInfo = await repository.FindAsyncFirst(f => f.PersonalId == personal.Id);
                if (idCardInfo.IsNullOrEmpty())
                {
                    idCardInfo = new Personal_Certificates();
                }
                idCardInfo.IDCardInfo = JsonConvert.SerializeObject(idCardOCR);
                repository.Update(idCardInfo, p => new { p.IDCardInfo }, true);
                responseContent.OK("保存成功", idCardOCR);
            }
            catch (Exception ex)
            {
                error = ex.Message + ex.StackTrace + ex.Source;
                responseContent.Error(error);
            }
            finally
            {
                Logger.Info(LoggerType.ReplaceToeken, ($"用户Id:{UserContext.Current.UserId},用户{UserContext.Current.UserName}")
                    + (responseContent.Status ? "OCR信息保存成功" : "OCR信息保存失败"), null, error);
            }
            return responseContent;
        }

        /// <summary>
        /// 调用腾讯云OCR
        /// </summary>
        /// <param name="personalId"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        public async Task<WebResponseContent> OCR(Personal_Certificates personal_Certificates)
        {
            WebResponseContent responseContent = new WebResponseContent();
            string error = "";
            try
            {
                if (personal_Certificates.PersonalId.IsNullOrEmpty())
                {
                    return responseContent.Error("请关联所属人员");
                }
                Credential cred = new Credential
                {
                    SecretId = "",
                    SecretKey = ""
                };

                ClientProfile clientProfile = new ClientProfile();
                HttpProfile httpProfile = new HttpProfile();
                httpProfile.Endpoint = ("ocr.tencentcloudapi.com");
                clientProfile.HttpProfile = httpProfile;

                OcrClient client = new OcrClient(cred, "ap-beijing", clientProfile);
                IDCardOCRRequest req = new IDCardOCRRequest
                {
                    Config = JsonConvert.SerializeObject(new { Quality = true })
                };
                List<string> list = new List<string>();
                list = personal_Certificates.IDCardImagePath.Split("/").Skip(3).ToList();
                var localPath = string.Join("\\", list.ToArray());
                var FilePath = Path.Combine(_hostingEnvironment.WebRootPath, localPath);
                if (File.Exists(FilePath))
                {
                    req.ImageBase64 = Convert.ToBase64String(File.ReadAllBytes(FilePath));
                    //IDCardOCRResponse resp = client.IDCardOCRSync(req);

                    var result = "{\"Name\":\"王冰冰\",\"Sex\":\"男\",\"Nation\":\"汉\",\"Birth\":\"2001/3/13\",\"Address\":\"甘肃省康乐县鸣鹿乡拔字沟村老科马7号\",\"IdNum\":\"622922200103135014\",\"Authority\":\"\",\"ValidDate\":\"\",\"AdvancedInfo\":\"{\\\"WarnInfos\\\":[],\\\"Quality\\\":80}\",\"RequestId\":\"2fac17e3-99eb-4056-a47f-3a074d2d4d24\"}";
                    //personal.IDCardInfo = JsonConvert.SerializeObject(resp);

                    IDCardInfo iDCardOCR;

                    var certificate = await repository.FindAsyncFirst(f => f.PersonalId == personal_Certificates.PersonalId);
                    if (certificate.IsNullOrEmpty())
                    {
                        personal_Certificates.IDCardInfo = result;
                        personal_Certificates.CreateDate = DateTime.Now;
                        personal_Certificates.IDCardImagePath = localPath;
                        personal_Certificates.CreateID = UserContext.Current.UserId;
                        personal_Certificates.Creator = UserContext.Current.UserTrueName;
                        repository.Add(personal_Certificates, true);
                        iDCardOCR = JsonConvert.DeserializeObject<IDCardInfo>(personal_Certificates.IDCardInfo);
                    }
                    else
                    {
                        certificate.IDCardInfo = result;
                        certificate.IDCardImagePath = localPath;
                        certificate.ModifyDate = DateTime.Now;
                        certificate.ModifyID = UserContext.Current.UserId;
                        certificate.Modifier = UserContext.Current.UserTrueName;
                        certificate.CertificateType = personal_Certificates.CertificateType;
                        repository.Update(certificate, true);
                        iDCardOCR = JsonConvert.DeserializeObject<IDCardInfo>(certificate.IDCardInfo);
                    }


                    responseContent.OK("转换成功", iDCardOCR);
                }
                else
                {
                    return responseContent.Error("文件未找到");
                }

            }
            catch (Exception ex)
            {
                error = ex.Message + ex.StackTrace + ex.Source;
                responseContent.Error(error);
            }
            finally
            {
                Logger.Info(LoggerType.ReplaceToeken, ($"用户Id:{UserContext.Current.UserId},用户{UserContext.Current.UserName}")
                    + (responseContent.Status ? "OCR成功" : "OCR失败"), null, error);
            }
            return responseContent;
        }
    }
}
