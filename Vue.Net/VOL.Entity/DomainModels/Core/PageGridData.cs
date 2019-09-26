using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class PageGridData<T>
    {
        public int status { get; set; }
        public string msg { get; set; }
        public int total { get; set; }
        public List<T> rows { get; set; }
        public object footer { get; set; }

    
    }

}
