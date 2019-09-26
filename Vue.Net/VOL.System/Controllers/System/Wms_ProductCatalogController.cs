using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.System.IServices;
using VOL.Core.Controllers.Basic;
using Microsoft.AspNetCore.Mvc;

namespace VOL.System.Controllers
{
    public partial class Wms_ProductCatalogController : WebBaseController<IWms_ProductCatalogService>
    {
        public Wms_ProductCatalogController(IWms_ProductCatalogService service)
        : base("System","System","Wms_ProductCatalog", service)
        {
        }
    }
}

