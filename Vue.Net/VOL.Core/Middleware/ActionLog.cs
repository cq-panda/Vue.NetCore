using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.Middleware
{
    public class ActionLog : Attribute
    {
        public string LogType { get; set; }
        /// <summary>
        /// 是否写入日志
        /// </summary>
        public bool Write { get; set; }
        public ActionLog() : this(true)
        {

        }
        public ActionLog(bool write = true)
        {
            Write = write;
        }
        public ActionLog(string logType)
        {
            LogType = logType;
            Write = true;
        }

    }
}
