//using Confluent.Kafka;
//using System;
//using System.Collections.Generic;
//using System.Text;
//using System.Threading.Tasks;
//using VOL.Core.Configuration;
//using VOL.Core.Enums;
//using VOL.Core.KafkaManager.IService;
//using VOL.Core.Services;

//namespace VOL.Core.KafkaManager.Service
//{
//    /// <summary>
//    /// 消费者 (Message.Key的数据类型为string、Message.Value的数据类型为string）
//    /// 消费者实现三种消费方式：1.订阅回调模式 2.批量消费模式 3.单笔消费模式
//    /// </summary>
//    /// <typeparam name="TKey">Message.Key 的数据类型</typeparam>
//    /// <typeparam name="TValue">Message.Value 的数据类型</typeparam>
//    public class KafkaConsumer<TKey, TValue> : KafkaConfig, IKafkaConsumer<TKey, TValue>
//    {
//        /// <summary>
//        ///  Kafka地址(包含端口号)
//        /// </summary>
//        public string Servers
//        {
//            get
//            {
//                return ConsumerConfig.BootstrapServers;
//            }
//            set
//            {
//                ConsumerConfig.BootstrapServers = value;
//            }
//        }

//        /// <summary>
//        /// 消费者群组
//        /// </summary>
//        public string GroupId
//        {
//            get
//            {
//                return ConsumerConfig.GroupId;
//            }
//            set
//            {
//                ConsumerConfig.GroupId = value;
//            }
//        }

//        /// <summary>
//        /// 自动提交 默认为 false
//        /// </summary>
//        public bool EnableAutoCommit
//        {
//            get
//            {
//                return ConsumerConfig.EnableAutoCommit ?? false;
//            }
//            set
//            {
//                ConsumerConfig.EnableAutoCommit = value;
//            }
//        }

//        /// <summary>
//        /// 订阅回调模式-消费(持续订阅)
//        /// </summary>
//        /// <param name="Func">回调函数,若配置为非自动提交(默认为否),则通过回调函数的返回值判断是否提交</param>
//        /// <param name="Topic">主题</param>
//        public void Consume(Func<ConsumeResult<TKey, TValue>, bool> Func, string Topic)
//        {
//            Task.Factory.StartNew(() =>
//            {
//                var builder = new ConsumerBuilder<TKey, TValue>(ConsumerConfig);
//                //设置反序列化方式
//                builder.SetValueDeserializer(new KafkaDConverter<TValue>());
//                builder.SetErrorHandler((_, e) =>
//                {
//                    Logger.Error(LoggerType.KafkaException, null, null, $"Error:{e.Reason}");
//                }).SetStatisticsHandler((_, json) =>
//                {
//                    Console.WriteLine($"-{DateTime.Now:yyyy-MM-dd HH:mm:ss} > 消息监听中..");
//                }).SetPartitionsAssignedHandler((c, partitions) =>
//                {
//                    string partitionsStr = string.Join(", ", partitions);
//                    Console.WriteLine($"-分配的kafka分区:{partitionsStr}");
//                }).SetPartitionsRevokedHandler((c, partitions) =>
//                {
//                    string partitionsStr = string.Join(", ", partitions);
//                    Console.WriteLine($"-回收了kafka的分区:{partitionsStr}");
//                });
//                using var consumer = builder.Build();
//                consumer.Subscribe(Topic);
//                while (AppSetting.Kafka.IsConsumerSubscribe) //true
//                {
//                    ConsumeResult<TKey, TValue> result = null;
//                    try
//                    {
//                        result = consumer.Consume();
//                        if (result.IsPartitionEOF) continue;
//                        if (Func(result))
//                        {
//                            if (!(bool)ConsumerConfig.EnableAutoCommit)
//                            {
//                                //手动提交，如果上面的EnableAutoCommit=true表示自动提交，则无需调用Commit方法
//                                consumer.Commit(result);
//                            }
//                        }
//                    }
//                    catch (ConsumeException ex)
//                    {
//                        Logger.Error(LoggerType.KafkaException, $"Topic:{Topic},{ex.Error.Reason}", null, ex.Message + ex.StackTrace);
//                    }
//                    catch (Exception ex)
//                    {
//                        Logger.Error(LoggerType.KafkaException, $"Topic:{result.Topic}", null, ex.Message + ex.StackTrace);
//                    }
//                }
//            });
//        }

