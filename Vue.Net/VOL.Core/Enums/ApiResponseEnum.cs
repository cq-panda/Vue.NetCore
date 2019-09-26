using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Enums
{
    public enum ApiResponseEnum
    {
        OK = 100,
        Error = 101,
        Other = 102,
        OnlyPost = 103,
        ParametersError = 104,
        TimeStampInvalid = 105,
        SignInvalid = 106,
        VersionEmpty = 107,
        ApiKeyInvalid = 108,
        e110 = 110,//打印机项目：无数据(表示调用WMS接口获取数据，WMS没有数据返回)
        e111 = 111,//打印机项目：表示调WMS接口获取数据后，还有可返回的数据，请再次调用此接口。
        ContentIsNull = 112,
        NoData = 113,
    }
}
