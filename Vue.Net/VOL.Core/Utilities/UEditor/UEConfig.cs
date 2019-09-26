using VOL.Core.Extensions;
using VOL.Entity.System;
using Microsoft.Extensions.Options;
using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Linq;


namespace VOL.Core.Utilities
{
    /// <summary>
    /// Config 的摘要说明
    /// </summary>
    public static class UEConfig
    {
        private static bool noCache = true;
        private static object _UEditorConfigOBJ = new object();

        public static UEditorConfig Items
        {
            get
            {
                lock (_UEditorConfigOBJ)
                {
                    if (noCache || _Items == null)
                    {
                        if (_Items == null)
                        {
                            _Items = (typeof(IOptions<UEditorConfig>).GetService() as IOptions<UEditorConfig>).Value;
                        }
                    }
                }
                return _Items;
            }
        }
        private static UEditorConfig _Items;
    }
}