//        /// <summary>
//        /// 批量订阅回调模式-消费(持续订阅)
//        /// </summary>
//        /// <param name="Func">回调函数,若配置为非自动提交(默认为否),则通过回调函数的返回值判断是否提交</param>
//        /// <param name="Topic">主题</param>
//        public void ConsumeBatch(Func<ConsumeResult<TKey, TValue>, bool> Func, List<string> Topics)
//        {
//            Task.Factory.StartNew(() =>
//            {
//                var builder = new ConsumerBuilder<TKey, TValue>(ConsumerConfig);
//                //设置反序列化方式
//                builder.SetValueDeserializer(new KafkaDConverter<TValue>());
//                builder.SetErrorHandler((_, e) =>
//                {
//                    Logger.Error(LoggerType.KafkaException, null, null, $"Error:{e.Reason}");
//                }).SetStatisticsHandler((_, json) =>
//                {
//                    Console.WriteLine($"-{DateTime.Now:yyyy-MM-dd HH:mm:ss} > 消息监听中..");
//                }).SetPartitionsAssignedHandler((c, partitions) =>
//                {
//                    string partitionsStr = string.Join(", ", partitions);
//                    Console.WriteLine($"-分配的kafka分区:{partitionsStr}");
//                }).SetPartitionsRevokedHandler((c, partitions) =>
//                {
//                    string partitionsStr = string.Join(", ", partitions);
//                    Console.WriteLine($"-回收了kafka的分区:{partitionsStr}");
//                });
//                using var consumer = builder.Build();
//                consumer.Subscribe(Topics);
//                while (AppSetting.Kafka.IsConsumerSubscribe) //true
//                {
//                    ConsumeResult<TKey, TValue> result = null;
//                    try
//                    {
//                        result = consumer.Consume();
//                        if (result.IsPartitionEOF) continue;
//                        if (Func(result))
//                        {
//                            if (!(bool)ConsumerConfig.EnableAutoCommit)
//                            {
//                                //手动提交，如果上面的EnableAutoCommit=true表示自动提交，则无需调用Commit方法
//                                consumer.Commit(result);
//                            }
//                        }
//                    }
//                    catch (ConsumeException ex)
//                    {
//                        Logger.Error(LoggerType.KafkaException, $"Topic:{Topics.ToArray()},{ex.Error.Reason}", null, ex.Message + ex.StackTrace);
//                    }
//                    catch (Exception ex)
//                    {
//                        Logger.Error(LoggerType.KafkaException, $"Topic:{result.Topic}", null, ex.Message + ex.StackTrace);
//                    }
//                }
//            });
//        }

//        /// <summary>
//        /// 批量消费模式-单次消费(消费出当前Kafka缓存的所有数据,并持续监听 300ms,如无新数据生产,则返回(最多一次消费 100条)
//        /// </summary>
//        /// <param name="Topic">主题</param>
//        /// <param name="TimeOut">持续监听时间,单位ms 默认值:300ms</param>
//        /// <param name="MaxRow">最多单次消费行数 默认值:100行</param>
//        /// <returns>待消费数据</returns>
//        public List<ConsumeResult<TKey, TValue>> ConsumeOnce(string Topic, int TimeOut = 300, int MaxRow = 100)
//        {
//            var builder = new ConsumerBuilder<TKey, TValue>(ConsumerConfig);
//            //设置反序列化方式
//            builder.SetValueDeserializer(new KafkaDConverter<TValue>());
//            using var consumer = builder.Build();
//            consumer.Subscribe(Topic);
//            List<ConsumeResult<TKey, TValue>> Res = new List<ConsumeResult<TKey, TValue>>();
//            while (true)
//            {
//                try
//                {
//                    var result = consumer.Consume(TimeSpan.FromMilliseconds(TimeOut));
//                    if (result == null) break;
//                    else
//                    {
//                        Res.Add(result);
//                        //手动提交，如果上面的EnableAutoCommit=true表示自动提交，则无需调用Commit方法
//                        consumer.Commit();
//                    }
//                    if (Res.Count > MaxRow) break;
//                }
//                catch (Exception ex)
//                {
//                    Logger.Error(LoggerType.KafkaException, $"Topic:{Topic}", null, ex.Message + ex.StackTrace);
//                    return null;
//                }
//            }
//            return Res;
//        }

//        /// <summary>
//        /// 单笔消费模式-单行消费
//        /// </summary>
//        /// <param name="Topic">主题</param>
//        /// <param name="TimeOut">持续监听时间,单位ms 默认值:300ms</param>
//        /// <returns>待消费数据</returns>
//        public ConsumeResult<TKey, TValue> ConsumeOneRow(string Topic, int TimeOut = 300)
//        {
//            var builder = new ConsumerBuilder<TKey, TValue>(ConsumerConfig);
//            //设置反序列化方式
//            builder.SetValueDeserializer(new KafkaDConverter<TValue>());
//            using var consumer = builder.Build();
//            consumer.Subscribe(Topic);
//            try
//            {
//                var result = consumer.Consume(TimeSpan.FromMilliseconds(TimeOut));
//                if (result != null)
//                {
//                    //手动提交，如果上面的EnableAutoCommit=true表示自动提交，则无需调用Commit方法
//                    consumer.Commit();
//                }
//                return result;
//            }
//            catch (Exception ex)
//            {
//                Logger.Error(LoggerType.KafkaException, $"Topic:{Topic}", null, ex.Message + ex.StackTrace);
//                return null;
//            }
//        }

//        public void Dispose()
//        {
//            //if (_cache != null)
//            //    _cache.Dispose();
//            GC.SuppressFinalize(this);
//        }
//    }
//}
