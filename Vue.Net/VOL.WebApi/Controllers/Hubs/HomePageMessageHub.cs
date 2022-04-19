using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.CacheManager;
using VOL.Core.ManageUser;
using VOL.Order.IServices;
using VOL.System.IServices;

namespace VOL.WebApi.Controllers.Hubs
{
    /// <summary>
    /// SignalR即时通讯【推送方法可在业务控制器里重写，前提是需缓存起ConnectionId】
    /// 后端推送示例：HomePageMessageHub.cs上下线推送示例，SellOrderController.cs文件里GetPageData()方法中
    /// 前端调用示例：vue3.0版本 首页弹框消息
    /// 前端代码位置：Home.vue
    /// </summary>
    public class HomePageMessageHub : Hub
    {
        private readonly ICacheService _cacheService;
        private readonly ISellOrderService _service;
        private readonly ISys_UserService _userService;

        /// <summary>
        /// 构造 注入
        /// </summary>
        public HomePageMessageHub(ICacheService cacheService, ISellOrderService service, ISys_UserService userService)
        {
            _cacheService = cacheService;
            _service = service;
            _userService = userService;
        }

        /// <summary>
        /// 建立连接时异步触发
        /// </summary>
        /// <returns></returns>
        public override async Task OnConnectedAsync()
        {
            //Console.WriteLine($"建立连接{Context.ConnectionId}");
            //添加到一个组下
            await Groups.AddToGroupAsync(Context.ConnectionId, "SignalR Users");
            //发送上线消息
            await Clients.All.SendAsync("ReceiveHomePageMessage", 1, new { title = "系统消息", content = $"{Context.ConnectionId} 上线" });
            await base.OnConnectedAsync();
        }

        /// <summary>
        /// 离开连接时异步触发
        /// </summary>
        /// <param name="ex"></param>
        /// <returns></returns>
        public override async Task OnDisconnectedAsync(Exception ex)
        {
            //Console.WriteLine($"断开连接{Context.ConnectionId}");
            //从组中删除
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, "SignalR Users");
            //可自行调用下线业务处理方法...
            await UserOffline();
            //发送下线消息
            await Clients.All.SendAsync("ReceiveHomePageMessage", 4, new { title = "系统消息", content = $"{Context.ConnectionId} 离线" });
            await base.OnDisconnectedAsync(ex);
        }

        /// <summary>
        /// 前端Home.vue里面调用该方法
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public async Task<bool> GetCurrentUserInfo(string username)
        {
            //Console.WriteLine(username);

            //缓存cId与userId
            var cid = Context.ConnectionId;
            //缓存ConnectionId,用于在业务控制器中推送数据
            var key = "SignalR" + UserContext.Current.UserId;
            _cacheService.Add(key, cid);

            var data = _userService.GetCurrentUserInfo();
            //是否存在消息
            await Clients.Client(cid).SendAsync("IsExistMsg", 1 == 1);
            //推送当前用户信息            
            await Clients.Client(cid).SendAsync("ReceiveHomePageMessage", 200, data);
            return true;
        }

        /// <summary>
        /// 断开连接
        /// </summary>
        /// <returns></returns>
        public async Task<bool> UserOffline()
        {
            var cid = Context.ConnectionId;//也可以从缓存中获取ConnectionId
            await Clients.Client(cid).SendAsync("ReceiveHomePageMessage", 3, new { title = "系统消息", content = "离线成功" });

            //可以调用Service服务
            var temp = _service.GetServiceDate();
            //Console.WriteLine(temp);

            //从缓存中获取ConnectionId
            var key = "SignalR" + UserContext.Current.UserId;
            string cidCache = _cacheService.Get(key);
            _cacheService.Remove(key);

            //也可以修改用户下线状态数据等等...
            return true;
        }


    }
}
