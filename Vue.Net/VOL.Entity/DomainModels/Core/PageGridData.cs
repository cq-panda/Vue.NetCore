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
        public object summary { get; set; }
        /// <summary>
        /// 可以在返回前，再返回一些额外的数据，比如返回其他表的信息，前台找到查询后的方法取出来
        /// </summary>
        public object extra { get; set; }
    }

}
