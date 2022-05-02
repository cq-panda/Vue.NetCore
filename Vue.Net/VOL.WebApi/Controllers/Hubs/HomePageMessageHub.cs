using Microsoft.AspNetCore.SignalR;
using System;
<<<<<<< HEAD
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.CacheManager;

=======
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.CacheManager;
using VOL.Core.ManageUser;
using VOL.Order.IServices;
using VOL.System.IServices;
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee

namespace VOL.WebApi.Controllers.Hubs
{
    /// <summary>
<<<<<<< HEAD
    /// https://docs.microsoft.com/zh-cn/aspnet/core/signalr/introduction?view=aspnetcore-3.1
    /// https://docs.microsoft.com/zh-cn/aspnet/core/signalr/javascript-client?view=aspnetcore-6.0&tabs=visual-studio
=======
    /// SignalR即时通讯【推送方法可在业务控制器里重写，前提是需缓存起ConnectionId】
    /// 后端推送示例：HomePageMessageHub.cs上下线推送示例，SellOrderController.cs文件里GetPageData()方法中
    /// 前端调用示例：vue3.0版本 首页弹框消息
    /// 前端代码位置：Home.vue
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
    /// </summary>
    public class HomePageMessageHub : Hub
    {
        private readonly ICacheService _cacheService;
<<<<<<< HEAD


        private static ConcurrentDictionary<string, string> _connectionIds = new ConcurrentDictionary<string, string>();
=======
        private readonly ISellOrderService _service;
        private readonly ISys_UserService _userService;
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee

        /// <summary>
        /// 构造 注入
        /// </summary>
<<<<<<< HEAD
        public HomePageMessageHub(ICacheService cacheService)
        {
            _cacheService = cacheService;
=======
        public HomePageMessageHub(ICacheService cacheService, ISellOrderService service, ISys_UserService userService)
        {
            _cacheService = cacheService;
            _service = service;
            _userService = userService;
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
        }

        /// <summary>
        /// 建立连接时异步触发
        /// </summary>
        /// <returns></returns>
        public override async Task OnConnectedAsync()
        {
            //Console.WriteLine($"建立连接{Context.ConnectionId}");
<<<<<<< HEAD
            _connectionIds[Context.ConnectionId] = Context.GetHttpContext().Request.Query["userName"].ToString();
            //添加到一个组下
            //await Groups.AddToGroupAsync(Context.ConnectionId, "SignalR Users");
            //发送上线消息
            //await Clients.All.SendAsync("ReceiveHomePageMessage", 1, new { title = "系统消息", content = $"{Context.ConnectionId} 上线" });
=======
            //添加到一个组下
            await Groups.AddToGroupAsync(Context.ConnectionId, "SignalR Users");
            //发送上线消息
            await Clients.All.SendAsync("ReceiveHomePageMessage", 1, new { title = "系统消息", content = $"{Context.ConnectionId} 上线" });
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
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
<<<<<<< HEAD
            // await Groups.RemoveFromGroupAsync(Context.ConnectionId, "SignalR Users");
            //可自行调用下线业务处理方法...
            await UserOffline();
            //发送下线消息
         //   await Clients.All.SendAsync("ReceiveHomePageMessage", 4, new { title = "系统消息", content = $"{Context.ConnectionId} 离线" });
=======
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, "SignalR Users");
            //可自行调用下线业务处理方法...
            await UserOffline();
            //发送下线消息
            await Clients.All.SendAsync("ReceiveHomePageMessage", 4, new { title = "系统消息", content = $"{Context.ConnectionId} 离线" });
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
            await base.OnDisconnectedAsync(ex);
        }

        /// <summary>
<<<<<<< HEAD
        /// 根据用户名获取所有的客户端
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        private IEnumerable<string> GetCnnectionIds(string username)
        {
            foreach (var item in _connectionIds)
            {
                if (item.Value == username)
                {
                    yield return item.Key;
                }
            }
        }

        /// <summary>
        /// 发送给指定的人
        /// </summary>
        /// <param name="username">sys_user表的登陆帐号</param>
        /// <param name="message">发送的消息</param>
        /// <returns></returns>
        public async Task<bool> SendHomeMessage(string username, string title, string message)
        {
            await Clients.Clients(GetCnnectionIds(username).ToArray()).SendAsync("ReceiveHomePageMessage", new
            {
             //   username,
                title,
                message,
                date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:sss")
            });
=======
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
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
            return true;
        }

        /// <summary>
        /// 断开连接
        /// </summary>
        /// <returns></returns>
        public async Task<bool> UserOffline()
        {
            var cid = Context.ConnectionId;//也可以从缓存中获取ConnectionId
<<<<<<< HEAD
            //  await Clients.Client(cid).SendAsync("ReceiveHomePageMessage", 3, new { title = "系统消息", content = "离线成功" });
            //移除缓存
            if (_connectionIds.TryRemove(cid, out string value))
            {
            }
            await Task.CompletedTask;
=======
            await Clients.Client(cid).SendAsync("ReceiveHomePageMessage", 3, new { title = "系统消息", content = "离线成功" });

            //可以调用Service服务
            var temp = _service.GetServiceDate();
            //Console.WriteLine(temp);

            //从缓存中获取ConnectionId
            var key = "SignalR" + UserContext.Current.UserId;
            string cidCache = _cacheService.Get(key);
            _cacheService.Remove(key);

            //也可以修改用户下线状态数据等等...
>>>>>>> 1b423a02f154a9766cd3c9a61d7e8a628c0750ee
            return true;
        }


    }
}
