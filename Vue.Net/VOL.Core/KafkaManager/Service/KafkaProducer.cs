using Confluent.Kafka;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.KafkaManager.IService;

namespace VOL.Core.KafkaManager.Service
{
    /// <summary>
    /// 生产者 Message.Key的数据类型为string、Message.Value的数据类型为string
    /// </summary>
    /// <typeparam name="TKey">Message.Key 的数据类型</typeparam>
    /// <typeparam name="TValue">Message.Value 的数据类型</typeparam>
    public class KafkaProducer<TKey, TValue> : KafkaConfig, IKafkaProducer<TKey, TValue>
    {
        /// <summary>
        /// 构造生产者
        /// </summary>
        protected KafkaProducer()
        {

        }

        /// <summary>
        ///  Kafka地址(包含端口号) 默认为 127.0.0.1:9092
        /// </summary>
        public string Servers
        {
            get
            {
                return ProducerConfig.BootstrapServers;
            }
            set
            {
                ProducerConfig.BootstrapServers = value;
            }
        }

        /// <summary>
        /// 生产
        /// </summary>
        /// <param name="Key">Message.Key 做消息指定分区投放有用的</param>
        /// <param name="Value">Message.Value</param>
        /// <param name="Topic">主题</param>
        public void Produce(TKey Key, TValue Value, string Topic)
        {
            var producerBuilder = new ProducerBuilder<TKey, TValue>(ProducerConfig);
            producerBuilder.SetValueSerializer(new KafkaConverter<TValue>());//设置序列化方式
            using var producer = producerBuilder.Build();
            try
            {
                producer.Produce(Topic, new Message<TKey, TValue>
                {
                    Key = Key,
                    Value = Value
                }, (result) =>
                {
                    //日志
                    //WriteLog(!result.Error.IsError ? $"Delivered message to {result.TopicPartitionOffset}" : $"Delivery Error:{result.Error.Reason}");
                });//Value = JsonConvert.SerializeObject(value)
                Console.WriteLine($"Key:{Key}  Value:{Value}");
            }
            catch (ProduceException<Null, string> e)
            {
                Console.WriteLine($"Delivery failed: {e.Error.Reason}");
            }
        }

        /// <summary>
        /// 生产异步
        /// </summary>
        /// <param name="Key">Message.Key</param>
        /// <param name="Value">Message.Value</param>
        /// <param name="Topic">主题</param>
        /// <returns></returns>
        public async Task ProduceAsync(TKey Key, TValue Value, string Topic)
        {
            var producerBuilder = new ProducerBuilder<TKey, TValue>(ProducerConfig);
            producerBuilder.SetValueSerializer(new KafkaConverter<TValue>());//设置序列化方式
            using var producer = producerBuilder.Build();
            try
            {
                var dr = await producer.ProduceAsync(Topic, new Message<TKey, TValue> { Key = Key, Value = Value });
                Console.WriteLine($"Delivered '{dr.Value}' to '{dr.TopicPartitionOffset}'");
            }
            catch (ProduceException<Null, string> e)
            {
                Console.WriteLine($"Delivery failed: {e.Error.Reason}");
            }
        }
    }
}
