using VOL.Entity.SystemModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class ApiUserToken
    {
        /// <summary>
        /// 用户id
        /// </summary>
        public int UserId { get; set; }
       
        /// <summary>
        /// token过期时间(每个token过期时间默认24小时，过期了重新自动生成一个新的token)
        /// </summary>
        public DateTime ExpirationTime { get; set; }


    }
}
