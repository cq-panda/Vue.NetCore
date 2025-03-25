using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Extensions;

namespace VOL.Core.Utilities
{
    public static class MailHelper
    {
        private static string address { get; set; }
        private static string authPwd { get; set; }
        private static string name { get; set; }
        private static string host { get; set; }
        private static int port;
        private static bool enableSsl { get; set; }
        static MailHelper()
        {
            IConfigurationSection section= AppSetting.GetSection("Mail");
            address = section["Address"];
            authPwd = section["AuthPwd"];
            name = section["Name"];
            host = section["Host"];
            port = section["Port"].GetInt();
            enableSsl = section["EnableSsl"].GetBool();
        }

        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="title">标题</param>
        /// <param name="content">内容</param>
        /// <param name="list">收件人</param>
        public static void Send(string title, string content, params string[] list)
        {
            MailMessage message = new MailMessage
            {
                From = new MailAddress(address, name)//发送人邮箱
            };
            foreach (var item in list)
            {
                message.To.Add(item);//收件人地址
            }

            message.Subject = title;//发送邮件的标题

            message.Body = content;//发送邮件的内容
            //配置smtp服务地址
            SmtpClient client = new SmtpClient
            {
                Host = host,
                Port = port,//端口587
                EnableSsl = enableSsl,
                //发送人邮箱与授权密码
                Credentials = new NetworkCredential(address, authPwd)
            };
            client.Send(message);
        }
    }
}
