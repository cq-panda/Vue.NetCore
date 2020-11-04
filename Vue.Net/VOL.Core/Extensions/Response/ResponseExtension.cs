//using VOL.Core.Enums;
//using VOL.Entity.DomainModels;
//using System;
//using System.Collections.Generic;
//using System.Text;
//using VOL.Core.Utilities;

//namespace VOL.Core.Extensions
//{
//    public static class ResponseExtension
//    {

//        public static WebResponseContent Set(this WebResponseContent responseData, ResponseType responseType)
//        {
//            bool? b = null;
//            return Set(responseData, responseType, b);
//        }
//        public static WebResponseContent Set(this WebResponseContent responseData, ResponseType responseType, bool? status)
//        {
//            return Set(responseData, responseType, null, status);
//        }
//        public static WebResponseContent Set(this WebResponseContent responseData, ResponseType responseType, string msg)
//        {
//            bool? b = null;
//            return Set(responseData, responseType, msg, b);
//        }
//        public static WebResponseContent Set(this WebResponseContent responseData, ResponseType responseType, string msg, bool? status)
//        {
//            if (status != null)
//            {
//                responseData.Status = (bool)status;
//            }
//            responseData.Code = ((int)responseType).ToString();
//            if (!string.IsNullOrEmpty(msg))
//            {
//                responseData.Desc = msg;
//                return responseData;
//            }
//            responseData.Desc = responseType.GetMsg();
//            return responseData;
//        }

//    }
//}
