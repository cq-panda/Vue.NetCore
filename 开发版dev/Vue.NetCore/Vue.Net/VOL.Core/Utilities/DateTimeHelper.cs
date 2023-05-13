using System.IO;

using System.Text;
using System;

namespace VOL.Core.Utilities
{
  public class DateTimeHelper
  {
		public static string FriendlyDate(DateTime? date)
		{
			if (!date.HasValue) return string.Empty;

			string strDate = date.Value.ToString("yyyy-MM-dd");
			string vDate = string.Empty;
			if(DateTime.Now.ToString("yyyy-MM-dd")==strDate)
			{
				vDate = "今天";
			}
			else if (DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") == strDate)
			{
				vDate = "明天";
			}
			else if (DateTime.Now.AddDays(2).ToString("yyyy-MM-dd") == strDate)
			{
				vDate = "后天";
			}
			else if (DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") == strDate)
			{
				vDate = "昨天";
			}
			else if (DateTime.Now.AddDays(-2).ToString("yyyy-MM-dd") == strDate)
			{
				vDate = "前天";
			}
			else
			{
				vDate = strDate;
			}

			return vDate;
		}
  }
}

