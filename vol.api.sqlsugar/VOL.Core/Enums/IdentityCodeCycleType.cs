namespace VOL.Core.Enums
{
    /// <summary>
    /// 单据号周期类型
    /// </summary>
    public enum IdentityCodeCycleType
    {
        /// <summary>
        /// 每日，单据号格式：前缀+yyyyMMdd+流水号
        /// </summary>
        Day = 0,
        /// <summary>
        /// 每月，单据号格式：前缀+yyyyMM+流水号
        /// </summary>
        Month = 1,
        /// <summary>
        /// 每年，单据号格式：前缀+yyyy+流水号
        /// </summary>
        Year = 2
    }
}
