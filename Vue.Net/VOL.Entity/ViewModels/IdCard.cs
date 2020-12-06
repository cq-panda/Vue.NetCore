using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using VOL.Entity.MappingConfiguration;

namespace VOL.Entity.ViewModels
{

    public class IDCardInfo
    {
        public int personalID { get; set; }
        public string name { get; set; }
        public string sex { get; set; }
        public string nation { get; set; }
        public string birth { get; set; }
        public string address { get; set; }
        public string idNum { get; set; }
        public string authority { get; set; }
        public string validDate { get; set; }
        public string advancedInfo { get; set; }
        public string requestId { get; set; }
    }
}
