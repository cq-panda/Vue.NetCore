/*
 Navicat Premium Data Transfer

 Source Server         : 120.53.251.208
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.53.251.208:3306
 Source Schema         : 1105

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 06/11/2022 00:36:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of FormCollectionObject
-- ----------------------------
INSERT INTO `FormCollectionObject` VALUES ('00ac79fa-529b-45c1-ae98-1838d86f5e95', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-21\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-28 10:20:13', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('03c45672-2149-4399-9ecb-75644718f038', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-17 13:16:44', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0513b2ca-6ccd-489d-9e83-ea3de7b01754', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"d\"}', '2022-02-28 08:14:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('066ed25e-9f90-498f-bdec-05cb7881913e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-26 11:50:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('06febfc3-28d0-497f-828d-a29d5acfa366', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-03-08\",\"field1641207457900\":\"324\",\"field1641207424694\":\"\"}', '2022-03-16 16:51:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0a71d04e-6840-48ba-a3de-817896e1e111', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-14 01:44:33', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b0d324e-916b-4246-9f7a-96f5f9435320', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"22\"}', '2022-03-10 08:58:21', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b3ac6d2-35ac-42b0-84c5-bd4a22157dc2', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-05-14 23:18:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b5e3fb4-9c8b-407d-931e-bae4b8b34ce9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"11\",\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-30 16:41:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1041a590-3d36-43c8-8b1d-fe6a7a7ca18f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-04-18 18:07:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('10e5c36a-c3b0-4d9f-83bc-c25bd97e2b82', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"0\"}', '2022-02-12 14:12:00', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('15290644-4a33-4c16-8326-fd75974592a6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"7\",\"field1650260638189\":\"7777777777777777\",\"field1650260647796\":\"7777777777777777\",\"field1641206608182\":\"777\"}', '2022-06-06 16:31:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1550cb90-47c6-43cd-8690-97999d72d92f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-13 10:35:58', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('16d5ead2-e9ef-40fb-b275-832898b8cdfa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"fgdfghf gfh fg\"}', '2022-03-09 17:07:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('182125f4-f074-4b48-8ab1-e17aba5b82e9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"FAS\"}', '2022-02-08 17:18:44', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1da99df3-fc0c-48e6-98db-e95daeeddd05', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"4、输入框：\",\"field1650260638189\":\"5、输入框：\",\"field1650260647796\":\"6、输入框：\",\"field1641206608182\":\"7、其他意见：\"}', '2022-06-11 23:15:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1f50d9ec-6be5-4410-b54b-e918ee0eb386', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":null}', '2022-03-24 21:27:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('201e9a14-7ee7-4f68-919f-aac4059dfc2c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-12 14:49:03', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('21323223-980d-4177-a144-210fd26f10bf', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"fq\"}', '2022-03-25 19:45:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('248d00a3-73fd-4c44-84b2-142543c61155', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"111\"}', '2022-02-17 14:01:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('25b4cd02-8602-4516-8394-b4025e9cc420', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"2\",\"field1650260647796\":\"3\",\"field1641206608182\":\"4\"}', '2022-04-27 10:09:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('29819b15-d57b-435a-a4aa-68458e60bc4d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"2\",\"field1650260647796\":\"3\",\"field1641206608182\":\"\\n\"}', '2022-05-27 10:51:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2cf3ecde-45f3-44e5-af2a-329a8e91e6da', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"人\"}', '2022-03-27 22:52:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e10dfbc-5e80-466d-9e68-00f4c03b03cb', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-07\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-19 11:10:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e426da4-9bc2-4086-b910-55335252e286', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-07 17:15:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e71a231-ec58-4fe4-8101-f0d3405ac79d', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-03-12\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-03-12 07:21:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e860327-82a9-4e51-a451-f32295db062a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"5\",\"field1650260638189\":\"5\",\"field1650260647796\":\"5\",\"field1641206608182\":\"5\"}', '2022-05-11 09:59:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2ea29d88-281d-449a-a200-645ca8c613d5', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2017-05-04\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-05-23 17:21:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2f9fbaff-4c97-42e4-94b2-5fc2704b3a18', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":null}', '2022-03-03 10:14:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('32c11483-0898-447b-baff-a5911e988925', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-02-05 11:32:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('33d6d570-c665-40b6-9035-c5f6a7fce01f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"11111111\"}', '2022-03-04 16:54:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('35cbe5b1-2498-4f13-b605-ee6f191d30a9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-08\",\"field1641207457900\":\"v v    \",\"field1641207424694\":\"\"}', '2022-06-03 22:02:09', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('370e55db-746a-40cd-90f2-ff73b64eab00', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-08-02 11:37:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('372a0316-bf48-4411-bef0-bdfc2deefeb8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-22 16:39:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3990f4bd-68ac-483c-bc85-38335e83b88a', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-30\",\"field1641207457900\":\"的风景埃里克就\",\"field1641207424694\":\"\"}', '2022-01-22 21:16:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3bb62484-b056-43a2-9b33-5764fc625ab9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-16 10:45:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3e7a21bf-dd68-4b6a-bfa9-b0aaa3e8d49f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1231\"}', '2022-03-02 13:58:08', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3f22aafc-214f-4374-a97c-2cdcce81e08a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-31 16:19:16', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4254e8ed-0e9f-4423-9f72-1007df7fceb1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"test\"}', '2022-01-19 23:07:20', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('448ef9bf-bb84-4e56-af5b-17032207fa23', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-08-01 10:56:59', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4dcd83b4-5e1e-4299-9bc6-302313f98d5f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-02 21:09:23', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4f443026-4c8f-4c27-b6b7-20eeefab42a1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"sss\"}', '2022-02-25 17:30:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('51fcee24-aee5-4b55-9c30-f42082e8c61e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-13 08:56:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('52990452-b50e-497c-aa0f-5093214d690b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"22233\"}', '2022-03-10 08:58:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('530ce4a0-d399-49e3-b417-9dfdf2ac4da7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-31 15:29:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('53e1f20a-6c35-48b5-9fca-d5c72f87ca76', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-02-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-08 23:58:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('55419def-5b55-4878-9575-430a9761ac93', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-15 18:38:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('58253f8c-66d5-4eeb-a952-c84841351fe4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"比较满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-23 17:21:10', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('584c592f-0fb5-4246-a57e-9f39e80f97da', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-06 12:03:23', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5d26599c-2dbb-4261-9569-01472b8f525d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-08 14:21:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5dba775b-c261-46ec-bf4c-e3747e2939f8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-17 18:17:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5e8d3723-e5b4-41a3-b088-12266b98c523', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"111222333\"}', '2022-02-14 13:39:41', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5fa2dc0b-a498-4434-9286-690f0df8a914', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-12 10:53:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5fdcfca6-99b5-4477-b9d8-103e9787dc2f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-13 10:04:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('61ca3776-d945-4b44-9242-a73a70b925c4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"qqqq\"}', '2022-02-20 21:11:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('63398fae-9ce4-4818-9103-68c095fc9b6b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-06 21:57:17', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('63c4f091-b740-4995-a4e4-f46183cfcb49', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-16\",\"field1641207457900\":\"哈哈哈哈\",\"field1641207424694\":\"\"}', '2022-06-22 17:26:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('650dc3f2-075b-490b-9382-bd813af0dcd9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":\"111\",\"field1650260638189\":\"111\",\"field1650260647796\":\"111\",\"field1641206608182\":\"111\"}', '2022-06-23 13:50:13', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('67941f5e-7f34-455b-9afd-280ec7f02240', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"请问\"}', '2022-01-22 17:22:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6c8a34fc-f86a-4517-a792-2a941ceb2015', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"sdad\",\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-28 17:07:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6d36b685-e343-4e0f-b17d-ba39d83e3f72', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"111\"}', '2022-01-18 16:07:10', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6e279655-a553-494b-80e9-ac1b14361cab', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-07-07\",\"field1641207457900\":\"1334\",\"field1641207424694\":\"\"}', '2022-07-07 16:52:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('71ccce55-7dd4-4de7-962b-a0625ffaabf7', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-02-03\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-17 21:57:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('73eb6ca6-1159-4c95-a0cd-03789e158dd6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-05 10:33:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('766e2ed2-8de0-4043-bc77-93533e4bb666', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"5\"}', '2022-08-11 09:38:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7835bd2f-46f4-4476-92fc-562343f5222c', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-03\",\"field1641207457900\":\"test\",\"field1641207424694\":\"\"}', '2022-08-07 17:14:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('793a839a-4fb4-45a4-a274-c265529a08d7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"888\"}', '2022-04-06 21:57:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7c2c5dde-1318-4382-848c-215a862bbc14', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-25 09:24:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7cc358fe-d17c-49b0-a32d-4bde5b8d81ba', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-03 15:58:01', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7f7591b8-367e-4128-9e43-ef68e67edb5d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-14 09:20:31', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7fd4ea6c-d4ec-4cbe-a0dd-1ea77992ba88', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-22 17:22:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('814dbafb-dd62-438e-81c9-56e71cf49fa7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-11 21:45:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8245c9b8-a4c9-4db8-96e4-3cc471acbb79', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-10\",\"field1641207457900\":\"C#越学越不会了\",\"field1641207424694\":\"\"}', '2022-06-05 16:40:26', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('84754fa9-d2d0-4ed3-b3f0-90157a0a78c6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-02 14:23:40', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('848437d7-50be-40e7-88b4-de67ec402faa', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-22\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-13 13:25:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8510b8ea-e415-48b7-adbd-c88c39fe8136', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"XIONG GONG\"}', '2022-08-16 09:20:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('87166fa0-cfba-406c-b09e-2d94308a4905', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-02 21:48:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('87a68d22-74e1-498f-88cb-3462904eb0c7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-08 01:46:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8f754069-a619-4eb5-9261-aab4163b9e34', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-16 11:22:32', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('90513c4c-b639-4d0d-8c9d-fb69b77620f8', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-05\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-03 19:06:50', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('90f1525a-062c-4180-9a92-00bc802901c9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意,十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-21 15:24:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('9245c5de-c3d8-45a4-a8a0-a03975f15efc', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-28 20:04:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('956d43cc-c96a-4945-a029-079b0f99508f', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"1999-06-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-20 11:40:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('96348cf2-095e-4a37-8ab4-d0072b780c55', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"1\"}', '2022-04-12 15:11:51', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('9c1226c7-5694-4d52-8d2f-23ae5ade8b92', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"12\",\"field1650260638189\":\"34\",\"field1650260647796\":\"455\",\"field1641206608182\":\"66\"}', '2022-04-28 15:39:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a37c1956-ddc0-457b-8f0a-93cdc44c257d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"没有意见\"}', '2022-01-03 19:05:46', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a507f976-af08-4e7a-9885-9a04a97592df', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-18 14:32:03', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a5c0e586-c7ad-43f4-8629-aa9e1c672c42', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-19\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-21 13:49:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a60cfa8b-cdb0-47f9-9cee-570c3150e055', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-16 08:53:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a7ac9b0d-f866-4db0-b499-59e3d36d8131', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-07-19 16:00:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a8adcb8f-3238-41f3-b3bd-28197a5bc230', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-18 14:13:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a92575b4-9889-42ed-9677-5a648a429970', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-04-26 10:09:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ad25a88c-54c6-4164-8f8a-9d54d6489b42', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-02-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-15 13:35:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ae89f005-a7a2-43cc-9786-99301569f78e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"sdf\",\"field1650260638189\":\"dsf\",\"field1650260647796\":\"sdf\",\"field1641206608182\":\"dsf\"}', '2022-06-15 15:28:11', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ae8f2272-1311-4a2d-a58c-ea2b6fa36578', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"0000\"}', '2022-03-16 15:53:31', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('afe8243d-a936-443f-864c-7b5278f26167', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2018-01-03\",\"field1641207457900\":\"这个低代码会有很多坑  实际用的时候 发现很痛苦\\n小项目会很方便\",\"field1641207424694\":\"\"}', '2022-01-14 15:53:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('b2097447-69bb-454f-809e-d47ad90301d9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-09 21:39:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('b5fab3ae-ec1d-4a51-a9b5-041104b957d8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-09 13:47:41', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('bf26c23b-88ed-404b-98f1-e081c4d92f54', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-07 17:14:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c0dbcff2-b8f6-4c3b-93ec-59ee17dbab6f', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2017-03-24\",\"field1641207457900\":\"支持博主，希望网站越做越完善\",\"field1641207424694\":\"\"}', '2022-05-22 07:46:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c1c56c53-785c-4641-a581-228326dcf491', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-01 10:25:59', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c217f308-55ed-431f-8de3-8a41c197c336', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-18 14:32:43', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c768c884-d674-44be-a003-aae62eeff90c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"3333\"}', '2022-03-18 12:01:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cafcb37f-b6e8-46a1-b786-78a38a76c40b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-19 23:39:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cb7e2576-3b88-48bf-9202-3f77a9f915b5', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-25 22:24:50', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cccc519c-c448-4292-85d1-6a0ac2828fd9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-04\",\"field1641207457900\":\"123456\",\"field1641207424694\":\"\"}', '2022-01-03 19:09:53', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cce9c0a6-8850-43a1-aca9-b7e6321dceef', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-01-16\",\"field1641207457900\":\"科技大道就看见\",\"field1641207424694\":\"\"}', '2022-01-16 16:21:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cde313b5-1fa1-4c43-9765-df1d66f19249', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"111\",\"field1650260638189\":\"222\",\"field1650260647796\":\"333\",\"field1641206608182\":\"44\"}', '2022-05-07 15:33:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ce238aa2-5355-463c-8341-15e08fce098b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"78999\"}', '2022-04-12 18:53:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cfa58a5a-2b94-42a2-8825-acd558983a2b', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-27\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-05-10 01:27:35', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d01d07e6-b8dc-49de-b6a9-9b54333af37a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"444\"}', '2022-03-23 14:43:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d01d544c-d260-4ee9-9929-b18daba2b880', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"456\",\"field1650260638189\":\"456\",\"field1650260647796\":\"456\",\"field1641206608182\":\"456\"}', '2022-06-29 13:21:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d3a90649-7dbe-4f27-ad73-2a201bd2b7fa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-13 13:22:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d7833a92-c0d9-4a90-b70f-375b980258c4', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-01-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-16 17:00:28', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d8c84159-280d-4280-a374-63f4fecc9b8c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-12 07:21:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d9d8dca9-8899-4636-886b-929d91de6cf9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"e\",\"field1650260638189\":\"we\",\"field1650260647796\":\"ew\",\"field1641206608182\":\"we\"}', '2022-05-31 15:45:49', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('da47770c-9067-459b-805c-e7081480c9d4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-09 12:22:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc0319f2-3b02-465e-9c94-d32c19cc83ba', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-01 09:24:58', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc4af657-1e89-4807-baf9-92693aff0762', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意,相当满意,十分满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-02 09:42:43', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc827875-7c48-4092-8299-615e60897dd6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-07 17:13:45', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dd6b3150-808e-4ca9-b936-66b12e88173b', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-03-31\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-26 10:08:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dedb01d1-b168-4ef7-a9f8-e2fc809821d7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,比较满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-22 09:11:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dfd6a79c-5ee7-4362-a7b5-a7ee556dcb4f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"36\"}', '2022-01-14 15:10:33', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e003b80d-a262-49f5-86f5-7a9be8cfebb8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\";ppp\"}', '2022-01-18 22:46:35', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e3eaeafe-19cc-4335-b05a-ba1723532a94', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-15\",\"field1641207457900\":\"3333\",\"field1641207424694\":\"\"}', '2022-06-22 17:25:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e4a9051a-acd6-4c9f-b484-6ade9641b97a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"我的测试\"}', '2022-03-23 09:55:50', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e6e08ec4-5b55-4b3f-8f1f-b399817ddab6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"2323\"}', '2022-03-07 13:02:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e75f8825-5934-4562-9846-a938e105a6aa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-18 11:56:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e894b567-e6e0-4fb9-9eac-6b90557b4c06', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-03-10\",\"field1641207457900\":\"dddd\",\"field1641207424694\":\"\"}', '2022-03-18 20:23:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e8f5cdee-4b67-4191-bb48-0c9968fa49d4', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-13\",\"field1641207457900\":\"432\",\"field1641207424694\":\"\"}', '2022-04-13 09:04:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e913389c-e11a-4675-b8eb-a25c75086e37', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1111\"}', '2022-01-03 19:09:45', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e988f446-00df-4d43-9682-eba419c9f18b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意\",\"field1641205647957\":\"比较满意\",\"field1641206608182\":\"滚滚滚\"}', '2022-01-16 16:17:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ed4863d4-6bf7-4f4c-bd6b-b984881d6dd1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"123\"}', '2022-03-16 14:36:51', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('edfac119-20ec-494f-b92e-b9f340ef7093', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-13 14:49:38', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ef16549c-59b7-425d-b32e-424882eeb92f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"123\"}', '2022-04-01 15:27:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f011feed-4cff-4f9d-a878-a38a8afd539c', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-08-19\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-08-03 15:56:21', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f549faa0-c6e0-431e-a029-a0ba7767386b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"1\"}', '2022-02-16 11:45:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f6cbc763-5cd0-4774-be84-06e7a9872278', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-12 11:32:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f6f2586f-2249-4bca-928f-0b513deab6e2', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-09\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-08-15 13:21:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f8d30ab4-8d7f-42ac-899c-dac1c5f61619', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"34343\"}', '2022-04-14 21:07:46', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fa69e0b6-4bbd-4ac0-a691-cbbb2905f589', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"111\"}', '2022-03-04 16:53:11', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fbb50231-efa5-46c2-a3bb-9ce2279de293', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"e\",\"field1650260638189\":\"qew\",\"field1650260647796\":\"eqw\",\"field1641206608182\":\"qwe\"}', '2022-07-14 14:52:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fced572f-b387-46a4-9afc-c70c4931f3cf', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-08-01 12:47:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fd8d649a-ce7f-4801-89dc-0a7e3556468c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"AAA\",\"field1650260638189\":\"AAA\",\"field1650260647796\":\"AAA\",\"field1641206608182\":null}', '2022-06-12 17:24:32', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fe3cc538-3bf7-4c9c-a6cf-9c96386d17e5', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-02 14:30:57', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ff2b479b-66ca-4ad4-9272-6671d465d9d3', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-23 22:57:26', 3362, '演示帐号', NULL, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of FormDesignOptions
-- ----------------------------
INSERT INTO `FormDesignOptions` VALUES ('0431a578-bfc9-407f-b95e-321c350f10cb', '2021开发语言使用调查', '[{\"id\":5,\"name\":\"多种语言开发\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1640871905593\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":3,\"name\":\"从什么时候开始做开发?\",\"type\":\"date\",\"icon\":\"el-icon-date\",\"value\":null,\"field\":\"field1640871902689\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":2,\"name\":\"说点什么\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641207457900\",\"width\":100,\"readonly\":false,\"required\":false},{\"id\":9,\"name\":\"图片上传\",\"type\":\"img\",\"url\":\"\",\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"icon\":\"el-icon-picture-outline\",\"field\":\"field1641207424694\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1640871905593\":[],\"field1640871902689\":null,\"field1641207457900\":null,\"field1641207424694\":null},\"formOptions\":[[{\"field\":\"field1640871905593\",\"title\":\"多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1640871905593\",\"title\":\"多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]', NULL, '[]', '2021-12-29 23:39:22', 1, '超级管理员', '超级管理员', '2022-08-03 15:58:37', 1);
INSERT INTO `FormDesignOptions` VALUES ('8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', '2021双减政策调查', '[{\"id\":5,\"name\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1641205615398\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":6,\"name\":\"您认为放学后作业对孩子的负担怎样?\",\"values\":[\"非常满意\"],\"type\":\"checkbox\",\"key\":\"满意度\",\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"icon\":\"el-icon-circle-check\",\"field\":\"field1641206170991\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":5,\"name\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"key\":\"满意度\",\"field\":\"field1641205647957\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"非常满意\"]},{\"id\":2,\"name\":\"其他意见\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641206608182\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1641205615398\":[],\"field1641206170991\":[],\"field1641205647957\":[],\"field1641206608182\":null},\"formOptions\":[[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]', NULL, '[]', '2021-12-30 21:45:16', 1, '超级管理员', '超级管理员', '2022-08-03 15:57:54', 1);

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
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\ntextField: \'Enable\',\n containField: null,\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', '1', NULL, '是否值', 'enable', 1, '超级管理员', '2022-08-03 15:59:01', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\n textField: \'Success\', \n containField: null,\n handler: null }\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '测试超级管理员', '2018-06-12 10:21:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\n textField: \'LogType\', \n containField: null,\n handler: null }\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, 1, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\n textField: \'RoleName\', \n containField: [\'Role_Id\',\'RoleName\'],\n handler: null }\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\n', '角色列表', 'roles', 1, '测试超级管理员', '2018-07-13 15:03:53', 1, 123, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (35, '{\n valueField: \'AuditStatus\',\n textField: \'AuditStatus\',\n  containField:null \n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (36, '{\n valueField: \'Variety\',\n textField: \'Variety\',\n  containField:null \n}', '2018-07-10 14:06:12', 1, '测试超级管理员', NULL, NULL, '分类', 'pz', 1, '超级管理员', '2022-03-26 02:18:40', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (37, '{\n valueField: \'AgeRange\',\n textField: \'AgeRange\',\n  containField:null \n}', '2018-07-10 14:07:46', NULL, '测试超级管理员', NULL, NULL, '值范围', 'age', 1, '超级管理员', '2022-03-26 02:18:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\n valueField: \'City\',\n textField: \'City\',\n  containField:null \n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '测试超级管理员', '2018-07-16 17:03:50', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (44, '{\n valueField: \'NewsType\',\n textField: \'NewsType\',\n  containField:null \n}', '2018-07-10 16:15:59', 1, '测试超级管理员', NULL, NULL, '新闻类型', 'news', 1, '超级管理员', '2022-06-27 13:46:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (45, '{\n valueField: \'Expire\',\n textField: \'Expire\',\n  containField:null \n}', '2018-07-10 16:38:40', 1, '测试超级管理员', NULL, NULL, '是否过期', 'expire', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\n valueField: \'ProvinceName\',\n textField: \'ProvinceName\',\n  containField:null \n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '测试超级管理员', '2018-07-23 15:23:21', 1, NULL, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (48, '{\n valueField: \'ClassifyId\',\n textField: \'ClassifyTitle\',\n  containField:null \n}', '2018-07-18 10:16:22', NULL, '测试超级管理员', NULL, NULL, '是否买入', 'nav', 1, '超级管理员', '2019-09-18 18:09:42', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (49, '{\n valueField: \'Gender\',\n textField: \'Gender\',\n  containField:null \n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\n valueField: \'Enable\',\n textField: \'Enable\',\n  containField:null \n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (52, '{\n valueField: \'Choiceness\',\n textField: \'Choiceness\',\n  containField:null \n}', '2018-07-24 15:45:47', 1, '测试超级管理员', NULL, NULL, '是否买入', 'cq', 1, '超级管理员', '2022-03-26 23:07:16', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (59, '{\n valueField: \'IsRegregisterPhone\',\n textField: \'IsRegregisterPhone\',\n  containField:null \n}', '2018-08-29 15:54:21', 1, '测试超级管理员', NULL, NULL, 'test', 'isphone', 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (62, '{\n valueField: \'IsTop\',\n textField: \'IsTop\',\n  containField:null \n}', '2019-08-20 09:57:54', 1, '超级管理员', NULL, NULL, 'test1', 'top', 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, 1, 'dddd');
INSERT INTO `Sys_Dictionary` VALUES (64, NULL, '2019-09-18 19:25:47', 1, '超级管理员', NULL, NULL, '订单类型', 'ordertype', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (65, NULL, '2019-09-19 10:07:23', 1, '超级管理员', NULL, NULL, '商品名称', 'pn', 1, '超级管理员', '2022-07-12 10:55:23', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (66, NULL, '2020-05-08 09:42:50', 1, '超级管理员', NULL, NULL, 'dr', 'dr', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (67, NULL, '2020-05-30 19:48:29', 1, '超级管理员', NULL, NULL, '获取所有角色Table显示用', 't_roles', 1, '超级管理员', '2020-05-30 19:48:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (69, NULL, '2020-09-18 23:13:42', 1, '超级管理员', NULL, NULL, '11', 'test111', 1, '超级管理员', '2022-06-16 11:00:09', 1, 1, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (70, NULL, '2020-11-02 19:18:08', 1, '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS `key`,RoleName AS `value` FROM Sys_Role', '级联角色', 'tree_roles', 1, '超级管理员', '2021-02-28 14:35:35', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (75, NULL, '2022-01-03 19:31:24', 1, '超级管理员', NULL, NULL, '满意度', '满意度', 1, '超级管理员', '2022-03-26 23:07:19', 1, NULL, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2022-08-03 15:59:01', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2022-08-03 15:59:01', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '0', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核未通过', '2', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (40, '2018-07-10 14:06:13', 1, '测试超级管理员', '数码相框', '数码相框', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (41, '2018-07-10 14:06:13', 1, '测试超级管理员', '影棚器材', '影棚器材', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (42, '2018-07-10 14:06:13', 1, '测试超级管理员', '户外器材', '户外器材', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (44, '2018-07-10 14:06:13', 1, '测试超级管理员', '运动相机', '运动相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (45, '2018-07-10 14:06:13', 1, '测试超级管理员', '微单相机', '微单相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (46, '2018-07-10 14:06:13', 1, '测试超级管理员', '单反相机', '单反相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (47, '2018-07-10 14:07:46', 1, '测试超级管理员', '50-60', '50-60', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (48, '2018-07-10 14:07:46', 1, '测试超级管理员', '40-50', '40-50', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (49, '2018-07-10 14:07:46', 1, '测试超级管理员', '30-40', '30-40', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (50, '2018-07-10 14:07:46', 1, '测试超级管理员', '20-30', '20-30', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (51, '2018-07-10 14:07:46', 1, '测试超级管理员', '10-20', '10-20', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (64, '2018-07-10 16:15:59', 1, '测试超级管理员', '更新日志', '1', 44, 0, '超级管理员', '2022-04-20 01:31:15', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (65, '2018-07-10 16:15:59', 1, '测试超级管理员', '其他信息', '2', 44, 0, '超级管理员', '2022-04-20 01:31:15', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (66, '2018-07-10 16:38:40', 1, '测试超级管理员', '否', '0', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (67, '2018-07-10 16:38:40', 1, '测试超级管理员', '是', '1', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (77, '2018-07-18 10:16:22', 1, '测试超级管理员', '现金', '1', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 120, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (78, '2018-07-18 10:16:23', 1, '测试超级管理员', '赊账', '2', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (79, '2018-07-18 10:16:23', 1, '测试超级管理员', '抵扣', '3', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (101, '2018-07-24 15:45:47', 1, '测试超级管理员', '否', '0', 52, 0, '超级管理员', '2022-03-26 23:07:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (102, '2018-07-24 15:45:47', 1, '测试超级管理员', '是', '1', 52, 0, '超级管理员', '2022-03-26 23:07:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (128, '2018-08-29 15:54:21', 1, '测试超级管理员', '是', '1', 59, 0, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (129, '2018-08-29 15:54:21', 1, '测试超级管理员', '否', '0', 59, 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (130, '2018-09-04 16:13:47', 1, '测试超级管理员', '数码相机', '数码相机', 36, 1, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (142, '2019-08-20 09:57:54', 1, '超级管理员', '是', '1', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '1');
INSERT INTO `Sys_DictionaryList` VALUES (143, '2019-08-20 09:57:54', 1, '超级管理员', '否', '0', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '测试');
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (149, '2019-09-18 19:25:47', 1, '超级管理员', '发货', '1', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (150, '2019-09-18 19:25:47', 1, '超级管理员', '退货', '2', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (151, '2019-09-18 19:25:47', 1, '超级管理员', '返单', '3', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (152, '2019-09-19 10:07:23', 1, '超级管理员', '二手', '二手', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (153, '2019-09-19 10:07:23', 1, '超级管理员', '潮流', '潮流', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, 4, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (154, '2019-09-19 10:07:23', 1, '超级管理员', '家电', '家电', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, 6, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (155, '2019-09-19 10:07:23', 1, '超级管理员', '食品', '食品', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (156, '2019-10-11 10:41:32', 1, '超级管理员', '登陆已过期', 'ApiAuthorize', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (157, '2020-05-08 09:42:50', 1, '超级管理员', '否', '0', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (158, '2020-05-08 09:42:50', 1, '超级管理员', '是', '1', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (161, '2020-09-11 23:10:50', 1, '超级管理员', '审核', 'Audit', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (162, '2020-09-11 23:10:50', 1, '超级管理员', '打印', 'Print', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (164, '2020-09-11 23:12:54', 1, '超级管理员', '开启权限', 'Open', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (165, '2020-09-11 23:12:54', 1, '超级管理员', '其他', 'Other', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (168, '2020-11-05 10:28:22', 1, '超级管理员', 'Info', '3', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (171, '2021-08-16 14:00:45', 1, '超级管理员', '3', '3', 69, 0, '超级管理员', '2021-10-15 16:27:27', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (175, '2022-01-03 19:31:25', 1, '超级管理员', '非常满意', '非常满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (176, '2022-01-03 19:31:25', 1, '超级管理员', '十分满意', '十分满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (177, '2022-01-03 19:31:25', 1, '超级管理员', '相当满意', '相当满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (178, '2022-01-03 19:31:25', 1, '超级管理员', '比较满意', '比较满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Log`;
CREATE TABLE `Sys_Log`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BeginDate` datetime(0) NULL DEFAULT NULL,
  `BrowserType` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_BeginDate`(`BeginDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `MenuType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO `Sys_Menu` VALUES (2, '用户信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-user-solid', NULL, 1, 1600, '.', 0, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2021-08-02 02:59:11', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2021-05-02 15:55:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-info', NULL, 1, 1300, 'xxx', 0, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2021-08-02 03:00:14', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 11110, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2021-05-02 15:56:46', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (10, '表单与上传下载', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 28, '/formUpload', NULL, NULL, '2019-12-07 11:16:47', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (11, 'api加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, 'table2', 12, '/table2', NULL, NULL, '2019-11-14 00:11:17', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (16, '首页轮播图片', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 2000, 'App_HomeHeadImages', 15, '/App_HomeHeadImages/Manager', NULL, NULL, '2019-08-12 16:26:44', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (24, '后台加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 750, '/', 56, '/table', NULL, NULL, '2021-07-25 12:26:52', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (25, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1100, '/', 29, '/form6', NULL, NULL, '2019-09-22 23:27:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (26, '文件上传', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'volUploadExample', 28, '/volUploadExample', NULL, NULL, '2019-12-17 18:29:50', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (27, 'table编辑(一)', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'vtable', 12, '/table1', NULL, NULL, '2021-03-20 15:20:43', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (30, '图表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100000, 'App_PriceTendency', 34, '/chart', NULL, NULL, '2019-11-14 00:07:26', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (31, '图表+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 950, 'App_Comment', 34, '/formChart', NULL, NULL, '2019-11-14 00:07:51', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (33, '完整table+forms', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 800, 'tableForms', 12, '/tableForms', NULL, NULL, '2021-08-03 09:51:26', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (35, '可编辑的table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 730, 'editTable', 56, '/editTable', NULL, NULL, '2021-07-25 12:26:55', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (36, '表单一对多table', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 950, 'App_TransactionAvgPrice1', 32, '/multi1', NULL, NULL, '2019-11-14 00:03:19', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (37, '表单+图表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_Transaction', 32, '/multi3', NULL, NULL, '2019-11-14 00:04:17', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (42, '主从表单明细一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'SellOrder1', 32, '/multi4', NULL, NULL, '2021-08-03 09:51:10', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (45, '不用节点放此处', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2022-08-19 16:30:43', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (49, '基础只读表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 1000, 'App_Appointment', 48, '/App_Appointment', '2019-07-12 13:28:17', '超级管理员', '2022-03-26 01:33:01', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (50, '自动绑定下拉框', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 900, 'App_TransactionAvgPrice', 48, '/App_TransactionAvgPrice', '2019-07-12 13:53:32', '超级管理员', '2020-12-27 13:34:36', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (51, '主从一对多弹出框(4)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_ReportPrice', 74, '/App_ReportPrice', '2019-07-12 13:55:21', '超级管理员', '2021-03-14 23:53:29', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (52, '导入导出表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'App_Transaction', 48, '/App_Transaction', '2019-07-12 13:56:15', '超级管理员', '2019-10-31 13:23:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (57, '单列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 56, '/form1', '2019-07-12 14:01:12', '超级管理员', '2019-09-20 13:59:00', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (58, '两列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 900, '两列表单', 56, '/form2', '2019-07-12 14:01:43', '超级管理员', '2019-09-20 13:59:03', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (59, '多列表单自动数据源', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 800, '多列表单', 56, '/form3', '2019-07-12 14:02:17', '超级管理员', '2019-12-17 11:08:06', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (60, 'Table+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 700, 'Table+表单', 56, '/form4', '2019-07-12 14:03:14', '超级管理员', '2019-09-20 13:59:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (61, '系统设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-setting', NULL, 1, 1350, '系统', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2021-08-02 02:59:47', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'Sys_Menu', 61, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2019-10-31 13:23:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (63, '下拉框绑定设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 10, 'Sys_Dictionary', 61, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2019-08-16 17:41:15', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (64, '代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-position', NULL, 1, 1500, '代码在线生成器', 0, '/coding', '2019-07-12 14:07:55', '超级管理员', '2021-08-02 02:59:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (65, '代码生成器', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2021-05-18 09:50:56', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (67, '静态页面发布', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 10, 'App_News', 66, '/App_News', '2019-07-12 14:14:16', '超级管理员', '2019-12-22 00:40:46', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (68, '多弹出框上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 700, 'App_Expert', 48, '/App_Expert', '2019-07-12 14:24:15', '超级管理员', '2021-08-03 09:49:40', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (69, '前端自定义扩展', '', '', NULL, 0, 500, '前端自定义扩展', 48, '/coding', '2019-07-12 14:26:25', '超级管理员', '2019-09-25 17:22:22', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (70, '编辑器表格换行', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 400, 'App_NewsEditor', 48, '/App_NewsEditor', '2019-07-12 14:28:45', '超级管理员', '2021-08-03 09:50:03', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (71, '权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, 'Sys_Role2', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2020-12-21 23:27:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (73, '移动端H5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, NULL, '/', 72, '/app/guide', '2019-08-14 13:16:55', '超级管理员', '2021-05-05 15:21:18', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (75, '主从一对一(1)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1000, 'SellOrder', 74, '/SellOrder', '2019-08-22 18:12:43', '超级管理员', '2021-03-14 23:52:28', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (77, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, '表单只读', 56, '/form7', '2019-08-26 11:58:55', '超级管理员', '2019-09-20 13:59:13', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (78, '混合表单一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 900, '32', 32, '/multi2', '2019-10-12 09:18:41', '超级管理员', '2019-11-14 00:03:51', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (79, 'wangEditor编辑器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, 'WangEditor编辑器', 66, '/kindEditor', '2019-12-22 00:36:10', '超级管理员', '2021-09-05 21:50:33', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (80, '静态页面列表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'htmlList', 66, '/htmlList', '2019-12-22 00:36:54', '超级管理员', '2019-12-21 22:50:41', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (81, '后台参数校验', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 41, '/validator', '2020-02-02 20:01:59', '超级管理员', '2020-02-02 20:01:16', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (82, '数字排版', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'flex', 34, '/flex', '2020-04-07 23:55:33', '超级管理员', '2019-11-15 14:32:56', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (83, '从表图片上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'vSellorderImg', 74, '/vSellorderImg', '2020-04-07 23:56:22', '超级管理员', '2020-04-07 23:56:28', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (85, 'tree与代码生成页面', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 100, 'treetable1', 84, '/treetable1', '2020-04-26 20:20:28', '超级管理员', '2019-11-15 14:32:32', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (86, 'tree自定义table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, 'treetable2', 84, '/treetable2', '2020-04-26 20:20:57', '超级管理员', '2020-04-26 20:21:34', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (89, '流程管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-s-operation', NULL, 1, 1765, '.', 0, '', '2020-11-29 16:49:27', '超级管理员', '2022-07-25 03:04:30', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (90, '审批流程', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 2000, 'Sys_WorkFlow', 89, '/Sys_WorkFlow', '2020-11-29 16:49:42', '超级管理员', '2022-08-15 04:33:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (91, '多列合并显示', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, '/App_Expert', 48, '/App_Expert2', '2021-03-06 17:47:23', '超级管理员', '2021-02-28 22:18:37', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (92, '主从一对一(2)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 890, 'SellOrder2', 74, '/SellOrder2', '2021-03-14 23:52:46', '超级管理员', '2021-03-14 23:52:54', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (93, '主从一对一(3)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 880, 'SellOrder3', 74, '/SellOrder3', '2021-03-14 23:53:50', '超级管理员', '2021-03-14 23:52:54', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (94, '在线表格编辑', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'App_Transaction2', 48, '/App_Transaction2', '2021-03-20 15:19:14', '超级管理员', '2021-02-28 22:18:37', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (95, 'table编辑(二)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 1040, 'table3', 12, '/table3', '2021-03-20 15:21:05', '超级管理员', '2021-03-20 15:21:07', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (96, 'treetable', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'treetable3', 84, 'treetable3', '2021-05-02 15:54:23', '超级管理员', '2019-11-15 14:32:32', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (97, '角色管理(tree)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 15:56:15', '超级管理员', '2021-05-02 18:29:18', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (98, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-news', NULL, 1, 3000, '.', 0, '', '2021-08-30 02:48:10', '超级管理员', '2022-03-27 02:14:48', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (99, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 98, '/formDraggable', '2021-08-30 02:48:34', '超级管理员', '2022-03-27 02:15:01', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (100, '明细表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 0, 'SellOrderList', 74, '', '2021-09-27 00:47:23', '超级管理员', '2021-03-14 23:52:28', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (101, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'FormDesignOptions', 98, '/FormDesignOptions', '2022-01-03 19:32:02', '超级管理员', '2022-03-27 03:02:12', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (102, '数据收集', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'formCollectionResultTree', 98, '/formCollectionResultTree', '2022-01-03 19:33:09', '超级管理员', '2022-01-10 10:28:14', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (103, '多页签', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 105, '/tabsTable', '2022-01-08 17:14:01', '超级管理员', '2022-01-08 18:06:44', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (104, '多表头', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, '.', 105, '/App_Appointment2', '2022-01-08 17:14:44', '超级管理员', '2022-01-08 18:06:49', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (106, '数据收集(表数据)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'FormCollectionObject', 98, '/FormCollectionObject', '2022-01-10 10:28:31', '超级管理员', '2022-01-10 10:28:34', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (108, '只读页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, 'App_Appointment', 107, 'pages/order/App_Appointment/App_Appointment', '2022-03-26 00:59:36', '超级管理员', '2022-03-27 09:00:19', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (109, '水平显示', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 107, '/pages/order/App_Appointment1/App_Appointment1', '2022-03-26 01:00:38', '超级管理员', '2022-03-26 01:10:16', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (111, '数据源绑定', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'App_TransactionAvgPrice', 110, 'pages/appmanager/App_TransactionAvgPrice/App_TransactionAvgPrice', '2022-03-26 02:04:58', '超级管理员', '2022-03-27 09:00:13', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (113, '事件绑定', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'App_Transaction', 112, '/pages/appmanager/App_Transaction/App_Transaction', '2022-03-26 03:09:17', '超级管理员', '2022-03-27 09:00:09', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (114, '格式化', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, '.', 112, '/pages/appmanager/App_Transaction1/App_Transaction1', '2022-03-26 03:09:45', '超级管理员', '2022-03-26 22:39:35', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (116, '主表1对1', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'SellOrder', 115, '/pages/order/SellOrder/SellOrder', '2022-03-26 03:11:13', '超级管理员', '2022-03-26 23:29:38', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (118, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, '.', 117, '/pages/form/form2', '2022-03-26 03:12:39', '超级管理员', '2022-03-27 08:59:33', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (119, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 117, 'pages/form/form1', '2022-03-26 03:12:52', '超级管理员', '2022-03-27 08:59:28', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (121, '列表显示table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 120, 'pages/table/table2/table2', '2022-03-26 03:13:47', '超级管理员', '2022-03-27 02:43:58', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (122, '表格显示table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'App_Expert', 120, '/pages/table/table1/table1', '2022-03-26 03:13:59', '超级管理员', '2022-03-27 02:44:00', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (124, '生成页面扩展组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 123, 'pages/pagedemo/pagedemo', '2022-03-26 03:16:51', '超级管理员', '2022-03-27 09:04:15', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (125, '手动绑定数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 120, 'pages/table/table3/table3', '2022-03-27 03:02:06', '超级管理员', '2022-03-27 02:15:29', NULL, 1);
INSERT INTO `Sys_Menu` VALUES (126, '消息推送', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-chat-line-round', NULL, 1, 2900, '.', 0, '/signalR', '2022-05-04 12:00:00', '超级管理员', '2022-05-05 15:31:04', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (127, '我的任务', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 1500, 'Sys_WorkFlowTable', 89, '/Sys_WorkFlowTable', '2022-08-15 04:33:28', '超级管理员', '2022-08-15 04:33:39', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (128, '发起流程', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '发起流程', 89, '/flowdemo', '2022-08-15 04:33:54', '超级管理员', '2022-08-15 04:34:33', '超级管理员', 0);

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
-- Table structure for Sys_QuartzLog
-- ----------------------------
DROP TABLE IF EXISTS `Sys_QuartzLog`;
CREATE TABLE `Sys_QuartzLog`  (
  `LogId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TaskName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ElapsedTime` int(11) NULL DEFAULT NULL,
  `StratDate` datetime(0) NULL DEFAULT NULL,
  `EndDate` datetime(0) NULL DEFAULT NULL,
  `Result` int(11) NULL DEFAULT NULL,
  `ResponseContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ErrorMsg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`LogId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_QuartzLog
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_QuartzOptions
-- ----------------------------
DROP TABLE IF EXISTS `Sys_QuartzOptions`;
CREATE TABLE `Sys_QuartzOptions`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TaskName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GroupName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CronExpression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ApiUrl` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AuthKey` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AuthValue` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LastRunTime` datetime(0) NULL DEFAULT NULL,
  `Status` int(11) NULL DEFAULT NULL,
  `Describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PostData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TimeOut` int(11) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_QuartzOptions
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `Sys_Role` VALUES (12, '2022-03-23 09:47:00', '超级管理员', NULL, NULL, NULL, 1, '', NULL, NULL, 2, '测试角色');

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
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `Sys_RoleAuth` VALUES (203, 'Search,Import,Export,Upload', '2020-05-05 12:05:34', '超级管理员', 49, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
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
INSERT INTO `Sys_RoleAuth` VALUES (215, 'Search,Add,Delete,Update,Export', '2020-11-29 16:52:52', '超级管理员', 90, '超级管理员', '2022-07-25 03:10:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (216, 'Search,Add,Delete,Update,Import,Export,Upload', '2021-01-16 12:01:58', '超级管理员', 70, '超级管理员', '2021-01-16 12:01:58', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (217, 'Search,Add,Delete,Update,Import,Export', '2021-03-06 17:47:32', '超级管理员', 91, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (218, 'Search,Add,Delete,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 92, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (219, 'Search,Add,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 93, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (220, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 95, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (221, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 94, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (222, 'Search', '2021-05-02 15:57:11', '超级管理员', 96, '超级管理员', '2021-05-02 15:57:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (223, 'Search', '2021-05-02 15:57:11', '超级管理员', 97, '超级管理员', '2021-05-02 15:57:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (224, 'Export', '2021-05-05 15:25:06', '超级管理员', 68, '超级管理员', '2021-05-05 15:25:06', 6, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (225, 'Search', '2021-08-30 02:51:00', '超级管理员', 98, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (226, 'Search', '2021-08-30 02:51:00', '超级管理员', 99, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (227, 'Search', '2021-09-27 00:47:34', '超级管理员', 100, '超级管理员', '2021-09-27 00:47:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (228, 'Search', '2022-01-08 17:16:55', '超级管理员', 103, '超级管理员', '2022-01-08 17:16:55', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (229, 'Search,Add,Delete,Update', '2022-01-08 17:16:55', '超级管理员', 104, '超级管理员', '2022-01-08 17:16:55', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (230, 'Search', '2022-01-08 18:07:11', '超级管理员', 105, '超级管理员', '2022-01-08 18:07:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (231, 'Search,Add,Delete,Export', '2022-01-08 18:07:11', '超级管理员', 101, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (232, 'Search,Export', '2022-01-08 18:07:11', '超级管理员', 102, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (233, 'Search,Export', '2022-01-10 10:30:29', '超级管理员', 106, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (234, 'Search', '2022-03-26 03:22:47', '超级管理员', 108, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (235, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 111, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (236, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 114, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (237, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 113, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (238, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 116, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (239, 'Search', '2022-03-26 03:22:47', '超级管理员', 119, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (240, 'Search', '2022-03-26 03:22:47', '超级管理员', 118, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (241, 'Search', '2022-03-26 03:22:47', '超级管理员', 109, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (242, 'Search', '2022-03-26 03:22:47', '超级管理员', 122, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (243, 'Search', '2022-03-26 03:22:47', '超级管理员', 124, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (244, 'Search', '2022-03-26 03:22:47', '超级管理员', 120, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (245, 'Search', '2022-03-26 03:22:47', '超级管理员', 117, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (246, 'Search', '2022-03-26 03:22:47', '超级管理员', 123, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (247, 'Search', '2022-03-26 03:22:47', '超级管理员', 115, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (248, 'Search', '2022-03-26 03:22:47', '超级管理员', 112, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (249, 'Search', '2022-03-26 03:22:47', '超级管理员', 110, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (250, 'Search', '2022-03-26 03:22:47', '超级管理员', 121, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (251, 'Search', '2022-03-26 03:22:47', '超级管理员', 107, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (252, 'Search', '2022-03-27 02:39:28', '超级管理员', 107, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (253, 'Search', '2022-03-27 02:39:28', '超级管理员', 110, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (254, 'Search', '2022-03-27 02:39:28', '超级管理员', 112, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (255, 'Search', '2022-03-27 02:39:28', '超级管理员', 115, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (256, 'Search', '2022-03-27 02:39:28', '超级管理员', 123, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (257, 'Search', '2022-03-27 02:39:28', '超级管理员', 117, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (258, 'Search', '2022-03-27 02:39:28', '超级管理员', 124, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (259, 'Search', '2022-03-27 02:39:28', '超级管理员', 118, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (260, 'Search', '2022-03-27 02:39:28', '超级管理员', 119, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (261, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 116, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (262, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 113, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (263, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 114, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (264, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 111, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (265, 'Search', '2022-03-27 02:39:28', '超级管理员', 108, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (266, 'Search', '2022-03-27 02:39:28', '超级管理员', 109, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (267, 'Search', '2022-03-27 03:02:19', '超级管理员', 125, '超级管理员', '2022-03-27 03:02:19', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (268, 'Search', '2022-05-04 14:45:36', '超级管理员', 126, '超级管理员', '2022-05-04 14:45:36', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (269, 'Search,Export', '2022-08-15 05:02:56', '超级管理员', 127, '超级管理员', '2022-08-15 05:02:56', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (270, 'Search', '2022-08-15 05:02:56', '超级管理员', 128, '超级管理员', '2022-08-15 05:02:56', 2, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 865 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1420, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'tree_roles', NULL, 1, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1410, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1400, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1390, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1380, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1370, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1360, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1350, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1340, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1330, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1320, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1375, '', NULL, 1, 'select', 0, 'Sys_Role', 2);
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
INSERT INTO `Sys_TableColumn` VALUES (429, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2021-04-12 23:04:26', 1, 7760, '', NULL, 3, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (431, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 500, '超级管理员', '2021-04-12 23:04:26', 1, 7810, '', NULL, 2, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (506, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 100, '', NULL, NULL, NULL, 'gender', NULL, 4, 'drop', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7843, '', NULL, 1, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (654, NULL, NULL, NULL, NULL, '登陆设备类型', 'AppType', 'int', 150, '', NULL, NULL, NULL, 'ut', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7809, '', NULL, 3, 'dropList', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (659, NULL, NULL, NULL, NULL, '是否手机用户', 'IsRegregisterPhone', 'int', 120, '', NULL, NULL, NULL, 'isphone', NULL, 2, 'drop', NULL, 1, 0, NULL, NULL, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7771, '', NULL, 3, 'drop', 0, 'Sys_User', 6);
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
INSERT INTO `Sys_TableColumn` VALUES (801, NULL, NULL, NULL, NULL, '', 'WorkFlow_Id', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (802, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, 'like', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (803, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, '', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (804, NULL, NULL, NULL, NULL, '功能菜单', 'WorkTableName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (805, NULL, NULL, NULL, NULL, '节点信息', 'NodeConfig', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (806, NULL, NULL, NULL, NULL, '连接配置', 'LineConfig', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (807, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (808, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (809, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (810, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (811, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (812, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (813, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (814, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (815, NULL, NULL, NULL, NULL, '', 'WorkStepFlow_Id', 'string', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:38:35', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (816, NULL, NULL, NULL, NULL, '流程主表id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:38:35', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (817, NULL, NULL, NULL, NULL, '流程节点Id', 'StepId', 'string', 120, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2022-08-17 23:38:35', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (818, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 180, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:38:35', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (819, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批,3=按部门审批)', 'StepType', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (820, NULL, NULL, NULL, NULL, '审批用户id或角色id、部门id', 'StepValue', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (821, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (822, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 220, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:38:35', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (823, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (824, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (825, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:38:35', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (826, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (827, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:38:35', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (828, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (829, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (830, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'string', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:40:13', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (831, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:40:13', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (832, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 180, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1150, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (833, NULL, NULL, NULL, NULL, '表主键id', 'WorkTableKey', 'string', 180, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (834, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 120, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1050, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (835, NULL, NULL, NULL, NULL, '业务名称', 'WorkTableName', 'string', 120, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1000, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (836, NULL, NULL, NULL, NULL, '当前审批节点', 'CurrentOrderId', 'int', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (837, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 900, NULL, NULL, 1, 'select', 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (838, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (839, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (840, NULL, NULL, NULL, NULL, '创建时间', 'Creator', 'string', 130, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:40:13', 1, 750, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (841, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (842, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:40:13', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (843, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (844, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (845, NULL, NULL, NULL, NULL, '', 'Sys_WorkFlowTableStep_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1500, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (846, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:22:24', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (847, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (848, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:22:24', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (849, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (850, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (851, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:22:24', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (852, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (853, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (854, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-08-17 23:22:24', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (855, NULL, NULL, NULL, NULL, '审核人id', 'AuditId', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (856, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (857, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批,3=按部门审批 )', 'StepValue', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (858, NULL, NULL, NULL, NULL, '审批类型', 'StepType', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (859, NULL, NULL, NULL, NULL, '节名称', 'StepName', 'string', 180, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:22:24', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (860, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2022-08-17 23:22:24', 1, 1350, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (861, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1400, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (862, NULL, NULL, NULL, NULL, '主表id', 'WorkFlowTable_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1450, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (863, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (864, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);

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
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, 1, 'RoleName', 'System', 'VOL.System', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, 1, 'DicName', 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_Dictionary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'System', 'VOL.System', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户基础信息', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 200, 0, NULL, NULL, '无', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '170', '日志管理', '日志管理', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (11, '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '250', '配置管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (83, '表单设计', '表单设计', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, NULL, '表单设计', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (84, '表单设计', '表单设计', NULL, NULL, NULL, '', NULL, 1, 'Title', 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormDesignOptions', 'FormDesignOptions', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (85, '数据采集', '数据采集', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormCollectionObject', 'FormCollectionObject', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (87, '审批流程', '审批流程', NULL, NULL, NULL, NULL, NULL, 1, NULL, '审批流程', 'VOL.System', NULL, 0, NULL, NULL, '审批流程', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (88, '审批流程配置', '审批流程配置', NULL, NULL, '审批步骤', 'Sys_WorkFlowStep', NULL, 1, 'WorkName', 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlow', 'Sys_WorkFlow', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (89, '审批节点配置', '审批节点配置', NULL, NULL, '', NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowStep', 'Sys_WorkFlowStep', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (90, '审批流程', '审批流程', NULL, NULL, '审批节点', 'Sys_WorkFlowTableStep', NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowTable', 'Sys_WorkFlowTable', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (91, '审批节点', '审批节点', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowTableStep', 'Sys_WorkFlowTableStep', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3380 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, '北京市西城区', 0, '2019-08-18 00:54:06', 1, '超级管理员', '2012-06-10 11:10:03', NULL, NULL, NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202006191408112343/1111s.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:13:49', NULL, '超级管理员', '2020-06-19 14:08:12', 1, 0, 1, '超级管理员', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTY2NzY2NjA4OSIsIm5iZiI6IjE2Njc2NjYwODkiLCJleHAiOiIxNjY3NjczMjg5IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.YNJMmbtmwkVSOEOHGVZquZqvOnhDQkqJkRlM2Sx-o2g');
INSERT INTO `Sys_User` VALUES (3362, '北京市还没注册', NULL, '2019-08-18 00:54:06', 1, '超级管理员', '2019-08-13 14:24:27', NULL, NULL, NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004241341311851/04.jpg', 0, NULL, '2019-09-22 23:12:33', '01012345678', '超级管理员', '2021-01-27 12:53:41', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', '演示帐号', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTY2MDg5NTY1MiIsIm5iZiI6IjE2NjA4OTU2NTIiLCJleHAiOiIxNjYzNDg3NjUyIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.h2-MxpKITk_YN7wkQMNQgZok_ioP5o-bY_PR0MPbT9U');
INSERT INTO `Sys_User` VALUES (3378, NULL, NULL, NULL, NULL, NULL, '2021-09-27 15:50:22', 1, '超级管理员', NULL, NULL, NULL, 0, 0, 'Upload/Tables/Sys_User/202109271550212214/12313.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '小编', NULL, NULL, NULL, 'Admin888', 'al7ulHECMmQ_i6lA3dPKlg==', 'Admin888', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzc4IiwiaWF0IjoiMTY0NTQxODQ0NyIsIm5iZiI6IjE2NDU0MTg0NDciLCJleHAiOiIxNjQ1NDI1NjQ3IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.mbKyMF6dQMZEmOjnRy8MZwXjz3jsm2DsejSrkFWD3B4');

-- ----------------------------
-- Table structure for Sys_WorkFlow
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlow`;
CREATE TABLE `Sys_WorkFlow`  (
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能菜单',
  `NodeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '节点信息',
  `LineConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '连接配置',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL COMMENT '是否启用',
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkFlow_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_WorkFlow
-- ----------------------------
INSERT INTO `Sys_WorkFlow` VALUES ('c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', 'SellOrder', '销售订单', '[{\"id\":\"1659276275052\",\"name\":\"流程-节点A\",\"type\":\"task\",\"left\":\"230px\",\"top\":\"15px\",\"ico\":\"el-icon-user-solid\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"1659276282115\",\"name\":\"流程-节点B\",\"type\":\"task\",\"left\":\"228px\",\"top\":\"127px\",\"ico\":\"el-icon-goods\",\"nodeType\":\"1\",\"userId\":3362,\"roleId\":null},{\"id\":\"l0om4eidz\",\"name\":\"流程-节点C\",\"type\":\"timer\",\"left\":\"226px\",\"top\":\"243.25px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"nodeType\":\"1\",\"userId\":3378,\"roleId\":null}]', '[{\"from\":\"1659276275052\",\"to\":\"1659276282115\"},{\"from\":\"1659276282115\",\"to\":\"l0om4eidz\"}]', '订单流程测试', '2022-08-15 05:00:03', 1, '超级管理员', 0, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlow` VALUES ('d3445da2-043f-4c8b-943a-0c8a8f92d4b5', '流程测试', 'App_Expert', '启用图片支持', '[{\"id\":\"1659276275052\",\"name\":\"流程C-节点A\",\"type\":\"task\",\"left\":\"46px\",\"top\":\"28px\",\"ico\":\"el-icon-user-solid\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"1659276282115\",\"name\":\"流程C-节点B\",\"type\":\"task\",\"left\":\"61px\",\"top\":\"195px\",\"ico\":\"el-icon-goods\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"txpo1vyv8u\",\"name\":\"添加节点\",\"type\":\"timer\",\"left\":\"266px\",\"top\":\"99px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":3362,\"roleId\":null,\"deptId\":null},{\"id\":\"yshtxdrq9u\",\"name\":\"添加节点1\",\"type\":\"timer\",\"left\":\"498px\",\"top\":\"200px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":3378,\"roleId\":null,\"deptId\":null},{\"id\":\"64q19orr1h\",\"name\":\"添加节点2\",\"type\":\"timer\",\"left\":\"515px\",\"top\":\"39px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":1,\"roleId\":null,\"deptId\":null}]', '[{\"from\":\"1659276275052\",\"to\":\"1659276282115\"},{\"from\":\"1659276282115\",\"to\":\"txpo1vyv8u\"},{\"from\":\"txpo1vyv8u\",\"to\":\"yshtxdrq9u\"},{\"from\":\"yshtxdrq9u\",\"to\":\"64q19orr1h\"}]', '流程测试', '2022-08-15 05:02:05', 1, '超级管理员', 0, '超级管理员', '2022-08-17 00:30:38', 1);

-- ----------------------------
-- Table structure for Sys_WorkFlowStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowStep`;
CREATE TABLE `Sys_WorkFlowStep`  (
  `WorkStepFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程主表id',
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程节点Id',
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `StepType` int(11) NULL DEFAULT NULL COMMENT '节点类型(1=按用户审批,2=按角色审批,3=按部门审批)',
  `StepValue` int(11) NULL DEFAULT NULL COMMENT '审批用户id或角色id、部门id',
  `OrderId` int(11) NULL DEFAULT NULL COMMENT '审批顺序',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkStepFlow_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_WorkFlowStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d01-841c-fd9981caf52c', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d43-8759-ea887bb9ad66', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d6a-8e9b-5a067e559d4c', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e38-3e0b-48c7-8c31-702b73e9d97e', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276275052', '流程C-节点A', 1, 1, 1, NULL, '2022-08-15 05:02:05', 1, '超级管理员', NULL, '超级管理员', '2022-08-17 00:30:38', 1);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e38-3e0b-48ef-8010-b941874857b5', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276282115', '流程C-节点B', 1, 1, 2, NULL, '2022-08-15 05:02:05', 1, '超级管理员', NULL, '超级管理员', '2022-08-17 00:30:38', 1);
INSERT INTO `Sys_WorkFlowStep` VALUES ('257cb391-4b84-41eb-b8db-d38c6dde4e9c', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', 'txpo1vyv8u', '添加节点', 1, 3362, 3, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('a6b7408c-9dc4-422d-8d98-c9a5660f579a', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', 'yshtxdrq9u', '添加节点1', 1, 3378, 4, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('ee385e1c-d78a-4eb8-9539-661822dcbfb8', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '64q19orr1h', '添加节点2', 1, 1, 5, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTable
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTable`;
CREATE TABLE `Sys_WorkFlowTable`  (
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `WorkTableKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表主键id',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `CurrentOrderId` int(11) NULL DEFAULT NULL COMMENT '当前审批节点',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审批状态',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkFlowTable_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_WorkFlowTable
-- ----------------------------
INSERT INTO `Sys_WorkFlowTable` VALUES ('460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', 'ec217c01-42a2-435f-bdb6-70613b947bf9', 'SellOrder', '销售订单', 2, 1, '2022-08-15 05:01:04', 1, '超级管理员', 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTable` VALUES ('8abd4a91-fad8-466f-9fe4-6524188ef4c9', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '流程油荒', '287', 'App_Expert', '启用图片支持', 1, 0, '2022-08-15 05:02:14', 1, '超级管理员', 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTable` VALUES ('a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', '978ad775-77c0-49ca-be31-ba36bb6f8af8', 'SellOrder', '销售订单', 1, 0, '2022-08-17 23:27:48', 1, '超级管理员', 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTable` VALUES ('b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', '47e41e06-cb4a-4763-9aeb-df66cd6615e1', 'SellOrder', '销售订单', 2, 0, '2022-08-16 02:03:17', 1, '超级管理员', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTableStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTableStep`;
CREATE TABLE `Sys_WorkFlowTableStep`  (
  `Sys_WorkFlowTableStep_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主表id',
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点id',
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节名称',
  `StepType` int(11) NULL DEFAULT NULL COMMENT '审批类型',
  `StepValue` int(11) NULL DEFAULT NULL COMMENT '节点类型(1=按用户审批,2=按角色审批,3=按部门审批 )',
  `OrderId` int(11) NULL DEFAULT NULL COMMENT '审批顺序',
  `AuditId` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `Auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审核状态',
  `AuditDate` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Sys_WorkFlowTableStep_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of Sys_WorkFlowTableStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('02e50a7c-e04b-41cd-a8cf-6224b77a9c1b', '8abd4a91-fad8-466f-9fe4-6524188ef4c9', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276282115', '流程C-节点B', 1, 1, 2, 1, NULL, NULL, NULL, NULL, '2022-08-15 05:02:14', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('136b08e5-1fb5-4a07-8d7f-6f78d09c2685', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('1ac547df-27cf-4eb4-9ad6-37881ef671cc', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('1c75af0d-96ea-4777-8f1b-98a8ba168d89', '8abd4a91-fad8-466f-9fe4-6524188ef4c9', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276275052', '流程C-节点A', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '2022-08-15 05:02:14', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('21c8252a-15a3-4435-a6ca-0dbee4474bba', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, '超级管理员', 1, '2022-08-16 02:03:38', '审批通过测试', '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('521f23e3-6d5d-4a9d-8e67-a289440f7ecd', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('81856e1e-9796-4ceb-8b8a-36b201604e25', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, '超级管理员', 1, '2022-08-15 05:13:51', '1', '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('83485f9f-119b-4344-a26a-22a1f4a3760e', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('d9a0f59c-7b3e-4099-84a5-2b3c74414b46', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('e623c47c-e0f5-4052-a2be-baf857784499', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('f92d5a23-f572-446e-a3e4-e6063ee6dcdf', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
set global local_infile = 'ON';
