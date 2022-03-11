/*
 Navicat Premium Data Transfer

 Source Server         : 120
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.53.251.208:3306
 Source Schema         : 0103

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 03/01/2022 19:57:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App_Appointment
-- ----------------------------
DROP TABLE IF EXISTS `App_Appointment`;
CREATE TABLE `App_Appointment`  (
  `Id` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Describe` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Appointment
-- ----------------------------
INSERT INTO `App_Appointment` VALUES ('08d73c0e-edef-0a68-ab81-c3dc5e0fe407', '2019-09-18 16:05:11', 1, '超级管理员', '美国十八世纪仅列于华盛顿之后的最著名人物。。', '超级管理员', '2020-04-24 13:47:46', 1, '杰明·富兰克林', '138888887698');
INSERT INTO `App_Appointment` VALUES ('08d73c0e-edf8-595b-9a8f-2ff134751833', '2019-09-18 16:05:11', 1, '超级管理员', '由古希腊盲诗人荷马创作的两部长篇史诗。', '超级管理员', '2020-04-24 13:44:04', 1, '荷马史诗', '1300111235');
INSERT INTO `App_Appointment` VALUES ('08d73c11-6a43-97e8-ca70-e8b0d906807e', '2019-09-18 16:22:59', 1, '超级管理员', '希腊神话是原始氏族社会的精神产物。', '超级管理员', '2020-05-28 16:41:33', 1, '希腊神话', '138888887698');
INSERT INTO `App_Appointment` VALUES ('08d99f6a-11d7-42c8-8b54-3b4f3ea26a70', '2021-11-04 16:06:56', 1, '超级管理员', '23', NULL, NULL, NULL, '1', '32');

-- ----------------------------
-- Table structure for App_Expert
-- ----------------------------
DROP TABLE IF EXISTS `App_Expert`;
CREATE TABLE `App_Expert`  (
  `ExpertId` int(11) NOT NULL AUTO_INCREMENT,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `AuditStatus` int(11) NOT NULL,
  `Auditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Certificate` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Education` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NOT NULL,
  `ExpertName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HeadImageUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Professional` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReallyName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Resume` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SpecialField` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ExpertId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Expert
-- ----------------------------
INSERT INTO `App_Expert` VALUES (275, '2018-09-07 10:58:17', 1, 1, '测试超级管理员', NULL, '上海市', '中国农业大学', '2018-09-04 15:49:44', 3344, 'User31110458', '博士', 1, '宫本七号', 'Upload/Tables/App_Expert/202103061750152777/head2.jpg', '150124199911110116', '超级管理员', '2021-03-07 21:55:31', 1, '1388886666', '教授', '拉美西斯', '二十九岁,对于一个人男人而言不算老,可是对于爱情来说已是风烛残年', 'Upload/Tables/App_Expert/201911271400081947/启用图片支持 (1).xlsx', '13381277739', 'User31110458', 3344);
INSERT INTO `App_Expert` VALUES (276, '2019-09-22 22:30:08', 3362, 1, 'zs', '', '北京市', '窦天宝传奇', '2018-09-18 17:45:54', 3358, '较瘦', '小学', 1, '榴莲', 'Upload/Tables/App_Expert/202109221608498894/c6dd920b17825b5801e97b400897ed03_t.gif', '250124123911110121', '超级管理员', '2021-09-24 11:09:48', 1, '1388887777', '演员', '木兰', '还没想好', 'Upload/Tables/App_Expert/201912111717154170/exceltest.xlsx', '18612119023', '较瘦', 3358);
INSERT INTO `App_Expert` VALUES (280, NULL, NULL, 0, NULL, NULL, '北京市', NULL, '2021-03-06 17:52:07', 1, '超级管理员', NULL, 1, '女秘书', 'Upload/Tables/App_Expert/202103061753415708/060222.jpg', NULL, '超级管理员', '2021-12-30 11:26:21', 1, '1388888888', NULL, '女秘书', '嗯？嗯？嗯？嗯？嗯？', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for App_News
-- ----------------------------
DROP TABLE IF EXISTS `App_News`;
CREATE TABLE `App_News`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BigImageUrls` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DailyRecommend` tinyint(4) NOT NULL,
  `DetailUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `ImageUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `NewsType` int(11) NOT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ReleaseDate` datetime(0) NULL DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ViewCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73789 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_News
-- ----------------------------
INSERT INTO `App_News` VALUES (73779, NULL, NULL, '<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	<b>网易娱乐11月21日报道</b>&nbsp;日前，杨幂在个人平台晒出自拍照，沈腾喊话魏大勋，再度引来网友对杨幂与魏大勋恋情的猜想。随后，又有网友发现魏大勋疯狂点赞微博，疑似承认与杨幂恋情。12月20日晚间，魏大勋工作室回应称，当天魏大勋的账号没有登陆过，点赞并非艺人本人的操作行为，是新浪微博系统故障导致。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	据了解，20日晚，有网友发现魏大勋的微博账号在疯狂点赞微博，其中有一条是“女人三十如狼四十如虎”，而杨幂1986年出生，今年33岁，再度引发网友的猜想\n</p>', '2019-12-22 00:54:24', 1, '超级管理员', 1, 'static/news/20191222/0054254823.html', 1, 'Upload/Tables/App_News/202108021127034211/06.jpg', '超级管理员', '2021-01-16 12:02:27', 1, 1, NULL, NULL, '魏大勋点赞\"女人三十如狼\"微博 工作室这样回应，又有网友发现魏大勋疯狂点赞微博，疑似承认与杨幂恋情', NULL);
INSERT INTO `App_News` VALUES (73780, NULL, NULL, '<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	<b>相关阅读：</b> \n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	<a href=\"https://tech.163.com/19/1221/17/F0UFROFU00097U7R.html\" target=\"_self\" style=\"color:#0F6B99;line-height:1;\"><b>马云回应指挥交响乐争议：企业家最大的资源不是钱</b></a> \n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	网易科技讯 12月21日消息，今日，马云在“2019世界浙商上海论坛暨上海市浙江商会年会”上谈到，2019年很不容易，但是我们做企业的都知道，每一年都不容易。唯一2019年最不容易的是，以往可能是部分人不容易，2019年可能是大部分企业不容易。\n</p>\n<p style=\"text-align:center;margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;color:#404040;white-space:normal;background-color:#FFFFFF;\">\n	<img src=\"http://cms-bucket.ws.126.net/2019/1221/3e42a18ej00q2uvfx0030c000t600jgc.jpg?imageView&amp;thumbnail=550x0\" style=\"vertical-align:top;max-width:550px;\" /> \n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	马云以自己为例称，“昨天一天，我收到很多朋友借钱的电话，一天内5个电话。过去一个礼拜，要卖楼的朋友大概有10个，确实不容易。”（易科）\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">以下为马云演讲实录：</span> \n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	马云：我想讲三句话，三个意思。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	第一，祝贺王均金会长、喻渭蛟执行会长的完美的工作。2019年，商会取得了那么多的成绩，这是不容易的，这主要是奉献，通过帮助别人来提升自己。我们看到了商会的巨大努力。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	第二，2019年很不容易，但是我们做企业的都知道，每一年都不容易。唯一2019年最不容易的是，以往可能是部分人不容易，2019年可能是大部分企业不容易。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	到了年底了，昨天一天，我收到很多朋友借钱的电话，一天内5个电话。过去一个礼拜，要卖楼的朋友大概有10个，确实不容易。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	我们所有的企业家都要明白，做企业2019年不容易，要想到这可能是不容易的开始，大家都不容易，就好办了。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	第三层，大家要明白，浙商过不去，其他商人肯定也过不去，我们要有这个自信。世界正在进入巨大的变化之中，中国经济也面临巨大的调整，我们只有改变自己，才能适应这种调整，我相信这是机会的开始。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	我们每一年的浙商大会，尤其是上海商会，会开得非常好，我们在这不是炫耀成绩，不是谈怎么赚钱，而是互相交流，互相学习，提升自己。只有学习的人，才能面向未来，只有改变自己的人，才有未来，只有为未来解决问题的企业，才有希望。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	祝大家2020年，在最困难的时候能够度过，我相信，我也对浙商，所有爱学习的企业家、爱交流的企业家、实干的企业家、改变自己的企业家，我相信他们能度过。\n</p>\n<p style=\"margin-top:32px;margin-bottom:0px;padding:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;\">\n	再次祝贺大家，祝福大家，2020年，我们一起努力\n</p>', '2019-12-22 00:56:04', 1, '超级管理员', 1, 'static/news/20191222/0056049868.html', 1, 'Upload/Tables/App_News/202108021126542659/05.jpg', '超级管理员', '2021-06-25 15:33:52', 1, 2, NULL, NULL, '马云谈2019太难了：光昨天我就收到5个朋友借钱电话', NULL);
INSERT INTO `App_News` VALUES (73785, NULL, NULL, '<p>7月31日晚10时30分，北京市公安局朝阳分局官方微博发布“情况通报”称，针对网络举报的“吴某凡多次诱骗年轻女性发生性关系”等有关情况，经警方调查，吴某凡（男，30岁，加拿大籍）因涉嫌强奸罪，目前已被朝阳公安分局依法刑事拘留，案件侦办工作正在进一步开展。</p><p>吴某凡，就是吴亦凡。此时，离7月22日北京市公安局朝阳分局发布涉及都美竹、吴亦凡等人的相关通报，仅过去了9天。</p><p><br/></p><p><strong>“蝴蝶”扇动“翅膀”：</strong></p><p><strong>陨落，从一场电影开始</strong></p><p>从万人瞩目的顶流巨星，到被公安机关刑事拘留的强奸罪嫌疑人，吴亦凡在“明面”上的陨落时间仅用了64天。</p><p>5月28日中午，一张吴亦凡与女孩包场看电影的截图和观影后两人走出影院的监控视频在网络放出。当晚，吴亦凡工作室委托律师发布声明提到，电影院涉嫌严重侵犯艺人隐私。随后，涉事影院发布致歉信并表示，吴亦凡及友人观影时间为5月26日，私自偷拍吴亦凡相关视频的员工饶某已被开除。</p><p>看似只是一则不起眼的绯闻，但最终引发了都美竹后续的发声。</p><p>6月2日，自称“都美竹最好的朋友”的网友“刘美丽同学”发布多张疑似都美竹与吴亦凡聊天截图，表示好友与吴亦凡曾是恋爱关系，但从4月起遭遇吴亦凡冷暴力，目前抑郁中。</p><p>信息不断发酵的同时，吴亦凡方开始发布律师声明。6月3日，北京星权律师事务所发声称，诸多主体在网络平台中发布严重失实言论，“部分别有用心者”甚至存在恶意PS相关聊天记录截图的行为，旨在“混淆视听，抹黑吴亦凡”。同日，吴亦凡在微博发布自嘲“糊凡”，更直指对方炒作，“没有一片雪花是清白的”。</p>', '2021-08-02 11:15:40', 1, '超级管理员', 1, 'static/news/20210802/1115429008.html', 0, 'Upload/Tables/App_News/202108021124432797/03.jpg', '超级管理员', '2021-12-19 23:33:06', 1, 2, NULL, NULL, '64天，“顶流”的陨落，涉嫌强奸罪！吴亦凡被北京朝阳警方拘留', NULL);
INSERT INTO `App_News` VALUES (73786, NULL, NULL, '<p>1111中国基金报&nbsp; 安曼</p><p><a href=\"https://www.163.com/keywords/6/5/60525927/1.html\" target=\"_blank\">恒大</a>又在“朋友圈”卖资产了，这次接盘的是老朋友<a href=\"https://www.163.com/keywords/8/7/817e8baf/1.html\" target=\"_blank\">腾讯</a>！</p><p>8月1日晚间，恒腾网络在港交所公告称，中国恒大以32.5亿港元价格出售恒腾网络合计11%股权。</p><p><img alt=\"恒大又卖资产！马化腾出手了！影视大佬曾豪掷44亿接盘，浮亏超19亿...\" src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2021%2F0802%2F00a68ad6p00qx6ojp0027c000hs00egc.png&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg\"/></p><p>就在一个多月前，中国恒大刚以44.33亿港元转让了7.39亿股恒腾网络的股份，接盘方是去年收购的儒意<a href=\"https://www.163.com/keywords/5/7/5f7189c6/1.html\" target=\"_blank\">影视</a>的实控人柯利明。</p><p><b>腾讯接盘7%</b></p><p><b>再次成为第二大股东</b></p><p>据公告介绍，腾讯方面按每股3.20港元价格收购恒腾网络7%股份，总代价20.68亿港元；另一个独立第三方买方以每股3.20港元价格收购恒腾网络4%股份，交易代价11.82亿港元。</p><p>两笔交易总交易代价32.5亿港元。</p><p>交易完成后，腾讯方面和独立第三方买方将分别持有恒腾已发行股本约23.90%及4%，而中国恒大仍将持有26.55%的股份。</p><p>公告还指出，为了支持恒腾业务发展，恒大方面同意提供一笔约20.7亿港元的五年期无抵押无息股东贷款。</p><p>6月22日，恒大方面以每股6港元向儒意影业、南瓜电影创始人柯利明转让7.39亿股恒腾网络股份，占总股本8%，套现44.33亿港元。交易完成后，恒大持股37.55%为第一大股东，柯利明持股增至20.5%，超过QQ音乐持股量，成为恒腾网络第二大股东。</p><p>但是此次交易完成之后，腾讯再度成为恒腾网络的第二大股东。</p><p><b>加码港版“爆款制造机”</b></p><p>不少人士分析，因为恒腾网络在流媒体领域的强劲发展势头，所以腾讯才会花重金增持。</p><p>公开资料显示，恒腾网络是由恒大集团和腾讯两大巨头合资成立的上市公司，此前，主营业务为家具定制、家电配套、阳台布艺、软装饰品、软装工程及厨房用品等产品的线上化销售。</p><p>2020年7月，恒腾网络发布公告称，将以总价72亿港元（约合人民币62亿元）全资收购儒意影业，以完成从家装行业向影视行业的转型。</p><p>而儒意影业是业内知名的影视公司，在图书出版界、编剧界、导演界、制片领域拥有强大的资源整合能力,与好莱坞影视巨头长期深入合作,先后制作了《北平无战事》、《琅琊榜》、《芈月传》、《老中医》、《老酒馆》、《决战中途岛》、《致我们终将逝去的青春》、《缝纫机乐队》、《动物世界》等超100部精品影视作品,储备数百部影视版权。</p><p>2021年的春节档，儒意影业制作的《你好，李焕英》、《送你一朵小红花》意外成为票房“黑马”，一时间恒腾网络的股价一度暴涨近800%。</p>', '2021-08-02 11:21:11', 1, '超级管理员', 1, 'static/news/20210802/1121154569.html', 1, 'Upload/Tables/App_News/202109241738397101/77776s.jpg', '超级管理员', '2021-12-19 23:32:41', 1, 1, NULL, NULL, '恒大又卖资产！马化腾出手了！影视大佬曾豪掷44亿接盘，浮亏超19亿', NULL);

-- ----------------------------
-- Table structure for App_ReportPrice
-- ----------------------------
DROP TABLE IF EXISTS `App_ReportPrice`;
CREATE TABLE `App_ReportPrice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Age` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `City` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Price` decimal(10, 0) NOT NULL,
  `Variety` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_ReportPrice
-- ----------------------------
INSERT INTO `App_ReportPrice` VALUES (67, '12-16月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '忻州市', '2018-09-10 10:12:50', 3344, '啊啊啊', 0, '超级管理员', '2021-11-10 10:04:43', 1, 29, '运动相机');
INSERT INTO `App_ReportPrice` VALUES (74, '7-12月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '唐山市', '2019-07-11 18:25:35', 1, '超级管理员', 0, '超级管理员', '2021-11-10 10:04:17', 1, 65, '数码相机');
INSERT INTO `App_ReportPrice` VALUES (75, '7-12月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '北京市', '2019-07-11 18:28:53', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:13', 1, 43, '单反相机');
INSERT INTO `App_ReportPrice` VALUES (83, '12-16月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '天津市', '2019-07-26 13:20:43', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:08', 1, 12, '运动相机');
INSERT INTO `App_ReportPrice` VALUES (85, '0-2月龄', '2019-10-21 16:42:04', 1, 2, '超级管理员', '天津市', '2019-10-21 16:41:48', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:05', 1, 23, '影棚器材');

-- ----------------------------
-- Table structure for App_Transaction
-- ----------------------------
DROP TABLE IF EXISTS `App_Transaction`;
CREATE TABLE `App_Transaction`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CowType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Quantity` int(11) NOT NULL,
  `TransactionType` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Transaction
-- ----------------------------
INSERT INTO `App_Transaction` VALUES (4, '1', '2019-09-18 18:10:01', 1, '超级管理员', '寒江孤影，江湖故人....', NULL, '超级管理员', '2021-10-12 10:23:42', 1, '小小*鸭', '13419098123', 25, 1);
INSERT INTO `App_Transaction` VALUES (5, '1', '2019-09-18 18:10:01', 1, '超级管理员', '闻着臭，吃着更臭。。。。。', NULL, '超级管理员', '2021-10-12 10:23:39', 1, '不爱`吃臭`豆腐', '13419098123', 25, 1);
INSERT INTO `App_Transaction` VALUES (6, '3', '2019-09-18 18:22:25', 1, '超级管理员', '。。。', NULL, '超级管理员', '2021-12-15 09:40:21', 1, '同是天涯流落人', '13419444123', 199, 1);
INSERT INTO `App_Transaction` VALUES (9, '3', '2020-09-19 23:22:19', 1, '超级管理员', '13888888888138888888881', NULL, '超级管理员', '2021-10-10 15:08:11', 1, '林子大了什么鸟都有', '13888888888', 0, 1);

-- ----------------------------
-- Table structure for App_TransactionAvgPrice
-- ----------------------------
DROP TABLE IF EXISTS `App_TransactionAvgPrice`;
CREATE TABLE `App_TransactionAvgPrice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AgeRange` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AvgPrice` decimal(10, 2) NOT NULL,
  `City` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Date` date NOT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `IsTop` int(11) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Variety` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_TransactionAvgPrice
-- ----------------------------
INSERT INTO `App_TransactionAvgPrice` VALUES (3, '16月龄以上', 18.00, '石家庄市', '2019-05-06 14:06:35', 1, '超级管理员', '2019-05-08', 0, 1, '超级管理员', '2021-11-10 10:02:54', 1, '数码相框,影棚器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (6, '7-12月龄', 19.00, '北京市', '2019-05-08 15:42:30', 1, '超级管理员', '2019-05-07', 0, 1, '超级管理员', '2021-11-10 10:02:29', 1, '单反相机');
INSERT INTO `App_TransactionAvgPrice` VALUES (10, '2-6月龄', 22.00, '唐山市', '2019-07-12 18:01:27', 1, '超级管理员', '2019-07-07', NULL, 0, '超级管理员', '2021-11-10 10:02:23', 1, '影棚器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (13, '2-6月龄', 90.00, '北京市', '2020-11-16 23:14:23', 1, '超级管理员', '2020-11-16', NULL, 1, '超级管理员', '2021-11-10 10:02:19', 1, '户外器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (14, '12-16月龄', 50.00, '天津市', '2020-11-16 23:14:40', 1, '超级管理员', '2020-11-16', NULL, 1, '超级管理员', '2021-11-10 10:02:14', 1, '户外器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (17, '12-16月龄', 12.00, '唐山市', '2020-11-16 23:15:47', 1, '超级管理员', '2020-11-16', NULL, 0, '超级管理员', '2021-11-10 10:02:12', 1, '影棚器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (19, '7-12月龄', 20.00, '邯郸市', '2020-11-16 23:16:22', 1, '超级管理员', '2020-11-16', NULL, 0, '超级管理员', '2021-11-10 10:02:09', 1, '数码相机');

-- ----------------------------
-- Table structure for FormCollectionObject
-- ----------------------------
DROP TABLE IF EXISTS `FormCollectionObject`;
CREATE TABLE `FormCollectionObject`  (
  `FormCollectionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FormId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FormCollectionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FormCollectionObject
-- ----------------------------
INSERT INTO `FormCollectionObject` VALUES ('90513c4c-b639-4d0d-8c9d-fb69b77620f8', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-05\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-03 19:06:50', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a37c1956-ddc0-457b-8f0a-93cdc44c257d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"没有意见\"}', '2022-01-03 19:05:46', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cccc519c-c448-4292-85d1-6a0ac2828fd9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-04\",\"field1641207457900\":\"123456\",\"field1641207424694\":\"\"}', '2022-01-03 19:09:53', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e913389c-e11a-4675-b8eb-a25c75086e37', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1111\"}', '2022-01-03 19:09:45', 1, '超级管理员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for FormDesignOptions
-- ----------------------------
DROP TABLE IF EXISTS `FormDesignOptions`;
CREATE TABLE `FormDesignOptions`  (
  `FormId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DaraggeOptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormOptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormFields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TableConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FormId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FormDesignOptions
-- ----------------------------
INSERT INTO `FormDesignOptions` VALUES ('0431a578-bfc9-407f-b95e-321c350f10cb', '2021开发语言使用调查', '[{\"id\":5,\"name\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1640871905593\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":3,\"name\":\"从什么时候开始做开发?\",\"type\":\"date\",\"icon\":\"el-icon-date\",\"value\":null,\"field\":\"field1640871902689\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":2,\"name\":\"说点什么\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641207457900\",\"width\":100,\"readonly\":false,\"required\":false},{\"id\":9,\"name\":\"图片上传\",\"type\":\"img\",\"url\":\"\",\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"icon\":\"el-icon-picture-outline\",\"field\":\"field1641207424694\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1640871905593\":[],\"field1640871902689\":null,\"field1641207457900\":null,\"field1641207424694\":null},\"formOptions\":[[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]', NULL, '[]', '2021-12-29 23:39:22', 1, '超级管理员', '超级管理员', '2022-01-03 19:00:30', 1);
INSERT INTO `FormDesignOptions` VALUES ('8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', '2021双减政策调查', '[{\"id\":5,\"name\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1641205615398\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":6,\"name\":\"您认为放学后作业对孩子的负担怎样?\",\"values\":[\"非常满意\"],\"type\":\"checkbox\",\"key\":\"满意度\",\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"icon\":\"el-icon-circle-check\",\"field\":\"field1641206170991\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":5,\"name\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"key\":\"满意度\",\"field\":\"field1641205647957\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"非常满意\"]},{\"id\":2,\"name\":\"其他意见\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641206608182\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1641205615398\":[],\"field1641206170991\":[],\"field1641205647957\":[],\"field1641206608182\":null},\"formOptions\":[[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]', NULL, '[]', '2021-12-30 21:45:16', 1, '超级管理员', '超级管理员', '2022-01-03 18:43:46', 1);

-- ----------------------------
-- Table structure for SellOrder
-- ----------------------------
DROP TABLE IF EXISTS `SellOrder`;
CREATE TABLE `SellOrder`  (
  `Order_Id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `OrderType` int(11) NOT NULL,
  `TranNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SellNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Qty` int(11) NOT NULL DEFAULT 0,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(4) NOT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of SellOrder
-- ----------------------------
INSERT INTO `SellOrder` VALUES ('2bf6dade-d206-4856-827d-a5bf060c1c70', 1, '2021031400000002', 'T2021031400000002', 200, NULL, 0, NULL, NULL, NULL, 1, '超级管理员', '2021-01-22 19:11:22', 1, '超级管理员', '2021-09-27 00:43:41');
INSERT INTO `SellOrder` VALUES ('d012569d-3007-4ea5-be12-72a21492fdf6', 1, '2021031400000001', 'T2021031400000001', 22, NULL, 0, NULL, NULL, NULL, 1, '超级管理员', '2021-01-22 17:49:47', 1, '超级管理员', '2021-08-27 09:40:31');
INSERT INTO `SellOrder` VALUES ('f30e1d98-b2c6-4150-b372-a9154553041e', 3, 'T2019000001810003', 'S2019000001810004', 56, '2019-09-18 13:28:06', 1, 1, '超级管理员', NULL, 3362, 'admin666', '2019-09-18 12:20:52', 1, '超级管理员', '2021-09-22 16:10:24');

-- ----------------------------
-- Table structure for SellOrderList
-- ----------------------------
DROP TABLE IF EXISTS `SellOrderList`;
CREATE TABLE `SellOrderList`  (
  `OrderList_Id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Order_Id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ProductName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Qty` int(11) NOT NULL DEFAULT 0,
  `Weight` decimal(11, 2) NULL DEFAULT NULL,
  `Remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderList_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of SellOrderList
-- ----------------------------
INSERT INTO `SellOrderList` VALUES ('08d8bebb-0d71-4f51-80e0-fc4d38ed29ca', 'd012569d-3007-4ea5-be12-72a21492fdf6', '女装', '1', 200, 1.00, 'Upload/Tables/Sys_Dictionary/202108020957229625/77776s.jpg', 1, '超级管理员', '2021-01-22 17:49:47', 1, '超级管理员', '2021-08-27 09:40:31');
INSERT INTO `SellOrderList` VALUES ('08d8bec6-733b-4556-8687-3a218f4d8333', '2bf6dade-d206-4856-827d-a5bf060c1c70', '女装', '11', 22, NULL, 'Upload/Tables/Sys_Dictionary/202104181727204574/060222.jpg', 1, '超级管理员', '2021-01-22 19:11:22', 1, '超级管理员', '2021-09-27 00:43:41');
INSERT INTO `SellOrderList` VALUES ('8f74fe02-543f-4c98-bb66-c8fc01e67683', 'f30e1d98-b2c6-4150-b372-a9154553041e', '男装', '1', 2, 11.00, 'Upload/Tables/Sys_Dictionary/202101180933091704/1111s.jpg', 1, '超级管理员', '2021-01-18 09:33:18', 1, '超级管理员', '2021-09-22 16:10:24');
INSERT INTO `SellOrderList` VALUES ('9af6dd8d-b2f1-47fc-ae0a-9d88d8fbcfda', '2bf6dade-d206-4856-827d-a5bf060c1c70', '女装', '1', 200, 1.00, 'Upload/Tables/Sys_Dictionary/202108020957229625/77776s.jpg', 1, '超级管理员', '2021-09-27 00:43:41', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('fc332cef-c1eb-4063-b71c-6addf19a8e8b', '6efb65b8-585e-4be7-8b77-94c76e362412', '22', '2', 0, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_City
-- ----------------------------
DROP TABLE IF EXISTS `Sys_City`;
CREATE TABLE `Sys_City`  (
  `CityId` int(11) NOT NULL,
  `CityCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CityName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_City
-- ----------------------------
INSERT INTO `Sys_City` VALUES (1, '110100', '市辖区', '110000');
INSERT INTO `Sys_City` VALUES (2, '110200', '县', '110000');
INSERT INTO `Sys_City` VALUES (3, '120100', '市辖区', '120000');
INSERT INTO `Sys_City` VALUES (4, '120200', '县', '120000');
INSERT INTO `Sys_City` VALUES (5, '130100', '石家庄市', '130000');
INSERT INTO `Sys_City` VALUES (6, '130200', '唐山市', '130000');
INSERT INTO `Sys_City` VALUES (7, '130300', '秦皇岛市', '130000');
INSERT INTO `Sys_City` VALUES (8, '130400', '邯郸市', '130000');
INSERT INTO `Sys_City` VALUES (9, '130500', '邢台市', '130000');
INSERT INTO `Sys_City` VALUES (10, '130600', '保定市', '130000');
INSERT INTO `Sys_City` VALUES (11, '130700', '张家口市', '130000');
INSERT INTO `Sys_City` VALUES (12, '130800', '承德市', '130000');
INSERT INTO `Sys_City` VALUES (13, '130900', '沧州市', '130000');
INSERT INTO `Sys_City` VALUES (14, '131000', '廊坊市', '130000');
INSERT INTO `Sys_City` VALUES (15, '131100', '衡水市', '130000');
INSERT INTO `Sys_City` VALUES (16, '140100', '太原市', '140000');
INSERT INTO `Sys_City` VALUES (17, '140200', '大同市', '140000');
INSERT INTO `Sys_City` VALUES (18, '140300', '阳泉市', '140000');
INSERT INTO `Sys_City` VALUES (19, '140400', '长治市', '140000');
INSERT INTO `Sys_City` VALUES (20, '140500', '晋城市', '140000');
INSERT INTO `Sys_City` VALUES (21, '140600', '朔州市', '140000');
INSERT INTO `Sys_City` VALUES (22, '140700', '晋中市', '140000');
INSERT INTO `Sys_City` VALUES (23, '140800', '运城市', '140000');
INSERT INTO `Sys_City` VALUES (24, '140900', '忻州市', '140000');
INSERT INTO `Sys_City` VALUES (25, '141000', '临汾市', '140000');
INSERT INTO `Sys_City` VALUES (26, '141100', '吕梁市', '140000');
INSERT INTO `Sys_City` VALUES (27, '150100', '呼和浩特市', '150000');
INSERT INTO `Sys_City` VALUES (28, '150200', '包头市', '150000');
INSERT INTO `Sys_City` VALUES (29, '150300', '乌海市', '150000');
INSERT INTO `Sys_City` VALUES (30, '150400', '赤峰市', '150000');
INSERT INTO `Sys_City` VALUES (31, '150500', '通辽市', '150000');
INSERT INTO `Sys_City` VALUES (32, '150600', '鄂尔多斯市', '150000');
INSERT INTO `Sys_City` VALUES (33, '150700', '呼伦贝尔市', '150000');
INSERT INTO `Sys_City` VALUES (34, '150800', '巴彦淖尔市', '150000');
INSERT INTO `Sys_City` VALUES (35, '150900', '乌兰察布市', '150000');
INSERT INTO `Sys_City` VALUES (36, '152200', '兴安盟', '150000');
INSERT INTO `Sys_City` VALUES (37, '152500', '锡林郭勒盟', '150000');
INSERT INTO `Sys_City` VALUES (38, '152900', '阿拉善盟', '150000');
INSERT INTO `Sys_City` VALUES (39, '210100', '沈阳市', '210000');
INSERT INTO `Sys_City` VALUES (40, '210200', '大连市', '210000');
INSERT INTO `Sys_City` VALUES (41, '210300', '鞍山市', '210000');
INSERT INTO `Sys_City` VALUES (42, '210400', '抚顺市', '210000');
INSERT INTO `Sys_City` VALUES (43, '210500', '本溪市', '210000');
INSERT INTO `Sys_City` VALUES (44, '210600', '丹东市', '210000');
INSERT INTO `Sys_City` VALUES (45, '210700', '锦州市', '210000');
INSERT INTO `Sys_City` VALUES (46, '210800', '营口市', '210000');
INSERT INTO `Sys_City` VALUES (47, '210900', '阜新市', '210000');
INSERT INTO `Sys_City` VALUES (48, '211000', '辽阳市', '210000');
INSERT INTO `Sys_City` VALUES (49, '211100', '盘锦市', '210000');
INSERT INTO `Sys_City` VALUES (50, '211200', '铁岭市', '210000');
INSERT INTO `Sys_City` VALUES (51, '211300', '朝阳市', '210000');
INSERT INTO `Sys_City` VALUES (52, '211400', '葫芦岛市', '210000');
INSERT INTO `Sys_City` VALUES (53, '220100', '长春市', '220000');
INSERT INTO `Sys_City` VALUES (54, '220200', '吉林市', '220000');
INSERT INTO `Sys_City` VALUES (55, '220300', '四平市', '220000');
INSERT INTO `Sys_City` VALUES (56, '220400', '辽源市', '220000');
INSERT INTO `Sys_City` VALUES (57, '220500', '通化市', '220000');
INSERT INTO `Sys_City` VALUES (58, '220600', '白山市', '220000');
INSERT INTO `Sys_City` VALUES (59, '220700', '松原市', '220000');
INSERT INTO `Sys_City` VALUES (60, '220800', '白城市', '220000');
INSERT INTO `Sys_City` VALUES (61, '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `Sys_City` VALUES (62, '230100', '哈尔滨市', '230000');
INSERT INTO `Sys_City` VALUES (63, '230200', '齐齐哈尔市', '230000');
INSERT INTO `Sys_City` VALUES (64, '230300', '鸡西市', '230000');
INSERT INTO `Sys_City` VALUES (65, '230400', '鹤岗市', '230000');
INSERT INTO `Sys_City` VALUES (66, '230500', '双鸭山市', '230000');
INSERT INTO `Sys_City` VALUES (67, '230600', '大庆市', '230000');
INSERT INTO `Sys_City` VALUES (68, '230700', '伊春市', '230000');
INSERT INTO `Sys_City` VALUES (69, '230800', '佳木斯市', '230000');
INSERT INTO `Sys_City` VALUES (70, '230900', '七台河市', '230000');
INSERT INTO `Sys_City` VALUES (71, '231000', '牡丹江市', '230000');
INSERT INTO `Sys_City` VALUES (72, '231100', '黑河市', '230000');
INSERT INTO `Sys_City` VALUES (73, '231200', '绥化市', '230000');
INSERT INTO `Sys_City` VALUES (74, '232700', '大兴安岭地区', '230000');
INSERT INTO `Sys_City` VALUES (75, '310100', '市辖区', '310000');
INSERT INTO `Sys_City` VALUES (76, '310200', '县', '310000');
INSERT INTO `Sys_City` VALUES (77, '320100', '南京市', '320000');
INSERT INTO `Sys_City` VALUES (78, '320200', '无锡市', '320000');
INSERT INTO `Sys_City` VALUES (79, '320300', '徐州市', '320000');
INSERT INTO `Sys_City` VALUES (80, '320400', '常州市', '320000');
INSERT INTO `Sys_City` VALUES (81, '320500', '苏州市', '320000');
INSERT INTO `Sys_City` VALUES (82, '320600', '南通市', '320000');
INSERT INTO `Sys_City` VALUES (83, '320700', '连云港市', '320000');
INSERT INTO `Sys_City` VALUES (84, '320800', '淮安市', '320000');
INSERT INTO `Sys_City` VALUES (85, '320900', '盐城市', '320000');
INSERT INTO `Sys_City` VALUES (86, '321000', '扬州市', '320000');
INSERT INTO `Sys_City` VALUES (87, '321100', '镇江市', '320000');
INSERT INTO `Sys_City` VALUES (88, '321200', '泰州市', '320000');
INSERT INTO `Sys_City` VALUES (89, '321300', '宿迁市', '320000');
INSERT INTO `Sys_City` VALUES (90, '330100', '杭州市', '330000');
INSERT INTO `Sys_City` VALUES (91, '330200', '宁波市', '330000');
INSERT INTO `Sys_City` VALUES (92, '330300', '温州市', '330000');
INSERT INTO `Sys_City` VALUES (93, '330400', '嘉兴市', '330000');
INSERT INTO `Sys_City` VALUES (94, '330500', '湖州市', '330000');
INSERT INTO `Sys_City` VALUES (95, '330600', '绍兴市', '330000');
INSERT INTO `Sys_City` VALUES (96, '330700', '金华市', '330000');
INSERT INTO `Sys_City` VALUES (97, '330800', '衢州市', '330000');
INSERT INTO `Sys_City` VALUES (98, '330900', '舟山市', '330000');
INSERT INTO `Sys_City` VALUES (99, '331000', '台州市', '330000');
INSERT INTO `Sys_City` VALUES (100, '331100', '丽水市', '330000');
INSERT INTO `Sys_City` VALUES (101, '340100', '合肥市', '340000');
INSERT INTO `Sys_City` VALUES (102, '340200', '芜湖市', '340000');
INSERT INTO `Sys_City` VALUES (103, '340300', '蚌埠市', '340000');
INSERT INTO `Sys_City` VALUES (104, '340400', '淮南市', '340000');
INSERT INTO `Sys_City` VALUES (105, '340500', '马鞍山市', '340000');
INSERT INTO `Sys_City` VALUES (106, '340600', '淮北市', '340000');
INSERT INTO `Sys_City` VALUES (107, '340700', '铜陵市', '340000');
INSERT INTO `Sys_City` VALUES (108, '340800', '安庆市', '340000');
INSERT INTO `Sys_City` VALUES (109, '341000', '黄山市', '340000');
INSERT INTO `Sys_City` VALUES (110, '341100', '滁州市', '340000');
INSERT INTO `Sys_City` VALUES (111, '341200', '阜阳市', '340000');
INSERT INTO `Sys_City` VALUES (112, '341300', '宿州市', '340000');
INSERT INTO `Sys_City` VALUES (113, '341400', '巢湖市', '340000');
INSERT INTO `Sys_City` VALUES (114, '341500', '六安市', '340000');
INSERT INTO `Sys_City` VALUES (115, '341600', '亳州市', '340000');
INSERT INTO `Sys_City` VALUES (116, '341700', '池州市', '340000');
INSERT INTO `Sys_City` VALUES (117, '341800', '宣城市', '340000');
INSERT INTO `Sys_City` VALUES (118, '350100', '福州市', '350000');
INSERT INTO `Sys_City` VALUES (119, '350200', '厦门市', '350000');
INSERT INTO `Sys_City` VALUES (120, '350300', '莆田市', '350000');
INSERT INTO `Sys_City` VALUES (121, '350400', '三明市', '350000');
INSERT INTO `Sys_City` VALUES (122, '350500', '泉州市', '350000');
INSERT INTO `Sys_City` VALUES (123, '350600', '漳州市', '350000');
INSERT INTO `Sys_City` VALUES (124, '350700', '南平市', '350000');
INSERT INTO `Sys_City` VALUES (125, '350800', '龙岩市', '350000');
INSERT INTO `Sys_City` VALUES (126, '350900', '宁德市', '350000');
INSERT INTO `Sys_City` VALUES (127, '360100', '南昌市', '360000');
INSERT INTO `Sys_City` VALUES (128, '360200', '景德镇市', '360000');
INSERT INTO `Sys_City` VALUES (129, '360300', '萍乡市', '360000');
INSERT INTO `Sys_City` VALUES (130, '360400', '九江市', '360000');
INSERT INTO `Sys_City` VALUES (131, '360500', '新余市', '360000');
INSERT INTO `Sys_City` VALUES (132, '360600', '鹰潭市', '360000');
INSERT INTO `Sys_City` VALUES (133, '360700', '赣州市', '360000');
INSERT INTO `Sys_City` VALUES (134, '360800', '吉安市', '360000');
INSERT INTO `Sys_City` VALUES (135, '360900', '宜春市', '360000');
INSERT INTO `Sys_City` VALUES (136, '361000', '抚州市', '360000');
INSERT INTO `Sys_City` VALUES (137, '361100', '上饶市', '360000');
INSERT INTO `Sys_City` VALUES (138, '370100', '济南市', '370000');
INSERT INTO `Sys_City` VALUES (139, '370200', '青岛市', '370000');
INSERT INTO `Sys_City` VALUES (140, '370300', '淄博市', '370000');
INSERT INTO `Sys_City` VALUES (141, '370400', '枣庄市', '370000');
INSERT INTO `Sys_City` VALUES (142, '370500', '东营市', '370000');
INSERT INTO `Sys_City` VALUES (143, '370600', '烟台市', '370000');
INSERT INTO `Sys_City` VALUES (144, '370700', '潍坊市', '370000');
INSERT INTO `Sys_City` VALUES (145, '370800', '济宁市', '370000');
INSERT INTO `Sys_City` VALUES (146, '370900', '泰安市', '370000');
INSERT INTO `Sys_City` VALUES (147, '371000', '威海市', '370000');
INSERT INTO `Sys_City` VALUES (148, '371100', '日照市', '370000');
INSERT INTO `Sys_City` VALUES (149, '371200', '莱芜市', '370000');
INSERT INTO `Sys_City` VALUES (150, '371300', '临沂市', '370000');
INSERT INTO `Sys_City` VALUES (151, '371400', '德州市', '370000');
INSERT INTO `Sys_City` VALUES (152, '371500', '聊城市', '370000');
INSERT INTO `Sys_City` VALUES (153, '371600', '滨州市', '370000');
INSERT INTO `Sys_City` VALUES (154, '371700', '荷泽市', '370000');
INSERT INTO `Sys_City` VALUES (155, '410100', '郑州市', '410000');
INSERT INTO `Sys_City` VALUES (156, '410200', '开封市', '410000');
INSERT INTO `Sys_City` VALUES (157, '410300', '洛阳市', '410000');
INSERT INTO `Sys_City` VALUES (158, '410400', '平顶山市', '410000');
INSERT INTO `Sys_City` VALUES (159, '410500', '安阳市', '410000');
INSERT INTO `Sys_City` VALUES (160, '410600', '鹤壁市', '410000');
INSERT INTO `Sys_City` VALUES (161, '410700', '新乡市', '410000');
INSERT INTO `Sys_City` VALUES (162, '410800', '焦作市', '410000');
INSERT INTO `Sys_City` VALUES (163, '410900', '濮阳市', '410000');
INSERT INTO `Sys_City` VALUES (164, '411000', '许昌市', '410000');
INSERT INTO `Sys_City` VALUES (165, '411100', '漯河市', '410000');
INSERT INTO `Sys_City` VALUES (166, '411200', '三门峡市', '410000');
INSERT INTO `Sys_City` VALUES (167, '411300', '南阳市', '410000');
INSERT INTO `Sys_City` VALUES (168, '411400', '商丘市', '410000');
INSERT INTO `Sys_City` VALUES (169, '411500', '信阳市', '410000');
INSERT INTO `Sys_City` VALUES (170, '411600', '周口市', '410000');
INSERT INTO `Sys_City` VALUES (171, '411700', '驻马店市', '410000');
INSERT INTO `Sys_City` VALUES (172, '420100', '武汉市', '420000');
INSERT INTO `Sys_City` VALUES (173, '420200', '黄石市', '420000');
INSERT INTO `Sys_City` VALUES (174, '420300', '十堰市', '420000');
INSERT INTO `Sys_City` VALUES (175, '420500', '宜昌市', '420000');
INSERT INTO `Sys_City` VALUES (176, '420600', '襄樊市', '420000');
INSERT INTO `Sys_City` VALUES (177, '420700', '鄂州市', '420000');
INSERT INTO `Sys_City` VALUES (178, '420800', '荆门市', '420000');
INSERT INTO `Sys_City` VALUES (179, '420900', '孝感市', '420000');
INSERT INTO `Sys_City` VALUES (180, '421000', '荆州市', '420000');
INSERT INTO `Sys_City` VALUES (181, '421100', '黄冈市', '420000');
INSERT INTO `Sys_City` VALUES (182, '421200', '咸宁市', '420000');
INSERT INTO `Sys_City` VALUES (183, '421300', '随州市', '420000');
INSERT INTO `Sys_City` VALUES (184, '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `Sys_City` VALUES (185, '429000', '省直辖行政单位', '420000');
INSERT INTO `Sys_City` VALUES (186, '430100', '长沙市', '430000');
INSERT INTO `Sys_City` VALUES (187, '430200', '株洲市', '430000');
INSERT INTO `Sys_City` VALUES (188, '430300', '湘潭市', '430000');
INSERT INTO `Sys_City` VALUES (189, '430400', '衡阳市', '430000');
INSERT INTO `Sys_City` VALUES (190, '430500', '邵阳市', '430000');
INSERT INTO `Sys_City` VALUES (191, '430600', '岳阳市', '430000');
INSERT INTO `Sys_City` VALUES (192, '430700', '常德市', '430000');
INSERT INTO `Sys_City` VALUES (193, '430800', '张家界市', '430000');
INSERT INTO `Sys_City` VALUES (194, '430900', '益阳市', '430000');
INSERT INTO `Sys_City` VALUES (195, '431000', '郴州市', '430000');
INSERT INTO `Sys_City` VALUES (196, '431100', '永州市', '430000');
INSERT INTO `Sys_City` VALUES (197, '431200', '怀化市', '430000');
INSERT INTO `Sys_City` VALUES (198, '431300', '娄底市', '430000');
INSERT INTO `Sys_City` VALUES (199, '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `Sys_City` VALUES (200, '440100', '广州市', '440000');
INSERT INTO `Sys_City` VALUES (201, '440200', '韶关市', '440000');
INSERT INTO `Sys_City` VALUES (202, '440300', '深圳市', '440000');
INSERT INTO `Sys_City` VALUES (203, '440400', '珠海市', '440000');
INSERT INTO `Sys_City` VALUES (204, '440500', '汕头市', '440000');
INSERT INTO `Sys_City` VALUES (205, '440600', '佛山市', '440000');
INSERT INTO `Sys_City` VALUES (206, '440700', '江门市', '440000');
INSERT INTO `Sys_City` VALUES (207, '440800', '湛江市', '440000');
INSERT INTO `Sys_City` VALUES (208, '440900', '茂名市', '440000');
INSERT INTO `Sys_City` VALUES (209, '441200', '肇庆市', '440000');
INSERT INTO `Sys_City` VALUES (210, '441300', '惠州市', '440000');
INSERT INTO `Sys_City` VALUES (211, '441400', '梅州市', '440000');
INSERT INTO `Sys_City` VALUES (212, '441500', '汕尾市', '440000');
INSERT INTO `Sys_City` VALUES (213, '441600', '河源市', '440000');
INSERT INTO `Sys_City` VALUES (214, '441700', '阳江市', '440000');
INSERT INTO `Sys_City` VALUES (215, '441800', '清远市', '440000');
INSERT INTO `Sys_City` VALUES (216, '441900', '东莞市', '440000');
INSERT INTO `Sys_City` VALUES (217, '442000', '中山市', '440000');
INSERT INTO `Sys_City` VALUES (218, '445100', '潮州市', '440000');
INSERT INTO `Sys_City` VALUES (219, '445200', '揭阳市', '440000');
INSERT INTO `Sys_City` VALUES (220, '445300', '云浮市', '440000');
INSERT INTO `Sys_City` VALUES (221, '450100', '南宁市', '450000');
INSERT INTO `Sys_City` VALUES (222, '450200', '柳州市', '450000');
INSERT INTO `Sys_City` VALUES (223, '450300', '桂林市', '450000');
INSERT INTO `Sys_City` VALUES (224, '450400', '梧州市', '450000');
INSERT INTO `Sys_City` VALUES (225, '450500', '北海市', '450000');
INSERT INTO `Sys_City` VALUES (226, '450600', '防城港市', '450000');
INSERT INTO `Sys_City` VALUES (227, '450700', '钦州市', '450000');
INSERT INTO `Sys_City` VALUES (228, '450800', '贵港市', '450000');
INSERT INTO `Sys_City` VALUES (229, '450900', '玉林市', '450000');
INSERT INTO `Sys_City` VALUES (230, '451000', '百色市', '450000');
INSERT INTO `Sys_City` VALUES (231, '451100', '贺州市', '450000');
INSERT INTO `Sys_City` VALUES (232, '451200', '河池市', '450000');
INSERT INTO `Sys_City` VALUES (233, '451300', '来宾市', '450000');
INSERT INTO `Sys_City` VALUES (234, '451400', '崇左市', '450000');
INSERT INTO `Sys_City` VALUES (235, '460100', '海口市', '460000');
INSERT INTO `Sys_City` VALUES (236, '460200', '三亚市', '460000');
INSERT INTO `Sys_City` VALUES (237, '469000', '省直辖县级行政单位', '460000');
INSERT INTO `Sys_City` VALUES (238, '500100', '市辖区', '500000');
INSERT INTO `Sys_City` VALUES (239, '500200', '县', '500000');
INSERT INTO `Sys_City` VALUES (240, '500300', '市', '500000');
INSERT INTO `Sys_City` VALUES (241, '510100', '成都市', '510000');
INSERT INTO `Sys_City` VALUES (242, '510300', '自贡市', '510000');
INSERT INTO `Sys_City` VALUES (243, '510400', '攀枝花市', '510000');
INSERT INTO `Sys_City` VALUES (244, '510500', '泸州市', '510000');
INSERT INTO `Sys_City` VALUES (245, '510600', '德阳市', '510000');
INSERT INTO `Sys_City` VALUES (246, '510700', '绵阳市', '510000');
INSERT INTO `Sys_City` VALUES (247, '510800', '广元市', '510000');
INSERT INTO `Sys_City` VALUES (248, '510900', '遂宁市', '510000');
INSERT INTO `Sys_City` VALUES (249, '511000', '内江市', '510000');
INSERT INTO `Sys_City` VALUES (250, '511100', '乐山市', '510000');
INSERT INTO `Sys_City` VALUES (251, '511300', '南充市', '510000');
INSERT INTO `Sys_City` VALUES (252, '511400', '眉山市', '510000');
INSERT INTO `Sys_City` VALUES (253, '511500', '宜宾市', '510000');
INSERT INTO `Sys_City` VALUES (254, '511600', '广安市', '510000');
INSERT INTO `Sys_City` VALUES (255, '511700', '达州市', '510000');
INSERT INTO `Sys_City` VALUES (256, '511800', '雅安市', '510000');
INSERT INTO `Sys_City` VALUES (257, '511900', '巴中市', '510000');
INSERT INTO `Sys_City` VALUES (258, '512000', '资阳市', '510000');
INSERT INTO `Sys_City` VALUES (259, '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `Sys_City` VALUES (260, '513300', '甘孜藏族自治州', '510000');
INSERT INTO `Sys_City` VALUES (261, '513400', '凉山彝族自治州', '510000');
INSERT INTO `Sys_City` VALUES (262, '520100', '贵阳市', '520000');
INSERT INTO `Sys_City` VALUES (263, '520200', '六盘水市', '520000');
INSERT INTO `Sys_City` VALUES (264, '520300', '遵义市', '520000');
INSERT INTO `Sys_City` VALUES (265, '520400', '安顺市', '520000');
INSERT INTO `Sys_City` VALUES (266, '522200', '铜仁地区', '520000');
INSERT INTO `Sys_City` VALUES (267, '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (268, '522400', '毕节地区', '520000');
INSERT INTO `Sys_City` VALUES (269, '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (270, '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (271, '530100', '昆明市', '530000');
INSERT INTO `Sys_City` VALUES (272, '530300', '曲靖市', '530000');
INSERT INTO `Sys_City` VALUES (273, '530400', '玉溪市', '530000');
INSERT INTO `Sys_City` VALUES (274, '530500', '保山市', '530000');
INSERT INTO `Sys_City` VALUES (275, '530600', '昭通市', '530000');
INSERT INTO `Sys_City` VALUES (276, '530700', '丽江市', '530000');
INSERT INTO `Sys_City` VALUES (277, '530800', '思茅市', '530000');
INSERT INTO `Sys_City` VALUES (278, '530900', '临沧市', '530000');
INSERT INTO `Sys_City` VALUES (279, '532300', '楚雄彝族自治州', '530000');
INSERT INTO `Sys_City` VALUES (280, '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `Sys_City` VALUES (281, '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `Sys_City` VALUES (282, '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `Sys_City` VALUES (283, '532900', '大理白族自治州', '530000');
INSERT INTO `Sys_City` VALUES (284, '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `Sys_City` VALUES (285, '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `Sys_City` VALUES (286, '533400', '迪庆藏族自治州', '530000');
INSERT INTO `Sys_City` VALUES (287, '540100', '拉萨市', '540000');
INSERT INTO `Sys_City` VALUES (288, '542100', '昌都地区', '540000');
INSERT INTO `Sys_City` VALUES (289, '542200', '山南地区', '540000');
INSERT INTO `Sys_City` VALUES (290, '542300', '日喀则地区', '540000');
INSERT INTO `Sys_City` VALUES (291, '542400', '那曲地区', '540000');
INSERT INTO `Sys_City` VALUES (292, '542500', '阿里地区', '540000');
INSERT INTO `Sys_City` VALUES (293, '542600', '林芝地区', '540000');
INSERT INTO `Sys_City` VALUES (294, '610100', '西安市', '610000');
INSERT INTO `Sys_City` VALUES (295, '610200', '铜川市', '610000');
INSERT INTO `Sys_City` VALUES (296, '610300', '宝鸡市', '610000');
INSERT INTO `Sys_City` VALUES (297, '610400', '咸阳市', '610000');
INSERT INTO `Sys_City` VALUES (298, '610500', '渭南市', '610000');
INSERT INTO `Sys_City` VALUES (299, '610600', '延安市', '610000');
INSERT INTO `Sys_City` VALUES (300, '610700', '汉中市', '610000');
INSERT INTO `Sys_City` VALUES (301, '610800', '榆林市', '610000');
INSERT INTO `Sys_City` VALUES (302, '610900', '安康市', '610000');
INSERT INTO `Sys_City` VALUES (303, '611000', '商洛市', '610000');
INSERT INTO `Sys_City` VALUES (304, '620100', '兰州市', '620000');
INSERT INTO `Sys_City` VALUES (305, '620200', '嘉峪关市', '620000');
INSERT INTO `Sys_City` VALUES (306, '620300', '金昌市', '620000');
INSERT INTO `Sys_City` VALUES (307, '620400', '白银市', '620000');
INSERT INTO `Sys_City` VALUES (308, '620500', '天水市', '620000');
INSERT INTO `Sys_City` VALUES (309, '620600', '武威市', '620000');
INSERT INTO `Sys_City` VALUES (310, '620700', '张掖市', '620000');
INSERT INTO `Sys_City` VALUES (311, '620800', '平凉市', '620000');
INSERT INTO `Sys_City` VALUES (312, '620900', '酒泉市', '620000');
INSERT INTO `Sys_City` VALUES (313, '621000', '庆阳市', '620000');
INSERT INTO `Sys_City` VALUES (314, '621100', '定西市', '620000');
INSERT INTO `Sys_City` VALUES (315, '621200', '陇南市', '620000');
INSERT INTO `Sys_City` VALUES (316, '622900', '临夏回族自治州', '620000');
INSERT INTO `Sys_City` VALUES (317, '623000', '甘南藏族自治州', '620000');
INSERT INTO `Sys_City` VALUES (318, '630100', '西宁市', '630000');
INSERT INTO `Sys_City` VALUES (319, '632100', '海东地区', '630000');
INSERT INTO `Sys_City` VALUES (320, '632200', '海北藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (321, '632300', '黄南藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (322, '632500', '海南藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (323, '632600', '果洛藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (324, '632700', '玉树藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (325, '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (326, '640100', '银川市', '640000');
INSERT INTO `Sys_City` VALUES (327, '640200', '石嘴山市', '640000');
INSERT INTO `Sys_City` VALUES (328, '640300', '吴忠市', '640000');
INSERT INTO `Sys_City` VALUES (329, '640400', '固原市', '640000');
INSERT INTO `Sys_City` VALUES (330, '640500', '中卫市', '640000');
INSERT INTO `Sys_City` VALUES (331, '650100', '乌鲁木齐市', '650000');
INSERT INTO `Sys_City` VALUES (332, '650200', '克拉玛依市', '650000');
INSERT INTO `Sys_City` VALUES (333, '652100', '吐鲁番地区', '650000');
INSERT INTO `Sys_City` VALUES (334, '652200', '哈密地区', '650000');
INSERT INTO `Sys_City` VALUES (335, '652300', '昌吉回族自治州', '650000');
INSERT INTO `Sys_City` VALUES (336, '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `Sys_City` VALUES (337, '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `Sys_City` VALUES (338, '652900', '阿克苏地区', '650000');
INSERT INTO `Sys_City` VALUES (339, '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `Sys_City` VALUES (340, '653100', '喀什地区', '650000');
INSERT INTO `Sys_City` VALUES (341, '653200', '和田地区', '650000');
INSERT INTO `Sys_City` VALUES (342, '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `Sys_City` VALUES (343, '654200', '塔城地区', '650000');
INSERT INTO `Sys_City` VALUES (344, '654300', '阿勒泰地区', '650000');
INSERT INTO `Sys_City` VALUES (345, '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for Sys_Dictionary
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Dictionary`;
CREATE TABLE `Sys_Dictionary`  (
  `Dic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Config` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DBServer` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DbSql` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DicNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Dic_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\ntextField: \'Enable\',\n containField: null,\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', '1', NULL, '是否值', 'enable', 1, '测试超级管理员', '2018-07-10 16:38:51', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\n textField: \'Success\', \n containField: null,\n handler: null }\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '测试超级管理员', '2018-06-12 10:21:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\n textField: \'LogType\', \n containField: null,\n handler: null }\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2020-11-05 10:28:22', 1, NULL, 1, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\n textField: \'RoleName\', \n containField: [\'Role_Id\',\'RoleName\'],\n handler: null }\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\n', '角色列表', 'roles', 1, '测试超级管理员', '2018-07-13 15:03:53', 1, 123, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (35, '{\n valueField: \'AuditStatus\',\n textField: \'AuditStatus\',\n  containField:null \n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (36, '{\n valueField: \'Variety\',\n textField: \'Variety\',\n  containField:null \n}', '2018-07-10 14:06:12', 1, '测试超级管理员', NULL, NULL, '品种', 'pz', 1, '超级管理员', '2021-11-10 09:59:44', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (37, '{\n valueField: \'AgeRange\',\n textField: \'AgeRange\',\n  containField:null \n}', '2018-07-10 14:07:46', NULL, '测试超级管理员', NULL, NULL, '月龄', 'age', 1, '测试超级管理员', '2018-07-10 14:14:49', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\n valueField: \'City\',\n textField: \'City\',\n  containField:null \n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '测试超级管理员', '2018-07-16 17:03:50', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (44, '{\n valueField: \'NewsType\',\n textField: \'NewsType\',\n  containField:null \n}', '2018-07-10 16:15:59', 1, '测试超级管理员', NULL, NULL, '新闻类型', 'news', 1, '超级管理员', '2021-03-24 13:42:20', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (45, '{\n valueField: \'Expire\',\n textField: \'Expire\',\n  containField:null \n}', '2018-07-10 16:38:40', 1, '测试超级管理员', NULL, NULL, '是否过期', 'expire', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\n valueField: \'ProvinceName\',\n textField: \'ProvinceName\',\n  containField:null \n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '测试超级管理员', '2018-07-23 15:23:21', 1, NULL, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (48, '{\n valueField: \'ClassifyId\',\n textField: \'ClassifyTitle\',\n  containField:null \n}', '2018-07-18 10:16:22', NULL, '测试超级管理员', NULL, NULL, '是否买入', 'nav', 1, '超级管理员', '2019-09-18 18:09:42', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (49, '{\n valueField: \'Gender\',\n textField: \'Gender\',\n  containField:null \n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\n valueField: \'Enable\',\n textField: \'Enable\',\n  containField:null \n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (52, '{\n valueField: \'Choiceness\',\n textField: \'Choiceness\',\n  containField:null \n}', '2018-07-24 15:45:47', 1, '测试超级管理员', NULL, NULL, '是否买入', 'cq', 1, '超级管理员', '2020-09-06 00:24:59', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (59, '{\n valueField: \'IsRegregisterPhone\',\n textField: \'IsRegregisterPhone\',\n  containField:null \n}', '2018-08-29 15:54:21', 1, '测试超级管理员', NULL, NULL, 'test', 'isphone', 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (62, '{\n valueField: \'IsTop\',\n textField: \'IsTop\',\n  containField:null \n}', '2019-08-20 09:57:54', 1, '超级管理员', NULL, NULL, 'test1', 'top', 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, 1, 'dddd');
INSERT INTO `Sys_Dictionary` VALUES (64, NULL, '2019-09-18 19:25:47', 1, '超级管理员', NULL, NULL, '订单类型', 'ordertype', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (65, NULL, '2019-09-19 10:07:23', 1, '超级管理员', NULL, NULL, '商品名称', 'pn', 1, '超级管理员', '2021-03-24 13:43:23', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (66, NULL, '2020-05-08 09:42:50', 1, '超级管理员', NULL, NULL, 'dr', 'dr', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (67, NULL, '2020-05-30 19:48:29', 1, '超级管理员', NULL, NULL, '获取所有角色Table显示用', 't_roles', 1, '超级管理员', '2020-05-30 19:48:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (69, NULL, '2020-09-18 23:13:42', 1, '超级管理员', NULL, NULL, '11', 'test111', 1, '超级管理员', '2021-10-15 16:27:27', 1, 1, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (70, NULL, '2020-11-02 19:18:08', 1, '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS `key`,RoleName AS `value` FROM Sys_Role', '级联角色', 'tree_roles', 1, '超级管理员', '2021-02-28 14:35:35', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (75, NULL, '2022-01-03 19:31:24', 1, '超级管理员', NULL, NULL, '满意度', '满意度', 1, NULL, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for Sys_DictionaryList
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DictionaryList`;
CREATE TABLE `Sys_DictionaryList`  (
  `DicList_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicValue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dic_ID` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DicList_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '0', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核未通过', '2', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (40, '2018-07-10 14:06:13', 1, '测试超级管理员', '数码相框', '数码相框', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (41, '2018-07-10 14:06:13', 1, '测试超级管理员', '影棚器材', '影棚器材', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (42, '2018-07-10 14:06:13', 1, '测试超级管理员', '户外器材', '户外器材', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (44, '2018-07-10 14:06:13', 1, '测试超级管理员', '运动相机', '运动相机', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (45, '2018-07-10 14:06:13', 1, '测试超级管理员', '微单相机', '微单相机', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (46, '2018-07-10 14:06:13', 1, '测试超级管理员', '单反相机', '单反相机', 36, 0, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (47, '2018-07-10 14:07:46', 1, '测试超级管理员', '0-2月龄', '0-2月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (48, '2018-07-10 14:07:46', 1, '测试超级管理员', '2-6月龄', '2-6月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (49, '2018-07-10 14:07:46', 1, '测试超级管理员', '7-12月龄', '7-12月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (50, '2018-07-10 14:07:46', 1, '测试超级管理员', '12-16月龄', '12-16月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (51, '2018-07-10 14:07:46', 1, '测试超级管理员', '16月龄以上', '16月龄以上', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (64, '2018-07-10 16:15:59', 1, '测试超级管理员', '实时', '1', 44, NULL, '超级管理员', '2021-03-24 13:42:20', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (65, '2018-07-10 16:15:59', 1, '测试超级管理员', '娱乐', '2', 44, NULL, '超级管理员', '2021-03-24 13:42:20', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (66, '2018-07-10 16:38:40', 1, '测试超级管理员', '否', '0', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (67, '2018-07-10 16:38:40', 1, '测试超级管理员', '是', '1', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (70, '2018-07-11 17:11:18', 1, '测试超级管理员', 'App请求异常', 'ApiException', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (77, '2018-07-18 10:16:22', 1, '测试超级管理员', '现金', '1', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 120, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (78, '2018-07-18 10:16:23', 1, '测试超级管理员', '赊账', '2', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (79, '2018-07-18 10:16:23', 1, '测试超级管理员', '抵扣', '3', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (92, '2018-07-23 10:44:14', 1, '测试超级管理员', '修改密码', 'ApiModifyPwd', 31, 0, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (101, '2018-07-24 15:45:47', 1, '测试超级管理员', '否', '0', 52, 0, '超级管理员', '2020-09-06 00:24:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (102, '2018-07-24 15:45:47', 1, '测试超级管理员', '是', '1', 52, 0, '超级管理员', '2020-09-06 00:24:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (128, '2018-08-29 15:54:21', 1, '测试超级管理员', '是', '1', 59, 0, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (129, '2018-08-29 15:54:21', 1, '测试超级管理员', '否', '0', 59, 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (130, '2018-09-04 16:13:47', 1, '测试超级管理员', '数码相机', '数码相机', 36, 1, '超级管理员', '2021-11-10 09:59:44', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (142, '2019-08-20 09:57:54', 1, '超级管理员', '是', '1', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '1');
INSERT INTO `Sys_DictionaryList` VALUES (143, '2019-08-20 09:57:54', 1, '超级管理员', '否', '0', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '测试');
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (149, '2019-09-18 19:25:47', 1, '超级管理员', '发货', '1', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (150, '2019-09-18 19:25:47', 1, '超级管理员', '退货', '2', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (151, '2019-09-18 19:25:47', 1, '超级管理员', '返单', '3', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (152, '2019-09-19 10:07:23', 1, '超级管理员', '二手', '二手', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (153, '2019-09-19 10:07:23', 1, '超级管理员', '潮流', '潮流', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, 4, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (154, '2019-09-19 10:07:23', 1, '超级管理员', '家电', '家电', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, 6, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (155, '2019-09-19 10:07:23', 1, '超级管理员', '食品', '食品', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (156, '2019-10-11 10:41:32', 1, '超级管理员', '登陆已过期', 'ApiAuthorize', 31, NULL, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (157, '2020-05-08 09:42:50', 1, '超级管理员', '否', '0', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (158, '2020-05-08 09:42:50', 1, '超级管理员', '是', '1', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (160, '2020-09-06 00:24:59', 1, '超级管理员', NULL, NULL, 52, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (161, '2020-09-11 23:10:50', 1, '超级管理员', '审核', 'Audit', 31, 0, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (162, '2020-09-11 23:10:50', 1, '超级管理员', '打印', 'Print', 31, 0, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (164, '2020-09-11 23:12:54', 1, '超级管理员', '开启权限', 'Open', 31, 0, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (165, '2020-09-11 23:12:54', 1, '超级管理员', '其他', 'Other', 31, 0, '超级管理员', '2020-11-05 10:28:22', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (168, '2020-11-05 10:28:22', 1, '超级管理员', 'Info', '3', 31, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (171, '2021-08-16 14:00:45', 1, '超级管理员', '3', '3', 69, 0, '超级管理员', '2021-10-15 16:27:27', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (175, '2022-01-03 19:31:25', 1, '超级管理员', '非常满意', '非常满意', 75, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (176, '2022-01-03 19:31:25', 1, '超级管理员', '十分满意', '十分满意', 75, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (177, '2022-01-03 19:31:25', 1, '超级管理员', '相当满意', '相当满意', 75, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (178, '2022-01-03 19:31:25', 1, '超级管理员', '比较满意', '比较满意', 75, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Log`;
CREATE TABLE `Sys_Log`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BeginDate` datetime(0) NULL DEFAULT NULL,
  `BrowserType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ElapsedTime` int(11) NULL DEFAULT NULL,
  `EndDate` datetime(0) NULL DEFAULT NULL,
  `ExceptionInfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LogType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RequestParameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ResponseParameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `ServiceIP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Success` int(11) NULL DEFAULT NULL,
  `Url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserIP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255446 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------
INSERT INTO `Sys_Log` VALUES (255431, '2022-01-03 19:57:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 85, '2022-01-03 19:57:16', '', 'System', '', '', 0, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/Upload/Tables/Sys_User/202006191408112343/1111s.jpg', '127.0.0.1', '', 0);
INSERT INTO `Sys_Log` VALUES (255432, '2022-01-03 19:57:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 3240, '2022-01-03 19:57:19', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/menu/getTreeMenu', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255433, '2022-01-03 19:57:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 261, '2022-01-03 19:57:20', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/formDesignOptions/getList', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255434, '2022-01-03 19:57:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 470, '2022-01-03 19:57:20', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/FormCollectionObject/getPageData', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255438, '2022-01-03 19:57:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 537, '2022-01-03 19:57:21', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/FormCollectionObject/getPageData', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255439, '2022-01-03 19:57:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 636, '2022-01-03 19:57:22', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/FormCollectionObject/getPageData', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255440, '2022-01-03 19:57:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 516, '2022-01-03 19:57:24', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/Sys_Log/getPageData', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255441, '2022-01-03 19:57:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1154, '2022-01-03 19:57:25', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/Sys_Dictionary/GetVueDictionary', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255442, '2022-01-03 19:57:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 553, '2022-01-03 19:57:25', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/Sys_Log/getPageData', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255443, '2022-01-03 19:57:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 2234, '2022-01-03 19:57:26', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/Sys_Dictionary/GetVueDictionary', '127.0.0.1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (255445, '2022-01-03 19:57:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 552, '2022-01-03 19:57:29', '', 'System', '', '', 1, '127.0.0.1:9995', 3, 'http://127.0.0.1:9995/api/Sys_Log/getPageData', '127.0.0.1', '超级管理员', 1);

-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Menu`;
CREATE TABLE `Sys_Menu`  (
  `Menu_Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Auth` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Menu
INSERT INTO `Sys_Menu` VALUES (2, '用户信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-user-solid', NULL, 1, 1600, '.', 0, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2021-08-02 02:59:11', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2021-05-02 15:55:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-info', NULL, 1, 1300, 'xxx', 0, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2021-08-02 03:00:14', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 11110, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2021-05-02 15:56:46', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (10, '表单与上传下载', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 28, '/formUpload', NULL, NULL, '2019-12-07 11:16:47', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (11, 'api加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, 'table2', 12, '/table2', NULL, NULL, '2019-11-14 00:11:17', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (12, 'table使用', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-date', NULL, 1, 1710, '/', 0, '', '2017-08-28 14:22:10', 'null', '2021-08-02 02:55:40', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (16, '首页轮播图片', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 2000, 'App_HomeHeadImages', 15, '/App_HomeHeadImages/Manager', NULL, NULL, '2019-08-12 16:26:44', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (24, '后台加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 750, '/', 56, '/table', NULL, NULL, '2021-07-25 12:26:52', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (25, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1100, '/', 29, '/form6', NULL, NULL, '2019-09-22 23:27:37', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (26, '文件上传', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'volUploadExample', 28, '/volUploadExample', NULL, NULL, '2019-12-17 18:29:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (27, 'table编辑(一)', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'vtable', 12, '/table1', NULL, NULL, '2021-03-20 15:20:43', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (28, '文件上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', 'el-icon-upload', NULL, 1, 1690, '/', 0, NULL, NULL, NULL, '2021-08-02 02:58:35', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (29, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-folder-opened', NULL, 1, 1670, '其他组件', 0, '', NULL, NULL, '2021-08-02 02:59:02', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (30, '图表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100000, 'App_PriceTendency', 34, '/chart', NULL, NULL, '2019-11-14 00:07:26', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (31, '图表+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 950, 'App_Comment', 34, '/formChart', NULL, NULL, '2019-11-14 00:07:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (32, '表单一对多', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-s-operation', NULL, 1, 1740, '/', 0, '', NULL, NULL, '2021-08-02 02:54:56', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (33, '完整table+forms', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 800, 'tableForms', 12, '/tableForms', NULL, NULL, '2021-08-03 09:51:26', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (34, '图表表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-set-up', NULL, 1, 1720, '/', 0, '', NULL, NULL, '2021-08-02 02:57:01', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (35, '可编辑的table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 730, 'editTable', 56, '/editTable', NULL, NULL, '2021-07-25 12:26:55', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (36, '表单一对多table', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 950, 'App_TransactionAvgPrice1', 32, '/multi1', NULL, NULL, '2019-11-14 00:03:19', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (37, '表单+图表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_Transaction', 32, '/multi3', NULL, NULL, '2019-11-14 00:04:17', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (41, '后台校验', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-document-copy', NULL, 1, 1700, '/', 0, '', NULL, NULL, '2021-08-02 02:58:20', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (42, '主从表单明细一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'SellOrder1', 32, '/multi4', NULL, NULL, '2021-08-03 09:51:10', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (45, '不用节点放此处', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2020-05-05 12:02:07', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (48, '表单数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-postcard', NULL, 1, 2000, 'Table+表单数据', 0, '/', '2019-07-12 13:26:32', '超级管理员', '2021-08-02 16:59:37', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (49, '基础只读表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"test\",\"value\":\"test\"}]', '', NULL, 1, 1000, 'App_Appointment', 48, '/App_Appointment', '2019-07-12 13:28:17', '超级管理员', '2021-08-03 09:48:33', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (50, '自动绑定下拉框', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 900, 'App_TransactionAvgPrice', 48, '/App_TransactionAvgPrice', '2019-07-12 13:53:32', '超级管理员', '2020-12-27 13:34:36', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (51, '主从一对多弹出框(4)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_ReportPrice', 74, '/App_ReportPrice', '2019-07-12 13:55:21', '超级管理员', '2021-03-14 23:53:29', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (52, '导入导出表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'App_Transaction', 48, '/App_Transaction', '2019-07-12 13:56:15', '超级管理员', '2019-10-31 13:23:37', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (56, '表单布局', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-office-building', NULL, 1, 1750, '/', 0, NULL, '2019-07-12 14:00:19', '超级管理员', '2021-08-02 02:54:39', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (57, '单列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 56, '/form1', '2019-07-12 14:01:12', '超级管理员', '2019-09-20 13:59:00', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (58, '两列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 900, '两列表单', 56, '/form2', '2019-07-12 14:01:43', '超级管理员', '2019-09-20 13:59:03', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (59, '多列表单自动数据源', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 800, '多列表单', 56, '/form3', '2019-07-12 14:02:17', '超级管理员', '2019-12-17 11:08:06', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (60, 'Table+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 700, 'Table+表单', 56, '/form4', '2019-07-12 14:03:14', '超级管理员', '2019-09-20 13:59:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (61, '系统设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-setting', NULL, 1, 1350, '系统', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2021-08-02 02:59:47', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'Sys_Menu', 61, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2019-10-31 13:23:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (63, '下拉框绑定设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 10, 'Sys_Dictionary', 61, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2019-08-16 17:41:15', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (64, '代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-position', NULL, 1, 1500, '代码在线生成器', 0, '/coding', '2019-07-12 14:07:55', '超级管理员', '2021-08-02 02:59:37', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (65, '代码生成器', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2021-05-18 09:50:56', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (66, '内容发布', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-edit', NULL, 1, 1680, '静态页面发布', 0, '/coding', '2019-07-12 14:12:38', '超级管理员', '2021-08-05 10:01:10', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (67, '静态页面发布', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 10, 'App_News', 66, '/App_News', '2019-07-12 14:14:16', '超级管理员', '2019-12-22 00:40:46', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (68, '多弹出框上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 700, 'App_Expert', 48, '/App_Expert', '2019-07-12 14:24:15', '超级管理员', '2021-08-03 09:49:40', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (69, '前端自定义扩展', '', '', NULL, 0, 500, '前端自定义扩展', 48, '/coding', '2019-07-12 14:26:25', '超级管理员', '2019-09-25 17:22:22', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (70, '编辑器表格换行', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 400, 'App_NewsEditor', 48, '/App_NewsEditor', '2019-07-12 14:28:45', '超级管理员', '2021-08-03 09:50:03', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (71, '权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, 'Sys_Role2', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2020-12-21 23:27:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (72, 'AppH5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-logo-android', NULL, 1, 1650, '/', 0, '', '2019-08-14 13:16:06', '超级管理员', '2021-05-05 15:20:46', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (73, '移动端H5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, NULL, '/', 72, '/app/guide', '2019-08-14 13:16:55', '超级管理员', '2021-05-05 15:21:18', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (74, '一对一(多)', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-share', NULL, 1, 1770, '/', 0, '/', '2019-08-22 17:43:58', '超级管理员', '2021-08-02 02:54:23', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (75, '主从一对一(1)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1000, 'SellOrder', 74, '/SellOrder', '2019-08-22 18:12:43', '超级管理员', '2021-03-14 23:52:28', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (77, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, '表单只读', 56, '/form7', '2019-08-26 11:58:55', '超级管理员', '2019-09-20 13:59:13', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (78, '混合表单一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 900, '32', 32, '/multi2', '2019-10-12 09:18:41', '超级管理员', '2019-11-14 00:03:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (79, 'wangEditor编辑器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, 'WangEditor编辑器', 66, '/kindEditor', '2019-12-22 00:36:10', '超级管理员', '2021-09-05 21:50:33', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (80, '静态页面列表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'htmlList', 66, '/htmlList', '2019-12-22 00:36:54', '超级管理员', '2019-12-21 22:50:41', NULL);
INSERT INTO `Sys_Menu` VALUES (81, '后台参数校验', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 41, '/validator', '2020-02-02 20:01:59', '超级管理员', '2020-02-02 20:01:16', NULL);
INSERT INTO `Sys_Menu` VALUES (82, '数字排版', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'flex', 34, '/flex', '2020-04-07 23:55:33', '超级管理员', '2019-11-15 14:32:56', NULL);
INSERT INTO `Sys_Menu` VALUES (83, '从表图片上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'vSellorderImg', 74, '/vSellorderImg', '2020-04-07 23:56:22', '超级管理员', '2020-04-07 23:56:28', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (84, '树形菜单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-c-scale-to-original', NULL, 1, 1705, '树形菜单与table', 0, '', '2020-04-26 20:19:42', '超级管理员', '2021-08-02 02:57:43', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (85, 'tree与代码生成页面', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 100, 'treetable1', 84, '/treetable1', '2020-04-26 20:20:28', '超级管理员', '2019-11-15 14:32:32', NULL);
INSERT INTO `Sys_Menu` VALUES (86, 'tree自定义table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, 'treetable2', 84, '/treetable2', '2020-04-26 20:20:57', '超级管理员', '2020-04-26 20:21:34', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (89, '审批设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-thumb', NULL, 1, 1702, '审批流', 0, '', '2020-11-29 16:49:27', '超级管理员', '2021-08-02 02:58:07', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (90, '审批流', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'workFlow', 89, '/workFlow', '2020-11-29 16:49:42', '超级管理员', '2020-02-02 20:01:16', NULL);
INSERT INTO `Sys_Menu` VALUES (91, '多列合并显示', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, '/App_Expert', 48, '/App_Expert2', '2021-03-06 17:47:23', '超级管理员', '2021-02-28 22:18:37', NULL);
INSERT INTO `Sys_Menu` VALUES (92, '主从一对一(2)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 890, 'SellOrder2', 74, '/SellOrder2', '2021-03-14 23:52:46', '超级管理员', '2021-03-14 23:52:54', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (93, '主从一对一(3)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 880, 'SellOrder3', 74, '/SellOrder3', '2021-03-14 23:53:50', '超级管理员', '2021-03-14 23:52:54', NULL);
INSERT INTO `Sys_Menu` VALUES (94, '在线表格编辑', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'App_Transaction2', 48, '/App_Transaction2', '2021-03-20 15:19:14', '超级管理员', '2021-02-28 22:18:37', NULL);
INSERT INTO `Sys_Menu` VALUES (95, 'table编辑(二)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 1040, 'table3', 12, '/table3', '2021-03-20 15:21:05', '超级管理员', '2021-03-20 15:21:07', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (96, 'treetable', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'treetable3', 84, 'treetable3', '2021-05-02 15:54:23', '超级管理员', '2019-11-15 14:32:32', NULL);
INSERT INTO `Sys_Menu` VALUES (97, '角色管理(tree)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 15:56:15', '超级管理员', '2021-05-02 18:29:18', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (98, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-news', NULL, 1, 3000, '.', 0, '', '2021-08-30 02:48:10', '超级管理员', '2021-08-30 02:50:12', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (99, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 98, '/formDraggable', '2021-08-30 02:48:34', '超级管理员', '2022-01-03 19:32:25', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (100, '明细表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 0, 'SellOrderList', 74, '', '2021-09-27 00:47:23', '超级管理员', '2021-03-14 23:52:28', NULL);
INSERT INTO `Sys_Menu` VALUES (101, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'FormDesignOptions', 98, '/FormDesignOptions', '2022-01-03 19:32:02', '超级管理员', '2022-01-03 19:32:29', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (102, '数据收集', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'formCollectionResultTree', 98, '/formCollectionResultTree', '2022-01-03 19:33:09', '超级管理员', '2022-01-03 19:33:36', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (103, '多页签表数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 48, '/tabsTable', '2022-01-08 17:14:01', '超级管理员', '2022-01-08 17:15:39', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (104, '多表头(合并)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, '.', 48, '/App_Appointment2', '2022-01-08 17:14:44', '超级管理员', '2022-01-08 17:15:47', '超级管理员');

-- ----------------------------
-- Table structure for Sys_Province
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Province`;
CREATE TABLE `Sys_Province`  (
  `ProvinceId` int(11) NOT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProvinceName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RegionCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProvinceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Province
-- ----------------------------
INSERT INTO `Sys_Province` VALUES (1, '110000', '北京市', '华北');
INSERT INTO `Sys_Province` VALUES (2, '120000', '天津市', '华北');
INSERT INTO `Sys_Province` VALUES (3, '130000', '河北省', '华北');
INSERT INTO `Sys_Province` VALUES (4, '140000', '山西省', '华北');
INSERT INTO `Sys_Province` VALUES (5, '150000', '内蒙古自治区', '华北');
INSERT INTO `Sys_Province` VALUES (6, '210000', '辽宁省', '东北');
INSERT INTO `Sys_Province` VALUES (7, '220000', '吉林省', '东北');
INSERT INTO `Sys_Province` VALUES (8, '230000', '黑龙江省', '东北');
INSERT INTO `Sys_Province` VALUES (9, '310000', '上海市', '华东');
INSERT INTO `Sys_Province` VALUES (10, '320000', '江苏省', '华东');
INSERT INTO `Sys_Province` VALUES (11, '330000', '浙江省', '华东');
INSERT INTO `Sys_Province` VALUES (12, '340000', '安徽省', '华东');
INSERT INTO `Sys_Province` VALUES (13, '350000', '福建省', '华东');
INSERT INTO `Sys_Province` VALUES (14, '360000', '江西省', '华东');
INSERT INTO `Sys_Province` VALUES (15, '370000', '山东省', '华东');
INSERT INTO `Sys_Province` VALUES (16, '410000', '河南省', '华中');
INSERT INTO `Sys_Province` VALUES (17, '420000', '湖北省', '华中');
INSERT INTO `Sys_Province` VALUES (18, '430000', '湖南省', '华中');
INSERT INTO `Sys_Province` VALUES (19, '440000', '广东省', '华南');
INSERT INTO `Sys_Province` VALUES (20, '450000', '广西壮族自治区', '华南');
INSERT INTO `Sys_Province` VALUES (21, '460000', '海南省', '华南');
INSERT INTO `Sys_Province` VALUES (22, '500000', '重庆市', '西南');
INSERT INTO `Sys_Province` VALUES (23, '510000', '四川省', '西南');
INSERT INTO `Sys_Province` VALUES (24, '520000', '贵州省', '西南');
INSERT INTO `Sys_Province` VALUES (25, '530000', '云南省', '西南');
INSERT INTO `Sys_Province` VALUES (26, '540000', '西藏自治区', '西南');
INSERT INTO `Sys_Province` VALUES (27, '610000', '陕西省', '西北');
INSERT INTO `Sys_Province` VALUES (28, '620000', '甘肃省', '西北');
INSERT INTO `Sys_Province` VALUES (29, '630000', '青海省', '西北');
INSERT INTO `Sys_Province` VALUES (30, '640000', '宁夏回族自治区', '西北');
INSERT INTO `Sys_Province` VALUES (31, '650000', '新疆维吾尔自治区', '西北');
INSERT INTO `Sys_Province` VALUES (32, '710000', '台湾省', '港澳台');
INSERT INTO `Sys_Province` VALUES (33, '810000', '香港特别行政区', '港澳台');
INSERT INTO `Sys_Province` VALUES (34, '820000', '澳门特别行政区', '港澳台');
INSERT INTO `Sys_Province` VALUES (35, 'thd', '桃花岛', '东北');
INSERT INTO `Sys_Province` VALUES (43, '测试1', '测试1', '港澳台');

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Role`;
CREATE TABLE `Sys_Role`  (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Role_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO `Sys_Role` VALUES (1, '2018-08-23 11:46:06', 'admin', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '超级管理员');
INSERT INTO `Sys_Role` VALUES (2, '2018-08-23 11:46:52', 'admin', NULL, '1', 0, 1, '超级管理员', '2019-12-08 20:15:46', NULL, 1, '测试管理员');
INSERT INTO `Sys_Role` VALUES (3, '2018-08-23 11:47:10', 'admin', NULL, '无', 0, 1, '超级管理员', '2020-11-16 14:16:57', NULL, 5, '小编');
INSERT INTO `Sys_Role` VALUES (4, '2018-08-23 11:47:41', 'admin', NULL, '无  ', 0, 1, '超级管理员', '2020-11-16 14:17:00', NULL, 0, '信息员');
INSERT INTO `Sys_Role` VALUES (5, '2019-05-30 10:59:13', 'admin', NULL, '还没想好', NULL, 1, '超级管理员', '2019-12-08 20:16:43', NULL, 0, '主管');
INSERT INTO `Sys_Role` VALUES (8, '2021-05-02 18:33:49', '超级管理员', NULL, NULL, NULL, 1, '', NULL, NULL, 4, '二级角色');
INSERT INTO `Sys_Role` VALUES (10, '2021-07-09 22:28:18', '超级管理员', NULL, NULL, NULL, 1, '', NULL, NULL, 8, '三级角色');
INSERT INTO `Sys_Role` VALUES (11, '2021-07-09 22:29:07', '超级管理员', NULL, NULL, NULL, 1, '超级管理员', '2021-08-06 11:22:06', NULL, 8, '四级角色');

-- ----------------------------
-- Table structure for Sys_RoleAuth
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RoleAuth`;
CREATE TABLE `Sys_RoleAuth`  (
  `Auth_Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthValue` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Menu_Id` int(11) NOT NULL,
  `Modifier` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------
INSERT INTO `Sys_RoleAuth` VALUES (151, 'Search', '2020-05-05 12:05:34', '超级管理员', 30, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (152, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 3, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (153, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 12:05:34', '超级管理员', 51, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (154, 'Search', '2020-05-05 12:05:34', '超级管理员', 59, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (155, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 37, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (156, 'Search', '2020-05-05 12:05:34', '超级管理员', 33, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (157, '', '2020-05-05 12:05:34', '超级管理员', 24, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (158, '', '2020-05-05 12:05:34', '超级管理员', 35, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (159, 'Search', '2020-05-05 12:05:34', '超级管理员', 60, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (160, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 12:05:34', '超级管理员', 68, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (161, 'Search', '2020-05-05 12:05:34', '超级管理员', 77, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (162, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 12:05:34', '超级管理员', 52, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (163, 'Search', '2020-05-05 12:05:34', '超级管理员', 11, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (164, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 85, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (165, 'Search', '2020-05-05 12:05:34', '超级管理员', 79, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (166, 'Search', '2020-05-05 12:05:34', '超级管理员', 86, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (167, 'Search,Add,Delete,Update,Export,Upload', '2020-05-05 12:05:34', '超级管理员', 67, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (168, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 65, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (169, 'Search,Add,Update', '2020-05-05 12:05:34', '超级管理员', 62, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (170, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 63, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (171, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 83, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (172, 'Search', '2020-05-05 12:05:34', '超级管理员', 80, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (173, 'Search', '2020-05-05 12:05:34', '超级管理员', 81, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (174, 'Search', '2020-05-05 12:05:34', '超级管理员', 82, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (175, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 42, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (176, 'Search', '2020-05-05 12:05:34', '超级管理员', 10, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (177, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 78, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (178, 'Search,Delete,Export', '2020-05-05 12:05:34', '超级管理员', 6, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (179, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 50, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (180, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 12:05:34', '超级管理员', 36, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (181, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 9, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (182, 'Search', '2020-05-05 12:05:34', '超级管理员', 48, '超级管理员', '2021-01-16 12:14:19', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (183, 'Search', '2020-05-05 12:05:34', '超级管理员', 74, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (184, 'Search', '2020-05-05 12:05:34', '超级管理员', 56, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (185, 'Search', '2020-05-05 12:05:34', '超级管理员', 32, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (186, 'Search', '2020-05-05 12:05:34', '超级管理员', 34, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (187, 'Search', '2020-05-05 12:05:34', '超级管理员', 12, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (188, 'Search', '2020-05-05 12:05:34', '超级管理员', 84, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (189, 'Search', '2020-05-05 12:05:34', '超级管理员', 41, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (190, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 28, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (191, 'Search', '2020-05-05 12:05:34', '超级管理员', 66, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (192, 'Search', '2020-05-05 12:05:34', '超级管理员', 29, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (193, 'Search', '2020-05-05 12:05:34', '超级管理员', 72, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (194, 'Search', '2020-05-05 12:05:34', '超级管理员', 2, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (195, 'Search', '2020-05-05 12:05:34', '超级管理员', 64, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (196, 'Search', '2020-05-05 12:05:34', '超级管理员', 61, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (197, 'Search', '2020-05-05 12:05:34', '超级管理员', 5, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (198, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 25, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (199, 'Search', '2020-05-05 12:05:34', '超级管理员', 26, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (200, 'Search', '2020-05-05 12:05:34', '超级管理员', 27, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (201, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 75, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (202, 'Search', '2020-05-05 12:05:34', '超级管理员', 57, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (203, 'Search,Import,Export,Upload,test', '2020-05-05 12:05:34', '超级管理员', 49, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (204, 'Search,Update', '2020-05-05 12:05:34', '超级管理员', 71, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (205, 'Search', '2020-05-05 12:05:34', '超级管理员', 31, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (206, 'Search', '2020-05-05 12:05:34', '超级管理员', 58, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (207, 'Search', '2020-05-05 12:05:34', '超级管理员', 73, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (208, 'Search', '2020-05-25 13:15:51', '超级管理员', 48, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (209, 'Search,Add,Update,Import,Export,Upload', '2020-05-25 13:15:51', '超级管理员', 49, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (210, 'Search,Add,Delete,Update', '2020-05-25 13:15:51', '超级管理员', 50, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (211, 'Search,Add,Update,Export,Audit', '2020-05-25 13:15:51', '超级管理员', 68, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (212, 'Search,Add,Delete,Update,Import,Export', '2020-05-25 13:15:51', '超级管理员', 52, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (213, 'Search,Import,Export,Upload', '2020-09-11 01:03:11', '演示帐号', 49, '演示帐号', '2020-09-11 01:03:11', 6, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (214, 'Search', '2020-11-29 16:52:52', '超级管理员', 89, '超级管理员', '2020-11-29 16:52:52', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (215, 'Search', '2020-11-29 16:52:52', '超级管理员', 90, '超级管理员', '2020-11-29 16:52:52', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (216, 'Search,Add,Delete,Update,Import,Export,Upload', '2021-01-16 12:01:58', '超级管理员', 70, '超级管理员', '2021-01-16 12:01:58', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (217, 'Search,Add,Delete,Update,Import,Export', '2021-03-06 17:47:32', '超级管理员', 91, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (218, 'Search,Add,Delete,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 92, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (219, 'Search,Add,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 93, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (220, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 95, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (221, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 94, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (222, 'Search', '2021-05-02 15:57:11', '超级管理员', 96, '超级管理员', '2021-05-02 15:57:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (223, 'Search', '2021-05-02 15:57:11', '超级管理员', 97, '超级管理员', '2021-05-02 15:57:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (224, 'Export', '2021-05-05 15:25:06', '超级管理员', 68, '超级管理员', '2021-05-05 15:25:06', 6, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (225, 'Search', '2021-08-30 02:51:00', '超级管理员', 98, '超级管理员', '2021-08-30 02:51:00', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (226, 'Search', '2021-08-30 02:51:00', '超级管理员', 99, '超级管理员', '2021-08-30 02:51:00', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (227, 'Search', '2021-09-27 00:47:34', '超级管理员', 100, '超级管理员', '2021-09-27 00:47:34', 2, NULL);

-- ----------------------------
-- Table structure for Sys_RoleAuthData
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RoleAuthData`;
CREATE TABLE `Sys_RoleAuthData`  (
  `Auth_Id` int(11) NOT NULL,
  `DataType_Id` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  `Node_Id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LevelID` int(11) NULL DEFAULT NULL,
  `AuthValue` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` timestamp(0) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_RoleAuthData
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_TableColumn
-- ----------------------------
DROP TABLE IF EXISTS `Sys_TableColumn`;
CREATE TABLE `Sys_TableColumn`  (
  `ColumnId` int(11) NOT NULL AUTO_INCREMENT,
  `ApiInPut` int(11) NULL DEFAULT NULL,
  `ApiIsNull` int(11) NULL DEFAULT NULL,
  `ApiOutPut` int(11) NULL DEFAULT NULL,
  `ColSize` int(11) NULL DEFAULT NULL,
  `ColumnCNName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ColumnWidth` int(11) NULL DEFAULT NULL,
  `Columnformat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DropNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EditColNo` int(11) NULL DEFAULT NULL,
  `EditRowNo` int(11) NULL DEFAULT NULL,
  `EditType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `IsColumnData` int(11) NULL DEFAULT NULL,
  `IsDisplay` int(11) NULL DEFAULT NULL,
  `IsImage` int(11) NULL DEFAULT NULL,
  `IsKey` int(11) NULL DEFAULT NULL,
  `IsNull` int(11) NULL DEFAULT NULL,
  `IsReadDataset` int(11) NULL DEFAULT NULL,
  `Maxlength` int(11) NULL DEFAULT NULL,
  `Modifier` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Script` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SearchColNo` int(11) NULL DEFAULT NULL,
  `SearchRowNo` int(11) NULL DEFAULT NULL,
  `SearchType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sortable` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Table_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ColumnId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 787 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1420, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'tree_roles', NULL, 1, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1410, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2021-12-29 22:46:12', 1, 1400, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1390, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2021-12-29 22:46:12', 1, 1380, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1370, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2021-12-29 22:46:12', 1, 1360, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1350, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2021-12-29 22:46:12', 1, 1340, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1330, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2021-12-29 22:46:12', 1, 1320, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-12-29 22:46:12', 1, 1375, '', NULL, 1, 'select', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (32, NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1300, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (33, NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', 140, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1290, NULL, NULL, 1, 'textarea', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (34, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1280, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (35, NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', 300, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1270, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (36, NULL, NULL, NULL, 8, 'sql语句', 'DbSql', 'string', 200, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1260, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (37, NULL, NULL, NULL, NULL, 'DBServer', 'DBServer', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1250, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (38, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1240, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (39, NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1295, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (40, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2019-08-23 10:17:27', 1, 1220, NULL, NULL, NULL, '无', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (41, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'enable', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1210, NULL, NULL, 2, 'drop', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (42, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1200, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (43, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1190, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (44, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1180, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (45, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1170, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (46, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1160, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (47, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1150, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1140, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1130, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (50, NULL, NULL, NULL, NULL, '数据源Value', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-05-05 19:40:42', 1, 1120, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (51, NULL, NULL, NULL, NULL, '数据源Text', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-05-05 19:40:42', 1, 1110, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1100, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2021-05-05 19:40:42', 1, 1090, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1080, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1070, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2021-05-05 19:40:42', 1, 1060, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1050, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1040, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2021-05-05 19:40:42', 1, 1030, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1020, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 10000, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 120, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2020-03-02 19:22:18', 1, 8888, NULL, NULL, 3, 'checkbox', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 250, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7980, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 280, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7970, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 8700, NULL, NULL, 2, 'dropList', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 9999, NULL, NULL, 2, 'datetime', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 880, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (69, NULL, NULL, NULL, NULL, '时长(毫秒)', 'ElapsedTime', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 8600, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-03-02 19:22:18', 1, 7920, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-03-02 19:22:18', 1, 7910, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-03-02 19:22:18', 1, 7900, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-03-02 19:22:18', 1, 9000, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 7880, NULL, NULL, NULL, '无', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-03-02 19:22:18', 1, 7870, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 7860, NULL, NULL, 2, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (77, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7850, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (78, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7840, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (79, 0, NULL, 1, NULL, '部门', 'DeptName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2021-04-12 23:04:26', 1, 7830, '', NULL, 2, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (80, 0, 0, 1, NULL, '角色', 'Role_Id', 'int', 150, '', '2018-06-14 16:44:15', NULL, NULL, 'roles', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7820, '', NULL, 2, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (81, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 0, 0, 150, '超级管理员', '2021-04-12 23:04:26', 1, 7810, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (82, 1, 0, 1, NULL, '用户名', 'UserName', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7945, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (83, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7790, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (84, NULL, NULL, NULL, NULL, '用户真实姓名', 'UserTrueName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2021-04-12 23:04:26', 1, 7792, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (85, NULL, NULL, NULL, NULL, '地址', 'Address', 'string', 190, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7270, '', NULL, 4, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (86, NULL, NULL, NULL, NULL, '电话', 'Mobile', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7260, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (87, NULL, NULL, NULL, NULL, 'Email', 'Email', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 5, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7250, '', NULL, 4, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (88, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2021-04-12 23:04:26', 1, 7740, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (89, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 180, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 7, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7230, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (90, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7220, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (91, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 5, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7670, '', NULL, 4, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (92, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7700, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (93, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7690, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (94, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7780, '', NULL, 5, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (95, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7670, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (96, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7660, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (97, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7650, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (98, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'audit', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7640, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (99, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7630, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (100, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7620, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (101, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7610, '', NULL, 5, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (102, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7600, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (114, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 150, '', NULL, NULL, NULL, '', NULL, 9, 'img', NULL, 1, 1, 1, NULL, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7842, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (142, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8570, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (143, NULL, NULL, NULL, 12, '品种', 'Variety', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'pz', NULL, 1, 'checkbox', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2020-05-03 01:07:54', 1, 8560, NULL, NULL, 1, 'select', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (144, NULL, NULL, NULL, 12, '月龄', 'AgeRange', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'age', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2020-05-03 01:07:54', 1, 8550, NULL, NULL, 1, 'select', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (145, NULL, NULL, NULL, 12, '城市', 'City', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'city', NULL, 15, 'select', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2020-05-03 01:07:54', 1, 8540, NULL, NULL, 1, 'select', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (146, NULL, NULL, NULL, 12, '成交均价', 'AvgPrice', 'decimal', 80, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 20, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8530, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (147, NULL, NULL, NULL, 12, '成交日期', 'Date', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 25, 'date', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8520, NULL, NULL, 2, 'datetime', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (148, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'enable', NULL, NULL, 'select', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8510, NULL, NULL, 2, 'select', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (149, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8500, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (150, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2020-05-03 01:07:54', 1, 8490, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (151, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8480, NULL, NULL, NULL, 'datetime', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (152, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8470, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (153, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2020-05-03 01:07:54', 1, 8460, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (154, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8450, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (155, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8440, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (156, NULL, NULL, NULL, NULL, '品种', 'Variety', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'pz', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8430, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (157, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, 'age', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 18:36:03', 1, 8420, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (158, NULL, NULL, NULL, NULL, '报价城市', 'City', 'string', 120, NULL, '2018-07-10 15:02:46', NULL, NULL, 'city', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 18:36:03', 1, 8410, NULL, NULL, 1, 'dropList', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (159, NULL, NULL, NULL, NULL, '上报价格', 'Price', 'decimal', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8400, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (160, 0, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'audit', NULL, NULL, 'select', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8382, NULL, NULL, 2, 'select', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (161, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8380, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (162, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8370, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (163, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8360, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (164, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8350, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (165, NULL, NULL, NULL, NULL, '上报人', 'Creator', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8388, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (166, NULL, 0, NULL, NULL, '上报时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8387, NULL, NULL, 2, 'datetime', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (167, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8320, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (168, NULL, NULL, NULL, 12, '测试', 'Modifier', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8310, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (169, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, '无', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8300, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (170, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8381, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (193, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 8060, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (194, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 120, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 17:40:42', 1, 8050, NULL, NULL, 1, 'text', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (195, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 17:40:42', 1, 8040, NULL, NULL, 1, 'text', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (196, NULL, NULL, NULL, NULL, '数量', 'Quantity', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 8030, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (197, NULL, NULL, NULL, NULL, '购买类型', 'CowType', 'string', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, 'nav', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-09-18 17:40:42', 1, 8020, NULL, NULL, 2, 'dropList', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (198, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 190, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2019-09-18 17:40:42', 1, 8010, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (199, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 8000, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (200, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (201, NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 17:40:42', 1, 7980, NULL, NULL, 2, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (202, NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 7970, NULL, NULL, 2, 'datetime', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (203, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 7960, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (204, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 17:40:42', 1, 7950, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (205, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 7940, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (206, 1, 1, 0, NULL, '主键ID', 'ExpertId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7930, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (207, NULL, NULL, NULL, NULL, '专家名称', 'ExpertName', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (208, NULL, NULL, NULL, NULL, '真实姓名', 'ReallyName', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7910, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (209, NULL, NULL, NULL, NULL, '身份证号', 'IDNumber', 'string', 200, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 18, '超级管理员', '2019-09-18 16:46:51', 1, 7900, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (210, NULL, NULL, NULL, NULL, '专家头像', 'HeadImageUrl', 'string', 220, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 10, '', NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (211, NULL, NULL, NULL, NULL, '学历', 'Education', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7880, '', NULL, 2, 'text', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (212, NULL, NULL, NULL, NULL, '职业', 'Professional', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 3, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7870, '', NULL, 2, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (213, NULL, NULL, NULL, NULL, '所在公司', 'Company', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7860, '', NULL, 2, '无', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (214, NULL, NULL, NULL, NULL, '服务地区', 'City', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, 'city', NULL, 3, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7850, '', NULL, 3, 'dropList', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (215, NULL, NULL, NULL, NULL, '擅长领域', 'SpecialField', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 800, '超级管理员', '2019-09-18 16:46:51', 1, 7840, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (216, NULL, NULL, NULL, NULL, '个人简介', 'Resume', 'string', 220, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-09-18 16:46:51', 1, 7830, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (217, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 120, '', '2018-07-10 15:29:01', NULL, NULL, 'audit', NULL, 0, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, 3, 'dropList', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (218, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7810, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (219, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (220, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7790, '', NULL, 3, 'datetime', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (221, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-07-10 15:29:01', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (222, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7770, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (223, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7760, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (224, NULL, NULL, NULL, NULL, '申请时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 7, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7750, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (225, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7740, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (226, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7730, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (227, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7720, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (308, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6910, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (309, NULL, NULL, NULL, 12, '标题', 'Title', 'string', 250, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2021-05-05 19:40:33', 1, 6900, NULL, NULL, 1, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (310, NULL, NULL, NULL, NULL, '发布人', 'Author', 'string', 120, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 50, '超级管理员', '2021-05-05 19:40:33', 1, 6890, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (311, 0, NULL, NULL, NULL, '发布时间', 'ReleaseDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6880, NULL, NULL, 3, 'datetime', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (312, NULL, NULL, NULL, 12, '封面图片', 'ImageUrl', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2021-05-05 19:40:33', 1, 6870, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (313, NULL, NULL, NULL, NULL, '图片(大图)', 'BigImageUrls', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2021-05-05 19:40:33', 1, 6860, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (314, NULL, NULL, NULL, 12, '新闻地址', 'DetailUrl', 'string', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-05-05 19:40:33', 1, 6850, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (315, NULL, NULL, NULL, NULL, '浏览次数', 'ViewCount', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6840, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (316, NULL, NULL, NULL, NULL, '新闻类型', 'NewsType', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, 'news', 1, 3, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6830, NULL, NULL, 1, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (317, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6820, NULL, NULL, 3, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (318, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6810, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (319, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2021-05-05 19:40:33', 1, 6800, NULL, NULL, 3, '无', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (320, NULL, NULL, NULL, NULL, '发布时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6790, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (321, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6780, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (322, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2021-05-05 19:40:33', 1, 6770, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (323, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6760, NULL, NULL, NULL, 'datetime', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (324, NULL, NULL, NULL, 12, '新闻内容', 'Content', 'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 0, NULL, NULL, 1, 0, 0, '超级管理员', '2021-05-05 19:40:33', 1, 6896, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (429, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2021-04-12 23:04:26', 1, 7760, '', NULL, 3, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (431, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 500, '超级管理员', '2021-04-12 23:04:26', 1, 7810, '', NULL, 2, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (446, NULL, NULL, NULL, 12, '是否推荐价格', 'IsTop', 'int', 90, NULL, NULL, NULL, NULL, 'top', NULL, 30, 'select', NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2020-05-03 01:07:54', 1, 8515, NULL, NULL, 2, 'select', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (457, NULL, NULL, NULL, NULL, '是否买入', 'TransactionType', 'int', 120, NULL, NULL, NULL, NULL, 'cq', NULL, 2, 'select', NULL, 1, 1, NULL, NULL, NULL, 0, NULL, '超级管理员', '2019-09-18 17:40:42', 1, 8021, NULL, NULL, 1, 'select', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (506, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 100, '', NULL, NULL, NULL, 'gender', NULL, 4, 'drop', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7843, '', NULL, 1, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (523, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2019-09-18 16:46:51', 1, 7900, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (550, NULL, NULL, NULL, NULL, '申请人帐号Id', 'User_Id', 'int', 90, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, NULL, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7921, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (551, NULL, NULL, NULL, NULL, '申请人帐号', 'UserName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (552, NULL, NULL, NULL, NULL, '申请人', 'UserTrueName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (654, NULL, NULL, NULL, NULL, '登陆设备类型', 'AppType', 'int', 150, '', NULL, NULL, NULL, 'ut', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7809, '', NULL, 3, 'dropList', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (659, NULL, NULL, NULL, NULL, '是否手机用户', 'IsRegregisterPhone', 'int', 120, '', NULL, NULL, NULL, 'isphone', NULL, 2, 'drop', NULL, 1, 0, NULL, NULL, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7771, '', NULL, 3, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (663, NULL, NULL, NULL, NULL, '是否今日推荐', 'DailyRecommend', 'sbyte', 120, NULL, NULL, NULL, NULL, 'dr', NULL, 5, 'drop', NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6825, NULL, NULL, 1, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (664, NULL, NULL, NULL, NULL, '推荐排序', 'OrderNo', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6822, NULL, NULL, NULL, '无', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (714, NULL, NULL, NULL, NULL, 'Id', 'Order_Id', 'string', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2019-09-19 14:55:02', 1, 2850, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (715, NULL, NULL, NULL, NULL, '订单类型', 'OrderType', 'int', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', 'ordertype', 1, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2840, NULL, 1, 1, 'select', NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (716, NULL, NULL, NULL, NULL, '运单号', 'TranNo', 'string', 150, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-09-19 14:55:02', 1, 2830, NULL, NULL, 1, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (717, NULL, NULL, NULL, NULL, '销售订单号', 'SellNo', 'string', 200, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 2, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, '超级管理员', '2019-09-19 14:55:02', 1, 2820, NULL, NULL, 1, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (718, NULL, NULL, NULL, NULL, '销售数量', 'Qty', 'int', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 2, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2810, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (719, NULL, NULL, NULL, 8, '备注', 'Remark', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, 2, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2019-09-19 14:55:02', 1, 2800, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (720, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2790, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (721, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 255, '超级管理员', '2019-09-19 14:55:02', 1, 2780, NULL, NULL, 3, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (722, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2770, NULL, NULL, 3, 'datetime', NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (723, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2760, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (724, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 4, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 255, '超级管理员', '2019-09-19 14:55:02', 1, 2750, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (725, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 4, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2740, NULL, NULL, 3, 'datetime', NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (726, NULL, NULL, NULL, NULL, '', 'OrderList_Id', 'string', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 0, 36, '超级管理员', '2019-09-19 14:54:58', 1, 2730, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (727, NULL, NULL, NULL, NULL, '订单Id', 'Order_Id', 'string', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 1, 36, '超级管理员', '2019-09-19 14:54:58', 1, 2720, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (728, NULL, NULL, NULL, NULL, '商品名称', 'ProductName', 'string', 150, NULL, '2019-08-28 09:17:39', 1, '超级管理员', 'pn', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2019-09-19 14:54:58', 1, 2710, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (729, NULL, NULL, NULL, NULL, '批次', 'MO', 'string', 100, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2700, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (730, NULL, NULL, NULL, NULL, '数量', 'Qty', 'int', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 1, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2690, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (731, NULL, NULL, NULL, NULL, '重量', 'Weight', 'decimal', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2680, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (732, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 120, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2019-09-19 14:54:58', 1, 2670, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (733, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2660, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (734, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2650, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (735, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2640, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (736, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2630, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (737, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2620, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (738, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2610, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (739, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 120, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2805, NULL, NULL, 2, 'datetime', NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (740, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 100, '超级管理员', '2019-09-19 14:55:02', 1, 2803, NULL, NULL, 2, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (741, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2801, NULL, NULL, NULL, NULL, NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (742, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2019-09-19 14:55:02', 1, 2808, NULL, NULL, 2, 'select', NULL, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (743, NULL, NULL, NULL, NULL, '', 'Id', 'string', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 5, 1, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2020-04-24 13:47:36', 1, 2560, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (744, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-04-24 13:47:36', 1, 2550, NULL, NULL, 1, 'datetime', NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (745, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-04-24 13:47:36', 1, 2540, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (746, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2020-04-24 13:47:36', 1, 2530, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (747, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 180, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 250, '超级管理员', '2020-04-24 13:47:36', 1, 3490, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (748, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2020-04-24 13:47:36', 1, 2510, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (749, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-04-24 13:47:36', 1, 2500, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (750, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-04-24 13:47:36', 1, 2490, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (751, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 100, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 50, '超级管理员', '2020-04-24 13:47:36', 1, 3500, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (752, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 15, '超级管理员', '2020-04-24 13:47:36', 1, 3470, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (763, NULL, NULL, NULL, NULL, '', 'Certificate', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2500, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (764, NULL, NULL, NULL, NULL, '', 'FormId', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-01-03 19:28:41', 1, 1150, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (765, NULL, NULL, NULL, NULL, '表单名称', 'Title', 'string', 220, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-01-03 19:28:41', 1, 1100, NULL, NULL, 1, 'like', 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (766, NULL, NULL, NULL, NULL, '设计器配置', 'DaraggeOptions', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 1050, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (767, NULL, NULL, NULL, NULL, '表单参数', 'FormOptions', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 1000, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (768, NULL, NULL, NULL, NULL, '表单配置', 'FormConfig', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 950, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (769, NULL, NULL, NULL, NULL, '表单字段', 'FormFields', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 900, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (770, NULL, NULL, NULL, NULL, '表格配置', 'TableConfig', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 850, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (771, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 800, NULL, NULL, 1, 'datetime', 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (772, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 750, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (773, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:28:41', 1, 700, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (774, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:28:41', 1, 650, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (775, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 600, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (776, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 550, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (777, NULL, NULL, NULL, NULL, '', 'FormCollectionId', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-01-03 19:30:13', 1, 1000, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (778, NULL, NULL, NULL, NULL, '', 'FormId', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-01-03 19:30:13', 1, 950, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (779, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:30:13', 1, 900, NULL, NULL, 1, 'like', 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (780, NULL, NULL, NULL, NULL, '表单数据', 'FormData', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:30:13', 1, 850, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (781, NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 800, NULL, NULL, 1, 'datetime', 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (782, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 750, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (783, NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', 130, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:30:13', 1, 700, NULL, NULL, 1, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (784, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:30:13', 1, 650, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (785, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 600, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (786, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 550, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);

-- ----------------------------
-- Table structure for Sys_TableInfo
-- ----------------------------
DROP TABLE IF EXISTS `Sys_TableInfo`;
CREATE TABLE `Sys_TableInfo`  (
  `Table_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CnName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnCNName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DBServer` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DataTableType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DetailCnName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DetailName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EditorType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `ExpressField` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FolderName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Namespace` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NULL DEFAULT NULL,
  `RichText` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SortName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TableName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TableTrueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UploadField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UploadMaxCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Table_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, 1, 'RoleName', 'System', 'VOL.System', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, 1, 'DicName', 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_Dictionary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'System', 'VOL.System', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户基础信息', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 200, 0, NULL, NULL, '无', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '170', '日志管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (11, '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '250', '配置管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (15, '成交均价', '自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, 1, 'AvgPrice', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_TransactionAvgPrice', 'App_TransactionAvgPrice', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (16, NULL, '新增编辑表单', NULL, NULL, NULL, NULL, NULL, 1, 'Price', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_ReportPrice', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (19, NULL, '导入导出', NULL, NULL, NULL, NULL, NULL, 1, '姓名', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Transaction', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (20, NULL, '启用图片支持', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Expert', NULL, 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (27, '侩牛资讯', '静态页面发布', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'News', 'VOL.AppManager', NULL, 0, NULL, NULL, '侩牛资讯', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (28, NULL, '新闻列表', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'News', 'VOL.AppManager', NULL, 27, 'Content', 'CreateDate', 'App_News', 'App_News', 'ImageUrl', 3);
INSERT INTO `Sys_TableInfo` VALUES (76, '订单管理', '测试完整示例', NULL, NULL, NULL, NULL, NULL, 1, NULL, '订单管理', 'VOL.Order', NULL, 0, NULL, NULL, '订单管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (77, '销售订单', '销售订单', NULL, NULL, '订单明细', 'SellOrderList', NULL, 1, 'TranNo', 'Sell', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrder', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (78, '订单明细', '订单明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrderList', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (79, 'Table 单表数据', 'Table+单表数据', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 0, NULL, NULL, 'Table+单表数据', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (80, '基础表单查询', '基础表单+编辑只读', NULL, NULL, NULL, NULL, NULL, 1, 'Name', 'Appointment', 'VOL.Order', NULL, 79, NULL, 'CreateDate', 'App_Appointment', 'App_Appointment', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (83, '表单设计', '表单设计', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, NULL, '表单设计', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (84, '表单设计', '表单设计', NULL, NULL, NULL, '', NULL, 1, 'Title', 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormDesignOptions', 'FormDesignOptions', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (85, '数据采集', '数据采集', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormCollectionObject', 'FormCollectionObject', NULL, NULL);

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS `Sys_User`;
CREATE TABLE `Sys_User`  (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AppType` int(11) NULL DEFAULT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Gender` int(1) NULL DEFAULT NULL,
  `HeadImageUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsRegregisterPhone` int(11) NOT NULL,
  `LastLoginDate` datetime(0) NULL DEFAULT NULL,
  `LastModifyPwdDate` datetime(0) NULL DEFAULT NULL,
  `Mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NOT NULL,
  `RoleName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserPwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`User_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3379 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, '北京市西城区', 0, '2019-08-18 00:54:06', 1, '超级管理员', '2012-06-10 11:10:03', NULL, NULL, NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202006191408112343/1111s.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:13:49', NULL, '超级管理员', '2020-06-19 14:08:12', 1, 0, 1, '超级管理员', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTY0MTIwODc0MSIsIm5iZiI6IjE2NDEyMDg3NDEiLCJleHAiOiIxNjQxMjE1OTQxIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9._rhE6MTMaMzote4Z2QFZcvH7D80AFVsVAf34r6EkqIw');
INSERT INTO `Sys_User` VALUES (3362, '北京市还没注册', NULL, '2019-08-18 00:54:06', 1, '超级管理员', '2019-08-13 14:24:27', NULL, NULL, NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004241341311851/04.jpg', 0, NULL, '2019-09-22 23:12:33', '01012345678', '超级管理员', '2021-01-27 12:53:41', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', '演示帐号', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTY0MTIwOTg2MiIsIm5iZiI6IjE2NDEyMDk4NjIiLCJleHAiOiIxNjQxMjE3MDYyIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.Z7Ay5SL2GGE16DuB9eI0pvqYH3jQ__U47e5nuwX5Jfw');
INSERT INTO `Sys_User` VALUES (3378, NULL, NULL, NULL, NULL, NULL, '2021-09-27 15:50:22', 1, '超级管理员', NULL, NULL, NULL, 0, 0, 'Upload/Tables/Sys_User/202109271550212214/12313.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '小编', NULL, NULL, NULL, 'Admin888', 'N4GbASgPLeXypdPhgxiVcQ==', 'Admin888', NULL);

SET FOREIGN_KEY_CHECKS = 1;
