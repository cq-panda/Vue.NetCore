using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Entity.System
{
    public class ApiPostParameters
    {
        public string apiKey { get; set; }
        public string timestamp { get; set; }
        public string v { get; set; }
        public string sign { get; set; }
        public string biz_content { get; set; }
    }
}
