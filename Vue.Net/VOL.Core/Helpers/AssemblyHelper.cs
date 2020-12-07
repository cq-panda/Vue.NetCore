using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using Microsoft.Extensions.DependencyModel;

namespace VOL.Core.Helpers
{
    /// <summary>
    /// 程序集操作帮助类
    /// </summary>
    public static class AssemblyHelper
    {
        /// <summary>
        /// 加载程序集
        /// </summary>
        /// <returns></returns>
        public static List<Assembly> Load(Func<RuntimeLibrary, bool> predicate = null)
        {
            var list = DependencyContext.Default.RuntimeLibraries.ToList();
            if (predicate != null)
                list = DependencyContext.Default.RuntimeLibraries.Where(predicate).ToList();

            return list.Select(m =>
            {
                try
                {
                    return AssemblyLoadContext.Default.LoadFromAssemblyName(new AssemblyName(m.Name));
                }
                catch
                {
                    return null;
                }
            }).Where(m => m != null).ToList();
        }

        /// <summary>
        /// 根据名称结尾查询程序集
        /// </summary>
        /// <param name="endString"></param>
        /// <returns></returns>
        public static Assembly LoadByNameEndString(string endString)
        {
            return Load(m => m.Name.EndsWith(endString)).FirstOrDefault();
        }

        /// <summary>
        /// 获取当前程序集的名称
        /// </summary>
        /// <returns></returns>
        public static string GetCurrentAssemblyName()
        {
            return Assembly.GetCallingAssembly().GetName().Name;
        }
    }
}
