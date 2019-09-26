using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity.DomainModels
{
    public class ResponseData
    {
        public ResponseData() {

        }

        public ResponseData(bool status) {
            this.Status = status;
        }
        public bool Status { get; set; }
        public string Code { get; set; }
        public string Desc { get; set; }
        public object Data { get; set; }
    }
}
