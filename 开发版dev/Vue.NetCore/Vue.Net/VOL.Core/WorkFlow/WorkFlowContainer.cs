using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VOL.Core.Extensions;

namespace VOL.Core.WorkFlow
{
    public class WorkFlowContainer
    {
        private static WorkFlowContainer _instance;
        private static Dictionary<string, string> _container = new Dictionary<string, string>();

        public static WorkFlowContainer Instance
        {
            get
            {
                _instance = new WorkFlowContainer();
                return _instance;
            }
        }

        public WorkFlowContainer Use<T>(string name = null)
        {
            _container[typeof(T).Name] = name ?? typeof(T).GetEntityTableCnName();
            return _instance;
        }

        public static object GetDic()
        {
            return _container.Select(s => new { key = s.Key, value = s.Value }).ToList();
        }

        public static bool Exists<T>()
        {
            return Exists(typeof(T).GetEntityTableName());
        }

        public static bool Exists(string table)
        {
            return _container.ContainsKey(table);
        }

    }
}
