using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using VOL.Core.Filters;

namespace VOL.Core.Controllers.Basic
{
    [JWTAuthorize, ApiController]
    public class VolController : Controller
    {
        public VolController()
        {

        }
        /// <summary>
        /// 2020.11.21增加json原格式返回数据(默认是驼峰格式)
        /// </summary>
        /// <param name="data"></param>
        /// <param name="serializerSettings"></param>
        /// <returns></returns>
        protected JsonResult JsonNormal(object data, JsonSerializerSettings serializerSettings = null, bool formateDate = true)
        {
            serializerSettings = serializerSettings ?? new JsonSerializerSettings();
            serializerSettings.ContractResolver = null;
            if (formateDate)
            {
                serializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            }
            serializerSettings.Converters.Add(new LongCovert());
            return Json(data, serializerSettings);
        }
    }
    public class LongCovert : JsonConverter
    {
        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            if (reader.Value == null)
            {
                return null;
            }
            long.TryParse(reader.Value.ToString(), out long value);
            return value;
        }

        public override bool CanConvert(Type objectType)
        {
            return typeof(long) == objectType || typeof(long?) == objectType;
        }
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            if (value == null)
            {
                writer.WriteNull();
                return;
            }
            serializer.Serialize(writer, value.ToString());
        }
    }
}
