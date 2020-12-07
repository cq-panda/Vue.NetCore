using VOL.Core.Enums;
using VOL.Core.Utilities;

namespace VOL.Core.Extensions
{
    public static class ApiResponseExtension
    {

        //public static ApiResponseData ApiResponseOK(this ApiResponseData responseData, string msg=null)
        //{
        //    return responseData.ApiSetResponse(ResponseType.OperSuccess, msg, ApiStatutsCode.Ok);
        //}

        //public static ApiResponseData ApiSetResponse(this ApiResponseData responseData, ResponseType responseType, ApiStatutsCode? status = null)
        //{
        //    return responseData.ApiSetResponse(responseType, null, status);
        //}
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="responseData"></param>
        ///// <param name="responseType">返回消息类型</param>
        ///// <param name="msg">返回消息，若msg为null,则取responseType的描述信息</param>
        ///// <param name="status">返回状态，目前只有0、失败，1、成功，2、token过期</param>
        //public static ApiResponseData ApiSetResponse(this ApiResponseData responseData, ResponseType responseType, string msg,ApiStatutsCode? status=null)
        //{
        //    if (status != null)
        //    {
        //        responseData.Status = (int)status;
        //    }
        //    if (!string.IsNullOrEmpty(msg))
        //    {
        //        responseData.Message = msg;
        //        return responseData;
        //    }
        //    if (!string.IsNullOrEmpty(responseData.Message))
        //        return responseData;
        //    responseData.Message = responseType.GetMsg();
        //    return responseData;
        //}

    }
}
