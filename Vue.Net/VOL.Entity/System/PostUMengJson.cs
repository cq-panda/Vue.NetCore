using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Entity.System
{
    /// <summary>
    /// 发送到友盟的json实体类
    /// </summary>
    public class PostUMengJson
    {

        /// <summary>
        /// 必填 应用唯一标识
        /// </summary>
        public string appkey { get; set; }
        /// <summary>
        /// 注意：该值由UMengMessagePush自动生成，无需主动赋值
        /// 
        /// 必填 时间戳，10位或者13位均可，时间戳有效期为10分钟 
        /// </summary>
        public string timestamp { get; set; }
        /// <summary>
        /// 必填 消息发送类型,其值可以为:
        /// <example>
        ///unicast-单播
        ///listcast-列播(要求不超过500个device_token)
        ///filecast-文件播
        ///(多个device_token可通过文件形式批量发送）
        ///broadcast-广播
        ///groupcast-组播
        ///(按照filter条件筛选特定用户群, 具体请参照filter参数)
        ///customizedcast(通过开发者自有的alias进行推送), 
        ///包括以下两种case:
        ///- alias: 对单个或者多个alias进行推送
        ///- file_id: 将alias存放到文件后，根据file_id来推送
        ///</example>
        /// </summary>
        public string type { get; set; }

        public string device_tokens { get; set; }
        /// <summary>
        /// 可选 
        /// 当type=customizedcast时必填，alias的类型, 
        /// alias_type可由开发者自定义,
        /// 开发者在SDK中调用setAlias(alias, alias_type)时所设置的alias_type
        /// </summary>
        public string alias_type { get; set; }
        /// <summary>
        /// 可选 当type=customizedcast时, 
        /// 开发者填写自己的alias。 要求不超过50个alias,多个alias以英文逗号间隔。
        /// 在SDK中调用setAlias(alias, alias_type)时所设置的alias
        /// </summary>
        public string alias { get; set; }

        public string file_id { get; set; }

        public string filter { get; set; }
        /// <summary>
        /// 必填 消息内容(Android最大为1840B),
        /// </summary>
        public Payload payload { get; set; }
        /// <summary>
        /// 可选 发送策略
        /// </summary>
        public Policy policy { get; set; }

        public string production_mode { get; set; }
        /// <summary>
        /// 可选 发送消息描述，建议填写。
        /// </summary>
        public string description { get; set; }
        public string thirdparty_id { get; set; }
    }


    public class Payload
    {
        /// <summary>
        /// 必填 消息类型，值可以为:notification-通知，message-消息
        /// </summary>
        public string display_type { get; set; }
        /// <summary>
        /// 必填 消息体
        /// </summary>
        public ContentBody body { get; set; }

        /// <summary>
        /// 可选 用户自定义key-value。只对"通知"(display_type=notification)生效。
        /// 可以配合通知到达后,打开App,打开URL,打开Activity使用。
        /// </summary>
        public Dictionary<string, object> extra { get; set; }
        public Aps aps { get; set; }
    }
    public class Aps
    {
        public Alert alert { get; set; }
        public string sound = "default";
    }
    public class Alert
    {
        public string title { get; set; }
        public string subtitle { get; set; }
        /// <summary>
        /// 通知消息的内容
        /// </summary>
        public string body { get; set; }
    }
    public class ContentBody
    {
        /// <summary>
        /// 必填 通知栏提示文字
        /// </summary>
        public string ticker { get; set; }
        /// <summary>
        /// 必填 通知标题
        /// </summary>
        public string title { get; set; }
        /// <summary>
        /// 必填 通知文字描述
        /// </summary>
        public string text { get; set; }
        public string icon { get; set; }
        public string largeIcon { get; set; }
        public string img { get; set; }
        public string sound { get; set; }
        public int builder_id { get; set; }
        public string play_vibrate { get; set; }
        public string play_lights { get; set; }
        public string play_sound { get; set; }
        /// <summary>
        /// 必填 点击"通知"的后续行为，默认为打开app。
        /// 取值：
        /// "go_app": 打开应用
        /// "go_url": 跳转到URL
        /// "go_activity": 打开特定的activity
        /// "go_custom": 用户自定义内容。
        /// </summary>
        public string after_open { get; set; }
        public string url { get; set; }
        public string activity { get; set; }
        public string custom { get; set; }
    }

    public class Policy
    {
        public string start_time { get; set; }
        public string expire_time { get; set; }
        public int max_send_num { get; set; }
        public string out_biz_no { get; set; }
    }
}
