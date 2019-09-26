using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class PageDataOptions
    {
        public int Page { get; set; }
        public int Rows { get; set; }
        public int Total { get; set; }
        public string TableName { get; set; }
        public string Sort { get; set; }
        /// <summary>
        /// 排序方式
        /// </summary>
        public string Order { get; set; }
        public string Wheres { get; set; }
    
        public string Foots { get; set; }
        public bool Export { get; set; }

        public object Value { get; set; }
    }
    public class SearchParameters
    {
        public string Name { get; set; }
        public string Value { get; set; }
        public string DisplayType { get; set; }
    }

}
