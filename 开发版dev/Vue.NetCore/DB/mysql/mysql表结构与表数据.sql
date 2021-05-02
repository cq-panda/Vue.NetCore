/*
 Navicat Premium Data Transfer

 Source Server         : 120
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.53.251.208:3306
 Source Schema         : dev1

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 14/11/2020 14:59:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\ntextField: \'Enable\',\n containField: null,\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', '1', NULL, '是否值', 'enable', 1, '测试超级管理员', '2018-07-10 16:38:51', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\n textField: \'Success\', \n containField: null,\n handler: null }\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '测试超级管理员', '2018-06-12 10:21:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\n textField: \'LogType\', \n containField: null,\n handler: null }\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2019-11-25 09:26:09', 1, NULL, 1, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\n textField: \'RoleName\', \n containField: [\'Role_Id\',\'RoleName\'],\n handler: null }\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\n', '角色列表', 'roles', 1, '测试超级管理员', '2018-07-13 15:03:53', 1, 123, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (35, '{\n valueField: \'AuditStatus\',\n textField: \'AuditStatus\',\n  containField:null \n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '测试超级管理员', '2018-07-10 11:02:59', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (36, '{\n valueField: \'Variety\',\n textField: \'Variety\',\n  containField:null \n}', '2018-07-10 14:06:12', 1, '测试超级管理员', NULL, NULL, '品种', 'pz', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (37, '{\n valueField: \'AgeRange\',\n textField: \'AgeRange\',\n  containField:null \n}', '2018-07-10 14:07:46', NULL, '测试超级管理员', NULL, NULL, '月龄', 'age', 1, '测试超级管理员', '2018-07-10 14:14:49', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\n valueField: \'City\',\n textField: \'City\',\n  containField:null \n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '测试超级管理员', '2018-07-16 17:03:50', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (44, '{\n valueField: \'NewsType\',\n textField: \'NewsType\',\n  containField:null \n}', '2018-07-10 16:15:59', 1, '测试超级管理员', NULL, NULL, '新闻类型', 'news', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (45, '{\n valueField: \'Expire\',\n textField: \'Expire\',\n  containField:null \n}', '2018-07-10 16:38:40', 1, '测试超级管理员', NULL, NULL, '是否过期', 'expire', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\n valueField: \'ProvinceName\',\n textField: \'ProvinceName\',\n  containField:null \n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '测试超级管理员', '2018-07-23 15:23:21', 1, NULL, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (48, '{\n valueField: \'ClassifyId\',\n textField: \'ClassifyTitle\',\n  containField:null \n}', '2018-07-18 10:16:22', NULL, '测试超级管理员', NULL, NULL, '是否买入', 'nav', 1, '超级管理员', '2019-09-18 18:09:42', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (49, '{\n valueField: \'Gender\',\n textField: \'Gender\',\n  containField:null \n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\n valueField: \'Enable\',\n textField: \'Enable\',\n  containField:null \n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (52, '{\n valueField: \'Choiceness\',\n textField: \'Choiceness\',\n  containField:null \n}', '2018-07-24 15:45:47', 1, '测试超级管理员', NULL, NULL, '是否买入', 'cq', 1, '超级管理员', '2019-09-18 17:32:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (59, '{\n valueField: \'IsRegregisterPhone\',\n textField: \'IsRegregisterPhone\',\n  containField:null \n}', '2018-08-29 15:54:21', 1, '测试超级管理员', NULL, NULL, '是否手机用户', 'isphone', 1, '超级管理员', '2019-09-17 11:22:03', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (62, '{\n valueField: \'IsTop\',\n textField: \'IsTop\',\n  containField:null \n}', '2019-08-20 09:57:54', 1, '超级管理员', NULL, NULL, '推荐价格', 'top', 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, 1, 'dddd');
INSERT INTO `Sys_Dictionary` VALUES (64, NULL, '2019-09-18 19:25:47', 1, '超级管理员', NULL, NULL, '订单类型', 'ordertype', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (65, NULL, '2019-09-19 10:07:23', 1, '超级管理员', NULL, NULL, '商品名称', 'pn', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (66, NULL, '2020-05-08 09:42:50', 1, '超级管理员', NULL, NULL, 'dr', 'dr', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (67, NULL, '2020-05-30 19:48:29', 1, '超级管理员', NULL, NULL, '获取所有角色Table显示用', 't_roles', 1, '超级管理员', '2020-05-30 19:48:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (68, NULL, '2020-11-14 14:58:45', 1, '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS `key`,RoleName AS value FROM Sys_Role', '级联角色', 'tree_roles', 1, NULL, NULL, NULL, NULL, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2019-08-23 10:45:47', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
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
INSERT INTO `Sys_DictionaryList` VALUES (64, '2018-07-10 16:15:59', 1, '测试超级管理员', '行业新闻', '1', 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (65, '2018-07-10 16:15:59', 1, '测试超级管理员', '行情资讯', '2', 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (66, '2018-07-10 16:38:40', 1, '测试超级管理员', '否', '0', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (67, '2018-07-10 16:38:40', 1, '测试超级管理员', '是', '1', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (70, '2018-07-11 17:11:18', 1, '测试超级管理员', 'App请求异常', 'ApiException', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (77, '2018-07-18 10:16:22', 1, '测试超级管理员', '现金', '1', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 120, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (78, '2018-07-18 10:16:23', 1, '测试超级管理员', '赊账', '2', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (79, '2018-07-18 10:16:23', 1, '测试超级管理员', '抵扣', '3', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (92, '2018-07-23 10:44:14', 1, '测试超级管理员', '修改密码', 'ApiModifyPwd', 31, 0, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (101, '2018-07-24 15:45:47', 1, '测试超级管理员', '否', '0', 52, 0, '超级管理员', '2019-09-18 17:32:36', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (102, '2018-07-24 15:45:47', 1, '测试超级管理员', '是', '1', 52, 0, '超级管理员', '2019-09-18 17:32:36', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (128, '2018-08-29 15:54:21', 1, '测试超级管理员', '是', '1', 59, 0, '超级管理员', '2019-09-17 11:22:03', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (129, '2018-08-29 15:54:21', 1, '测试超级管理员', '否', '0', 59, 1, '超级管理员', '2019-09-17 11:22:03', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (130, '2018-09-04 16:13:47', 1, '测试超级管理员', '安格斯', '安格斯', 36, 1, '测试超级管理员', '2018-09-04 16:13:58', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (142, '2019-08-20 09:57:54', 1, '超级管理员', '是', '1', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, '1');
INSERT INTO `Sys_DictionaryList` VALUES (143, '2019-08-20 09:57:54', 1, '超级管理员', '否', '0', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, '测试');
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (147, '2019-08-28 14:54:11', 1, '超级管理员', 'xx', '2', 62, 1, '超级管理员', '2019-09-18 15:23:10', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (149, '2019-09-18 19:25:47', 1, '超级管理员', '发货', '1', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (150, '2019-09-18 19:25:47', 1, '超级管理员', '退货', '2', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (151, '2019-09-18 19:25:47', 1, '超级管理员', '返单', '3', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (152, '2019-09-19 10:07:23', 1, '超级管理员', '家居', '家居', 65, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (153, '2019-09-19 10:07:23', 1, '超级管理员', '男装', '男装', 65, 1, NULL, NULL, NULL, 4, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (154, '2019-09-19 10:07:23', 1, '超级管理员', '女装', '女装', 65, NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (155, '2019-09-19 10:07:23', 1, '超级管理员', '食品', '食品', 65, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (156, '2019-10-11 10:41:32', 1, '超级管理员', '登陆已过期', 'ApiAuthorize', 31, NULL, '超级管理员', '2019-11-25 09:26:09', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (157, '2020-05-08 09:42:50', 1, '超级管理员', '否', '0', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (158, '2020-05-08 09:42:50', 1, '超级管理员', '是', '1', 66, 0, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 249520 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO `Sys_Menu` VALUES (2, '用户基础信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-md-contact', NULL, 1, 1600, '.', 0, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2019-10-11 14:33:29', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role/Manager', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2019-08-15 10:27:41', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-ios-create', NULL, 1, 1300, 'xxx', 0, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2019-10-11 14:34:00', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 11110, 'Sys_User', 2, '/Sys_User/Manager', NULL, NULL, '2019-08-14 14:28:43', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (16, '首页轮播图片', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 2000, 'App_HomeHeadImages', 15, '/App_HomeHeadImages/Manager', NULL, NULL, '2019-08-12 16:26:44', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (38, '省市列表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 1000, 'vProvinceCity', 15, '/vProvinceCity', NULL, NULL, '2019-08-20 09:30:04', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (46, '产业联盟', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 10, 'App_Alliance', 15, '/App_Alliance/Manager', NULL, NULL, '2019-08-13 13:12:42', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (47, 'test2019', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'test2019', 15, '/test2019', '2019-04-30 15:16:23', '超级管理员', '2019-08-13 13:12:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (61, '系统', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-md-settings', NULL, 1, 1350, '系统', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2019-11-27 13:30:08', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'Sys_Menu', 61, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2019-10-31 13:23:09', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (63, '下拉框绑定设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 10, 'Sys_Dictionary', 61, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2019-08-16 17:41:15', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (64, '代码在线生成器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'ivu-icon ivu-icon-ios-construct', NULL, 1, 1500, '代码在线生成器', 0, '/coding', '2019-07-12 14:07:55', '超级管理员', '2020-01-08 13:54:50', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (65, 'Vue+后台代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2019-09-22 23:27:54', '超级管理员');
INSERT INTO `Sys_Menu` VALUES (71, 'vue权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, 'Sys_Role2', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO `Sys_Role` VALUES (1, '2018-08-23 11:46:06', ' ', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '超级管理员');
INSERT INTO `Sys_Role` VALUES (2, '2018-08-23 11:46:52', ' 小编', NULL, '1', 0, 1, '超级管理员', '2019-12-08 20:15:46', NULL, 1, '测试管理员');
INSERT INTO `Sys_Role` VALUES (3, '2018-08-23 11:47:10', '小编', NULL, '无', 0, 1, '超级管理员', '2019-12-08 20:15:45', NULL, 1, '小编');
INSERT INTO `Sys_Role` VALUES (4, '2018-08-23 11:47:41', '测试超级管理员', NULL, '无  ', 0, 1, '超级管理员', '2019-12-11 17:16:28', NULL, 1, '信息员');
INSERT INTO `Sys_Role` VALUES (5, '2019-05-30 10:59:13', '超级管理员', NULL, '还没想好', NULL, 1, '超级管理员', '2019-12-08 20:16:43', NULL, 1, '主管');
INSERT INTO `Sys_Role` VALUES (6, '2020-04-26 20:22:17', '超级管理员', NULL, NULL, NULL, 1, '', NULL, NULL, 2, '测试003');

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
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 764 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1420, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'roles', NULL, 1, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1410, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2020-11-14 14:55:06', 1, 1400, '', NULL, 1, 'text', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1390, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2020-11-14 14:55:06', 1, 1380, '', NULL, 1, 'text', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1370, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2020-11-14 14:55:06', 1, 1360, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1350, '', NULL, 2, 'datetime', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2020-11-14 14:55:06', 1, 1340, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1330, '', NULL, 2, 'datetime', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2020-11-14 14:55:06', 1, 1320, '', NULL, NULL, '', NULL, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:55:06', 1, 1375, '', NULL, 1, 'select', NULL, 'Sys_Role', 2);
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
INSERT INTO `Sys_TableColumn` VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1140, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1130, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (50, NULL, NULL, NULL, NULL, '数据源Value', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-20 10:08:56', 1, 1120, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (51, NULL, NULL, NULL, NULL, '数据源Text', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2019-08-20 10:08:56', 1, 1110, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1100, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2019-08-20 10:08:56', 1, 1090, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1080, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1070, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-20 10:08:56', 1, 1060, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1050, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1040, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-08-20 10:08:56', 1, 1030, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-20 10:08:56', 1, 1020, '', NULL, NULL, '', NULL, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 10000, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 120, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2020-11-14 14:51:27', 1, 8888, NULL, NULL, 3, 'checkbox', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-11-14 14:51:27', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 250, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-11-14 14:51:27', 1, 7980, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 280, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-11-14 14:51:27', 1, 7970, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 8700, NULL, NULL, 2, 'dropList', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 9999, NULL, NULL, 2, 'datetime', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 880, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (69, NULL, NULL, NULL, NULL, '时长(毫秒)', 'ElapsedTime', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 8600, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-11-14 14:51:27', 1, 7920, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-11-14 14:51:27', 1, 7910, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-11-14 14:51:27', 1, 7900, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-11-14 14:51:27', 1, 9000, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 7880, NULL, NULL, NULL, '无', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-11-14 14:51:27', 1, 7870, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:27', 1, 7860, NULL, NULL, 2, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (77, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7850, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (78, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7840, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (79, 0, NULL, 1, NULL, '部门', 'DeptName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2020-11-14 14:51:11', 1, 7830, '', NULL, 2, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (80, 0, 0, 1, NULL, '角色', 'Role_Id', 'int', 150, '', '2018-06-14 16:44:15', NULL, NULL, 'roles', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7820, '', NULL, 2, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (81, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 0, 0, 150, '超级管理员', '2020-11-14 14:51:11', 1, 7810, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (82, 1, 0, 1, NULL, '用户名', 'UserName', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2020-11-14 14:51:11', 1, 7945, '', NULL, 1, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (83, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7790, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (84, NULL, NULL, NULL, NULL, '用户真实姓名', 'UserTrueName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2020-11-14 14:51:11', 1, 7792, '', NULL, 1, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (85, NULL, NULL, NULL, NULL, '地址', 'Address', 'string', 190, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7270, '', NULL, 4, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (86, NULL, NULL, NULL, NULL, '电话', 'Mobile', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-11-14 14:51:11', 1, 7260, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (87, NULL, NULL, NULL, NULL, 'Email', 'Email', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 5, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-11-14 14:51:11', 1, 7250, '', NULL, 4, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (88, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2020-11-14 14:51:11', 1, 7740, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (89, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 180, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 7, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7230, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (90, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7220, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (91, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 5, 'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7670, '', NULL, 4, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (92, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7700, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (93, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7690, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (94, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7780, '', NULL, 5, 'datetime', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (95, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7670, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (96, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7660, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (97, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7650, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (98, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'audit', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7640, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (99, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7630, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (100, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7620, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (101, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7610, '', NULL, 5, 'datetime', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (102, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7600, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (114, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 150, '', NULL, NULL, NULL, '', NULL, 9, 'img', NULL, 1, 1, 1, NULL, 1, 0, 200, '超级管理员', '2020-11-14 14:51:11', 1, 7842, '', NULL, NULL, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (429, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2020-11-14 14:51:11', 1, 7760, '', NULL, 3, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (431, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 500, '超级管理员', '2020-11-14 14:51:11', 1, 7810, '', NULL, 2, '', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (506, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 100, '', NULL, NULL, NULL, 'gender', NULL, 4, 'select', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7843, '', NULL, 1, 'drop', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (654, NULL, NULL, NULL, NULL, '登陆设备类型', 'AppType', 'int', 150, '', NULL, NULL, NULL, 'ut', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7809, '', NULL, 3, 'dropList', NULL, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (659, NULL, NULL, NULL, NULL, '是否手机用户', 'IsRegregisterPhone', 'int', 120, '', NULL, NULL, NULL, 'isphone', NULL, 2, 'select', NULL, 1, 0, NULL, NULL, 0, 0, NULL, '超级管理员', '2020-11-14 14:51:11', 1, 7771, '', NULL, 3, 'drop', NULL, 'Sys_User', 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, 1, 'RoleName', 'System', 'VOL.System', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, 1, 'DicName', 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_Dictionary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_DictionaryList', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'System', 'VOL.System', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户基础信息', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 200, 0, NULL, NULL, '无', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '170', '日志管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (11, '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '250', '配置管理', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3372 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, '北京市西城区', 0, '2019-08-18 00:54:06', 1, '超级管理员', '2012-06-10 11:10:03', NULL, NULL, NULL, 0, '283591387@qq.com', 1, 1, 'https://imgs-1256993465.cos.ap-chengdu.myqcloud.com/head.png', 0, '2017-08-28 09:58:55', '2019-12-14 15:13:49', NULL, '超级管理员', '2019-05-30 11:37:41', 1, 0, 1, '超级管理员', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTYwNTMzNTgwOSIsIm5iZiI6IjE2MDUzMzU4MDkiLCJleHAiOiIxNjA1MzQzMDA5IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.Yj-A6n09YvdU5VMNzopUUKTUNY5uKVSQ8W0zkNUO1hQ');
INSERT INTO `Sys_User` VALUES (3362, '北京市还没注册', NULL, '2019-08-18 00:54:06', 1, '超级管理员', '2019-08-13 14:24:27', NULL, NULL, NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004241341311851/04.jpg', 0, NULL, '2019-09-22 23:12:33', '01012345678', '超级管理员', '2020-04-27 09:48:53', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', '演示帐号', '');
INSERT INTO `Sys_User` VALUES (3364, '北京市西城区', NULL, NULL, NULL, NULL, '2019-10-10 17:29:14', 1, '超级管理员', NULL, NULL, '123@qq.com', 1, 0, 'Upload/Tables/Sys_User/202004270952013790/06.jpg', 0, NULL, NULL, '139999999999', '超级管理员', '2020-11-14 14:51:33', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin777', 'E2J_2bOfPPSTYWeMKksiaw==', '你猜？', NULL);
INSERT INTO `Sys_User` VALUES (3365, '北京市还没注册', NULL, NULL, NULL, NULL, '2019-10-24 11:39:22', 1, '超级管理员', NULL, NULL, NULL, 1, NULL, 'Upload/Tables/Sys_User/202004270952176882/111.jpg', 0, NULL, NULL, '01012345678', '超级管理员', '2020-04-27 09:52:18', 1, NULL, 4, '信息员', NULL, NULL, NULL, 'test123', 'CfpTfV6KXdeC5TVoy5WL~w==', 'zs j', '');
INSERT INTO `Sys_User` VALUES (3367, NULL, NULL, NULL, NULL, NULL, '2020-03-25 11:24:59', 1, '超级管理员', NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004270952259380/1111.jpg', 0, NULL, NULL, NULL, '超级管理员', '2020-04-27 09:52:25', 1, NULL, 4, '信息员', NULL, NULL, NULL, 'admin111', 'tr8aEOCW6YdvgRfzgxf4mg==', '11', NULL);
INSERT INTO `Sys_User` VALUES (3371, NULL, NULL, NULL, NULL, NULL, '2020-04-29 15:44:15', 1, '超级管理员', NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004291544153171/1111s.jpg', 0, NULL, NULL, NULL, '超级管理员', '2020-05-09 11:52:29', 1, NULL, 6, '测试003', NULL, NULL, NULL, 'treetest1', 'kba29e~WKmea~Dis3YNQKg==', 'tree', NULL);

SET FOREIGN_KEY_CHECKS = 1;
