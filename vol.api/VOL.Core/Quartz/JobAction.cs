namespace VOL.Core.Quartz
{
    /// <summary>
    /// 定时任务操作类型
    /// </summary>
    public enum JobAction
    {
        新增 = 1,
        删除 = 2,
        修改 = 3,
        暂停 = 4,
        停止 = 5,
        开启 = 6,
        立即执行 = 7
    }
}
