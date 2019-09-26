using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Entity.System
{
    public class UMSend
    {
        public int goType { get; set; }
        public int id { get; set; }
        public string title { get; set; }

        public string content { get; set; }
        public string creator { get; set; }

        public DateTime? createDate { get; set; }

        public string user { get; set; }
    }
}
