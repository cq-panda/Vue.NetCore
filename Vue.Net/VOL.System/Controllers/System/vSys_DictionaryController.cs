/*
 *Author：jxx
 *Contact：283591387@qq.com
 *Date：2018-07-01
 * 此代码由框架生成，请勿随意更改
 */
using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.System.IServices;
using VOL.Core.Controllers.Basic;
using Microsoft.AspNetCore.Mvc;

namespace VOL.System.Controllers
{
    public partial class vSys_DictionaryController : WebBaseController<IvSys_DictionaryService>
    {
        public vSys_DictionaryController(IvSys_DictionaryService service)
        : base("System","System","vSys_Dictionary", service)
        {
        }
    }
}

