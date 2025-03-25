//using System;
//using System.Collections.Generic;
//using System.Text;
//using System.Threading.Tasks;

//namespace VOL.Core.KafkaManager.IService
//{
//    public interface IKafkaProducer<TKey, TValue>
//    {
//        /// <summary>
//        /// 生产
//        /// </summary>
//        /// <param name="Key"></param>
//        /// <param name="Value"></param>
//        /// <param name="Topic"></param>
//        void Produce(TKey Key, TValue Value, string Topic);

//        /// <summary>
//        /// 生产 异步
//        /// </summary>
//        /// <param name="Key"></param>
//        /// <param name="Value"></param>
//        /// <param name="Topic"></param>
//        /// <returns></returns>
//        Task ProduceAsync(TKey Key, TValue Value, string Topic);

//    }
//}
