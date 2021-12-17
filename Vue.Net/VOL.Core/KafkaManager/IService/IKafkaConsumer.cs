using Confluent.Kafka;
using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.KafkaManager.IService
{
    public interface IKafkaConsumer<TKey, TValue> : IDisposable
    {
        /// <summary>
        /// 订阅回调模式-消费(持续订阅)
        /// </summary>
        /// <param name="Func">回调函数,若配置为非自动提交(默认为否),则通过回调函数的返回值判断是否提交</param>
        /// <param name="Topic">主题</param>
        void Consume(Func<ConsumeResult<TKey, TValue>, bool> Func, string Topic);

        /// <summary>
        /// 批量消费模式-单次消费(消费出当前Kafka缓存的所有数据,并持续监听 300ms,如无新数据生产,则返回(最多一次消费 100条)
        /// </summary>
        /// <param name="Topic">主题</param>
        /// <param name="TimeOut">持续监听时间,单位ms 默认值:300ms</param>
        /// <param name="MaxRow">最多单次消费行数 默认值:100行</param>
        /// <returns>待消费数据</returns>
        List<ConsumeResult<TKey, TValue>> ConsumeOnce(string Topic, int TimeOut = 300, int MaxRow = 100);

        /// <summary>
        /// 单笔消费模式-单行消费
        /// </summary>
        /// <param name="Topic">主题</param>
        /// <param name="TimeOut">持续监听时间,单位ms 默认值:300ms</param>
        /// <returns>待消费数据</returns>
        ConsumeResult<TKey, TValue> ConsumeOneRow(string Topic, int TimeOut = 300);
    }
}
