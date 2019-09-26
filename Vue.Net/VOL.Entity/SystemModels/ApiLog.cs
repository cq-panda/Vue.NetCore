using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace VOL.Entity.SystemModels
{
    //[DBConnectionAttribute(ConnectionString = "Api")]
    public class ApiLog:BaseEntity
    {
        [Key]
        public int ID { get; set; }
        public string LogCode { get; set; }
        public string Url { get; set; }
        public string ServerIp { get; set; }
        public string ClientIp { get; set; }
        public string RequestPar { get; set; }
        public string Responsepar { get; set; }
        public DateTime RequestDate { get; set; }
        public DateTime CreateDate { get; set; }
        public int Time_Consuming { get; set; }
        public int ResponseStatus { get; set; }
        public string BrowserType { get; set; }

    }
}
