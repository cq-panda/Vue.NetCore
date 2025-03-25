/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("SellOrder",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using VOL.Core.CacheManager;
using VOL.Core.Enums;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Entity.DomainModels;
using VOL.Order.IRepositories;
using VOL.Order.IServices;
using VOL.Order.Repositories;
using VOL.WebApi.Controllers.Hubs;

namespace VOL.Order.Controllers
{
    public partial class SellOrderController
    {
        private readonly ICacheService _cacheService;
        private readonly IHubContext<HomePageMessageHub> _hubContext;

        private readonly ISellOrderRepository _orderRepository;
        [ActivatorUtilitiesConstructor]

        public SellOrderController(ISellOrderRepository orderRepository, IHubContext<HomePageMessageHub> hubContext, ICacheService cacheService, ISellOrderService service) : base(service)
        {
            //数据库访问，更多操作见后台开发：数据库访问
            _orderRepository = orderRepository;
            _hubContext = hubContext;
            _cacheService = cacheService;
            //http://localhost:8081/document/netCoreDev
        }

        [HttpPost]
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Search)]
        [Route("getServiceDate"), FixedToken]//FixedToken请求此接口只要token合法就能能过//AllowAnonymous
        public IActionResult GetServiceDate()
        {
            return Content(Service.GetServiceDate());
        }

        /************重写权限************/

        /// <summary>
        /// 页面数据查询
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        /// ApiActionPermission注释后，只会验证用户是否登陆，不会验证用户查询权限
        //[ApiActionPermission(ActionPermissionOptions.Search)]
        //第一个参数可以输入表名，指定某张表的权限
        [ApiActionPermission()]
        [HttpPost, Route("GetPageData"), AllowAnonymous]
        public override ActionResult GetPageData([FromBody] PageDataOptions loadData)
        {
            return base.GetPageData(loadData);
            //var list = Service.GetPageData(loadData).rows;
            ////获取ConnectionId
            //var key = "SignalR" + UserContext.Current.UserId;
            //var cid = _cacheService.Get(key);
            ////测试SignalR推送业务数据
            //if (!string.IsNullOrEmpty(cid))
            //    _hubContext.Clients.Client(cid).SendAsync("SellOrderData", list);

            //return base.GetPageData(loadData);
        }

        /// <summary>
        /// 新增操作（权限重写同上）
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
        //[ApiActionPermission("SellOrder", ActionPermissionOptions.Add)]
        [HttpPost, Route("Add")]
        public override ActionResult Add([FromBody] SaveModel saveModel)
        {
            return base.Add(saveModel);
        }
        /// <summary>
        ///编译操作（权限重写同上）
        /// </summary>
        /// <param name="saveModel"></param>
        /// <returns></returns>
       // [ApiActionPermission(ActionPermissionOptions.Update)]
        [HttpPost, Route("Update")]
        public override ActionResult Update([FromBody] SaveModel saveModel)
        {
            return base.Update(saveModel);
        }
        /// <summary>
        /// 通过key删除文件（权限重写同上）
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        //  [ApiActionPermission(ActionPermissionOptions.Delete)]
        [HttpPost, Route("Del")]
        public override ActionResult Del([FromBody] object[] keys)
        {
            return base.Del(keys);
        }

        ///更多可重写的权限见ApiBaseController

    }
}
