/*
 Navicat Premium Data Transfer

 Source Server         : 132
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : 132.232.2.109:3306
 Source Schema         : netcoredev

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 24/09/2019 09:28:04
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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_Appointment
-- ----------------------------
INSERT INTO `App_Appointment` VALUES ('08d73c0e-edef-0a68-ab81-c3dc5e0fe407', '2019-09-18 16:05:11', 1, '超级管理员', '来自火星。。。', NULL, NULL, NULL, '元霸', '138888887698');
INSERT INTO `App_Appointment` VALUES ('08d73c0e-edf8-595b-9a8f-2ff134751833', '2019-09-18 16:05:11', 1, '超级管理员', '元歌有8个技能..', NULL, NULL, NULL, '元歌', '1300111235');
INSERT INTO `App_Appointment` VALUES ('08d73c11-6a43-97e8-ca70-e8b0d906807e', '2019-09-18 16:22:59', 1, '超级管理员', '来自火星。。。', '', NULL, NULL, '元华', '138888887698');

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
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_Expert
-- ----------------------------
INSERT INTO `App_Expert` VALUES (275, '2018-09-07 10:58:17', 1, 1, '测试超级管理员', NULL, '北京市', '中国农业大学', '2018-09-04 15:49:44', 3344, 'User31110458', '博士', 1, '教兽', 'https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x3.jpg', '150124199911110116', '超级管理员', '2019-09-18 17:08:06', 1, '13381277739', '教授', '拉美西斯', '66666666', '6666666', '13381277739', 'User31110458', 3344);
INSERT INTO `App_Expert` VALUES (276, '2019-09-22 22:30:08', 3362, 1, 'zs', '', '北京市', '窦天宝传奇', '2018-09-18 17:45:54', 3358, '较瘦', '小学', 1, '国家一级演员', 'https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x2.jpg', '88888', '超级管理员', '2019-09-19 14:27:32', 1, '18612119023', '演员', '木兰', '啊啊啊啊', 'xxxxxx', '18612119023', '较瘦', 3358);

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
) ENGINE = InnoDB AUTO_INCREMENT = 73777 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_News
-- ----------------------------
INSERT INTO `App_News` VALUES (73756, NULL, NULL, '<p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">1.&nbsp;</span></strong><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">改变对奶公犊经济价值的认识</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">根据国家肉牛牦牛产业技术体系的调查发现，很多奶牛养殖者选择奶公犊自己饲养或出售给他人育肥，是基于生鲜乳销售不畅，而饲养奶公犊可以解决这一问题（曹兵海，2009）。绝大多数奶牛场主观臆测饲养奶公犊不会有太高的利润，其实这是一种认识误区。根据目前奶公犊市场行情，初生奶公犊平均售价为2000-2500元/头，用代乳粉加颗粒料的方式饲养至56天断奶，犊牛售价则在4000元/头以上，饲料成本约700-800元/头，毛利润约为700-1300元/头，说明饲养奶公犊具有很大的利润空间。因此，加强肉牛和牛肉市场信息对奶牛养殖者的畅通，并提高对奶公犊经济价值的认识，将会进一步提高奶公犊育肥的数量。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">2.&nbsp;</span></strong><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">研发并集成奶公犊科学饲养管理的技术</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">虽然一些奶牛养殖者有规模较大的奶牛群，但并没有大规模饲养奶公犊，主要原因之一是缺乏奶公犊育肥的科学饲养管理技术。因此，多数奶牛养殖场在权衡奶公犊的饲养成本和收益后，选择出生后立即出售的处理方式。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">实际上，不仅奶牛饲养者缺乏相应的饲养技术，很多肉牛养殖者也同样如此，从而限制了奶牛或肉牛养殖者饲养奶公犊的积极性。近年来，国内一些学者在奶公犊生产小白牛肉（江昱明等，2015）、奶公犊生长和育肥期营养需要（张召兄等，2007；张云峰等，2013；郭康等，2017；夏传齐等，2017）、奶公犊生长性能和肉质变化规律（王嘉博，2013；吴宏达等，2014）等奶公犊饲养管理关键技术方面做了大量研究。但这些技术总体上是零散且不系统的，如果想要在奶公犊育肥过程中进行应用和推广，还需要进一步对这些已研发的技术进行集成和组装。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">3.&nbsp;</span></strong><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">客观认识和评价奶公牛产肉性能</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">奶公牛的架子牛和育肥牛的交易价格与肉牛及其杂交牛、西门塔尔等乳肉兼用牛存在较大差距，一般差价在1.6-2.3元/kg（曹兵海，2009）。很多时候，价格较低的理由是认为奶公牛出肉率低（骨肉比高）或肉质较差。在我国目前架子牛短期育肥的模式下，上述理由被过分强调，从而压低了奶公牛的价格，抑制了大家养殖和育肥奶公牛的积极性。实际上，荷斯坦作为传统的奶牛品种，也具有非常理想的产肉性能（包括产肉量和肉品质），根据张兴隆等（2017）最新研究结果表明，直线育肥奶公牛出肉率随月龄的增加而提高，育肥至18月龄以上，奶公牛的屠宰率和净肉率可分别达到58%和48%以上，达到或甚至超过一些专门的肉牛品种。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">另外，荷斯坦奶牛属于大体型牛种，经过强度育肥后活体重可以达到700-800kg甚至更高，绝对产肉量远远超过一般肉牛品种。另外，关于奶公牛肉质较差的理由很难站得住脚，在美国，利用荷斯坦阉牛生产出来的优级（Prime）牛肉占全美优级牛肉市场的32%-60%（Boetel，2016）；在欧盟，利用奶公犊生产小牛肉产量最大的国家是荷兰，其次是法国（Sans，2009）；荷兰利用奶公犊生产的高档小白牛肉占市场份额50%，其他50%来自淘汰奶牛和少量肉牛专用品种提供的牛肉（张越杰，2011）。由此可见，与一般纯种肉牛相比，在产肉量和牛肉品质方面，荷斯坦奶公牛毫不逊色。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">4.&nbsp;</span></strong><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">发展奶-肉牛复合养殖模式</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">奶牛和肉牛养殖是相辅相成的两个产业，特别是在目前奶业转型、肉牛牛源紧缺的情况下，奶牛和肉牛产业不可能完全独立存在。而事实上，越来越多的奶公犊已经开始被用来育肥，也证明了奶-肉牛复合养殖模式是最具盈利能力和抗风险能力的生产模式，这也是市场规律之下必然产生的模式。根据国家肉牛牦牛产业技术体系的调研报告（曹兵海，2009），将近20%的奶牛养殖者已经开始了奶-肉牛复合养殖模式。实际上，奶-肉牛复合养殖模式可分三种，即：奶牛和奶公犊复合、奶牛和奶-肉牛杂交牛复合、直接饲养乳肉兼用牛种。对于以养殖奶牛为主的生产模式，前两种模式富有实效，其中，奶牛和奶公犊复合养殖模式最为快捷，容易实现低成本高效生产。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">5.&nbsp;</span></strong><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">奶公犊资源利用的前景</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">奶公犊是连接奶牛养殖业与肉牛养殖业的纽带，近年来，奶业波动和肉牛牛源危机的日趋严重，使得奶公犊资源的开发利用逐渐成为各级政府、专家学者、肉牛养殖企业以及奶牛养殖企业共同关注的焦点。可以说，奶公犊育肥将在未来中国传统奶业和肉牛产业中扮演重要的角色，奶公犊的科学利用是弥补我国牛肉缺口的有效途径之一。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">事实上，目前在国内很多肉牛育肥场都能看到与其他品种同时接受育肥的奶公牛。近年来，养殖奶牛与养殖肉牛之间的比较效益优势已不明显，奶牛养殖企业依靠售卖生鲜乳所得利润越来越低，甚至出现周期性赔本的现象，加上肉牛牛源不足对犊牛价格的拉动，利用奶公犊资源生产牛肉的潜在盈利空间和经济优势已逐步表现出来。未来奶牛养殖企业采取奶牛养殖与奶公犊育肥的复合养殖方式，是规避奶业风险、提高效益的有效手段。</span></p><p><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp;&nbsp; &nbsp;</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">来源：DairymanCN&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">特邀作者｜曹兵海、苏华维</span></p><p><br/></p>', '2018-09-06 11:00:35', 3357, '侩牛小编', 0, 'http://118.190.209.59:9910/App/App_News/20180906/165148.html', 1, 'https://bj.bcebos.com/common1/180905/15361176985178184.jpeg@w_500', '超级管理员', '2019-08-16 10:18:29', 1, 1, NULL, NULL, '科学利用奶公犊资源的建议', 53);
INSERT INTO `App_News` VALUES (73762, NULL, NULL, '<p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">众所周知，牛都是吃草长大的，可是最近听说居然有牛也在吃巧克力！这是咋回事呢？让我们一起走进位于澳大利亚南部Mayura Station农庄，看一看那里的牛！</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">先来说说这个农场！</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361153829172922.jpg@w_500\"/><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\"><br/></span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">Mayura Station</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">农场成立于1997年，是澳大利亚精品牛肉生产商中的佼佼者，面向全球出口牛肉，其生产的高品质牛肉受到亚洲顶级餐厅及大量米其林星级餐厅的认可。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">农场位于南澳石灰岩海岸地区（Limestone Coast），这里有着最优质的农场腹地，适宜养殖顶级肉牛，1998年由德布鲁因家族集团（de Bruin Group）接管并参与经营。农场的牛肉主要出口国家为新加坡、迪拜、中国、新西兰及菲律宾。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">吃草也吃巧克力！</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361153832278365.jpg@w_500\"/><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\"><br/></span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">我们都知道澳大利亚的牛肉在全球范围内都是出了名的！已经连续多年蝉联“全球牛排界天下第一”的称号，这并不是没有理由的！您敢相信吗？眼前的牛吃的饲料并不是草，而是巧克力等甜品组成的混合饲料！养牛场的仓库里放的不是饲草，而是整整10吨巧克力！什么M&amp;M巧克力，Smarties巧克力豆，还有一些巧克力碎块和巧克力饼干等等。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">没错，这就是专门给牛配的巧克力甜品饲料！农场主花费了两年的时间，请教了一位日本的喂养牛的营养专家，才制定了不一样的饲养粮食。每头牛一天会吃下两公斤特制巧克力甜品饲料，农场主坚信如此做法定能取得成功！农场主表示：“我们家的牛不只是吃巧克力而已，均衡膳食是必须被考虑的因素，它们不会有糖尿病。”</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">事实也的确如此！巧克力喂养出来的牛肉，还真是有奇效的。吃过这种牛肉的顾客都反馈味道非常独特，跟以前吃过的所有牛肉都不一样，尝起来有点甜，而且牛肉有一种坚果般的颜色和风味！总之就是很好吃！</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">听音乐养牛</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361158997322042.jpg@w_500\"/></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">为培育出世界上最好吃的牛肉，农场的管理人员可谓煞费苦心！牛的待遇比人还好，没事的时候就听听音乐，农场主说了，这样有助于牛放松心情！这样的环境长出的牛肉质量可想而知！牛肉上如同大理石的花纹是评价牛肉质量的重要指标，花纹越多越丰富，表明牛肉越嫩，品质越好！最好的牛肉，大理石花纹最多也就只能打7、8分，但是这里牛肉的大理石花纹至少在9分以上，这种环境下的牛肉能不好吃么！</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">成功的秘诀：</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361158996288828.jpg@w_500\"/><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\"><br/></span></strong></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">1</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">、贸易条件</span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">Mayura</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">农场生产的牛肉70%用于出口。据悉他们家的牛肉一部分销往澳洲顶级餐厅，300克的牛排零售价格高达288美元（每千克约788 美元），70%的牛肉出口到亚洲餐厅。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">因此，出口市场的贸易条件对于其发展来说至关重要。德布鲁因集团人力资源及合规经理汉弗莱斯（Lee Humphries）表示，近年来，中国市场成长迅速且具有极大的增长潜力，这主要是由于其市场规模大，对牛肉需求高，尤其是中产阶级人群数扩增，奢侈品牛肉的消费需求也在不断上扬。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">另外，中澳自贸协定（ChAFTA）的实施也是一大利好因素，据澳贸委介绍，中澳FTA极大提高了澳洲牛肉的竞争优势，有力抵抗来自巴西、阿根廷和乌拉圭等国牛肉生产商的竞争。中澳自贸协定关键成果包括：至2024年1月1日前，逐步取消优质澳洲牛肉切块进口关税（目前是12-15%），最迟到2022年1月1日前，取消12%牛杂关税。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">2</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">、专注品质</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361153830565072.jpg@w_500\"/><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\"><br/></span></strong></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">汉弗莱斯称，纯种牛肉属于优质奢侈品产品，由于生产成本较高，价格方面不具备优势。中国的关税减免政策能够帮助企业大大缩减成本，扩大利润空间。针对这一现象，Mayura农场正在进行扩张计划，包括增加农场面积、强化谷物饲料生产能力及牲畜喂养能力。目标是刺激牛肉产量增长，以满足日益上涨的海外市场需求。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">对产品品质的专注使得Mayura农场成为除日本以外全球最大规模的纯种牛饲养商。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">俗话说，酒香不怕巷子深。许多人为了品这一口牛肉，都愿意千里迢迢专程来到这家养牛场，这家牛场还为此专门设了一个现场牛肉品尝室。</span></p><p style=\"text-indent:32px\"><strong><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">3</span><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">、政府支持</span></strong></p><p style=\"text-indent:32px\"><img src=\"https://bj.bcebos.com/common1/180905/15361158998365666.jpg@w_500\"/><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\"><br/></span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">首先，在澳洲的每一头牛，都会有一张NLIS，这是澳洲政府制定的“国家牲畜认证系统”，通俗点说，这是一张“牛的身份证”。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">这张“身份证”到底能起到什么作用呢？它记录着一头牛从出生到死亡的全部过程，并且只要在互联网上一查信息，就可以迅速找到这头牛的位置。还有！这张“身份证”会记录这头牛每日的产奶量，然后自动计算下一次的合理饲料配给。这样，如果有哪头牛产奶量有异常了，养牛场就能在第一时间获知并采取应对措施。</span></p><p style=\"text-indent:32px\"><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">在澳洲，每头牛的平均占地面积是：四亩草地！用水紧张的时期，政府会节约用水，甚至限水，水都是要留给牛牛们的。澳洲政府对牛始终保证充足而干净的水源，并且政府还会有专门的委员会，定时检测对养牛农场的水源，确保水质安全才能供牛饮用。</span></p><p><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">试问，充足的水源，肆意奔驰的草原，还有巧克力都那么好吃了，牛肉能不好吃吗？</span></p><p><span style=\"font-size:16px;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp; &nbsp; &nbsp; &nbsp;文章来源：搜狐网 腾讯新闻</span></p><p><br/></p>', '2018-09-06 17:10:56', 3357, '侩牛小编', 0, 'http://118.190.209.59:9910/App/App_News/20180906/171409.html', 1, 'https://bj.bcebos.com/common1/180905/15361158996288828.jpg@w_500', '超级管理员', '2019-08-16 10:18:35', 1, 1, NULL, NULL, '一斤牛肉人民币5369元，这吃巧克力的牛果然不一般！', 12);
INSERT INTO `App_News` VALUES (73765, NULL, NULL, '<p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:32px;line-height:150%\"><a></a><a><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">澳洲进口牛肉占中国总进口量的30%以上，是我国牛肉主要进口过之一，澳洲经历严重干旱对国内牛肉市场或将产生一定影响。受干旱影响澳洲目前国内屠宰量居高，短期有利出口，由于基础母牛被过量宰杀造成的整体牛源短缺将在一个较长的时间内被市场反馈，MIG预测，在未来的12个月内，澳洲活牛价格可能会上涨20-30%，我们预计澳洲价格的上涨势必会传导至国内，预计2019年我国活牛价格仍将继续高位运行。</span></a></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:32px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">以下为MIG详细报道内容：</span></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:32px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">澳洲干旱最早从去年10月份昆士兰开始，持续到今年3月的维多利亚地区，新南威尔士等州，目前仍在持续，目前澳洲相关机构预测，9月10月澳洲仍可能持续干旱。加上不断上升的饲料成本使牧场主更愿意将存栏送至屠宰场进行屠宰，集中出售存栏将会导致屠宰场牛源供给增加，屠宰场可以压低活牛收购价格，短期内获得成本优势。</span></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:16px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp;</span><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">澳洲的活牛价格指数EYCI一路走低，而出口价格由于国际市场的需求保持坚挺，澳洲屠宰厂短期获利空间增加。</span></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:16px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp;</span><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">MIG</span><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">预计澳洲国内价格的低点将出现在十月，不管是否继续干旱。</span></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:16px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp;</span><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">澳洲政府已开始进行干预，一方面已开始向牧场主拨款，以缓解他们的损失，保护存栏。另一方面对各州陆续开始设置母牛宰杀上限比例，做种群恢复的工作。因此预计屠宰量可能会在10月前后达到顶峰，然后市场逐渐进入供应偏紧的状态，国际市场的需求下半年预计保持强势，价格会逐渐回升。根据MIG预测，在未来的12个月内，活牛价格可能会上涨20-30%，由于基础母牛被过量宰杀造成的整体牛源短缺将在一个较长的时间内被市场反馈。</span></p><p style=\"text-align:justify;text-justify:inter-ideograph;text-indent:16px;line-height:150%\"><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">&nbsp;</span><span style=\";line-height:150%;font-family:&#39;微软雅黑&#39;,sans-serif\">由于干旱导致的高屠宰量，使EYCI的价格维持弱势状态。2013-2015年干旱的EYCI表现，可以发现EYCI从2015年下半年由于牛源减少，屠宰量下降，价格逐渐回升。</span></p><p><span style=\"font-size:14px;font-family:仿宋\">&nbsp; &nbsp; 文章来源：本文转载自梅特国际集团中国进口牛肉行业8月月报，侩牛编辑，如有版权等相关问题，我们将予以修正或删除。</span></p>', '2018-09-07 08:52:48', 3357, '侩牛小编', 1, 'http://118.190.209.59:9910/App/App_News/20180907/085323.html', 1, 'https://bj.bcebos.com/common1/180905/15361158998365666.jpg@w_500', '超级管理员', '2019-08-16 10:18:14', 1, 2, NULL, NULL, 'MIG预测未来12个月内活牛价格可能会上涨20-30%', 13);

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
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_ReportPrice
-- ----------------------------
INSERT INTO `App_ReportPrice` VALUES (66, '0-2月龄', '2018-09-10 09:13:49', 1, 1, '测试超级管理员', '重庆市', '2018-09-07 18:18:15', 3331, 'Mr.G', 0, '超级管理员', '2019-09-18 18:36:44', 1, 13, '西门塔尔');
INSERT INTO `App_ReportPrice` VALUES (67, '12-16月龄', '2018-09-10 10:16:59', 1, 1, '测试超级管理员', '忻州市', '2018-09-10 10:12:50', 3344, '啊啊啊', 0, '超级管理员', '2019-07-16 15:07:16', 1, 29, '西门塔尔');
INSERT INTO `App_ReportPrice` VALUES (72, '16月龄以上', '2019-07-16 15:02:36', 1, 1, '超级管理员', '秦皇岛市', '2019-07-11 17:17:41', 1, '超级管理员', 1, '超级管理员', '2019-08-09 09:29:13', 1, 21, '南阳牛');
INSERT INTO `App_ReportPrice` VALUES (74, '7-12月龄', '2019-07-16 15:05:39', 1, 2, '超级管理员', '唐山市', '2019-07-11 18:25:35', 1, '超级管理员', 0, '超级管理员', '2019-08-09 09:28:41', 1, 65, '利木赞牛');
INSERT INTO `App_ReportPrice` VALUES (75, '7-12月龄', '2019-07-16 10:29:11', 1, 1, '超级管理员', '北京市', '2019-07-11 18:28:53', 1, '超级管理员', 1, '超级管理员', '2019-08-09 09:29:03', 1, 43, '夏洛莱牛');
INSERT INTO `App_ReportPrice` VALUES (81, '2-6月龄', '2019-07-18 11:41:20', 1, 2, '超级管理员', '石家庄市', '2019-07-18 11:17:34', 1, '超级管理员', 1, '超级管理员', '2019-07-18 11:38:55', 1, 14, '利木赞牛');
INSERT INTO `App_ReportPrice` VALUES (82, '7-12月龄', '2019-07-18 12:42:06', 1, 1, '超级管理员', '唐山市', '2019-07-18 11:40:09', 1, '超级管理员', 0, '超级管理员', '2019-07-18 11:40:42', 1, 78, '利木赞牛');
INSERT INTO `App_ReportPrice` VALUES (83, '2-6月龄', NULL, NULL, 0, NULL, '天津市', '2019-07-26 13:20:43', 1, '超级管理员', 1, '超级管理员', '2019-09-18 18:36:31', 1, 12, '利木赞牛');
INSERT INTO `App_ReportPrice` VALUES (84, '16月龄以上', NULL, NULL, 0, NULL, '天津市', '2019-09-18 18:37:03', 1, '超级管理员', 1, '', NULL, NULL, 34, '夏洛莱牛');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_Transaction
-- ----------------------------
INSERT INTO `App_Transaction` VALUES (4, '1', '2019-09-18 18:10:01', 1, '超级管理员', '买买买买买买1', NULL, NULL, NULL, NULL, '大锤1', '13419098211', 25, 0);
INSERT INTO `App_Transaction` VALUES (5, '1', '2019-09-18 18:10:01', 1, '超级管理员', '买买买买买买2', NULL, NULL, NULL, NULL, '大锤2', '13419098211', 25, 1);
INSERT INTO `App_Transaction` VALUES (6, '3', '2019-09-18 18:22:25', 1, '超级管理员', '买买买买买买2', NULL, NULL, NULL, NULL, '小乔', '13419444421', 199, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App_TransactionAvgPrice
-- ----------------------------
INSERT INTO `App_TransactionAvgPrice` VALUES (2, '12-16月龄', 22.00, '天津市', '2019-05-06 14:06:15', 1, '超级管理员', '2019-05-30', 0, 1, '超级管理员', '2019-08-01 13:06:16', 1, '鲁西黄牛');
INSERT INTO `App_TransactionAvgPrice` VALUES (3, '16月龄以上', 18.00, '石家庄市', '2019-05-06 14:06:35', 1, '超级管理员', '2019-05-08', 0, 1, '超级管理员', '2019-08-01 15:20:42', 1, '秦川牛');
INSERT INTO `App_TransactionAvgPrice` VALUES (6, '7-12月龄', 19.00, '北京市', '2019-05-08 15:42:30', 1, '超级管理员', '2019-05-07', 0, 1, '超级管理员', '2019-07-15 15:24:45', 1, '神户肉牛');
INSERT INTO `App_TransactionAvgPrice` VALUES (7, '2-6月龄', 22.00, '北京市', '2019-07-12 10:39:44', 1, '超级管理员', '2019-07-16', 0, 1, '超级管理员', '2019-07-31 13:45:41', 1, '南阳牛');
INSERT INTO `App_TransactionAvgPrice` VALUES (8, '12-16月龄', 23.43, '石家庄市', '2019-07-12 14:32:29', 1, '超级管理员', '2019-07-10', 0, 1, '超级管理员', '2019-09-19 10:04:06', 1, '西门塔尔');
INSERT INTO `App_TransactionAvgPrice` VALUES (10, '7-12月龄', 22.00, '唐山市', '2019-07-12 18:01:27', 1, '超级管理员', '2019-07-07', NULL, 1, '超级管理员', '2019-08-23 10:42:10', 1, '利木赞牛');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of SellOrder
-- ----------------------------
INSERT INTO `SellOrder` VALUES ('8e68188b-a9a2-45f5-87cd-58c421b14090', 1, '2019000001810005', '2019000001810006', 188, '2019-09-18 13:28:06', 1, 1, '超级管理员', '4', 1, '超级管理员', '2019-09-18 12:21:12', 1, '超级管理员', '2019-09-20 17:08:14');
INSERT INTO `SellOrder` VALUES ('da70748d-6c95-4bdb-bcf2-beb55c1693e3', 2, '2019000001810001', '2019000001810002', 200, NULL, 0, NULL, NULL, '买家女朋友不要了', 1, '超级管理员', '2019-09-17 18:51:11', 1, '超级管理员', '2019-09-19 14:56:35');
INSERT INTO `SellOrder` VALUES ('f30e1d98-b2c6-4150-b372-a9154553041e', 2, '2019000001810003', '2019000001810004', 56, '2019-09-18 13:28:06', 1, 1, '超级管理员', NULL, 1, '超级管理员', '2019-09-18 12:20:52', 1, '超级管理员', '2019-09-19 10:09:41');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of SellOrderList
-- ----------------------------
INSERT INTO `SellOrderList` VALUES ('08d72cf6-d9f5-bee9-32ff-5808ff1238cb', '6efb65b8-585e-4be7-8b77-94c76e362412', '测试', '测试', 7, 8.00, NULL, 1, '超级管理员', '2019-08-30 11:05:03', 1, '超级管理员', '2019-08-30 11:05:19');
INSERT INTO `SellOrderList` VALUES ('08d72cf6-ed6c-f0e0-9e97-5930a04f2ebc', 'ad698348-1535-4221-9a1a-57db5cb351e4', '2', '2', 2, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:35', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('08d73b5c-f448-6ac7-5db9-66be4d4e6ca5', 'da70748d-6c95-4bdb-bcf2-beb55c1693e3', '男装', '32', 2, 2.00, '33', 1, '超级管理员', '2019-09-17 18:51:12', 1, '超级管理员', '2019-09-19 14:56:35');
INSERT INTO `SellOrderList` VALUES ('08d73bef-9771-0dad-717f-0115449d0db0', 'f30e1d98-b2c6-4150-b372-a9154553041e', '男装', '3', 1, NULL, NULL, 1, '超级管理员', '2019-09-18 12:20:52', 1, '超级管理员', '2019-09-19 10:09:41');
INSERT INTO `SellOrderList` VALUES ('08d73bef-a3a7-4ce3-00fb-8a1249593c9c', '8e68188b-a9a2-45f5-87cd-58c421b14090', '女装', '4', 1, NULL, NULL, 1, '超级管理员', '2019-09-18 12:21:13', 1, '超级管理员', '2019-09-20 17:08:14');
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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\ntextField: \'Enable\',\n containField: null,\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', '1', NULL, '是否值', 'enable', 1, '测试超级管理员', '2018-07-10 16:38:51', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\n textField: \'Success\', \n containField: null,\n handler: null }\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '测试超级管理员', '2018-06-12 10:21:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\n textField: \'LogType\', \n containField: null,\n handler: null }\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '测试超级管理员', '2018-08-01 14:41:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\n textField: \'RoleName\', \n containField: [\'Role_Id\',\'RoleName\'],\n handler: null }\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\n', '角色列表', 'roles', 1, '测试超级管理员', '2018-07-13 15:03:53', 1, 123, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (34, '{valueField: \'PINType\',\n textField: \'PINTypeV\', \n containField:null\n}', '2018-07-09 10:04:10', NULL, '测试超级管理员', NULL, NULL, '验证码获取记录', 'pin', 1, '测试超级管理员', '2018-07-10 14:08:10', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (35, '{\n valueField: \'AuditStatus\',\n textField: \'AuditStatus\',\n  containField:null \n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '测试超级管理员', '2018-07-10 11:02:59', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (36, '{\n valueField: \'Variety\',\n textField: \'Variety\',\n  containField:null \n}', '2018-07-10 14:06:12', 1, '测试超级管理员', NULL, NULL, '品种', 'pz', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (37, '{\n valueField: \'AgeRange\',\n textField: \'AgeRange\',\n  containField:null \n}', '2018-07-10 14:07:46', NULL, '测试超级管理员', NULL, NULL, '月龄', 'age', 1, '测试超级管理员', '2018-07-10 14:14:49', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\n valueField: \'City\',\n textField: \'City\',\n  containField:null \n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '测试超级管理员', '2018-07-16 17:03:50', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (39, '{\n valueField: \'ReplyStatus\',\n textField: \'ReplyStatus\',\n  containField:null \n}', '2018-07-10 14:53:08', NULL, '测试超级管理员', NULL, NULL, '回复状态', 'reply', 1, '测试超级管理员', '2018-07-10 14:56:16', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (41, '{\n valueField: \'Sex\',\n textField: \'Sex\',\n  containField:null \n}', '2018-07-10 15:43:44', 1, '测试超级管理员', NULL, NULL, '公母牛', 'sex', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (42, '{\n valueField: \'Temperature\',\n textField: \'Temperature\',\n  containField:null \n}', '2018-07-10 15:47:28', 1, '测试超级管理员', NULL, NULL, '温度', 'wd', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (44, '{\n valueField: \'NewsType\',\n textField: \'NewsType\',\n  containField:null \n}', '2018-07-10 16:15:59', 1, '测试超级管理员', NULL, NULL, '新闻类型', 'news', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (45, '{\n valueField: \'Expire\',\n textField: \'Expire\',\n  containField:null \n}', '2018-07-10 16:38:40', 1, '测试超级管理员', NULL, NULL, '是否过期', 'expire', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\n valueField: \'ProvinceName\',\n textField: \'ProvinceName\',\n  containField:null \n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '测试超级管理员', '2018-07-23 15:23:21', 1, NULL, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (48, '{\n valueField: \'ClassifyId\',\n textField: \'ClassifyTitle\',\n  containField:null \n}', '2018-07-18 10:16:22', NULL, '测试超级管理员', NULL, NULL, '是否买入', 'nav', 1, '超级管理员', '2019-09-18 18:09:42', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (49, '{\n valueField: \'Gender\',\n textField: \'Gender\',\n  containField:null \n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\n valueField: \'Enable\',\n textField: \'Enable\',\n  containField:null \n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (52, '{\n valueField: \'Choiceness\',\n textField: \'Choiceness\',\n  containField:null \n}', '2018-07-24 15:45:47', 1, '测试超级管理员', NULL, NULL, '是否买入', 'cq', 1, '超级管理员', '2019-09-18 17:32:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (53, '{\n valueField: \'SourceType\',\n textField: \'SourceType\',\n  containField:null \n}', '2018-08-07 13:53:56', 1, '测试超级管理员', NULL, NULL, '图片来源', 'ps', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (59, '{\n valueField: \'IsRegregisterPhone\',\n textField: \'IsRegregisterPhone\',\n  containField:null \n}', '2018-08-29 15:54:21', 1, '测试超级管理员', NULL, NULL, '是否手机用户', 'isphone', 1, '超级管理员', '2019-09-17 11:22:03', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (60, '{\n valueField: \'DailyRecommend\',\n textField: \'DailyRecommend\',\n  containField:null \n}', '2018-09-05 15:45:49', 1, '超级管理员', NULL, NULL, '是否今日推荐', 'dr', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (62, '{\n valueField: \'IsTop\',\n textField: \'IsTop\',\n  containField:null \n}', '2019-08-20 09:57:54', 1, '超级管理员', NULL, NULL, '推荐价格', 'top', 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, 1, 'dddd');
INSERT INTO `Sys_Dictionary` VALUES (64, NULL, '2019-09-18 19:25:47', 1, '超级管理员', NULL, NULL, '订单类型', 'ordertype', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (65, NULL, '2019-09-19 10:07:23', 1, '超级管理员', NULL, NULL, '商品名称', 'pn', 1, NULL, NULL, NULL, NULL, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (33, '2018-07-09 10:04:10', 1, '测试超级管理员', '注册', '1', 34, NULL, '测试超级管理员', '2018-07-10 14:08:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (34, '2018-07-09 10:04:10', 1, '测试超级管理员', '忘记密码', '2', 34, NULL, '测试超级管理员', '2018-07-10 14:08:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (35, '2018-07-09 10:04:10', 1, '测试超级管理员', '验证码登录', '3', 34, NULL, '测试超级管理员', '2018-07-10 14:08:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (36, '2018-07-09 10:04:10', 1, '测试超级管理员', '修改密码', '4', 34, NULL, '测试超级管理员', '2018-07-10 14:08:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '0', 35, NULL, '测试超级管理员', '2018-07-10 11:02:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, NULL, '测试超级管理员', '2018-07-10 11:02:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核未通过', '2', 35, NULL, '测试超级管理员', '2018-07-10 11:02:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (40, '2018-07-10 14:06:13', 1, '测试超级管理员', '西门塔尔', '西门塔尔', 36, NULL, '测试超级管理员', '2018-09-04 16:13:57', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (41, '2018-07-10 14:06:13', 1, '测试超级管理员', '利木赞牛', '利木赞牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:57', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (42, '2018-07-10 14:06:13', 1, '测试超级管理员', '夏洛莱牛', '夏洛莱牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:57', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (43, '2018-07-10 14:06:13', 1, '测试超级管理员', '鲁西黄牛', '鲁西黄牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:57', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (44, '2018-07-10 14:06:13', 1, '测试超级管理员', '神户肉牛', '神户肉牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:57', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (45, '2018-07-10 14:06:13', 1, '测试超级管理员', '南阳牛', '南阳牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:58', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (46, '2018-07-10 14:06:13', 1, '测试超级管理员', '秦川牛', '秦川牛', 36, NULL, '测试超级管理员', '2018-09-04 16:13:58', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (47, '2018-07-10 14:07:46', 1, '测试超级管理员', '0-2月龄', '0-2月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (48, '2018-07-10 14:07:46', 1, '测试超级管理员', '2-6月龄', '2-6月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (49, '2018-07-10 14:07:46', 1, '测试超级管理员', '7-12月龄', '7-12月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (50, '2018-07-10 14:07:46', 1, '测试超级管理员', '12-16月龄', '12-16月龄', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (51, '2018-07-10 14:07:46', 1, '测试超级管理员', '16月龄以上', '16月龄以上', 37, NULL, '测试超级管理员', '2018-09-06 15:57:29', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (52, '2018-07-10 14:53:08', 1, '测试超级管理员', '未回复', '0', 39, NULL, '测试超级管理员', '2018-07-10 14:56:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (53, '2018-07-10 14:53:08', 1, '测试超级管理员', '已回复', '1', 39, NULL, '测试超级管理员', '2018-07-10 14:56:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (56, '2018-07-10 15:43:44', 1, '测试超级管理员', '公牛', '公牛', 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (57, '2018-07-10 15:43:44', 1, '测试超级管理员', '母牛', '母牛', 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (58, '2018-07-10 15:47:28', 1, '测试超级管理员', '39.5°C以上(升高)', '39.5°C以上(升高)', 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (59, '2018-07-10 15:47:28', 1, '测试超级管理员', '38°C~39.5°C以上(正常)', '38°C~39.5°C以上(正常)', 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (60, '2018-07-10 15:47:28', 1, '测试超级管理员', '38°C以下(降低)', '38°C以下(降低)', 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (64, '2018-07-10 16:15:59', 1, '测试超级管理员', '行业新闻', '1', 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (65, '2018-07-10 16:15:59', 1, '测试超级管理员', '行情资讯', '2', 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (66, '2018-07-10 16:38:40', 1, '测试超级管理员', '否', '0', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (67, '2018-07-10 16:38:40', 1, '测试超级管理员', '是', '1', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (68, '2018-07-11 13:20:11', 1, '测试超级管理员', 'App登陆', 'ApiLogin', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (69, '2018-07-11 15:57:03', 1, '测试超级管理员', 'App发送验证码', 'ApiSendPIN', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (70, '2018-07-11 17:11:18', 1, '测试超级管理员', 'App请求异常', 'ApiException', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (77, '2018-07-18 10:16:22', 1, '测试超级管理员', '现金', '1', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 120, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (78, '2018-07-18 10:16:23', 1, '测试超级管理员', '赊账', '2', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (79, '2018-07-18 10:16:23', 1, '测试超级管理员', '抵扣', '3', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (86, '2018-07-19 11:34:35', 1, '测试超级管理员', 'App首页', 'AppHome', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (89, '2018-07-20 17:35:36', 1, '测试超级管理员', '加入会议', 'JoinMeeting', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (92, '2018-07-23 10:44:14', 1, '测试超级管理员', '修改密码', 'ApiModifyPwd', 31, 0, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (93, '2018-07-23 13:51:27', 1, '测试超级管理员', '加入我们', 'JoinUs', 31, 0, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (101, '2018-07-24 15:45:47', 1, '测试超级管理员', '否', '0', 52, 0, '超级管理员', '2019-09-18 17:32:36', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (102, '2018-07-24 15:45:47', 1, '测试超级管理员', '是', '1', 52, 0, '超级管理员', '2019-09-18 17:32:36', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (104, '2018-07-25 18:51:07', 1, '测试超级管理员', 'iPhone测试', 'IPhoneTest', 31, 0, '超级管理员', '2019-08-21 16:44:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (109, '2018-08-07 13:53:57', 1, '测试超级管理员', 'PC后台上传', '0', 53, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (110, '2018-08-07 13:53:57', 1, '测试超级管理员', '专家提问', '1', 53, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (111, '2018-08-07 13:53:57', 1, '测试超级管理员', '公开提问', '2', 53, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (112, '2018-08-07 13:53:57', 1, '测试超级管理员', '首面轮播', '3', 53, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (128, '2018-08-29 15:54:21', 1, '测试超级管理员', '是', '1', 59, 0, '超级管理员', '2019-09-17 11:22:03', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (129, '2018-08-29 15:54:21', 1, '测试超级管理员', '否', '0', 59, 1, '超级管理员', '2019-09-17 11:22:03', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (130, '2018-09-04 16:13:47', 1, '测试超级管理员', '安格斯', '安格斯', 36, 1, '测试超级管理员', '2018-09-04 16:13:58', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (137, '2018-09-05 15:45:49', 1, '超级管理员', '是', '1', 60, 1, '超级管理员', '2019-08-29 14:14:44', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (138, '2018-09-05 15:45:49', 1, '超级管理员', '否', '0', 60, 1, '超级管理员', '2019-08-29 14:14:44', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (142, '2019-08-20 09:57:54', 1, '超级管理员', '是', '1', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, '1');
INSERT INTO `Sys_DictionaryList` VALUES (143, '2019-08-20 09:57:54', 1, '超级管理员', '否', '0', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, '测试');
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2019-08-21 16:44:10', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (147, '2019-08-28 14:54:11', 1, '超级管理员', 'xx', '2', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (149, '2019-09-18 19:25:47', 1, '超级管理员', '发货', '1', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (150, '2019-09-18 19:25:47', 1, '超级管理员', '退货', '2', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (151, '2019-09-18 19:25:47', 1, '超级管理员', '返单', '3', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (152, '2019-09-19 10:07:23', 1, '超级管理员', '家居', '家居', 65, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (153, '2019-09-19 10:07:23', 1, '超级管理员', '男装', '男装', 65, 1, NULL, NULL, NULL, 4, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (154, '2019-09-19 10:07:23', 1, '超级管理员', '女装', '女装', 65, NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (155, '2019-09-19 10:07:23', 1, '超级管理员', '食品', '食品', 65, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40105 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO `Sys_Menu` VALUES (1, '系统设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 140, '.', 45, NULL, '2017-08-15 18:01:52', '2017-08-15 17:58:6', '2019-09-22 23:27:20', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (2, '用户基础信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 160, '.', 0, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2019-09-18 15:24:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 90, 'Sys_Role', 2, '/Sys_Role/Manager', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2019-08-15 10:27:41', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (4, '配置管理', 'Search,Save,Add,Update,Delete,Export,Imort', 'md-radio-button-on icon-plus-sign-alt', NULL, 1, 90, '.', 1, NULL, '2017-08-28 14:22:54', '2017-08-28 14:21:48', '2019-07-04 10:46:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 130, 'xxx', 0, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2019-09-18 15:25:43', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (7, '角色权限分配', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 0, 1, 'Sys_Role', 2, '/Sys_Role/TreeManager', NULL, NULL, '2019-09-19 15:15:54', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (8, '字典数据', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 1000, 'Sys_Dictionary', 14, '/Sys_Dictionary', NULL, NULL, '2019-08-16 17:26:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1111, 'Sys_User', 2, '/Sys_User/Manager', NULL, NULL, '2019-08-14 14:28:43', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (10, '短信验证码发送记录', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 1, 0, 'Sys_PinRecord', 11, '/Sys_PinRecord/Manager', NULL, NULL, '2019-05-06 14:19:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (11, '历史记录', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 60, '/', 45, '/', NULL, NULL, '2019-09-22 23:27:26', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (12, '生成配置', 'Search,Save,Add,Update,Delete,Export,Imort', '', NULL, 1, 0, 'Index', 4, '/Builder/Index', '2017-08-28 14:22:10', 'null', '2014-08-27 09:14:18', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (13, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 0, 'Sys_Menu', 1, '/sysmenu', '2017-08-28 14:22:08', 'null', '2019-08-08 16:55:39', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (14, '系统字典', 'Search,Save,Add,Update,Delete,Export,Imort', 'md-radio-button-on icon-plus-sign-alt', NULL, 1, 11, '.', 1, '/', NULL, NULL, '2019-07-04 10:46:54', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (16, '首页轮播图片', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 200, 'App_HomeHeadImages', 15, '/App_HomeHeadImages/Manager', NULL, NULL, '2019-08-12 16:26:44', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (17, '用户注册信息', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 1, 'Sys_UserRegisterRecord', 2, '/Sys_UserRegisterRecord/Manager', NULL, NULL, '2019-09-18 15:31:24', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (18, '成交均价', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', 'ivu-icon ivu-icon-md-alarm', NULL, 1, 120, 'App_TransactionAvgPrice', 15, '/App_TransactionAvgPrice', NULL, NULL, '2019-08-13 13:11:32', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (23, '问答信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 110, '/', 45, '/', NULL, NULL, '2019-09-18 15:27:12', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (24, '后台加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 75, '/', 56, '/table', NULL, NULL, '2019-09-20 14:59:25', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (25, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 110, '/', 29, '/form6', NULL, NULL, '2019-09-22 23:27:37', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (26, '静态页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-ios-bookmark', NULL, 0, 105, '/', 45, '/', NULL, NULL, '2019-09-18 15:27:07', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (27, '静态页面1', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 105, 'App_TechnicalClassify', 26, '/App_TechnicalClassify/Manager', NULL, NULL, '2019-09-18 15:27:03', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (28, '资讯', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 95, '/', 45, NULL, NULL, NULL, '2019-09-18 15:26:29', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (29, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 173, 'App_News', 0, '/App_News/Manager', NULL, NULL, '2019-09-20 12:46:11', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (30, '价格走势', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 95, 'App_PriceTendency', 28, '/App_PriceTendency/Manager', NULL, NULL, '2019-08-13 15:49:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (31, '牛评', '', '', NULL, 0, 95, 'App_Comment', 28, '/App_Comment/Manager', NULL, NULL, '2019-08-13 15:49:56', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (32, '会议活动', '', '', NULL, 0, 95, 'App_Meeting', 28, '/App_Meeting/Manager', NULL, NULL, '2019-08-13 15:49:59', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (33, '我要加入', '', '', NULL, 0, 95, 'App_CustomerJoin', 28, '/App_CustomerJoin/Manager', NULL, NULL, '2019-08-13 15:50:02', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (34, '我的', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 80, '/', 45, '/', NULL, NULL, '2019-09-18 15:26:03', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (35, '可编辑的table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 73, 'editTable', 56, '/editTable', NULL, NULL, '2019-09-20 15:50:21', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (36, '系统消息推送', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 1, 80, 'Sys_Message', 34, '/Sys_Message/Manager', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (37, '意见反馈', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 1, 80, 'App_Feedback', 34, '/App_Feedback/Manager', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (38, '省市列表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 100, 'vProvinceCity', 15, '/vProvinceCity', NULL, NULL, '2019-08-20 09:30:04', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (39, '用户Token生成记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 1, 'x', 2, '/Sys_UserTokenLog/Manager', NULL, NULL, '2019-09-18 15:31:19', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (40, '提问记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', 'ivu-icon ivu-icon-ios-add-circle', NULL, 1, 111, 'App_Question', 23, '/App_Question/Manager', NULL, NULL, '2019-09-18 14:40:53', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (41, '图片上传记录', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 1, 1, 'Sys_ImageLibrary', 11, '/Sys_ImageLibrary/Manager', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (42, '消息推送记录', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 0, 0, 'vSys_MessageSendLog', 34, '/vSys_MessageSendLog/Manager', NULL, NULL, '2019-02-21 18:37:53', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (43, '静态页访问记录', 'Search,Save,Add,Update,Delete,Export,Imort', NULL, NULL, 1, 0, 'vApp_StaticBrowserLog', 11, '/vApp_StaticBrowserLog/Manager', NULL, NULL, '2018-08-13 18:55:08', '测试超级管理员');
INSERT INTO `Sys_Menu` VALUES (44, '提问回复记录', '', NULL, NULL, 0, 1, 'App_QuestionReply', 23, NULL, NULL, NULL, '2018-08-29 18:12:07', '测试超级管理员');
INSERT INTO `Sys_Menu` VALUES (45, '其他不用节点', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2019-09-20 09:54:26', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (46, '产业联盟', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1, 'App_Alliance', 15, '/App_Alliance/Manager', NULL, NULL, '2019-08-13 13:12:42', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (47, 'test2019', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'test2019', 15, '/test2019', '2019-04-30 15:16:23', '超级管理员', '2019-08-13 13:12:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (48, 'Table+单表数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 200, 'Table+表单数据', 0, '/', '2019-07-12 13:26:32', '超级管理员', '2019-09-22 23:28:18', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (49, '基础表单+编辑只读', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 100, 'App_Appointment', 48, '/App_Appointment', '2019-07-12 13:28:17', '超级管理员', '2019-09-18 16:30:13', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (50, '自动绑定下拉框', '', '', NULL, 1, 90, 'App_TransactionAvgPrice', 48, '/App_TransactionAvgPrice', '2019-07-12 13:53:32', '超级管理员', '2019-09-18 16:35:40', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (51, '新增编辑删除表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 80, 'App_ReportPrice', 48, '/App_ReportPrice', '2019-07-12 13:55:21', '超级管理员', '2019-09-18 18:38:46', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (52, '导入导出表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 60, 'App_Transaction', 48, '/App_Transaction', '2019-07-12 13:56:15', '超级管理员', '2019-09-18 18:06:46', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (53, '主从基础表单', NULL, NULL, NULL, 1, 1, '/', 55, '/coding', '2019-07-12 13:57:05', '超级管理员', '2019-07-12 13:59:08', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (54, '可新增修改主从表单', NULL, NULL, NULL, 1, 1, '/', 55, '/coding', '2019-07-12 13:57:56', '超级管理员', '2019-07-12 13:59:12', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (55, 'Table+主从表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 180, '/', 0, NULL, '2019-07-12 13:58:34', '超级管理员', '2019-09-20 09:50:56', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (56, '表单布局', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 175, '/', 0, NULL, '2019-07-12 14:00:19', '超级管理员', '2019-09-18 15:27:49', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (57, '单列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, '.', 56, '/form1', '2019-07-12 14:01:12', '超级管理员', '2019-09-20 13:59:00', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (58, '两列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 90, '两列表单', 56, '/form2', '2019-07-12 14:01:43', '超级管理员', '2019-09-20 13:59:03', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (59, '多列表单自动数据源', '', '', NULL, 1, 80, '多列表单', 56, '/form3', '2019-07-12 14:02:17', '超级管理员', '2019-09-23 14:10:33', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (60, 'Table+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 70, 'Table+表单', 56, '/form4', '2019-07-12 14:03:14', '超级管理员', '2019-09-20 13:59:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (61, '系统', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, '系统', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2019-09-18 15:30:08', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '', '', NULL, 1, 1, '菜单设置', 61, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2019-08-14 16:16:25', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (63, '下拉框绑定设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 1, 'Sys_Dictionary', 61, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2019-08-16 17:41:15', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (64, '代码在线生成器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 150, '代码在线生成器', 0, '/coding', '2019-07-12 14:07:55', '超级管理员', '2019-09-22 23:27:51', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (65, 'Vue+后台代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 1, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2019-09-22 23:27:54', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (66, '静态页面发布', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 152, '静态页面发布', 0, '/coding', '2019-07-12 14:12:38', '超级管理员', '2019-09-20 17:27:29', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (67, '生成静态页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '生成静态页面', 66, '/coding', '2019-07-12 14:14:16', '超级管理员', '2019-09-22 23:27:48', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (68, '审核、启用图片支持', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 70, 'App_Expert', 48, '/App_Expert', '2019-07-12 14:24:15', '超级管理员', '2019-09-18 18:26:25', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (69, '前端自定义扩展', NULL, NULL, NULL, 1, 50, '前端自定义扩展', 48, '/coding', '2019-07-12 14:26:25', '超级管理员', '2019-07-12 14:27:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (70, '后台自定义扩展', NULL, NULL, NULL, 1, 40, '后台自定义扩展', 48, '/coding', '2019-07-12 14:28:45', '超级管理员', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (71, 'vue权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 100, 'Sys_Role', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (72, '移动H5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 165, '/', 0, '', '2019-08-14 13:16:06', '超级管理员', '2019-09-18 15:28:20', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (73, '移动H5开发打包介绍', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, NULL, '/', 72, '/app/guide', '2019-08-14 13:16:55', '超级管理员', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (74, '测试完整示例', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 177, '/', 0, '/', '2019-08-22 17:43:58', '超级管理员', '2019-09-20 09:51:19', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (75, '前后台主从扩展用例', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, NULL, 'SellOrder', 74, '/SellOrder', '2019-08-22 18:12:43', '超级管理员', '2019-09-18 19:16:47', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (76, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 95, '编辑只读', 26, '/coding', '2019-08-26 11:57:51', '超级管理员', '2019-09-20 12:42:56', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (77, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 60, '表单只读', 56, '/form7', '2019-08-26 11:58:55', '超级管理员', '2019-09-20 13:59:13', '超级管理员');

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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO `Sys_Role` VALUES (1, '2018-08-23 11:46:06', '侩牛', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '侩牛');
INSERT INTO `Sys_Role` VALUES (2, '2018-08-23 11:46:52', '侩牛小编', NULL, '1', 0, 1, '超级管理员', '2019-09-13 08:35:10', NULL, 1, '测试管理员');
INSERT INTO `Sys_Role` VALUES (3, '2018-08-23 11:47:10', '小编', NULL, '无', 0, 1, '超级管理员', '2019-08-15 10:48:25', NULL, 3, '小编');
INSERT INTO `Sys_Role` VALUES (4, '2018-08-23 11:47:41', '测试超级管理员', NULL, '无  ', 0, 1, '超级管理员', '2019-08-15 10:48:30', NULL, 3, '信息员');
INSERT INTO `Sys_Role` VALUES (5, '2019-05-30 10:59:13', '超级管理员', NULL, '还没想好', NULL, 1, '超级管理员', '2019-09-19 15:15:16', NULL, 1, '主管');

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------
INSERT INTO `Sys_RoleAuth` VALUES (1, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-13 11:18:30', '超级管理员', 18, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (2, '', '2019-08-13 11:18:30', '超级管理员', 19, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (3, '', '2019-08-13 11:18:30', '超级管理员', 22, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (4, '', '2019-08-13 11:18:30', '超级管理员', 15, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (5, 'Search,Add,Delete,Update,Export,Audit', '2019-08-13 11:18:30', '超级管理员', 46, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (6, 'Search,Add,Delete,Update,Export', '2019-08-13 11:18:30', '超级管理员', 47, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (7, 'Search,Add,Delete,Update,Export', '2019-08-13 13:13:04', '超级管理员', 38, '超级管理员', '2019-08-13 14:23:54', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (8, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-13 13:13:24', '超级管理员', 40, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (9, 'Search', '2019-08-13 13:16:20', '超级管理员', 29, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (10, 'Search,Update', '2019-08-13 13:36:03', '超级管理员', 71, '超级管理员', '2019-08-13 13:36:03', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (11, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-13 13:36:03', '超级管理员', 13, '超级管理员', '2019-08-13 13:36:03', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (12, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-13 14:35:39', '超级管理员', 18, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (13, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-13 14:35:39', '超级管理员', 19, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (14, 'Search,Add,Delete,Update,Import,Export,Audit', '2019-08-13 14:35:39', '超级管理员', 22, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (15, 'Search', '2019-08-13 14:35:39', '超级管理员', 15, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (16, 'Search,Add,Delete,Update,Export', '2019-08-13 14:35:39', '超级管理员', 38, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (17, 'Search,Add,Delete,Update,Export,Audit', '2019-08-13 14:35:39', '超级管理员', 46, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (18, 'Search,Add,Delete,Update,Export', '2019-08-13 14:35:39', '超级管理员', 47, '超级管理员', '2019-08-13 14:35:39', 5, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (19, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-14 14:26:16', '超级管理员', 9, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (20, 'Search', '2019-08-14 14:26:16', '超级管理员', 27, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (21, '', '2019-08-14 14:26:16', '超级管理员', 26, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (22, 'Search,Add,Delete,Update,Import,Export', '2019-08-14 14:26:16', '超级管理员', 30, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (23, 'Search', '2019-08-14 14:26:16', '超级管理员', 73, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (24, 'Search', '2019-08-14 14:26:16', '超级管理员', 72, '超级管理员', '2019-08-14 14:26:16', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (25, 'Search', '2019-08-14 14:29:21', '超级管理员', 2, '超级管理员', '2019-08-14 14:29:21', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (26, 'Search,Add,Delete,Update,Export', '2019-08-16 17:28:20', '超级管理员', 63, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (27, 'Search', '2019-08-16 17:28:20', '超级管理员', 61, '超级管理员', '2019-08-16 17:28:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (28, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-08-26 14:16:54', '测试帐号666', 9, '测试帐号666', '2019-08-26 14:16:54', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (29, 'Search,Update', '2019-08-26 14:16:54', '测试帐号666', 71, '测试帐号666', '2019-08-26 14:16:54', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (30, 'Search', '2019-08-26 14:16:54', '测试帐号666', 2, '测试帐号666', '2019-08-26 14:16:54', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (31, 'Search', '2019-09-20 17:26:45', '超级管理员', 5, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (32, 'Search', '2019-09-20 17:26:45', '超级管理员', 48, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (33, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-09-20 17:26:45', '超级管理员', 75, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (34, 'Search,Delete,Export', '2019-09-20 17:26:45', '超级管理员', 6, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (35, 'Search,Add,Delete,Update', '2019-09-20 17:26:45', '超级管理员', 65, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (36, 'Search,Delete,Import,Export', '2019-09-20 17:26:45', '超级管理员', 52, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (37, 'Search', '2019-09-20 17:26:45', '超级管理员', 77, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (38, 'Search,Add,Update,Export,Audit', '2019-09-20 17:26:45', '超级管理员', 68, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (39, 'Search', '2019-09-20 17:26:45', '超级管理员', 60, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (40, 'Search', '2019-09-20 17:26:45', '超级管理员', 35, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (41, 'Search', '2019-09-20 17:26:45', '超级管理员', 74, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (42, 'Search,Add,Delete,Update,Export,Audit', '2019-09-20 17:26:45', '超级管理员', 51, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (43, 'Search,Add,Delete,Update,Export', '2019-09-20 17:26:45', '超级管理员', 3, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (44, 'Search', '2019-09-20 17:26:45', '超级管理员', 58, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (45, 'Search,Import,Export', '2019-09-20 17:26:45', '超级管理员', 49, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (46, 'Search', '2019-09-20 17:26:45', '超级管理员', 57, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (47, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2019-09-20 17:26:45', '超级管理员', 25, '超级管理员', '2019-09-22 23:29:08', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (48, 'Search', '2019-09-20 17:26:45', '超级管理员', 56, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (49, 'Search', '2019-09-20 17:26:45', '超级管理员', 24, '超级管理员', '2019-09-20 17:26:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (50, 'Search', '2019-09-20 17:27:46', '超级管理员', 66, '超级管理员', '2019-09-20 17:27:46', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (51, 'Search', '2019-09-22 23:29:08', '超级管理员', 64, '超级管理员', '2019-09-22 23:29:08', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (52, 'Search', '2019-09-22 23:29:08', '超级管理员', 67, '超级管理员', '2019-09-22 23:29:08', 2, NULL);

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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 753 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-15 10:49:04', 1, 1420, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-08-15 10:49:04', 1, 1410, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-15 10:49:04', 1, 1400, '', NULL, 1, 'text', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-15 10:49:04', 1, 1390, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-15 10:49:04', 1, 1380, '', NULL, 1, 'text', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-15 10:49:04', 1, 1370, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2019-08-15 10:49:04', 1, 1360, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-15 10:49:04', 1, 1350, '', NULL, 2, 'datetime', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2019-08-15 10:49:04', 1, 1340, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-15 10:49:04', 1, 1330, '', NULL, 2, 'datetime', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-15 10:49:04', 1, 1320, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-08-15 10:49:04', 1, 1375, '', NULL, 1, 'select', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (32, NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1300, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (33, NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', 140, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1290, NULL, NULL, 1, 'textarea', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (34, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1280, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (35, NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', 300, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-23 10:17:27', 1, 1270, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (36, NULL, NULL, NULL, 8, 'sql语句', 'DbSql', 'string', 200, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-23 10:17:27', 1, 1260, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (37, NULL, NULL, NULL, NULL, 'DBServer', 'DBServer', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-23 10:17:27', 1, 1250, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (38, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1240, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (39, NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1295, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (40, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2019-08-23 10:17:27', 1, 1220, NULL, NULL, NULL, '无', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (41, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'enable', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1210, NULL, NULL, 2, 'drop', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (42, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1200, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (43, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1190, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (44, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-23 10:17:27', 1, 1180, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (45, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-23 10:17:27', 1, 1170, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (46, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1160, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (47, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-23 10:17:27', 1, 1150, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1140, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1130, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (50, NULL, NULL, NULL, NULL, '数据源Value', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-20 10:08:56', 1, 1120, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (51, NULL, NULL, NULL, NULL, '数据源Text', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-20 10:08:56', 1, 1110, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1100, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2019-08-20 10:08:56', 1, 1090, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1080, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1070, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-20 10:08:56', 1, 1060, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-20 10:08:56', 1, 1050, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-20 10:08:56', 1, 1040, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-08-20 10:08:56', 1, 1030, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-20 10:08:56', 1, 1020, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-21 16:56:29', 1, 10000, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 120, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-21 16:56:29', 1, 8888, NULL, NULL, 3, 'checkbox', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-21 16:56:29', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 250, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-21 16:56:29', 1, 7980, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 280, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 10000, '超级管理员', '2019-08-21 16:56:29', 1, 7970, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-21 16:56:29', 1, 8700, NULL, NULL, 2, 'dropList', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-21 16:56:29', 1, 9999, NULL, NULL, 2, 'datetime', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-21 16:56:29', 1, 880, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (69, NULL, NULL, NULL, NULL, '时长(毫秒)', 'ElapsedTime', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-21 16:56:29', 1, 8600, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-21 16:56:29', 1, 7920, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-21 16:56:29', 1, 7910, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-21 16:56:29', 1, 7900, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30000, '超级管理员', '2019-08-21 16:56:29', 1, 9000, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-21 16:56:29', 1, 7880, NULL, NULL, NULL, '无', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30000, '超级管理员', '2019-08-21 16:56:29', 1, 7870, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-21 16:56:29', 1, 7860, NULL, NULL, 2, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (77, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-18 01:04:14', 1, 7850, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (78, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-18 01:04:14', 1, 7840, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (79, 0, NULL, 1, NULL, '部门', 'DeptName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2019-08-18 01:04:14', 1, 7830, '', NULL, 2, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (80, 0, 0, 1, NULL, '角色', 'Role_Id', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, 'roles', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 600, '超级管理员', '2019-08-18 01:04:14', 1, 7820, '', NULL, 2, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (81, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 0, 0, 150, '超级管理员', '2019-08-18 01:04:14', 1, 7810, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (82, 1, 0, 1, NULL, '用户名', 'UserName', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2019-08-18 01:04:14', 1, 7945, '', NULL, 1, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (83, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7790, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (84, NULL, NULL, NULL, NULL, '用户真实姓名', 'UserTrueName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-08-18 01:04:14', 1, 7792, '', NULL, 1, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (85, NULL, NULL, NULL, NULL, '地址', 'Address', 'string', 190, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7270, '', NULL, 4, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (86, NULL, NULL, NULL, NULL, '电话', 'Mobile', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-18 01:04:14', 1, 7260, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (87, NULL, NULL, NULL, NULL, 'Email', 'Email', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 5, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-18 01:04:14', 1, 7250, '', NULL, 4, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (88, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2019-08-18 01:04:14', 1, 7740, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (89, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 180, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 7, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7230, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (90, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-18 01:04:14', 1, 7220, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (91, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 5, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2019-08-18 01:04:14', 1, 7670, '', NULL, 4, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (92, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-18 01:04:14', 1, 7700, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (93, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7690, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (94, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7780, '', NULL, 5, 'datetime', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (95, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-18 01:04:14', 1, 7670, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (96, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7660, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (97, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7650, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (98, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'audit', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-08-18 01:04:14', 1, 7640, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (99, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7630, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (100, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7620, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (101, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7610, '', NULL, 5, 'datetime', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (102, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7600, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (103, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-05-06 16:22:39', 1, 7300, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (104, 1, 1, NULL, NULL, '手机号', 'PhoneNo', 'string', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 11, '超级管理员', '2019-05-06 16:22:39', 1, 7290, NULL, NULL, 1, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (105, 1, NULL, NULL, NULL, '验证码', 'PIN', 'string', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-05-06 16:22:39', 1, 7281, NULL, NULL, 1, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (106, 1, 1, NULL, NULL, '验证码类型', 'PINType', 'int', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, 'pin', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-05-06 16:22:39', 1, 7270, NULL, NULL, 2, 'selectList', NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (107, NULL, NULL, NULL, NULL, '是否使用', 'Enable', 'byte', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, 'enable', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-05-06 16:22:39', 1, 7260, NULL, NULL, 1, 'drop', NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (108, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-06 16:22:39', 1, 7250, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (109, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-06 16:22:39', 1, 7240, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (110, NULL, NULL, NULL, NULL, '发送时间', 'CreateDate', 'DateTime', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-06 16:22:39', 1, 7230, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (111, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-06 16:22:39', 1, 7220, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (112, 0, 0, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-06 16:22:39', 1, 7210, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (113, 0, 0, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-06 18:06:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-06 16:22:39', 1, 7200, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (114, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 150, '', NULL, NULL, NULL, '', NULL, 9, '', NULL, 1, 1, 1, NULL, NULL, 0, 200, '超级管理员', '2019-08-18 01:04:14', 1, 7842, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (131, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-04-30 11:24:34', 1, 8680, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (132, NULL, NULL, NULL, 12, '轮播图片1', 'ImageUrl', 'string', 400, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 1, 1, 0, 0, 0, 500, '超级管理员', '2019-04-30 11:24:34', 1, 8670, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (133, NULL, NULL, NULL, NULL, '跳转地址', 'TransferUrl', 'string', 250, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-04-30 11:24:34', 1, 8660, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (134, NULL, NULL, NULL, NULL, '跳转类型', 'TransferType', 'string', 120, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-04-30 11:24:34', 1, 8650, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (135, NULL, NULL, NULL, NULL, '启用首页轮播', 'Enable', 'byte', 140, NULL, '2018-07-10 13:50:35', NULL, NULL, 'enable', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-04-30 11:24:34', 1, 8667, NULL, NULL, 1, 'drop', NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (136, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-04-30 11:24:34', 1, 8630, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (137, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 150, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-04-30 11:24:34', 1, 8620, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (138, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-04-30 11:24:34', 1, 8610, NULL, NULL, 1, 'datetime', NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (139, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-04-30 11:24:34', 1, 8600, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (140, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 140, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-04-30 11:24:34', 1, 8590, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (141, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 180, NULL, '2018-07-10 13:50:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-04-30 11:24:34', 1, 8580, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (142, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-19 10:03:48', 1, 8570, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (143, NULL, NULL, NULL, 12, '品种', 'Variety', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'pz', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-09-19 10:03:48', 1, 8560, NULL, NULL, 1, 'drop', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (144, NULL, NULL, NULL, 12, '月龄', 'AgeRange', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'age', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-19 10:03:48', 1, 8550, NULL, NULL, 1, 'dropList', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (145, NULL, NULL, NULL, 12, '城市', 'City', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'city', NULL, 15, 'select', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-19 10:03:48', 1, 8540, NULL, NULL, 1, 'dropList', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (146, NULL, NULL, NULL, 12, '成交均价', 'AvgPrice', 'decimal', 80, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 20, NULL, NULL, 1, 1, NULL, 0, 0, 0, 9, '超级管理员', '2019-09-19 10:03:48', 1, 8530, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (147, NULL, NULL, NULL, 12, '成交日期', 'Date', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 25, 'date', NULL, 1, 1, NULL, 0, 0, 0, 3, '超级管理员', '2019-09-19 10:03:48', 1, 8520, NULL, NULL, 2, 'datetime', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (148, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'enable', NULL, NULL, 'select', NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-19 10:03:48', 1, 8510, NULL, NULL, 2, 'drop', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (149, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-19 10:03:48', 1, 8500, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (150, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-19 10:03:48', 1, 8490, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (151, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-19 10:03:48', 1, 8480, NULL, NULL, NULL, 'datetime', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (152, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-19 10:03:48', 1, 8470, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (153, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-19 10:03:48', 1, 8460, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (154, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-19 10:03:48', 1, 8450, NULL, NULL, NULL, NULL, NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (155, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 18:36:03', 1, 8440, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (156, NULL, NULL, NULL, NULL, '品种', 'Variety', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'pz', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8430, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (157, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, 'age', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 18:36:03', 1, 8420, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (158, NULL, NULL, NULL, NULL, '报价城市', 'City', 'string', 120, NULL, '2018-07-10 15:02:46', NULL, NULL, 'city', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 18:36:03', 1, 8410, NULL, NULL, 1, 'dropList', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (159, NULL, NULL, NULL, NULL, '上报价格', 'Price', 'decimal', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 9, '超级管理员', '2019-09-18 18:36:03', 1, 8400, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (160, 0, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'audit', NULL, NULL, 'select', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 18:36:03', 1, 8382, NULL, NULL, 2, 'select', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (161, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 18:36:03', 1, 8380, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (162, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8370, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (163, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 18:36:03', 1, 8360, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (164, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 18:36:03', 1, 8350, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (165, NULL, NULL, NULL, NULL, '上报人', 'Creator', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8388, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (166, NULL, 0, NULL, NULL, '上报时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-18 18:36:03', 1, 8387, NULL, NULL, 2, 'datetime', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (167, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 18:36:03', 1, 8320, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (168, NULL, NULL, NULL, 12, '测试', 'Modifier', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8310, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (169, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, '无', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-18 18:36:03', 1, 8300, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (170, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8381, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (183, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-10 17:09:58', NULL, 8160, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (184, NULL, NULL, NULL, NULL, '预约专家界面描述', 'AppointmentDescribe', 'string', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-10 17:09:58', NULL, 8150, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (185, NULL, NULL, NULL, NULL, '产业联盟图片地址', 'AllianceImageUrls', 'string', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-10 17:09:58', NULL, 8140, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (186, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '', '2018-07-10 17:09:58', NULL, 8130, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (187, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-10 17:09:58', NULL, 8120, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (188, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-10 17:09:58', NULL, 8110, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (189, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-10 17:09:58', NULL, 8100, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (190, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-10 17:09:58', NULL, 8090, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (191, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-10 17:09:58', NULL, 8080, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (192, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-07-10 15:11:39', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-10 17:09:58', NULL, 8070, '', NULL, NULL, '', NULL, 'App_OtherConfig', 18);
INSERT INTO `Sys_TableColumn` VALUES (193, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 17:40:42', 1, 8060, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (194, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 120, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 17:40:42', 1, 8050, NULL, NULL, 1, 'text', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (195, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 17:40:42', 1, 8040, NULL, NULL, 1, 'text', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (196, NULL, NULL, NULL, NULL, '数量', 'Quantity', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-09-18 17:40:42', 1, 8030, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (197, NULL, NULL, NULL, NULL, '购买类型', 'CowType', 'string', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, 'nav', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-09-18 17:40:42', 1, 8020, NULL, NULL, 2, 'dropList', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (198, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 190, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2019-09-18 17:40:42', 1, 8010, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (199, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 17:40:42', 1, 8000, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (200, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 17:40:42', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (201, NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 17:40:42', 1, 7980, NULL, NULL, 2, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (202, NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 17:40:42', 1, 7970, NULL, NULL, 2, 'datetime', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (203, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 17:40:42', 1, 7960, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (204, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 17:40:42', 1, 7950, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (205, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 17:40:42', 1, 7940, NULL, NULL, NULL, NULL, NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (206, 1, 1, 0, NULL, '主键ID', 'ExpertId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 16:46:51', 1, 7930, '', NULL, NULL, '', NULL, 'App_Expert', 20);
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
INSERT INTO `Sys_TableColumn` VALUES (217, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 120, '', '2018-07-10 15:29:01', NULL, NULL, 'audit', NULL, 0, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, 3, 'dropList', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (218, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 16:46:51', 1, 7810, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (219, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (220, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 16:46:51', 1, 7790, '', NULL, 3, 'datetime', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (221, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 15:29:01', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (222, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 16:46:51', 1, 7770, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (223, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7760, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (224, NULL, NULL, NULL, NULL, '申请时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 7, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-18 16:46:51', 1, 7750, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (225, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 16:46:51', 1, 7740, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (226, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7730, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (227, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 16:46:51', 1, 7720, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (228, NULL, NULL, NULL, NULL, '主键ID', 'QuestionId', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-24 15:35:15', NULL, 7710, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (230, NULL, NULL, NULL, NULL, '专家名称', 'ExpertName', 'string', 150, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:15', NULL, 7690, '', NULL, 1, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (231, NULL, NULL, NULL, NULL, '提问人头像', 'HeadImageUrl', 'string', 140, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, 1, 0, 1, 0, 500, '', '2018-07-24 15:35:15', NULL, 7680, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (232, NULL, NULL, NULL, NULL, '公母', 'Sex', 'string', 90, '', '2018-07-10 15:41:33', NULL, NULL, 'sex', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 10, '', '2018-07-24 15:35:15', NULL, 7670, '', NULL, 1, 'drop', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (233, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 120, '', '2018-07-10 15:41:33', NULL, NULL, 'age', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:15', NULL, 7660, '', NULL, 1, 'dropList', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (234, NULL, NULL, NULL, NULL, '温度', 'Temperature', 'string', 200, '', '2018-07-10 15:41:33', NULL, NULL, 'wd', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:15', NULL, 7650, '', NULL, 2, 'dropList', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (235, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 300, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:15', NULL, 7640, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (236, NULL, NULL, NULL, NULL, '问题描述', 'Describe', 'string', 220, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-24 15:35:15', NULL, 7630, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (237, NULL, NULL, NULL, NULL, '提问照片', 'ImageUrls', 'string', 300, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, 1, 0, 1, 0, 500, '', '2018-07-24 15:35:15', NULL, 7620, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (238, NULL, NULL, NULL, NULL, '回复状态', 'ReplyStatus', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, 'reply', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '', '2018-07-24 15:35:15', NULL, 7610, '', NULL, 2, 'drop', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (239, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, 'audit', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '', '2018-07-24 15:35:15', NULL, 7600, '', NULL, 2, 'drop', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (240, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:15', NULL, 7590, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (241, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:15', NULL, 7580, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (242, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 15:41:33', NULL, NULL, 'status', NULL, 0, '', NULL, 1, 0, NULL, 0, 0, 0, 1, '', '2018-07-24 15:35:15', NULL, 7570, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (243, NULL, NULL, NULL, NULL, '提问人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:15', NULL, 7560, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (244, NULL, NULL, NULL, NULL, '提问人', 'Creator', 'string', 130, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:15', NULL, 7550, '', NULL, 3, '无', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (245, NULL, NULL, NULL, NULL, '提问时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:35:15', NULL, 7540, '', NULL, 3, 'datetime', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (246, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:15', NULL, 7530, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (247, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:15', NULL, 7520, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (248, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:41:33', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:35:15', NULL, 7510, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (249, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '', '2018-07-24 15:35:15', NULL, 7578, '', NULL, 3, 'datetime', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (252, NULL, NULL, NULL, NULL, '主键ID', 'QuestionId', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-24 15:35:04', NULL, 7470, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (253, NULL, NULL, NULL, NULL, '公母', 'Sex', 'string', 90, '', '2018-07-10 15:52:41', NULL, NULL, 'sex', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 10, '', '2018-07-24 15:35:04', NULL, 7460, '', NULL, 1, 'drop', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (254, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 90, '', '2018-07-10 15:52:41', NULL, NULL, 'age', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:04', NULL, 7450, '', NULL, 1, 'drop', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (255, NULL, NULL, NULL, NULL, '温度', 'Temperature', 'string', 140, '', '2018-07-10 15:52:41', NULL, NULL, 'wd', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:04', NULL, 7440, '', NULL, 1, 'drop', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (256, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 300, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:04', NULL, 7430, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (257, NULL, NULL, NULL, NULL, '问题描述', 'Describe', 'string', 220, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-24 15:35:04', NULL, 7420, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (258, NULL, NULL, NULL, NULL, '提问照片', 'ImageUrls', 'string', 350, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, 1, 0, 1, 0, 500, '', '2018-07-24 15:35:04', NULL, 7410, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (259, NULL, NULL, NULL, NULL, '提问照片(大图)', 'BigImageUrls', 'string', 220, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-24 15:35:04', NULL, 7400, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (260, NULL, NULL, NULL, NULL, '精选提问', 'Choiceness', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7390, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (261, NULL, NULL, NULL, NULL, '精选排序号', 'OrderNo', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7380, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (263, NULL, NULL, NULL, NULL, '回复状态', 'ReplyStatus', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, 'reply', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '', '2018-07-24 15:35:04', NULL, 7360, '', NULL, 2, 'drop', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (264, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '', '2018-07-24 15:35:04', NULL, 7350, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (265, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7340, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (266, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-07-24 15:35:04', NULL, 7330, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (267, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:35:04', NULL, 7320, '', NULL, 2, 'datetime', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (268, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 15:52:41', NULL, NULL, 'status', NULL, 0, '', NULL, 1, 1, NULL, 0, 0, 0, 1, '', '2018-07-24 15:35:04', NULL, 7310, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (269, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7300, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (270, NULL, NULL, NULL, NULL, '提问人', 'Creator', 'string', 130, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:04', NULL, 7290, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (271, NULL, NULL, NULL, NULL, '提问时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:35:04', NULL, 7280, '', NULL, 2, 'datetime', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (272, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7270, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (273, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:35:04', NULL, 7260, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (274, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:52:41', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:35:04', NULL, 7250, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (275, NULL, NULL, NULL, NULL, '主键ID', 'ReplyId', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-24 15:34:52', NULL, 7240, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (276, NULL, NULL, NULL, NULL, '问题ID', 'QuestionId', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:34:52', NULL, 7230, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (277, NULL, NULL, NULL, NULL, '回复id', 'ReplierId', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:34:52', NULL, 7220, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (278, NULL, NULL, NULL, NULL, '回复人', 'Replier', 'string', 120, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-07-24 15:34:52', NULL, 7210, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (279, NULL, NULL, NULL, NULL, '回复日期', 'ReplyDate', 'DateTime', 150, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:34:52', NULL, 7200, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (280, NULL, NULL, NULL, NULL, '回复内容', 'ReplyContent', 'string', 220, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-24 15:34:52', NULL, 7190, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (281, NULL, NULL, NULL, NULL, '被回复人ID', 'ReplyToId', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:34:52', NULL, 7180, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (282, NULL, NULL, NULL, NULL, '被回复人', 'ReplyTo', 'string', 120, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-07-24 15:34:52', NULL, 7170, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (283, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '', '2018-07-24 15:34:52', NULL, 7160, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (284, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:34:52', NULL, 7150, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (285, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:34:52', NULL, 7140, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (286, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:34:52', NULL, 7130, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (287, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:34:52', NULL, 7120, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (288, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 15:34:52', NULL, 7110, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (289, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:55:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 15:34:52', NULL, 7100, '', NULL, NULL, '', NULL, 'App_PublicQuestionReply', 24);
INSERT INTO `Sys_TableColumn` VALUES (290, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-01-31 12:54:36', 1, 8090, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (291, NULL, NULL, NULL, NULL, '二级分类标题', 'SecondClassifyId', 'int', 120, NULL, '2018-07-10 16:02:53', NULL, NULL, 'tc', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-01-31 12:54:36', 1, 7080, NULL, NULL, 1, 'dropList', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (292, NULL, NULL, NULL, NULL, '二级分类标题', 'SecondClassifyTitle', 'string', 90, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, 0, 'text', NULL, 1, 0, NULL, 0, 0, 0, 20, '超级管理员', '2019-01-31 12:54:36', 1, 7070, NULL, NULL, NULL, '无', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (293, NULL, NULL, NULL, 12, '标题', 'Title', 'string', 300, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-01-31 12:54:36', 1, 7060, NULL, NULL, 1, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (294, NULL, NULL, NULL, NULL, '浏览次数', 'ViewCount', 'int', 80, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 12:54:36', 1, 7050, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (295, NULL, NULL, NULL, 12, '浏览地址', 'DetailUrl', 'string', 90, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, 7, 'text', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-01-31 12:54:36', 1, 7040, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (296, NULL, NULL, NULL, 12, '封面图片', 'ImageUrls', 'string', 220, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-01-31 12:54:36', 1, 7030, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (297, NULL, NULL, NULL, NULL, '图片(大图)', 'BigImageUrls', 'string', 220, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2019-01-31 12:54:36', 1, 7020, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (298, NULL, NULL, NULL, NULL, 'Url类型', 'UrlType', 'int', 80, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 12:54:36', 1, 7010, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (299, NULL, NULL, NULL, NULL, '发布人', 'Author', 'string', 120, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 50, '超级管理员', '2019-01-31 12:54:36', 1, 7000, NULL, NULL, 2, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (300, NULL, NULL, NULL, NULL, '发布日期', 'ReleaseDate', 'DateTime', 150, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2019-01-31 12:54:36', 1, 6990, NULL, NULL, 3, 'datetime', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (301, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-10 16:02:53', NULL, NULL, 'enable', NULL, 4, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-01-31 12:54:36', 1, 6980, NULL, NULL, 2, 'drop', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (302, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 12:54:36', 1, 6970, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (303, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-01-31 12:54:36', 1, 6960, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (304, NULL, NULL, NULL, NULL, '发布时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-01-31 12:54:36', 1, 6950, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (305, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 12:54:36', 1, 6940, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (306, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-01-31 12:54:36', 1, 6930, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (307, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 16:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-01-31 12:54:36', 1, 6920, NULL, NULL, 3, 'datetime', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (308, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-16 09:31:10', 1, 6910, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (309, NULL, NULL, NULL, 12, '标题', 'Title', 'string', 250, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-08-16 09:31:10', 1, 6900, NULL, NULL, 1, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (310, NULL, NULL, NULL, NULL, '发布人', 'Author', 'string', 120, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 50, '超级管理员', '2019-08-16 09:31:10', 1, 6890, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (311, 0, NULL, NULL, NULL, '发布时间', 'ReleaseDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-16 09:31:10', 1, 6880, NULL, NULL, 3, 'datetime', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (312, NULL, NULL, NULL, 12, '封面图片', 'ImageUrl', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-08-16 09:31:10', 1, 6870, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (313, NULL, NULL, NULL, NULL, '图片(大图)', 'BigImageUrls', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2019-08-16 09:31:10', 1, 6860, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (314, NULL, NULL, NULL, 12, '新闻地址', 'DetailUrl', 'string', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-08-16 09:31:10', 1, 6850, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (315, NULL, NULL, NULL, NULL, '浏览次数', 'ViewCount', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-16 09:31:10', 1, 6840, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (316, NULL, NULL, NULL, NULL, '新闻类型', 'NewsType', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, 'news', 1, 3, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-08-16 09:31:10', 1, 6830, NULL, NULL, 1, 'drop', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (317, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-08-16 09:31:10', 1, 6820, NULL, NULL, 3, 'drop', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (318, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-16 09:31:10', 1, 6810, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (319, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-16 09:31:10', 1, 6800, NULL, NULL, 3, '无', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (320, NULL, NULL, NULL, NULL, '发布时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-16 09:31:10', 1, 6790, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (321, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-16 09:31:10', 1, 6780, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (322, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-08-16 09:31:10', 1, 6770, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (323, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-08-16 09:31:10', 1, 6760, NULL, NULL, NULL, 'datetime', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (324, NULL, NULL, NULL, 12, '新闻内容', 'Content', 'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 10000, '超级管理员', '2019-08-16 09:31:10', 1, 6896, NULL, NULL, NULL, NULL, NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (325, NULL, NULL, NULL, 12, '信息正文', 'Content', 'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 15, 'textarea', NULL, 1, 0, NULL, NULL, 0, 0, 10000, '超级管理员', '2019-01-31 12:54:36', 1, 7055, NULL, NULL, NULL, 'text', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (328, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 19:23:31', 1, 6710, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (329, NULL, NULL, NULL, NULL, '价格', 'Price', 'decimal', 90, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 0, 9, '超级管理员', '2019-09-18 19:23:31', 1, 6700, '', NULL, 1, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (330, NULL, NULL, NULL, NULL, '日期', 'Date', 'DateTime', 150, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, 1, 'date', NULL, 1, 1, NULL, 0, 0, 0, 3, '超级管理员', '2019-09-18 19:23:31', 1, 6690, '', NULL, 1, 'datetime', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (331, NULL, NULL, NULL, NULL, '城市预留', 'City', 'string', 120, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 19:23:31', 1, 6680, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (332, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 19:23:31', 1, 6670, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (333, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:31', 1, 6660, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (334, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 19:23:31', 1, 6650, '', NULL, NULL, '无', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (335, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:31', 1, 6640, '', NULL, 1, 'datetime', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (336, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:31', 1, 6630, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (337, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:31', 1, 6620, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (338, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:26:26', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:31', 1, 6610, '', NULL, NULL, '', NULL, 'App_PriceTendency', 29);
INSERT INTO `Sys_TableColumn` VALUES (339, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 19:23:27', 1, 6600, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (340, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 350, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, 1, '无', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 19:23:27', 1, 6590, '', NULL, 1, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (341, NULL, NULL, NULL, 12, '评论内容', 'Content', 'string', 220, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, 4, 'textarea', NULL, 1, 1, NULL, 0, 0, 0, 3000, '超级管理员', '2019-09-18 19:23:27', 1, 6580, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (342, NULL, NULL, NULL, NULL, '发布时间', 'CommentDate', 'DateTime', 90, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, 2, 'date', NULL, 1, 1, NULL, 0, 0, 0, 10, '超级管理员', '2019-09-18 19:23:27', 1, 6570, '', NULL, 1, 'date', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (343, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:28:45', NULL, NULL, 'enable', NULL, 1, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 19:23:27', 1, 6560, '', NULL, 1, 'select', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (344, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:27', 1, 6550, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (345, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 19:23:27', 1, 6578, '', NULL, 2, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (346, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:27', 1, 6530, '', NULL, 2, 'datetime', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (347, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:27', 1, 6520, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (348, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:27', 1, 6510, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (349, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:28:45', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:27', 1, 6500, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (350, NULL, NULL, 1, NULL, '主键ID', 'MeetingId', 'int', 80, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 19:23:24', 1, 6490, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (351, NULL, NULL, 1, 12, '会议标题', 'Title', 'string', 300, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 19:23:24', 1, 6480, '', NULL, 1, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (352, NULL, NULL, 1, NULL, '会议发布人', 'Author', 'string', 120, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 5, '', NULL, 1, 0, NULL, 0, 1, 1, 50, '超级管理员', '2019-09-18 19:23:24', 1, 6470, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (353, NULL, NULL, 1, NULL, '会议发布日期(备用)', 'ReleaseDate', 'DateTime', 150, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6460, '', NULL, NULL, '无', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (354, NULL, NULL, NULL, NULL, '', 'SmallImageUrl', 'string', 220, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 500, '超级管理员', '2019-09-18 19:23:24', 1, 6450, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (355, NULL, NULL, 1, 12, '会议图片', 'ImageUrl', 'string', 220, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 7, '', NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-09-18 19:23:24', 1, 6440, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (356, NULL, NULL, NULL, NULL, '会议截止日期', 'MeetingEndDate', 'DateTime', 150, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6430, '', NULL, 2, 'datetime', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (357, NULL, NULL, NULL, NULL, '会议地点', 'Location', 'string', 220, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 150, '超级管理员', '2019-09-18 19:23:24', 1, 6420, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (358, NULL, NULL, NULL, 12, '会议介绍', 'Content', 'string', 220, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 10, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 1500, '超级管理员', '2019-09-18 19:23:24', 1, 6410, '', NULL, NULL, '无', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (359, NULL, NULL, 1, NULL, '会议是否载止', 'Expire', 'int', 120, '', '2018-07-10 16:31:59', NULL, NULL, 'expire', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:24', 1, 6400, '', NULL, 1, 'drop', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (360, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:31:59', NULL, NULL, 'enable', NULL, 3, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 19:23:24', 1, 6390, '', NULL, 1, 'drop', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (361, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 5, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:24', 1, 6380, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (362, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:24', 1, 6370, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (363, NULL, NULL, NULL, NULL, '会议发布日期', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6460, '', NULL, 2, 'datetime', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (364, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:24', 1, 6350, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (365, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:24', 1, 6340, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (366, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:31:59', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6330, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (367, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-09-18 19:23:20', 1, 6320, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (368, NULL, NULL, NULL, NULL, '报名人姓名', 'Name', 'string', 120, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 19:23:20', 1, 6310, '', NULL, 1, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (369, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 90, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 19:23:20', 1, 6300, '', NULL, 1, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (370, NULL, NULL, NULL, NULL, '公司', 'Company', 'string', 220, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 150, '超级管理员', '2019-09-18 19:23:20', 1, 6290, '', NULL, 1, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (371, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-09-18 19:23:20', 1, 6280, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (372, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:20', 1, 6270, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (373, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:20', 1, 6260, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (374, NULL, NULL, NULL, NULL, '申请时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:20', 1, 6250, '', NULL, 2, 'datetime', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (375, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-09-18 19:23:20', 1, 6240, '', NULL, 2, 'datetime', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (376, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:20', 1, 6230, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (377, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:42:31', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-09-18 19:23:20', 1, 6220, '', NULL, NULL, '', NULL, 'App_CustomerJoin', 32);
INSERT INTO `Sys_TableColumn` VALUES (387, NULL, NULL, NULL, NULL, '参加人Id', 'CustomerId', 'int', 80, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-20 17:29:25', NULL, 6120, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (388, NULL, NULL, NULL, NULL, '参加人', 'CustomerName', 'string', 90, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-07-20 17:29:25', NULL, 6110, '', NULL, 1, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (389, NULL, NULL, NULL, NULL, '参加时间', 'JoinDate', 'DateTime', 150, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:29:25', NULL, 6100, '', NULL, 2, 'datetime', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (390, NULL, NULL, NULL, NULL, '', 'MeetingId', 'int', 80, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 0, 4, '', '2018-07-20 17:29:25', NULL, 6090, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (391, NULL, NULL, NULL, NULL, '会议标题', 'Title', 'string', 120, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-07-20 17:29:25', NULL, 6080, '', NULL, 1, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (392, NULL, NULL, NULL, NULL, '会议发布人', 'Author', 'string', 120, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-07-20 17:29:25', NULL, 6070, '', NULL, 1, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (393, NULL, NULL, NULL, NULL, '会议发布日期', 'ReleaseDate', 'DateTime', 150, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:29:25', NULL, 6060, '', NULL, 2, 'datetime', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (394, NULL, NULL, NULL, NULL, '', 'SmallImageUrl', 'string', 220, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 500, '', '2018-07-20 17:29:25', NULL, 6050, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (395, NULL, NULL, NULL, NULL, '会议图片', 'ImageUrl', 'string', 220, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-07-20 17:29:25', NULL, 6040, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (396, NULL, NULL, NULL, NULL, '会议截止日期', 'MeetingEndDate', 'DateTime', 150, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:29:25', NULL, 6030, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (397, NULL, NULL, NULL, NULL, '会议地点', 'Location', 'string', 220, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 150, '', '2018-07-20 17:29:25', NULL, 6020, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (398, NULL, NULL, NULL, NULL, '会议介绍', 'Content', 'string', 220, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1500, '', '2018-07-20 17:29:25', NULL, 6010, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (399, NULL, NULL, NULL, NULL, '会议是否载止', 'Expire', 'int', 80, '', '2018-07-10 16:53:15', NULL, NULL, 'expire', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-20 17:29:25', NULL, 6000, '', NULL, 2, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (400, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '', '2018-07-20 17:29:25', NULL, 5990, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (401, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-20 17:29:25', NULL, 5980, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (402, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-20 17:29:25', NULL, 5970, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (403, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:29:25', NULL, 5960, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (404, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 4, '', '2018-07-20 17:29:25', NULL, 5950, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (405, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 30, '', '2018-07-20 17:29:25', NULL, 5940, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (406, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:53:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 8, '', '2018-07-20 17:29:25', NULL, 5930, '', NULL, NULL, '', NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (407, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-08-16 09:40:29', NULL, 5920, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (408, NULL, NULL, NULL, 12, '标题', 'Title', 'string', 300, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 0, 50, '', '2018-08-16 09:40:29', NULL, 5910, '', NULL, 1, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (409, NULL, NULL, NULL, 12, '推送内容', 'Content', 'string', 400, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, 5, 'textarea', NULL, 1, 1, NULL, 0, 0, 0, 500, '', '2018-08-16 09:40:29', NULL, 5900, '', NULL, NULL, 'textarea', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (410, NULL, NULL, NULL, NULL, '推送人', 'Author', 'string', 120, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-08-16 09:40:29', NULL, 5890, '', NULL, NULL, '无', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (411, NULL, NULL, NULL, NULL, '最后推送时间', 'ReleaseDate', 'DateTime', 150, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '', '2018-08-16 09:40:29', NULL, 5880, '', NULL, 1, 'datetime', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (412, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-10 16:58:40', NULL, NULL, 'enable', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 1, '', '2018-08-16 09:40:29', NULL, 5870, '', NULL, 1, 'select', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (413, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-08-16 09:40:29', NULL, 5860, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (414, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-16 09:40:29', NULL, 5850, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (415, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-16 09:40:29', NULL, 5840, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (416, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-08-16 09:40:29', NULL, 5830, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (417, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 30, '', '2018-08-16 09:40:29', NULL, 5820, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (418, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 16:58:40', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '', '2018-08-16 09:40:29', NULL, 5810, '', NULL, NULL, '', NULL, 'Sys_Message', 36);
INSERT INTO `Sys_TableColumn` VALUES (419, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-24 11:44:08', NULL, 5800, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (420, NULL, NULL, NULL, NULL, '反馈内容', 'Content', 'string', 220, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 500, '', '2018-07-24 11:44:08', NULL, 5790, '', NULL, 1, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (421, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 90, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 11, '', '2018-07-24 11:44:08', NULL, 5780, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (422, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 80, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 11:44:08', NULL, 5770, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (423, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 11:44:08', NULL, 5760, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (424, NULL, NULL, NULL, NULL, '反馈人', 'Creator', 'string', 130, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 11:44:08', NULL, 5750, '', NULL, 1, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (425, NULL, NULL, NULL, NULL, '反馈时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 11:44:08', NULL, 5740, '', NULL, 1, 'datetime', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (426, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 11:44:08', NULL, 5730, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (427, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-24 11:44:08', NULL, 5720, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (428, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 17:26:23', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 11:44:08', NULL, 5710, '', NULL, NULL, '', NULL, 'App_Feedback', 37);
INSERT INTO `Sys_TableColumn` VALUES (429, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, 0, 11, '超级管理员', '2019-08-18 01:04:14', 1, 7760, '', NULL, 3, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (431, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 300, '超级管理员', '2019-08-18 01:04:14', 1, 7810, '', NULL, 2, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (433, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 0, 30, '超级管理员', '2019-05-06 16:22:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Sys_PinRecord', 7);
INSERT INTO `Sys_TableColumn` VALUES (436, NULL, NULL, NULL, NULL, '', 'ProvinceId', 'int', 80, '', '2018-07-16 13:24:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 0, 4, '超级管理员', '2019-08-20 09:26:49', 1, 5630, '', NULL, NULL, '', NULL, 'vProvinceCity', 38);
INSERT INTO `Sys_TableColumn` VALUES (437, NULL, NULL, NULL, NULL, '省编号', 'ProvinceCode', 'string', 90, '', '2018-07-16 13:24:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-08-20 09:26:49', 1, 5620, '', NULL, NULL, '无', NULL, 'vProvinceCity', 38);
INSERT INTO `Sys_TableColumn` VALUES (438, NULL, NULL, NULL, NULL, '省', 'ProvinceName', 'string', 300, '', '2018-07-16 13:24:05', NULL, NULL, 'pro', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 30, '超级管理员', '2019-08-20 09:26:49', 1, 5610, '', NULL, 1, 'selectList', NULL, 'vProvinceCity', 38);
INSERT INTO `Sys_TableColumn` VALUES (439, NULL, NULL, NULL, NULL, '市编号', 'CityCode', 'string', 90, '', '2018-07-16 13:24:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-08-20 09:26:49', 1, 5600, '', NULL, NULL, '', NULL, 'vProvinceCity', 38);
INSERT INTO `Sys_TableColumn` VALUES (440, NULL, NULL, NULL, NULL, '市', 'CityName', 'string', 250, '', '2018-07-16 13:24:05', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 30, '超级管理员', '2019-08-20 09:26:49', 1, 5590, '', NULL, NULL, '', NULL, 'vProvinceCity', 38);
INSERT INTO `Sys_TableColumn` VALUES (441, NULL, NULL, NULL, NULL, '图片像数', 'ImageSize', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 9, '超级管理员', '2019-04-30 11:24:34', 1, 8645, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (444, NULL, NULL, NULL, NULL, '轮播显示排序', 'OrderNo', 'int', 140, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-04-30 11:24:34', 1, 8668, NULL, NULL, NULL, NULL, NULL, 'App_HomeHeadImages', 14);
INSERT INTO `Sys_TableColumn` VALUES (446, NULL, NULL, NULL, 12, '是否推荐价格', 'IsTop', 'int', 90, NULL, NULL, NULL, NULL, 'top', NULL, 30, 'select', NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2019-09-19 10:03:48', 1, 8515, NULL, NULL, 2, 'drop', NULL, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (457, NULL, NULL, NULL, NULL, '是否买入', 'TransactionType', 'int', 120, NULL, NULL, NULL, NULL, 'cq', NULL, 2, 'select', NULL, 1, 1, NULL, NULL, NULL, 0, 8, '超级管理员', '2019-09-18 17:40:42', 1, 8021, NULL, NULL, 1, 'select', NULL, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (458, NULL, NULL, NULL, NULL, '专家Id', 'ExpertId', 'int', 80, '', '2018-07-10 15:41:33', NULL, '', '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:15', NULL, 7700, '', NULL, NULL, '', NULL, 'App_ExpertQuestion', 22);
INSERT INTO `Sys_TableColumn` VALUES (459, NULL, NULL, NULL, NULL, '回答数量', 'ReplyQty', 'int', 80, '', '2018-07-10 15:52:40', NULL, '', '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 15:35:04', NULL, 7370, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (460, NULL, NULL, NULL, NULL, '提问人头像', 'HeadImageUrl', 'string', 160, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, 0, 500, '', '2018-07-24 15:35:04', NULL, 7290, '', NULL, NULL, '', NULL, 'App_PublicQuestion', 23);
INSERT INTO `Sys_TableColumn` VALUES (461, 1, 0, NULL, NULL, '导航分类', 'ClassifyId', 'int', 150, NULL, NULL, NULL, NULL, 'nav', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-01-31 12:54:36', 1, 7085, NULL, NULL, 1, 'dropList', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (462, NULL, NULL, NULL, NULL, '11', 'PartById', 'long', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 8, '超级管理员', '2019-01-31 13:01:40', 1, 5370, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (463, NULL, NULL, NULL, NULL, '测试id', 'Id', 'int', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0, 0, 4, '超级管理员', '2019-01-31 13:01:40', 1, 5360, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (464, NULL, NULL, NULL, NULL, NULL, 'ClassifyId', 'int', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 13:01:40', 1, 5350, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (465, NULL, NULL, NULL, NULL, NULL, 'SecondClassifyId', 'int', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 13:01:40', 1, 5340, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (466, NULL, NULL, NULL, NULL, NULL, 'SecondClassifyTitle', 'string', 90, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-01-31 13:01:40', 1, 5330, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (467, NULL, NULL, NULL, NULL, NULL, 'Title', 'string', 120, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-01-31 13:01:40', 1, 5320, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (468, NULL, NULL, NULL, NULL, NULL, 'ViewCount', 'int', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 13:01:40', 1, 5310, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (469, NULL, NULL, NULL, NULL, NULL, 'DetailUrl', 'string', 90, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2019-01-31 13:01:40', 1, 5300, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (470, NULL, NULL, NULL, NULL, NULL, 'ImageUrls', 'string', 220, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-01-31 13:01:40', 1, 5290, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (471, NULL, NULL, NULL, NULL, NULL, 'UrlType', 'int', 80, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-01-31 13:01:40', 1, 5280, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (472, NULL, NULL, NULL, NULL, NULL, 'Author', 'string', 120, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-01-31 13:01:40', 1, 5270, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (473, NULL, NULL, NULL, NULL, NULL, 'ReleaseDate', 'DateTime', 150, NULL, '2018-07-18 17:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-01-31 13:01:40', 1, 5260, NULL, NULL, NULL, NULL, NULL, 'vApp_TechnicalClassifyPartBy', 40);
INSERT INTO `Sys_TableColumn` VALUES (474, NULL, NULL, NULL, NULL, '推荐排序', 'OrderNo', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 3, '无', NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-01-31 12:54:36', 1, 6982, NULL, NULL, NULL, NULL, NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (486, NULL, NULL, NULL, NULL, '查询日期', 'QueryCommentDate', 'string', 100, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, NULL, NULL, 0, 7, '超级管理员', '2019-09-18 19:23:27', 1, NULL, '', NULL, NULL, '', NULL, 'App_Comment', 30);
INSERT INTO `Sys_TableColumn` VALUES (487, NULL, NULL, NULL, NULL, '显示排序', 'OrderNo', 'int', 100, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6390, '', NULL, NULL, '', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (488, NULL, NULL, NULL, NULL, '会议开始日期', 'MeetingDate', 'DateTime', 150, '', NULL, NULL, NULL, '', NULL, 3, 'datetime', NULL, 1, 1, NULL, NULL, 0, 0, 8, '超级管理员', '2019-09-18 19:23:24', 1, 6408, '', NULL, 2, 'datetime', NULL, 'App_Meeting', 31);
INSERT INTO `Sys_TableColumn` VALUES (490, NULL, NULL, NULL, NULL, '会议Id', 'MeetingId', 'int', 80, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-20 17:25:39', NULL, 5090, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (491, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '', '2018-07-20 17:25:39', NULL, 5080, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (492, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-20 17:25:39', NULL, 5070, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (493, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-20 17:25:39', NULL, 5060, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (494, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:25:39', NULL, 5050, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (495, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-20 17:25:39', NULL, 5040, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (496, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-07-20 17:25:39', NULL, 5030, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (497, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-20 17:19:47', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-20 17:25:39', NULL, 5020, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (498, NULL, NULL, NULL, NULL, '公司', 'Company', 'string', 300, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 0, 0, 250, '', '2018-07-20 17:25:39', NULL, 5080, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (499, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, '', '2018-07-20 17:19:47', NULL, '', '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '', '2018-07-20 17:25:39', NULL, 5100, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (500, NULL, NULL, NULL, NULL, '会议参加人', 'Name', 'string', 180, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 0, 0, 50, '', '2018-07-20 17:25:39', NULL, 5080, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (501, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 0, 0, 11, '', '2018-07-20 17:25:39', NULL, 5080, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (502, NULL, NULL, NULL, NULL, '参加人数', 'Total', 'int', 100, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 0, 0, 8, '', '2018-07-20 17:25:39', NULL, 5080, '', NULL, NULL, '', NULL, 'App_MyJoinMeeting', 42);
INSERT INTO `Sys_TableColumn` VALUES (503, NULL, NULL, NULL, NULL, '公司', 'Company', 'string', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 250, NULL, NULL, NULL, 6100, NULL, NULL, NULL, NULL, NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (504, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 11, NULL, NULL, NULL, 6100, NULL, NULL, NULL, NULL, NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (505, NULL, NULL, NULL, NULL, '参加人数', 'Total', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, 6100, NULL, NULL, NULL, NULL, NULL, 'vMyJoinMeeting', 35);
INSERT INTO `Sys_TableColumn` VALUES (506, NULL, NULL, NULL, NULL, '性别', 'Gender', 'bool', 100, '', NULL, NULL, NULL, 'gender', NULL, 4, 'drop', NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7843, '', NULL, 1, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (507, NULL, NULL, NULL, NULL, '主键ID', 'ReplyId', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4920, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (508, NULL, NULL, NULL, NULL, '问题ID', 'QuestionId', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4910, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (509, NULL, NULL, NULL, NULL, '回复类型', 'QuestionType', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4900, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (510, NULL, NULL, NULL, NULL, '回复id', 'ReplierId', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4890, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (511, NULL, NULL, NULL, NULL, '回复人', 'Replier', 'string', 120, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-06 18:29:49', 1, 4880, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (512, NULL, NULL, NULL, NULL, '回复日期', 'ReplyDate', 'DateTime', 150, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-06 18:29:49', 1, 4870, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (513, NULL, NULL, NULL, NULL, '回复内容', 'ReplyContent', 'string', 220, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-08-06 18:29:49', 1, 4860, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (514, NULL, NULL, NULL, NULL, '被回复人ID', 'ReplyToId', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4850, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (515, NULL, NULL, NULL, NULL, '被回复人', 'ReplyTo', 'string', 120, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-08-06 18:29:49', 1, 4840, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (516, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-08-06 18:29:49', 1, 4830, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (518, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-08-06 18:29:49', 1, 4810, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (519, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-06 18:29:49', 1, 4800, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (520, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-08-06 18:29:49', 1, 4790, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (521, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-08-06 18:29:49', 1, 4780, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (522, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-23 17:17:51', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-08-06 18:29:49', 1, 4770, '', NULL, NULL, '', NULL, 'App_QuestionReply', 43);
INSERT INTO `Sys_TableColumn` VALUES (523, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2019-09-18 16:46:51', 1, 7900, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (524, NULL, NULL, NULL, NULL, '', 'QuestionId', 'int', 80, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 0, 4, '', '2018-07-24 11:01:24', NULL, 4750, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (525, NULL, NULL, NULL, NULL, '', 'ReplierId', 'int', 80, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 11:01:24', NULL, 4740, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (526, NULL, NULL, NULL, NULL, '', 'QuestionType', 'string', 90, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 3, '', '2018-07-24 11:01:24', NULL, 4730, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (527, NULL, NULL, NULL, NULL, '', 'Title', 'string', 90, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 60, '', '2018-07-24 11:01:24', NULL, 4720, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (528, NULL, NULL, NULL, NULL, '', 'Replier', 'string', 120, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 100, '', '2018-07-24 11:01:24', NULL, 4710, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (529, NULL, NULL, NULL, NULL, '', 'ReplyDate', 'DateTime', 150, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 11:01:24', NULL, 4700, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (530, NULL, NULL, NULL, NULL, '', 'ReplyContent', 'string', 220, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 1000, '', '2018-07-24 11:01:24', NULL, 4690, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (531, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 60, '', '2018-07-24 11:01:24', NULL, 4680, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (532, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-07-24 11:01:24', NULL, 4670, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (533, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-07-24 11:01:24', NULL, 4660, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (534, NULL, NULL, NULL, NULL, '', 'ReplyToId', 'int', 80, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-07-24 11:01:24', NULL, 4650, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (535, NULL, NULL, NULL, NULL, '', 'ReplyTo', 'string', 120, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 100, '', '2018-07-24 11:01:24', NULL, 4640, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (536, NULL, NULL, NULL, NULL, '', 'HeadImageUrl', 'string', 90, '', '2018-07-24 11:01:02', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 1, '', '2018-07-24 11:01:24', NULL, 4630, '', NULL, NULL, '', NULL, 'vApp_PublicQuestionReply', 47);
INSERT INTO `Sys_TableColumn` VALUES (537, NULL, NULL, NULL, NULL, '', 'QuestionId', 'int', 80, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 0, 4, '', '2018-08-10 16:43:19', NULL, 4620, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (538, NULL, NULL, NULL, NULL, '', 'ReplierId', 'int', 80, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-08-10 16:43:19', NULL, 4610, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (539, NULL, NULL, NULL, NULL, '', 'QuestionType', 'string', 90, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 3, '', '2018-08-10 16:43:19', NULL, 4600, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (540, NULL, NULL, NULL, NULL, '', 'Title', 'string', 90, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-10 16:43:19', NULL, 4590, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (541, NULL, NULL, NULL, NULL, '', 'Replier', 'string', 120, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-08-10 16:43:19', NULL, 4580, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (542, NULL, NULL, NULL, NULL, '', 'ReplyDate', 'DateTime', 150, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-10 16:43:19', NULL, 4570, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (543, NULL, NULL, NULL, NULL, '', 'ReplyContent', 'string', 220, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-10 16:43:19', NULL, 4560, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (544, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-10 16:43:19', NULL, 4550, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (545, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '', '2018-08-10 16:43:19', NULL, 4540, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (546, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-10 16:43:19', NULL, 4530, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (547, NULL, NULL, NULL, NULL, '', 'ReplyToId', 'int', 80, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-08-10 16:43:19', NULL, 4520, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (548, NULL, NULL, NULL, NULL, '', 'ReplyTo', 'string', 120, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-08-10 16:43:19', NULL, 4510, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (549, NULL, NULL, NULL, NULL, '', 'HeadImageUrl', 'string', 90, '', '2018-07-24 11:04:52', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-10 16:43:19', NULL, 4500, '', NULL, NULL, '', NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (550, NULL, NULL, NULL, NULL, '申请人帐号Id', 'User_Id', 'int', 90, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, NULL, 1, 0, 8, '超级管理员', '2019-09-18 16:46:51', 1, 7921, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (551, NULL, NULL, NULL, NULL, '申请人帐号', 'UserName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (552, NULL, NULL, NULL, NULL, '申请人', 'UserTrueName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (553, NULL, NULL, NULL, NULL, '主键ID', 'QuestionId', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4460, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (554, NULL, NULL, NULL, NULL, '提问人头像', 'HeadImageUrl', 'string', 220, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-05-16 10:41:10', 1, 4450, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (555, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 200, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-16 10:41:10', 1, 4440, NULL, NULL, 1, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (556, NULL, NULL, NULL, 12, '问题描述', 'Describe', 'string', 300, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 10, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-05-16 10:41:10', 1, 4430, NULL, NULL, NULL, '无', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (557, NULL, NULL, NULL, NULL, '提问类型', 'QuestionType', 'int', 100, NULL, '2018-07-24 15:36:18', NULL, NULL, 'qtype', 2, 1, 'drop', NULL, 1, 1, NULL, 0, 0, 1, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4459, NULL, NULL, 4, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (558, NULL, NULL, NULL, NULL, '提问照片', 'ImageUrls', 'string', 220, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-05-16 10:41:10', 1, 4410, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (559, NULL, NULL, NULL, NULL, NULL, 'ExpertId', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4400, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (560, NULL, NULL, NULL, NULL, '提问专家', 'ExpertName', 'string', 140, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-05-16 10:41:10', 1, 4390, NULL, NULL, 1, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (561, NULL, NULL, NULL, NULL, '公母', 'Sex', 'string', 90, NULL, '2018-07-24 15:36:18', NULL, NULL, 'sex', 3, 1, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 10, '超级管理员', '2019-05-16 10:41:10', 1, 4380, NULL, NULL, 2, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (562, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 90, NULL, '2018-07-24 15:36:18', NULL, NULL, 'age', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-05-16 10:41:10', 1, 4370, NULL, NULL, 2, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (563, NULL, NULL, NULL, NULL, '温度', 'Temperature', 'string', 200, NULL, '2018-07-24 15:36:18', NULL, NULL, 'wd', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-05-16 10:41:10', 1, 4360, NULL, NULL, 2, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (564, NULL, NULL, NULL, NULL, '提问照片(大图)', 'BigImageUrls', 'string', 220, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2019-05-16 10:41:10', 1, 4350, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (565, NULL, NULL, NULL, NULL, '精选提问', 'Choiceness', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, 'cq', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4457, NULL, NULL, 3, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (566, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4260, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (567, NULL, NULL, NULL, NULL, '回答数量', 'ReplyQty', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4320, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (568, NULL, NULL, NULL, NULL, '回复状态', 'ReplyStatus', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, 'reply', 2, 3, '无', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4310, NULL, NULL, 3, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (569, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, 'audit', NULL, NULL, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4455, NULL, NULL, 3, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (570, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4290, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (571, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 140, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-05-16 10:41:10', 1, 4280, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (572, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2019-05-16 10:41:10', 1, 4270, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (573, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-07-24 15:36:18', NULL, NULL, 'enable', 1, 3, 'drop', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2019-05-16 10:41:10', 1, 4260, NULL, NULL, 4, 'drop', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (574, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4250, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (575, NULL, NULL, NULL, NULL, '提问人', 'Creator', 'string', 130, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-16 10:41:10', 1, 4240, NULL, NULL, 1, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (576, NULL, NULL, NULL, NULL, '提问时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-16 10:41:10', 1, 4230, NULL, NULL, 4, 'datetime', NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (577, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-16 10:41:10', 1, 4220, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (578, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-16 10:41:10', 1, 4210, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (579, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-24 15:36:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-16 10:41:10', 1, 4200, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (580, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 500, '超级管理员', '2019-05-16 10:41:10', 1, 4305, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (581, NULL, NULL, NULL, NULL, '', 'PartById', 'long', 80, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-03 10:33:40', NULL, 4180, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (582, NULL, NULL, NULL, NULL, '', 'QuestionId', 'int', 80, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 0, 4, '', '2018-08-03 10:33:40', NULL, 4170, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (583, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-03 10:33:40', NULL, 4160, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (584, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-03 10:33:40', NULL, 4150, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (585, NULL, NULL, NULL, NULL, '', 'HeadImageUrl', 'string', 220, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-03 10:33:40', NULL, 4140, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (586, NULL, NULL, NULL, NULL, '', 'Title', 'string', 90, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-03 10:33:40', NULL, 4130, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (587, NULL, NULL, NULL, NULL, '', 'ImageUrls', 'string', 220, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-03 10:33:40', NULL, 4120, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (588, NULL, NULL, NULL, NULL, '', 'Attr', 'string', 90, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 4, '', '2018-08-03 10:33:40', NULL, 4110, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (589, NULL, NULL, NULL, NULL, '', 'QuestionType', 'int', 80, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '', '2018-08-03 10:33:40', NULL, 4100, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (590, NULL, NULL, NULL, NULL, '', 'Content', 'string', 220, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-03 10:33:40', NULL, 4090, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (591, NULL, NULL, NULL, NULL, '', 'ReplyDate', 'DateTime', 150, '', '2018-07-24 18:18:20', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '', '2018-08-03 10:33:40', NULL, 4080, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (592, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 80, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2019-05-06 17:30:16', 1, 4070, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (593, NULL, NULL, NULL, NULL, NULL, 'Enable', 'byte', 90, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2019-05-06 17:30:16', 1, 4060, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (594, NULL, NULL, NULL, NULL, '备注 ', 'Remark', 'string', 220, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-05-06 17:30:16', 1, 3985, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (595, NULL, NULL, NULL, NULL, '文件1', 'ImageUrls', 'string', 400, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-05-06 17:30:16', 1, 4040, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (596, NULL, NULL, NULL, NULL, '文件来源', 'SourceType', 'int', 150, NULL, '2018-07-25 13:50:07', NULL, NULL, 'ps', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-06 17:30:16', 1, 4030, NULL, NULL, 1, 'dropList', NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (597, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 80, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-06 17:30:16', 1, 4020, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (598, NULL, NULL, NULL, NULL, '上传人', 'Creator', 'string', 130, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-06 17:30:16', 1, 4010, NULL, NULL, 1, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (599, NULL, NULL, NULL, NULL, '上传时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-06 17:30:16', 1, 4000, NULL, NULL, 1, 'datetime', NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (600, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 80, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2019-05-06 17:30:16', 1, 3990, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (601, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-05-06 17:30:16', 1, 3980, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (602, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-25 13:50:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2019-05-06 17:30:16', 1, 3970, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (603, NULL, NULL, NULL, NULL, '资质证书', ' Certificate', 'string', 200, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, 1, NULL, 1, 0, 2500, '超级管理员', '2019-09-18 16:46:51', 1, 7828, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (605, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 120, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 8, '', '2018-08-03 10:33:40', NULL, 4161, '', NULL, NULL, '', NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (606, NULL, NULL, NULL, NULL, '', 'Replier', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 50, NULL, '2018-08-03 10:33:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (607, NULL, NULL, NULL, NULL, '', 'ReplierId', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, '2018-08-03 10:33:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vApp_QuestionMyReply', 50);
INSERT INTO `Sys_TableColumn` VALUES (609, NULL, NULL, NULL, NULL, '', 'LogId', 'int', 80, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 0, '', '2018-08-13 16:46:08', NULL, 3900, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (610, NULL, NULL, NULL, NULL, '用户', 'User_Id', 'int', 80, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '', '2018-08-13 16:46:08', NULL, 3890, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (611, NULL, NULL, NULL, NULL, '', 'ServerIP', 'string', 90, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 10, '', '2018-08-13 16:46:08', NULL, 3880, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (613, NULL, NULL, NULL, NULL, '', 'TablePrimaryKey', 'int', 80, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '', '2018-08-13 16:46:08', NULL, 3860, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (614, NULL, NULL, NULL, NULL, '', 'TableName', 'string', 90, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 25, '', '2018-08-13 16:46:08', NULL, 3850, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (615, NULL, NULL, NULL, NULL, '', 'Url', 'string', 220, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 150, '', '2018-08-13 16:46:08', NULL, 3840, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (619, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, '', '2018-08-09 17:30:17', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '', '2018-08-13 16:46:08', NULL, 3800, '', NULL, NULL, '', NULL, 'App_StaticBrowserLog', 52);
INSERT INTO `Sys_TableColumn` VALUES (623, NULL, NULL, NULL, NULL, '', 'Id', 'int', 80, '', '2018-08-10 14:59:38', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 0, 0, '', '2018-08-20 15:28:31', NULL, 3760, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (624, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 80, '', '2018-08-10 14:59:38', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 0, '', '2018-08-20 15:28:31', NULL, 3750, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (625, NULL, NULL, NULL, NULL, '', 'ReadStatus', 'int', 80, '', '2018-08-10 14:59:38', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 0, '', '2018-08-20 15:28:31', NULL, 3740, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (626, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 90, '', '2018-08-10 14:59:38', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '', '2018-08-20 15:28:31', NULL, 3730, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (627, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, '', '2018-08-10 14:59:38', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '', '2018-08-20 15:28:31', NULL, 3720, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (628, NULL, NULL, NULL, NULL, '', 'MsgId', 'int', 100, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, NULL, 1, 0, 0, '', '2018-08-20 15:28:31', NULL, NULL, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (629, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 80, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 0, 0, 0, '', '2018-08-20 17:13:20', NULL, 3700, '', NULL, NULL, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (630, NULL, NULL, NULL, NULL, '接收人帐号', 'UserName', 'string', 90, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 10, '', '2018-08-20 17:13:20', NULL, 3690, '', NULL, 1, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (631, NULL, NULL, NULL, NULL, '接收人', 'UserTrueName', 'string', 90, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '', '2018-08-20 17:13:20', NULL, 3680, '', NULL, 1, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (632, NULL, NULL, NULL, NULL, '消息标题', 'Title', 'string', 120, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '', '2018-08-20 17:13:20', NULL, 3670, '', NULL, 1, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (633, NULL, NULL, NULL, NULL, '消息内容', 'Content', 'string', 220, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 500, '', '2018-08-20 17:13:20', NULL, 3660, '', NULL, NULL, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (634, NULL, NULL, NULL, NULL, '推送人', 'Creator', 'string', 130, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '', '2018-08-20 17:13:20', NULL, 3650, '', NULL, 2, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (635, NULL, NULL, NULL, NULL, '推送时间', 'CreateDate', 'DateTime', 150, '', '2018-08-10 15:06:57', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 0, 0, 0, '', '2018-08-20 17:13:20', NULL, 3640, '', NULL, 2, 'datetime', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (636, NULL, NULL, NULL, NULL, '推送自增ID', 'Id', 'int', NULL, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, NULL, NULL, 1, 1, 0, NULL, '', '2018-08-20 17:13:20', NULL, NULL, '', NULL, NULL, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (637, NULL, NULL, NULL, NULL, '消息ID', 'MsgId', 'int', NULL, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, NULL, NULL, NULL, 1, 0, NULL, '', '2018-08-20 17:13:20', NULL, NULL, '', NULL, NULL, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (638, NULL, NULL, NULL, NULL, '用户是否已读', 'ReadStatus', 'int', 100, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, NULL, 1, 0, NULL, '', '2018-08-20 17:13:20', NULL, 3677, '', NULL, NULL, '', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (640, NULL, NULL, NULL, NULL, '读取状态', 'ReadStatus', 'int', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, '超级管理员', '2019-05-16 10:41:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'App_Question', 49);
INSERT INTO `Sys_TableColumn` VALUES (641, NULL, NULL, NULL, NULL, '', 'ReadStatus', 'int', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vApp_QuestionReplyMe', 48);
INSERT INTO `Sys_TableColumn` VALUES (642, NULL, NULL, NULL, NULL, '', 'LogId', 'int', 80, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 0, 0, '超级管理员', '2019-08-15 10:16:36', 1, 3570, '', NULL, NULL, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (643, NULL, NULL, NULL, NULL, '访问用户Id', 'User_Id', 'int', 80, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2019-08-15 10:16:36', 1, 3572, '', NULL, 1, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (644, NULL, NULL, NULL, NULL, '服务器IP', 'ServerIP', 'string', 90, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 10, '超级管理员', '2019-08-15 10:16:36', 1, 3550, '', NULL, 1, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (645, NULL, NULL, NULL, NULL, '', 'TablePrimaryKey', 'int', 80, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2019-08-15 10:16:36', 1, 3540, '', NULL, NULL, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (646, NULL, NULL, NULL, NULL, '访问类型', 'TableName', 'string', 90, '', '2018-08-13 18:50:04', NULL, NULL, 'html', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 25, '超级管理员', '2019-08-15 10:16:36', 1, 3530, '', NULL, 2, 'selectList', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (647, NULL, NULL, NULL, NULL, '', 'Url', 'string', 220, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 150, '超级管理员', '2019-08-15 10:16:36', 1, 3520, '', NULL, NULL, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (648, NULL, NULL, NULL, NULL, '访问时间', 'CreateDate', 'DateTime', 150, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, 0, 0, 1, 0, 0, '超级管理员', '2019-08-15 10:16:36', 1, 3540, '', NULL, 2, 'datetime', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (649, NULL, NULL, NULL, NULL, '用户', 'UserName', 'string', 90, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 10, '超级管理员', '2019-08-15 10:16:36', 1, 3500, '', NULL, NULL, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (650, NULL, NULL, NULL, NULL, '访问用户', 'UserTrueName', 'string', 90, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-08-15 10:16:36', 1, 3570, '', NULL, 1, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (651, NULL, NULL, NULL, NULL, '访问者头像', 'HeadImageUrl', 'string', 220, '', '2018-08-13 18:50:04', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, 1, 0, 1, 0, 200, '超级管理员', '2019-08-15 10:16:36', 1, 3569, '', NULL, NULL, '', NULL, 'vApp_StaticBrowserLog', 55);
INSERT INTO `Sys_TableColumn` VALUES (654, NULL, NULL, NULL, NULL, '登陆设备类型', 'AppType', 'int', 150, '', NULL, NULL, NULL, 'ut', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-08-18 01:04:14', 1, 7809, '', NULL, 3, 'dropList', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (657, NULL, NULL, NULL, NULL, '接收人设备', 'AppType', 'int', 120, '', NULL, NULL, NULL, 'ut', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 50, '', '2018-08-20 17:13:20', NULL, 3677, '', NULL, 2, 'drop', NULL, 'vSys_MessageSendLog', 54);
INSERT INTO `Sys_TableColumn` VALUES (658, NULL, NULL, NULL, NULL, '', 'AppType', 'int', NULL, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, NULL, NULL, NULL, 1, 0, 0, '', '2018-08-20 15:28:31', NULL, NULL, '', NULL, NULL, '', NULL, 'Sys_MessageSendLog', 53);
INSERT INTO `Sys_TableColumn` VALUES (659, NULL, NULL, NULL, NULL, '是否手机用户', 'IsRegregisterPhone', 'int', 120, '', NULL, NULL, NULL, 'isphone', NULL, 2, 'drop', NULL, 1, 0, NULL, NULL, 0, 0, NULL, '超级管理员', '2019-08-18 01:04:14', 1, 7771, '', NULL, 3, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (660, NULL, NULL, NULL, NULL, '视频封面', 'Cover', 'string', 180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 0, 0, 500, '超级管理员', '2019-05-06 17:30:16', 1, 4029, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (661, NULL, NULL, NULL, NULL, '文件类型', 'FileType', 'int', 120, NULL, NULL, NULL, NULL, 'filetype', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2019-05-06 17:30:16', 1, 4028, NULL, NULL, NULL, NULL, NULL, 'Sys_ImageLibrary', 51);
INSERT INTO `Sys_TableColumn` VALUES (662, NULL, NULL, NULL, NULL, '是否今日推荐', 'DailyRecommend', 'byte', 120, NULL, NULL, NULL, NULL, 'dr', NULL, 3, 'drop', NULL, 1, 1, NULL, NULL, 0, 0, 8, '超级管理员', '2019-01-31 12:54:36', 1, 6984, NULL, NULL, 2, 'drop', NULL, 'App_TechnicalClassify ', 26);
INSERT INTO `Sys_TableColumn` VALUES (663, NULL, NULL, NULL, NULL, '是否今日推荐', 'DailyRecommend', 'byte', 120, NULL, NULL, NULL, NULL, 'dr', NULL, 5, 'drop', NULL, 1, 1, NULL, NULL, 0, 0, 8, '超级管理员', '2019-08-16 09:31:10', 1, 6825, NULL, NULL, 1, 'drop', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (664, NULL, NULL, NULL, NULL, '推荐排序', 'OrderNo', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 8, '超级管理员', '2019-08-16 09:31:10', 1, 6822, NULL, NULL, NULL, '无', NULL, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (665, NULL, NULL, NULL, NULL, '', 'Id', 'int', 80, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0, 0, 0, NULL, '2018-09-05 15:12:55', NULL, 3340, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (666, NULL, NULL, NULL, NULL, '', 'Title', 'string', 120, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, NULL, '2018-09-05 15:12:55', NULL, 3330, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (667, NULL, NULL, NULL, NULL, '', 'Author', 'string', 90, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, NULL, '2018-09-05 15:12:55', NULL, 3320, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (668, NULL, NULL, NULL, NULL, '', 'ReleaseDate', 'DateTime', 150, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, '2018-09-05 15:12:55', NULL, 3310, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (669, NULL, NULL, NULL, NULL, '', 'DetailUrl', 'string', 90, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, '2018-09-05 15:12:55', NULL, 3300, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (670, NULL, NULL, NULL, NULL, '', 'ImageUrl', 'string', 220, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 250, NULL, '2018-09-05 15:12:55', NULL, 3290, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (671, NULL, NULL, NULL, NULL, '', 'UrlType', 'int', 80, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, '2018-09-05 15:12:55', NULL, 3280, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (672, NULL, NULL, NULL, NULL, '', 'OrderNo', 'int', 80, NULL, '2018-09-05 15:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, NULL, '2018-09-05 15:12:55', NULL, 3270, NULL, NULL, NULL, NULL, NULL, 'vDailyRecommend', 56);
INSERT INTO `Sys_TableColumn` VALUES (673, NULL, NULL, NULL, NULL, '', 'Id', 'int', 80, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3260, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (674, NULL, NULL, NULL, NULL, '图片', 'ImageUrl', 'string', 220, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, 1, 0, 0, 0, 250, '超级管理员', '2019-09-18 19:23:15', 1, 3250, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (675, NULL, NULL, NULL, NULL, '排序显示', 'OrderNo', 'int', 80, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3240, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (676, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-09-14 09:47:24', NULL, NULL, 'enable', NULL, 1, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3230, NULL, 1, 1, 'drop', NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (677, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3220, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (678, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 19:23:15', 1, 3210, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (679, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3200, NULL, 1, 1, 'datetime', NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (680, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3190, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (681, NULL, NULL, NULL, NULL, '修改时间', 'Modifier', 'string', 130, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 19:23:15', 1, 3180, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (682, NULL, NULL, NULL, NULL, '修改人', 'ModifyDate', 'DateTime', 150, NULL, '2018-09-14 09:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2019-09-18 19:23:15', 1, 3170, NULL, NULL, NULL, NULL, NULL, 'App_Alliance', 57);
INSERT INTO `Sys_TableColumn` VALUES (699, NULL, NULL, NULL, NULL, '测试Id', 'id', 'int', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-08-06 18:03:02', 1, 3000, NULL, NULL, NULL, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (700, NULL, NULL, NULL, NULL, '测试1', 'testUtf8', 'string', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 10, '超级管理员', '2019-08-06 18:03:02', 1, 2990, NULL, NULL, 1, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (701, NULL, NULL, NULL, NULL, '测试2', 'testmb4', 'string', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 12, '超级管理员', '2019-08-06 18:03:02', 1, 2980, NULL, NULL, 1, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (702, NULL, NULL, NULL, NULL, NULL, 'y', 'int', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-06 18:03:02', 1, 2970, NULL, NULL, 1, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (703, NULL, NULL, NULL, NULL, NULL, 'timepsan', 'DateTime', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-06 18:03:02', 1, 2960, NULL, NULL, NULL, 'datetime', NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (704, NULL, NULL, NULL, NULL, NULL, 'time', 'string', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 3, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-06 18:03:02', 1, 2950, NULL, NULL, NULL, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (705, NULL, NULL, NULL, NULL, NULL, 'text', 'string', 220, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 65535, '超级管理员', '2019-08-06 18:03:02', 1, 2940, NULL, NULL, NULL, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (706, NULL, NULL, NULL, NULL, NULL, 'db', 'decimal', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-06 18:03:02', 1, 2930, NULL, NULL, NULL, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (707, NULL, NULL, NULL, NULL, NULL, 'tt', 'string', 90, NULL, '2019-04-30 13:55:03', 1, '超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2019-08-06 18:03:02', 1, 2920, NULL, NULL, NULL, NULL, NULL, 'test2019', 67);
INSERT INTO `Sys_TableColumn` VALUES (711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 18:03:27', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67);
INSERT INTO `Sys_TableColumn` VALUES (712, NULL, NULL, NULL, NULL, 'fdsafdsa', NULL, NULL, NULL, NULL, '2019-08-06 18:29:49', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', 43);
INSERT INTO `Sys_TableColumn` VALUES (713, NULL, NULL, NULL, NULL, 'fdsasa', NULL, NULL, NULL, NULL, '2019-08-06 18:29:49', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fsafdsa', 43);
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
INSERT INTO `Sys_TableColumn` VALUES (743, NULL, NULL, NULL, NULL, '', 'Id', 'string', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 5, 1, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2019-09-18 16:32:24', 1, 2560, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (744, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 16:32:24', 1, 2550, NULL, NULL, 1, 'datetime', NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (745, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:32:24', 1, 2540, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (746, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 16:32:24', 1, 2530, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (747, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 180, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 250, '超级管理员', '2019-09-18 16:32:24', 1, 3490, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (748, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 16:32:24', 1, 2510, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (749, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 16:32:24', 1, 2500, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (750, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:32:24', 1, 2490, NULL, NULL, NULL, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (751, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 100, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 50, '超级管理员', '2019-09-18 16:32:24', 1, 3500, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (752, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 15, '超级管理员', '2019-09-18 16:32:24', 1, 3470, NULL, NULL, 1, NULL, NULL, 'App_Appointment', 80);

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
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, 1, 'RoleName', 'System', 'VOL.System', NULL, 8, NULL, NULL, 'Sys_Role', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, 1, 'DicName', 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_Dictionary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_DictionaryList', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'System', 'VOL.System', NULL, 8, NULL, '', 'Sys_User', NULL, 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (7, NULL, '短信验证码发送记录', NULL, '无', NULL, NULL, NULL, 1, NULL, 'Record', 'VOL.AppManager', NULL, 9, NULL, NULL, 'Sys_PinRecord', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户基础信息', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 200, 0, NULL, NULL, '无', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (9, '历史记录', '历史记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 180, 25, NULL, NULL, '.', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '170', '日志管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (11, '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '250', '配置管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (13, 'App首页维护', 'App维护', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'App', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App维护', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (14, NULL, '首页轮播图片', NULL, NULL, NULL, NULL, NULL, 1, 'OrderNo', 'App', 'VOL.AppManager', NULL, 13, NULL, NULL, 'App_HomeHeadImages', NULL, 'ImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (15, '成交均价', '自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, 1, 'AvgPrice', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_TransactionAvgPrice', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (16, NULL, '新增编辑表单', NULL, NULL, NULL, NULL, NULL, 1, 'Price', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_ReportPrice', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (18, '其他配置项', '其他配置项', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Other', 'VOL.AppManager', NULL, 13, NULL, NULL, 'App_OtherConfig', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (19, NULL, '导入导出', NULL, NULL, NULL, NULL, NULL, 1, '姓名', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Transaction', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (20, NULL, '启用图片支持', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Expert', NULL, 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (22, NULL, '专家提问(停用)', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'App_ExpertQuestion', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (23, NULL, '公开提问(停用)', NULL, NULL, '提问回复明细', 'App_QuestionReply', NULL, 1, 'Title', 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'App_PublicQuestion', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (24, NULL, '公开提问回复信息(停用)', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'App_PublicQuestionReply', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (25, '养牛宝', '其他', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'App', 'VOL.AppManager', NULL, 0, NULL, NULL, '养牛宝', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (26, NULL, '养牛宝信息发布', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'Technical', 'VOL.AppManager', NULL, 25, 'Content', NULL, 'App_TechnicalClassify', NULL, 'ImageUrls', 3);
INSERT INTO `Sys_TableInfo` VALUES (27, '侩牛资讯', '静态页面发布', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'News', 'VOL.AppManager', NULL, 0, NULL, NULL, '侩牛资讯', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (28, NULL, '新闻列表', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'News', 'VOL.AppManager', NULL, 27, 'Content', 'CreateDate', 'App_News', NULL, 'ImageUrl', 3);
INSERT INTO `Sys_TableInfo` VALUES (29, '价格走势', '价格走势', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Price', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App_PriceTendency', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (30, NULL, '牛评', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'Comment', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App_Comment', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (31, NULL, '会议活动', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'Meeting', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App_Meeting', NULL, 'ImageUrl', 3);
INSERT INTO `Sys_TableInfo` VALUES (32, NULL, '我要加入', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'CJoin', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App_CustomerJoin', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (33, '我的', '我的', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'My', 'VOL.AppManager', NULL, 25, NULL, NULL, '我的', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (35, NULL, '我加入的会议视图', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Meeting', 'VOL.AppManager', NULL, 33, NULL, NULL, 'vMyJoinMeeting', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (36, NULL, '系统消息推送', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'Message', 'VOL.AppManager', NULL, 33, NULL, NULL, 'Sys_Message', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (37, NULL, '意见反馈', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Feedback', 'VOL.AppManager', NULL, 33, NULL, NULL, 'App_Feedback', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (38, '省市列表', '省市列表', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'App', 'VOL.AppManager', NULL, 13, NULL, 'ProvinceId ASC', 'vProvinceCity', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (40, NULL, '养牛宝分页测试', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Technical', 'VOL.AppManager', NULL, 25, NULL, NULL, 'vApp_TechnicalClassifyPartBy', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (42, NULL, '我加入的会议', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'My', 'VOL.AppManager', NULL, 33, NULL, NULL, 'App_MyJoinMeeting', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (43, NULL, '问答回复明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'App_QuestionReply', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (46, '问答信息', '测试', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'App', 'VOL.AppManager', NULL, 25, NULL, NULL, 'Question', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (48, NULL, '回复我的', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'vApp_QuestionReplyMe', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (49, NULL, '提问记录', NULL, NULL, '回复信息', 'App_QuestionReply', NULL, 1, 'Title', 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'App_Question', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (50, NULL, '我的回答', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Question', 'VOL.AppManager', NULL, 46, NULL, NULL, 'vApp_QuestionMyReply', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (51, NULL, '图片上传记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 9, NULL, NULL, 'Sys_ImageLibrary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (52, NULL, '静态页面访问记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Record', 'VOL.AppManager', NULL, 9, NULL, NULL, 'App_StaticBrowserLog', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (53, NULL, '系统消息推送记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Message', 'VOL.AppManager', NULL, 33, NULL, NULL, 'Sys_MessageSendLog', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (54, NULL, '系统消息推送视图', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Message', 'VOL.AppManager', NULL, 33, NULL, NULL, 'vSys_MessageSendLog', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (55, NULL, '静态访问视图', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Record', 'VOL.AppManager', NULL, 9, NULL, NULL, 'vApp_StaticBrowserLog', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (56, NULL, '今日推荐', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'App', 'VOL.AppManager', NULL, 13, NULL, NULL, 'vDailyRecommend', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (57, NULL, '产业联盟', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'News', 'VOL.AppManager', NULL, 25, NULL, NULL, 'App_Alliance', NULL, 'ImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (67, 'test2019', 'test2019', NULL, NULL, NULL, NULL, NULL, 1, 'testUtf8', 'App', 'VOL.AppManager', NULL, 13, NULL, NULL, 'test2019', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (76, '订单管理', '测试完整示例', NULL, NULL, NULL, NULL, NULL, 1, NULL, '订单管理', 'VOL.Order', NULL, 0, NULL, NULL, '订单管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (77, '销售订单', '销售订单', NULL, NULL, '订单明细', 'SellOrderList', NULL, 1, 'TranNo', 'Sell', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrder', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (78, '订单明细', '订单明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrderList', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (79, 'Table 单表数据', 'Table+单表数据', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 0, NULL, NULL, 'Table+单表数据', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (80, '基础表单查询', '基础表单+编辑只读', NULL, NULL, NULL, NULL, NULL, 1, 'Name', 'Appointment', 'VOL.Order', NULL, 79, NULL, 'CreateDate', 'App_Appointment', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3364 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, '北京市西城区', 0, '2019-08-18 00:54:06', 1, '超级管理员', '2012-06-10 11:10:03', NULL, NULL, NULL, 0, '283591387@qq.com', 1, 1, 'https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/head.png', 0, '2017-08-28 09:58:55', '2019-09-24 09:23:41', NULL, '超级管理员', '2019-05-30 11:37:41', 1, 0, 1, '超级管理员', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTU2OTI4ODIzMCIsIm5iZiI6IjE1NjkyODgyMzAiLCJleHAiOiIxNTY5Mjk1NDMwIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.E5MhE07UIbEIstnFFDe7Fx8gkyKKFYh_UQGzcHCdQfo');
INSERT INTO `Sys_User` VALUES (3362, '北京市还没注册', NULL, '2019-08-18 00:54:06', 1, '超级管理员', '2019-08-13 14:24:27', NULL, NULL, NULL, NULL, NULL, 1, 1, 'https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/h5pic/x1.jpg', 0, NULL, '2019-09-22 23:12:33', '01012345678', '超级管理员', '2019-09-22 21:33:05', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', 'zs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTU2OTIwMDk0MSIsIm5iZiI6IjE1NjkyMDA5NDEiLCJleHAiOiIxNTY5MjA4MTQxIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.SeFAt2eHLIxCQay7F3Qvs3-3jUmJ3hzmAGPevoHmNJY');

-- ----------------------------
-- Table structure for test2019
-- ----------------------------
DROP TABLE IF EXISTS `test2019`;
CREATE TABLE `test2019`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '测试Id',
  `testUtf8` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试1',
  `testmb4` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测试2',
  `y` year NULL DEFAULT NULL,
  `timepsan` timestamp(0) NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `db` decimal(4, 3) NOT NULL,
  `tt` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of test2019
-- ----------------------------
INSERT INTO `test2019` VALUES (1, '1234567', '1234567890', 2009, '2019-04-17 01:48:51', NULL, 1.110, '恩');
INSERT INTO `test2019` VALUES (2, '长234567890', '1234567890', 2011, NULL, NULL, 9.333, NULL);
INSERT INTO `test2019` VALUES (3, '1', '1', 2001, '2019-04-10 15:57:07', '1', 1.000, '恩');
INSERT INTO `test2019` VALUES (4, '1111', 'testmb4', NULL, NULL, NULL, 0.000, NULL);
INSERT INTO `test2019` VALUES (5, '1111', 'testmb4', NULL, NULL, NULL, 0.000, NULL);
INSERT INTO `test2019` VALUES (6, '1111', 'testmb4', NULL, NULL, NULL, 0.000, NULL);
INSERT INTO `test2019` VALUES (7, '1111', 'testmb4', NULL, NULL, NULL, 0.000, NULL);
INSERT INTO `test2019` VALUES (8, '1111', 'testmb4', NULL, NULL, NULL, 0.000, 't');
INSERT INTO `test2019` VALUES (9, '1111', 'testmb4', NULL, NULL, NULL, 0.000, 't');
INSERT INTO `test2019` VALUES (10, '1111', 'testmb4', NULL, NULL, NULL, 0.000, 't');
INSERT INTO `test2019` VALUES (11, '1111', 'testmb4', NULL, NULL, NULL, 0.000, 't');

SET FOREIGN_KEY_CHECKS = 1;
