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
    public partial class Sys_ImageLibraryController : WebBaseController<ISys_ImageLibraryService>
    {
        public Sys_ImageLibraryController(ISys_ImageLibraryService service)
        : base("System","System","Sys_ImageLibrary", service)
        {
        }
    }
}

