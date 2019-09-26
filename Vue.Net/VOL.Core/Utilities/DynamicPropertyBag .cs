using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Dynamic;
using System.IO;

namespace VOL.Core.Utilities
{
  /// <summary>
  /// 动态属性Bag
  /// </summary>
  public class DynamicPropertyBag : DynamicObject
  {
    private Dictionary<string, object> storage = new Dictionary<string, object>();

    public override bool TryGetMember(GetMemberBinder binder, out object result)
    {
      if (storage.ContainsKey(binder.Name))
      {
        result = storage[binder.Name];
        return true;
      }
      result = null;
      return false;
    }

    public override bool TrySetMember(SetMemberBinder binder, object value)
    {
      string key = binder.Name;
      if (storage.ContainsKey(key))
        storage[key] = value;
      else
        storage.Add(key, value);
      return true;
    }

    public override string ToString()
    {
      StringWriter message = new StringWriter();
      foreach (var item in storage)
        message.WriteLine("{0}:\t{1}", item.Key, item.Value);
      return message.ToString();
    }
  }
}
