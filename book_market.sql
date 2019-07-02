/*
 Navicat Premium Data Transfer

 Source Server         : book
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : book_market

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 02/07/2019 01:15:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类别',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '卖家',
  `original_price` float(11, 2) NULL DEFAULT NULL COMMENT '原价',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '售价/求购时为意向价格',
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `end_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失效时间',
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '卖书为内容介绍/买书为求购信息',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0 失效 1 在售 2 求购',
  `img_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jd_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '一本书读懂法律常识', 3, 1, 34.80, 15.00, '2019-07-01', '2019-07-31', '2019-07-01', '《一本书读懂法律常识：解答日常法律难题的十万个为什么》并没有就法律谈法律，而是采撷生活中的真实法律事例，用生动的笔触和精彩的语言，描述人们生活和工作中常遇到的法律关系，并给予深入的解析，让人们明白自己的权利和义务在哪儿？去哪儿了？怎么办？使法律贴近实际、贴近生活、贴近大众，是老百姓掌握法律知识的宝典，大众维权的利器。', 0, '16c61412-9dcf-42b3-bf53-8f18f2ad5ec8.jpg', '9787515813042', 'https://item.jd.com/11710775.html');
INSERT INTO `books` VALUES (2, '2019新编中华人民共和国法律法规全书（第十二版）', 3, 1, 78.00, 39.00, '2019-07-01', '2019-07-31', '2019-07-01', '《新编中华人民共和国法律法规全书（第十二版 2019）》充分考虑读者的需求，新版增补、替换了2018年1月以来新公布、修正的《中华人民共和国人民陪审员法》《中华人民共和国公司法》《中华人民共和国刑事诉讼法》《中华人民共和国个人所得税法》《中华人民共和国广告法》等法律法规30余件。本书保持以下特点： \r\n1．收录全面，编排精细。本书收录现行有效的常用法律、行政法规、部门规章等规范性文件共320余件，重要法律条文前加注了条旨，意在用精炼的文字概括该条文的含意，便于读者理解、查阅和掌握。 \r\n2．分类科学，一目了然。全书分为宪法·国家法编、民商法编、行政法编、经济法编、社会法编、刑法编及程序法编七大类，每一类别细分为若干细目，让您一目了然，能清楚地找到您所需要的文件内容。 \r\n3．编排索引，便于查找。书中除有分类目录外，在书末还附有拼音索引，读者可通过这两种途径查阅书中所有文件。 \r\n4．后续追加，提供增补。书后附“增补登记表”，根据读者需求，提供法规信息增补。', 2, '18f3d262-ae19-4a31-8598-b4e2c3d39eb1.jpg', '9787519728014', 'https://item.jd.com/12486194.html');
INSERT INTO `books` VALUES (3, '一看就停不下来的中国史', 2, 1, 52.30, 25.00, '2019-07-01', '2019-07-31', '2019-07-01', '　　大唐第一战将：当老板怀疑你的时候，用一次次胜利怼他 \r\n　　李靖在历史爱好者的心目中地位很高，被封为“战神”。 \r\n　　这可能主要得益于小说和演义的影响。在传奇和演义里，李靖很风光，又是“风尘三侠”之一，有红拂知己；又是托塔天王，是哪吒他爸。但这些，基本都是附会和传说，跟真实的李靖没啥关系。 \r\n　　真实的李靖，一生的政治处境挺凶险的。 \r\n　　史书说他一度“阖门自守，杜绝宾客，虽亲戚不得妄进”，把自己封闭起来，不是抑郁，至少也是郁闷。 \r\n　　一个战绩爆棚的名将，为何内心如此难受？ \r\n　　因为，老板对他不放心。', 1, '3302cf51-121d-46e6-9e7f-d2bf934d533a.jpg', '9787516820940', 'https://item.jd.com/12434165.html');
INSERT INTO `books` VALUES (4, '图解易经+图解周易大全（套装共2册）', 4, 1, 125.10, 50.00, '2019-07-01', '2019-07-31', '2019-07-01', '　　周易大全\r\n\r\n　　《周易》被誉为华夏文明之源。它的古老和深邃使它当之无愧为“经典中的经典，哲学中的哲学，智慧中的智慧”。《易经》与《道德经》、《论语》一起构成中华民族的三条经线，共同成为华夏文化的灵魂，其他文化皆从此三者衍生而来。在中国古代史上，易学专著达三千余种，形成人类文化史上的学术奇观。《易经》传到西方后，被人们看成是一部奇妙的未来学著作。他们惊呼，东方文化正在改变西方人的生活方式。《易经》的哲理可以涵盖万物，不管社会如何进步，科学技术如何发展，《易经》总会有一个发展“框架”在等着，影响着人们生活的方方面面。\r\n\r\n　　《易经》是人类思想的*，迄今没有任何一种思想超过《易经》的高度。然而，《易经》蕴藏的道理都是在生活中能见到的，说出来会让人觉得豁然开朗。', 1, '04c81646-a290-4ce4-adfe-3035a64f24cc.jpg', '12137595', 'https://item.jd.com/12137595.html');
INSERT INTO `books` VALUES (5, '浮生六记', 1, 2, 28.40, 10.00, '2019-07-01', '2019-07-31', '2019-07-01', '　　《浮生六记》是清代文人沈复写作的自传散文。因其以真言述真情，从不刻意造作，得以浑然天成，独树一帜，达\"乐而不淫，哀而不伤\"之境界，深为后世文人所推崇，流传至今，已成经典。　　\r\n　　沈复，字三白，号梅逸。清乾隆二十八年（1763年）生于姑苏城南沧浪亭畔士族文人之家，十八岁娶舅女陈芸为妻。婚后夫妻俩举案齐眉、相爱甚笃，然命途多舛，常常事与愿违；幸而二人不落世俗，善苦中作乐，耳鬓厮磨二十三年，至芸积病身故，仍情深如旧。后，沈复离家漫游，著《浮生六记》六卷。成书后并未刊行出版，而在民间多有传抄，引以为珍。道光年间，由江南士人杨引传于街市书摊购得，转妹婿王韬于申报馆付梓出版。因其中以真言述真情，从不刻意造作，深为后世文人所推崇，流传至今，已成经典。其中《中山记历》《养生记道》两记，杨引传购得版本已佚。民国时期有称找到足本，并付梓出版，收录佚失两记，然实为时人拼凑杜撰。后常有传言佚记真本现身，或有相关、或片段，但至今仍无被证实可靠完整的，故本版只收底本所录《闺房记乐》《闲情记趣》《坎坷记愁》《浪游记快》四记。', 1, '05327ffc-8669-408a-b94d-7e48b71728e8.jpg', '9787201094014', 'https://item.jd.com/11757204.html');
INSERT INTO `books` VALUES (6, '理想国', 1, 2, 24.00, 12.00, '2019-07-01', '2019-07-31', '2019-07-01', '★《理想国》一书是著名的古希腊哲学家柏拉图的经典著作。柏拉图的主要哲学思想都是通过对话的形式记载下来的，在他的著作中，有很多是以苏格拉底的名字进行的对话，通过苏格拉底与他人的对话，以基础理念建构了人类历史上的乌托邦理想国，人类的真善美是这个乌托邦的主题。\r\n\r\n★柏拉图的理想国对于研究西方哲学而言有很强的启发性，但他的客观唯心主义思想是不切实际的，现在我们通过学习马克思主义哲学对一些问题要辨证的看待，只有这样才能正确、客观的看清事物的本质，合理的借鉴，取其精华，去其糟粕，合理的借鉴。\r\n\r\n★《理想国》全书讨论的大多数问题包括哲学、政治、教育、伦理、道德、文艺、科学等等，是西方政治思想的经典著作之一，堪称哲学的百科全书。', 2, '6cd07336-3436-49ea-9008-39bedaea6ea6.jpg', '9787516809419', 'https://item.jd.com/11932762.html');
INSERT INTO `books` VALUES (7, '哲学家们都干了些什么？', 4, 2, 51.00, 15.00, '2019-07-01', '2019-07-31', '2019-07-01', '你知道吗，你想过或者没想过的这些奇形怪状的问题，早在几千年前就被哲学家们一本正经地提出，挖空心思地找证据，面红耳赤地争论过了。在整个世界忙着探索、开垦、打仗、上天、发展的漫长历史中，这帮哲学家们却神经质地死磕这个世界的真相和人生的意义，就好像一个网络游戏里的角色试图琢磨自己手里武器的代码是什么……', 2, 'ab0ab34c-7cb6-456a-a3e9-78dc857f98db.jpg', '9787550242234', 'https://item.jd.com/11693492.html');
INSERT INTO `books` VALUES (8, '墨菲定律', 1, 2, 36.00, 20.00, '2019-07-01', '2019-07-31', '2019-07-01', '墨菲定律简单的来说就是：看似一件事好与坏的几率相同时，但事情总会朝着糟糕的方向发生。中国有句俗语：怕什么，来什么。这其实就是墨菲定律的另一种表达方式。本书分十个部分，从不同的方面，介绍定律、效应、法则、理论的神奇之处。在简单地介绍了每个定律或法则的来源和基本理论后，就如何运用其解释人生中的现象并指导我们的工作和生活等进行了重点阐述，是一部可以启迪智慧、改变命运的人生枕边书。墨菲定律还可以引申为，任何你觉得有可能失败的事，它就会失败。太多的人在一次两次的失败后退缩，这些人也就离成功越来越远，只有真正的强者才能笑到最后。这就是巧妙的运用墨菲定律，智慧地付出。让没有目标的人为有目标的人达到目标。', 1, '13307417-fe37-4c44-bc34-4370ffa627df.jpg', '9787504499134', 'https://item.jd.com/12302714.html');
INSERT INTO `books` VALUES (9, '你不可不知的法律常识', 3, 3, 42.00, 20.00, '2019-07-01', '2019-07-31', '2019-07-01', '酒后出事，同席者承担多大责任？样品误当新品卖，是否构成消费欺诈？车借给朋友出了事故，责任由谁承担？是不是所有的合同都可以采用电子签名？“小三”有权分得遗产吗？夫妻购买的小产权房，离婚时如何分割？父债子还，天经地义吗？借款人跑了，如何讨债？如何约定民间借贷的利息才合法？购买学区房，卖房人不迁走户口怎么办？老赖的住房不会被执行吗？这些问题都是生活中大家非常关注的，也是常常厘不清的。《你不可不知的法律常识》从生活与消费，夫与妻关系、父母与子女、资产与理财、企业经营与管理、诉讼与仲裁、犯罪与刑罚这7个方面入手，选取了与日常生活密切相关的100个问题，用非常接地气的语言，生动而严谨地进行点对点的讲解，非常适合大家查阅式阅读。', 2, '583b51e1-1a83-47e1-9e1e-ad00d2bb8552.jpg', '9787515819556', 'https://item.jd.com/12179752.html');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `send_id` int(11) NULL DEFAULT NULL,
  `receiver_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 3, 3, 1, '您好，能送到玉泉5舍吗？', '2019-07-01 08:46:59');
INSERT INTO `message` VALUES (2, 3, 1, 3, '没问题', '2019-07-01 08:50:23');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `books_id` int(11) NULL DEFAULT NULL,
  `num` bigint(25) NULL DEFAULT NULL COMMENT '订单编号',
  `state` int(11) NULL DEFAULT NULL COMMENT '订单状态 1线下 2寄送',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 3, 1, NULL, 1, '2019-07-01 08:47:53');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL COMMENT '该分类下的书籍数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '小说 / 文学 / 语言文学', 3);
INSERT INTO `type` VALUES (2, '历史 / 地理 / 艺术', 1);
INSERT INTO `type` VALUES (3, '政治 / 法律 / 军事', 3);
INSERT INTO `type` VALUES (4, '哲学 / 心理 / 宗教', 2);
INSERT INTO `type` VALUES (5, '经济 / 社科 / 综合', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一次登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '令狐冲', '964270816@qq.com', '390238A00E68EA0E10B1386B2B45E59B', NULL);
INSERT INTO `user` VALUES (2, '小龙女', 'long@zju.edu.cn', 'FCB705826F4E084445F59683AA9AD704', NULL);
INSERT INTO `user` VALUES (3, 'bai', 'bai@zju.edu.cn', '8915446DCB77FFE9736F9D8E77C025D1', NULL);

SET FOREIGN_KEY_CHECKS = 1;
