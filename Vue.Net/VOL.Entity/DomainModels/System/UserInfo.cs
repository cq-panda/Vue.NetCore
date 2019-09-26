using VOL.Entity.SystemModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class UserInfo
    {
        public int User_Id { get; set; }
        /// <summary>
        /// 多个角色ID
        /// </summary>
        public int Role_Id { get; set; }
        public string RoleName { get; set; }
        public string UserName { get; set; }
        public string UserTrueName { get; set; }
        public int  Enable { get; set; }
        public string Token { get; set; }
    }
}
