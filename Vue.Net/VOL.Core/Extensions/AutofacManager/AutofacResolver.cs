//using VOL.Core.Extensions;
//using Microsoft.Extensions.DependencyInjection;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;


//namespace VOL.Core.AutofacBase
//{
//    public class AutofacContainerModule
//    {
//        public static dynamic GetService(string projectName, string tableName)
//        {
//            return
//                Type.GetType("Framework." +
//                projectName + ".IServices.I" +
//                tableName + "Service," +
//                "Framework." + projectName
//                     ).GetService();
        
//        }
//        //public static dynamic GetService(IService­Provider serviceProvider, string projectName, string tableName)
//        //{
//        //    return (dynamic)serviceProvider.
//        //        GetService(
//        //        Type.GetType("Framework." +
//        //        projectName + ".IServices.I" +
//        //        tableName + "Service," +
//        //        "Framework." + projectName
//        //             )
//        //          );
//        //}
//    }
//}
