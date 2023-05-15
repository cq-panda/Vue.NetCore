using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;

namespace VOL.Core.ModelBinder
{
    public class BaseBinderProvider : IModelBinderProvider
    {
        public List<Type> types = new List<Type>();

     //   public List<BinderObject> binder=new BinderObject()
        public BaseBinderProvider()
        {
            types.Add(typeof(Dictionary<string, object>));
            InitType();
        }

        private void AddType(Type type)
        {
            if (!types.Any(x => x == type))
            {
                types.Add(type);
            }
        }
        private void InitType()
        {
            AddType(typeof(Dictionary<string, object>));
            AddType(typeof(List<Dictionary<string, object>>));
            AddType(typeof(List<object>));
            AddType(typeof(List<VOL.Entity.DomainModels.Sys_TableColumn>));
            AddType(typeof(VOL.Entity.DomainModels.Sys_TableInfo));
        }
        /// <summary>
        /// 增加一个委托用于调用 return new BaseModelBinder();时对参数进行行校验，待完..
        /// </summary>
        /// <param name="types"></param>
        public BaseBinderProvider(List<Type> types)
        {
            this.types = types ?? throw new Exception("types初始化不能为null");
            InitType();
        }
        public IModelBinder GetBinder(ModelBinderProviderContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            if (types.Any(x => x == context.Metadata.ModelType))
            {
                return new BaseModelBinder();// new BinderTypeModelBinder(typeof(TableInfoEntityBinder));
            }

            return null;
        }
    }
}
