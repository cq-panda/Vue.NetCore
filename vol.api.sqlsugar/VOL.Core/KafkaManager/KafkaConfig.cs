////using Confluent.Kafka;
//using System;
//using System.Collections.Generic;
//using System.Text;
//using VOL.Core.Configuration;

//namespace VOL.Core.KafkaManager
//{
//    /// <summary>
//    /// 配置类
//    /// </summary>
//    public class KafkaConfig
//    {
//        /// <summary>
//        /// 构造配置类
//        /// </summary>
//        protected KafkaConfig()
//        {
//            //ProducerConfig = new ProducerConfig()
//            //{
//            //    BootstrapServers = AppSetting.Kafka.ProducerSettings.BootstrapServers,// "192.168.20.241:9092",
//            //};

//            //ConsumerConfig = new ConsumerConfig()
//            //{
//            //    BootstrapServers = AppSetting.Kafka.ConsumerSettings.BootstrapServers,
//            //    GroupId = AppSetting.Kafka.ConsumerSettings.GroupId,
//            //    AutoOffsetReset = AutoOffsetReset.Earliest,//当各分区下有已提交的offset时，从提交的offset开始消费；无提交的offset时，从头开始消费
//            //    EnableAutoCommit = false,
//            //    //Kafka配置安全认证
//            //    //SecurityProtocol = SecurityProtocol.SaslPlaintext,
//            //    //SaslMechanism = SaslMechanism.Plain,
//            //    //SaslUsername = AppSetting.Kafka.ConsumerSettings.SaslUsername,
//            //    //SaslPassword = AppSetting.Kafka.ConsumerSettings.SaslPassword,
//            //};
//        }

//        ///// <summary>
//        ///// 消费者配置文件
//        ///// </summary>
//        //public ConsumerConfig ConsumerConfig;

//        ///// <summary>
//        ///// 生产者配置文件
//        ///// </summary>
//        //public ProducerConfig ProducerConfig;
//    }
//}