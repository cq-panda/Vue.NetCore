
using System.Collections;
using System.Collections.Generic;

namespace VOL.Entity.DomainModels
{
    public class SaveModel
    {
        public Dictionary<string, object> MainData { get; set; }
        public List<Dictionary<string, object>> DetailData { get; set; }
        public List<object> DelKeys { get; set; }
    }
}
