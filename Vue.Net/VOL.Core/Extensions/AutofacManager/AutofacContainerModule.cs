using VOL.Core.Extensions;
using System;
using VOL.Core.Configuration;

namespace VOL.Core.Extensions.AutofacManager
{
    public class AutofacContainerModule
    {
        public static TService GetService<TService>() where TService:class
        {
            return typeof(TService).GetService() as TService;
        }
    }
}
