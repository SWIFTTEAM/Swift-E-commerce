-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 12 月 21 日 19:41
-- 伺服器版本: 10.1.21-MariaDB
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `E-commerce`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Albums`
--

CREATE TABLE `Albums` (
  `AlbumID` int(10) NOT NULL,
  `AlbumName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CreateTime` datetime NOT NULL,
  `CreateTimeStamp` int(15) NOT NULL,
  `StickyAlbum` tinyint(1) NOT NULL,
  `Permission` tinyint(1) NOT NULL,
  `CustomerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Areas`
--

CREATE TABLE `Areas` (
  `AreaID` int(10) NOT NULL,
  `AreaChiName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AreaEngName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountyID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Areas`
--

INSERT INTO `Areas` (`AreaID`, `AreaChiName`, `AreaEngName`, `CountyID`) VALUES
(100, '中正區', 'Zhongzheng Dist', 1),
(103, '大同區', 'Datong Dist', 1),
(104, '中山區', 'Zhongshan Dist', 1),
(105, '松山區', 'Songshan Dist', 1),
(106, '大安區', 'Da’an Dist', 1),
(108, '萬華區', 'Wanhua Dist', 1),
(110, '信義區', 'Xinyi Dist', 1),
(111, '士林區', 'Shilin Dist', 1),
(112, '北投區', 'Beitou Dist', 1),
(114, '內湖區', 'Neihu Dist', 1),
(115, '南港區', 'Nangang Dist', 1),
(116, '文山區', 'Wenshan Dist', 1),
(200, '仁愛區', 'Ren’ai Dist', 3),
(201, '信義區', 'Xinyi Dist', 3),
(202, '中正區', 'Zhongzheng Dist', 3),
(203, '中山區', 'Zhongshan Dist', 3),
(204, '安樂區', 'Anle Dist', 3),
(205, '暖暖區', 'Nuannuan Dist', 3),
(206, '七堵區', 'Qidu Dist', 3),
(207, '萬里區', 'Wanli Dist', 2),
(208, '金山區', 'Jinshan Dist', 2),
(209, '南竿鄉', 'Nangan Township', 21),
(210, '北竿鄉', 'Beigan Township', 21),
(211, '莒光鄉', 'Juguang Township', 21),
(212, '東引鄉', 'Dongyin Township', 21),
(220, '板橋區', 'Banqiao Dist', 2),
(221, '汐止區', 'Xizhi Dist', 2),
(222, '深坑區', 'Shenkeng Dist', 2),
(223, '石碇區', 'Shiding Dist', 2),
(224, '瑞芳區', 'Ruifang Dist', 2),
(226, '平溪區', 'Pingxi Dist', 2),
(227, '雙溪區', 'Shuangxi Dist', 2),
(228, '貢寮區', 'Gongliao Dist', 2),
(231, '新店區', 'Xindian Dist', 2),
(232, '坪林區', 'Pinglin Dist', 2),
(233, '烏來區', 'Wulai Dist', 2),
(234, '永和區', 'Yonghe Dist', 2),
(235, '中和區', 'Zhonghe Dist', 2),
(236, '土城區', 'Tucheng Dist', 2),
(237, '三峽區', 'Sanxia Dist', 2),
(238, '樹林區', 'Shulin Dist', 2),
(239, '鶯歌區', 'Yingge Dist', 2),
(241, '三重區', 'Sanchong Dist', 2),
(242, '新莊區', 'Xinzhuang Dist', 2),
(243, '泰山區', 'Taishan Dist', 2),
(244, '林口區', 'Linkou Dist', 2),
(247, '蘆洲區', 'Luzhou Dist', 2),
(248, '五股區', 'Wugu Dist', 2),
(249, '八里區', 'Bali Dist', 2),
(251, '淡水區', 'Tamsui Dist', 2),
(252, '三芝區', 'Sanzhi Dist', 2),
(253, '石門區', 'Shimen Dist', 2),
(260, '宜蘭市', 'Yilan City', 22),
(261, '頭城鎮', 'Toucheng Township', 22),
(262, '礁溪鄉', 'Jiaoxi Township', 22),
(263, '壯圍鄉', 'Zhuangwei Township', 22),
(264, '員山鄉', 'Yuanshan Township', 22),
(265, '羅東鎮', 'Luodong Township', 22),
(266, '三星鄉', 'Sanxing Township', 22),
(267, '大同鄉', 'Datong Township', 22),
(268, '五結鄉', 'Wujie Township', 22),
(269, '冬山鄉', 'Dongshan Township', 22),
(270, '蘇澳鎮', 'Su’ao Township', 22),
(272, '南澳鄉', 'Nan’ao Township', 22),
(290, '釣魚臺', 'Diauyutai', 3),
(300, '北區', 'North Dist', 5),
(302, '竹北市', 'Zhubei City', 6),
(303, '湖口鄉', 'Hukou Township', 6),
(304, '新豐鄉', 'Xinfeng Township', 6),
(305, '新埔鎮', 'Xinpu Township', 6),
(306, '關西鎮', 'Guanxi Township', 6),
(307, '芎林鄉', 'Qionglin Township', 6),
(308, '寶山鄉', 'Baoshan Township', 6),
(310, '竹東鎮', 'Zhudong Township', 6),
(311, '五峰鄉', 'Wufeng Township', 6),
(312, '橫山鄉', 'Hengshan Township', 6),
(313, '尖石鄉', 'Jianshi Township', 6),
(314, '北埔鄉', 'Beipu Township', 6),
(315, '峨眉鄉', 'Emei Township', 6),
(320, '中壢區', 'Zhongli Dist', 4),
(324, '平鎮區', 'Pingzhen Dist', 4),
(325, '龍潭區', 'Longtan Dist', 4),
(326, '楊梅區', 'Yangmei Dist', 4),
(327, '新屋區', 'Xinwu Dist', 4),
(328, '觀音區', 'Guanyin Dist', 4),
(330, '桃園區', 'Taoyuan Dist', 4),
(333, '龜山區', 'Guishan Dist', 4),
(334, '八德區', 'Bade Dist', 4),
(335, '大溪區', 'Daxi Dist', 4),
(336, '復興區', 'Fuxing Dist', 4),
(337, '大園區', 'Dayuan Dist', 4),
(338, '蘆竹區', 'Luzhu Dist', 4),
(350, '竹南鎮', 'Zhunan Township', 8),
(351, '頭份市', 'Toufen City', 8),
(352, '三灣鄉', 'Sanwan Township', 8),
(353, '南庄鄉', 'Nanzhuang Township', 8),
(354, '獅潭鄉', 'Shitan Township', 8),
(356, '後龍鎮', 'Houlong Township', 8),
(357, '通霄鎮', 'Tongxiao Township', 8),
(358, '苑裡鎮', 'Yuanli Township', 8),
(360, '苗栗市', 'Miaoli City', 8),
(361, '造橋鄉', 'Zaoqiao Township', 8),
(362, '頭屋鄉', 'Touwu Township', 8),
(363, '公館鄉', 'Gongguan Township', 8),
(364, '大湖鄉', 'Dahu Township', 8),
(365, '泰安鄉', 'Tai’an Township', 8),
(366, '銅鑼鄉', 'Tongluo Township', 8),
(367, '三義鄉', 'Sanyi Township', 8),
(368, '西湖鄉', 'Xihu Township', 8),
(369, '卓蘭鎮', 'Zhuolan Township', 8),
(400, '中區', 'Central Dist', 9),
(401, '東區', 'East Dist', 9),
(402, '南區', 'South Dist', 9),
(403, '西區', 'West Dist', 9),
(404, '北區', 'North Dist', 9),
(406, '北屯區', 'Beitun Dist', 9),
(407, '西屯區', 'Xitun Dist', 9),
(408, '南屯區', 'Nantun Dist', 9),
(411, '太平區', 'Taiping Dist', 9),
(412, '大里區', 'Dali Dist', 9),
(413, '霧峰區', 'Wufeng Dist', 9),
(414, '烏日區', 'Wuri Dist', 9),
(420, '豐原區', 'Fengyuan Dist', 9),
(421, '后里區', 'Houli Dist', 9),
(422, '石岡區', 'Shigang Dist', 9),
(423, '東勢區', 'Dongshi Dist', 9),
(424, '和平區', 'Heping Dist', 9),
(426, '新社區', 'Xinshe Dist', 9),
(427, '潭子區', 'Tanzi Dist', 9),
(428, '大雅區', 'Daya Dist', 9),
(429, '神岡區', 'Shengang Dist', 9),
(432, '大肚區', 'Dadu Dist', 9),
(433, '沙鹿區', 'Shalu Dist', 9),
(434, '龍井區', 'Longjing Dist', 9),
(435, '梧棲區', 'Wuqi Dist', 9),
(436, '清水區', 'Qingshui Dist', 9),
(437, '大甲區', 'Dajia Dist', 9),
(438, '外埔區', 'Waipu Dist', 9),
(439, '大安區', 'Da’an Dist', 9),
(500, '彰化市', 'Changhua City', 10),
(502, '芬園鄉', 'Fenyuan Township', 10),
(503, '花壇鄉', 'Huatan Township', 10),
(504, '秀水鄉', 'Xiushui Township', 10),
(505, '鹿港鎮', 'Lukang Township', 10),
(506, '福興鄉', 'Fuxing Township', 10),
(507, '線西鄉', 'Xianxi Township', 10),
(508, '和美鎮', 'Hemei Township', 10),
(509, '伸港鄉', 'Shengang Township', 10),
(510, '員林市', 'Yuanlin City', 10),
(511, '社頭鄉', 'Shetou Township', 10),
(512, '永靖鄉', 'Yongjing Township', 10),
(513, '埔心鄉', 'Puxin Township', 10),
(514, '溪湖鎮', 'Xihu Township', 10),
(515, '大村鄉', 'Dacun Township', 10),
(516, '埔鹽鄉', 'Puyan Township', 10),
(520, '田中鎮', 'Tianzhong Township', 10),
(521, '北斗鎮', 'Beidou Township', 10),
(522, '田尾鄉', 'Tianwei Township', 10),
(523, '埤頭鄉', 'Pitou Township', 10),
(524, '溪州鄉', 'Xizhou Township', 10),
(525, '竹塘鄉', 'Zhutang Township', 10),
(526, '二林鎮', 'Erlin Township', 10),
(527, '大城鄉', 'Dacheng Township', 10),
(528, '芳苑鄉', 'Fangyuan Township', 10),
(530, '二水鄉', 'Ershui Township', 10),
(540, '南投市', 'Nantou City', 11),
(541, '中寮鄉', 'Zhongliao Township', 11),
(542, '草屯鎮', 'Caotun Township', 11),
(544, '國姓鄉', 'Guoxing Township', 11),
(545, '埔里鎮', 'Puli Township', 11),
(546, '仁愛鄉', 'Ren’ai Township', 11),
(551, '名間鄉', 'Mingjian Township', 11),
(552, '集集鎮', 'Jiji Township', 11),
(553, '水里鄉', 'Shuili Township', 11),
(555, '魚池鄉', 'Yuchi Township', 11),
(556, '信義鄉', 'Xinyi Township', 11),
(557, '竹山鎮', 'Zhushan Township', 11),
(558, '鹿谷鄉', 'Lugu Township', 11),
(600, '東區', 'East Dist', 12),
(602, '番路鄉', 'Fanlu Township', 13),
(603, '梅山鄉', 'Meishan Township', 13),
(604, '竹崎鄉', 'Zhuqi Township', 13),
(605, '阿里山鄉', 'Alishan Township', 13),
(606, '中埔鄉', 'Zhongpu Township', 13),
(607, '大埔鄉', 'Dapu Township', 13),
(608, '水上鄉', 'Shuishang Township', 13),
(611, '鹿草鄉', 'Lucao Township', 13),
(612, '太保市', 'Taibao City', 13),
(613, '朴子市', 'Puzi City', 13),
(614, '東石鄉', 'Dongshi Township', 13),
(615, '六腳鄉', 'Liujiao Township', 13),
(616, '新港鄉', 'Xingang Township', 13),
(621, '民雄鄉', 'Minxiong Township', 13),
(622, '大林鎮', 'Dalin Township', 13),
(623, '溪口鄉', 'Xikou Township', 13),
(624, '義竹鄉', 'Yizhu Township', 13),
(625, '布袋鎮', 'Budai Township', 13),
(630, '斗南鎮', 'Dounan Township', 14),
(631, '大埤鄉', 'Dapi Township', 14),
(632, '虎尾鎮', 'Huwei Township', 14),
(633, '土庫鎮', 'Tuku Township', 14),
(634, '褒忠鄉', 'Baozhong Township', 14),
(635, '東勢鄉', 'Dongshi Township', 14),
(636, '臺西鄉', 'Taixi Township', 14),
(637, '崙背鄉', 'Lunbei Township', 14),
(638, '麥寮鄉', 'Mailiao Township', 14),
(640, '斗六市', 'Douliu City', 14),
(643, '林內鄉', 'Linnei Township', 14),
(646, '古坑鄉', 'Gukeng Township', 14),
(647, '莿桐鄉', 'Citong Township', 14),
(648, '西螺鎮', 'Xiluo Township', 14),
(649, '二崙鄉', 'Erlun Township', 14),
(651, '北港鎮', 'Beigang Township', 14),
(652, '水林鄉', 'Shuilin Township', 14),
(653, '口湖鄉', 'Kouhu Township', 14),
(654, '四湖鄉', 'Sihu Township', 14),
(655, '元長鄉', 'Yuanchang Township', 14),
(700, '中西區', 'West Central Dist', 15),
(701, '東區', 'East Dist', 15),
(702, '南區', 'South Dist', 15),
(704, '北區', 'North Dist', 15),
(708, '安平區', 'Anping Dist', 15),
(709, '安南區', 'Annan Dist', 15),
(710, '永康區', 'Yongkang Dist', 15),
(711, '歸仁區', 'Guiren Dist', 15),
(712, '新化區', 'Xinhua Dist', 15),
(713, '左鎮區', 'Zuozhen Dist', 15),
(714, '玉井區', 'Yujing Dist', 15),
(715, '楠西區', 'Nanxi Dist', 15),
(716, '南化區', 'Nanhua Dist', 15),
(717, '仁德區', 'Rende Dist', 15),
(718, '關廟區', 'Guanmiao Dist', 15),
(719, '龍崎區', 'Longqi Dist', 15),
(720, '官田區', 'Guantian Dist', 15),
(721, '麻豆區', 'Madou Dist', 15),
(722, '佳里區', 'Jiali Dist', 15),
(723, '西港區', 'Xigang Dist', 15),
(724, '七股區', 'Qigu Dist', 15),
(725, '將軍區', 'Jiangjun Dist', 15),
(726, '學甲區', 'Xuejia Dist', 15),
(727, '北門區', 'Beimen Dist', 15),
(730, '新營區', 'Xinying Dist', 15),
(731, '後壁區', 'Houbi Dist', 15),
(732, '白河區', 'Baihe Dist', 15),
(733, '東山區', 'Dongshan Dist', 15),
(734, '六甲區', 'Liujia Dist', 15),
(735, '下營區', 'Xiaying Dist', 15),
(736, '柳營區', 'Liuying Dist', 15),
(737, '鹽水區', 'Yanshui Dist', 15),
(741, '善化區', 'Shanhua Dist', 15),
(742, '大內區', 'Danei Dist', 15),
(743, '山上區', 'Shanshang Dist', 15),
(744, '新市區', 'Xinshi Dist', 15),
(745, '安定區', 'Anding Dist', 15),
(800, '新興區', 'Xinxing Dist', 16),
(801, '前金區', 'Qianjin Dist', 16),
(802, '苓雅區', 'Lingya Dist', 16),
(803, '鹽埕區', 'Yancheng Dist', 16),
(804, '鼓山區', 'Gushan Dist', 16),
(805, '旗津區', 'Qijin Dist', 16),
(806, '前鎮區', 'Qianzhen Dist', 16),
(807, '三民區', 'Sanmin Dist', 16),
(811, '楠梓區', 'Nanzi Dist', 16),
(812, '小港區', 'Xiaogang Dist', 16),
(813, '左營區', 'Zuoying Dist', 16),
(814, '仁武區', 'Renwu Dist', 16),
(815, '大社區', 'Dashe Dist', 16),
(817, '東沙群島', 'Dongsha Islands', 16),
(819, '南沙群島', 'Nansha Islands', 16),
(820, '岡山區', 'Gangshan Dist', 16),
(821, '路竹區', 'Luzhu Dist', 16),
(822, '阿蓮區', 'Alian Dist', 16),
(823, '田寮區', 'Tianliao Dist', 16),
(824, '燕巢區', 'Yanchao Dist', 16),
(825, '橋頭區', 'Qiaotou Dist', 16),
(826, '梓官區', 'Ziguan Dist', 16),
(827, '彌陀區', 'Mituo Dist', 16),
(828, '永安區', 'Yong’an Dist', 16),
(829, '湖內區', 'Hunei Dist', 16),
(830, '鳳山區', 'Fengshan Dist', 16),
(831, '大寮區', 'Daliao Dist', 16),
(832, '林園區', 'Linyuan Dist', 16),
(833, '鳥松區', 'Niaosong Dist', 16),
(840, '大樹區', 'Dashu Dist', 16),
(842, '旗山區', 'Qishan Dist', 16),
(843, '美濃區', 'Meinong Dist', 16),
(844, '六龜區', 'Liugui Dist', 16),
(845, '內門區', 'Neimen Dist', 16),
(846, '杉林區', 'Shanlin Dist', 16),
(847, '甲仙區', 'Jiaxian Dist', 16),
(848, '桃源區', 'Taoyuan Dist', 16),
(849, '那瑪夏區', 'Namaxia Dist', 16),
(851, '茂林區', 'Maolin Dist', 16),
(852, '茄萣區', 'Qieding Dist', 16),
(880, '馬公市', 'Magong City', 19),
(881, '西嶼鄉', 'Xiyu Township', 19),
(882, '望安鄉', 'Wang’an Township', 19),
(883, '七美鄉', 'Qimei Township', 19),
(884, '白沙鄉', 'Baisha Township', 19),
(885, '湖西鄉', 'Huxi Township', 19),
(890, '金沙鎮', 'Jinsha Township', 20),
(891, '金湖鎮', 'Jinhu Township', 20),
(892, '金寧鄉', 'Jinning Township', 20),
(893, '金城鎮', 'Jincheng Township', 20),
(894, '烈嶼鄉', 'Lieyu Township', 20),
(896, '烏坵鄉', 'Wuqiu Township', 20),
(900, '屏東市', 'Pingtung City', 17),
(901, '三地門鄉', 'Sandimen Township', 17),
(902, '霧臺鄉', 'Wutai Township', 17),
(903, '瑪家鄉', 'Majia Township', 17),
(904, '九如鄉', 'Jiuru Township', 17),
(905, '里港鄉', 'Ligang Township', 17),
(906, '高樹鄉', 'Gaoshu Township', 17),
(907, '鹽埔鄉', 'Yanpu Township', 17),
(908, '長治鄉', 'Changzhi Township', 17),
(909, '麟洛鄉', 'Linluo Township', 17),
(911, '竹田鄉', 'Zhutian Township', 17),
(912, '內埔鄉', 'Neipu Township', 17),
(913, '萬丹鄉', 'Wandan Township', 17),
(920, '潮州鎮', 'Chaozhou Township', 17),
(921, '泰武鄉', 'Taiwu Township', 17),
(922, '來義鄉', 'Laiyi Township', 17),
(923, '萬巒鄉', 'Wanluan Township', 17),
(924, '崁頂鄉', 'Kanding Township', 17),
(925, '新埤鄉新埤鄉', 'Xinpi Township', 17),
(926, '南州鄉', 'Nanzhou Township', 17),
(927, '林邊鄉', 'Linbian Township', 17),
(928, '東港鎮', 'Donggang Township', 17),
(929, '琉球鄉', 'Liuqiu Township', 17),
(931, '佳冬鄉', 'Jiadong Township', 17),
(932, '新園鄉', 'Xinyuan Township', 17),
(940, '枋寮鄉', 'Fangliao Township', 17),
(941, '枋山鄉', 'Fangshan Township', 17),
(942, '春日鄉', 'Chunri Township', 17),
(943, '獅子鄉', 'Shizi Township', 17),
(944, '車城鄉', 'Checheng Township', 17),
(945, '牡丹鄉', 'Mudan Township', 17),
(946, '恆春鎮', 'Hengchun Township', 17),
(947, '滿州鄉', 'Manzhou Township', 17),
(950, '臺東市', 'Taitung City', 18),
(951, '綠島鄉', 'Ludao Township', 18),
(952, '蘭嶼鄉', 'Lanyu Township', 18),
(953, '延平鄉', 'Yanping Township', 18),
(954, '卑南鄉', 'Beinan Township', 18),
(955, '鹿野鄉', 'Luye Township', 18),
(956, '關山鎮', 'Guanshan Township', 18),
(957, '海端鄉', 'Haiduan Township', 18),
(958, '池上鄉', 'Chishang Township', 18),
(959, '東河鄉', 'Donghe Township', 18),
(961, '成功鎮', 'Chenggong Township', 18),
(962, '長濱鄉', 'Changbin Township', 18),
(963, '太麻里鄉', 'Taimali Township', 18),
(964, '金峰鄉', 'Jinfeng Township', 18),
(965, '大武鄉', 'Dawu Township', 18),
(966, '達仁鄉', 'Daren Township', 18),
(970, '花蓮市', 'Hualien City', 7),
(971, '新城鄉', 'Xincheng Township', 7),
(972, '秀林鄉', 'Xiulin Township', 7),
(973, '吉安鄉', 'Ji’an Township', 7),
(974, '壽豐鄉', 'Shoufeng Township', 7),
(975, '鳳林鎮', 'Fenglin Township', 7),
(976, '光復鄉', 'Guangfu Township', 7),
(977, '豐濱鄉', 'Fengbin Township', 7),
(978, '瑞穗鄉', 'Ruisui Township', 7),
(979, '萬榮鄉', 'Wanrong Township', 7),
(981, '玉里鎮', 'Yuli Township', 7),
(982, '卓溪鄉', 'Zhuoxi Township', 7),
(983, '富里鄉', 'Fuli Township', 7);

-- --------------------------------------------------------

--
-- 資料表結構 `Companies`
--

CREATE TABLE `Companies` (
  `CompanyID` int(10) NOT NULL,
  `NameChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NameEng` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LocalPhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `FaxPhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CreateTime` date NOT NULL,
  `CountryID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Counties`
--

CREATE TABLE `Counties` (
  `CountyID` int(10) NOT NULL,
  `CountyNum` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `CountyChiName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountyEngName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Counties`
--

INSERT INTO `Counties` (`CountyID`, `CountyNum`, `CountyChiName`, `CountyEngName`, `CountryID`) VALUES
(1, '02', '臺北市', 'Taipei City', 886),
(2, '02', '新北市', 'New Taipei City', 886),
(3, '02', '基隆市', 'Keelung City\r\n', 886),
(4, '03', '桃園市', 'Taoyuan City\r\n', 886),
(5, '03', '新竹市', 'Hsinchu City', 886),
(6, '03', '新竹縣', 'Hsinchu County', 886),
(7, '03', '花蓮縣', 'Hualien County', 886),
(8, '037', '苗栗縣', 'Miaoli County', 886),
(9, '04', '台中市', 'Taichung City', 886),
(10, '04', '彰化縣', 'Changhua County', 886),
(11, '049', '南投縣', 'Nantou County', 886),
(12, '05', '嘉義市', 'Chiayi City', 886),
(13, '05', '嘉義縣', 'Chiayi County', 886),
(14, '05', '雲林縣', 'Yunlin County', 886),
(15, '06', '臺南市', 'Tainan City', 886),
(16, '07', '高雄市', 'Kaohsiung City', 886),
(17, '08', '屏東縣', 'Pingtung County', 886),
(18, '089', '臺東縣', 'Taitung County', 886),
(19, '06', '澎湖縣', 'Penghu County', 886),
(20, '082', '金門縣', 'Kinmen County', 886),
(21, '0836', '連江縣', 'Lianjiang County', 886),
(22, '03', '宜蘭縣', 'Ilan County', 886);

-- --------------------------------------------------------

--
-- 資料表結構 `Countries`
--

CREATE TABLE `Countries` (
  `CountryID` int(11) NOT NULL,
  `CountryChiName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountryEngName` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Countries`
--

INSERT INTO `Countries` (`CountryID`, `CountryChiName`, `CountryEngName`) VALUES
(886, '台灣', 'Taiwan');

-- --------------------------------------------------------

--
-- 資料表結構 `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(10) NOT NULL,
  `Account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NameChi` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `NameEng` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Identify` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Birth` date NOT NULL,
  `CellPhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CellPhone_Spare` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HomePhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ResidenceAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MailingAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DeliveryAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisteredTime` datetime NOT NULL,
  `RegisteredTimeStamp` int(15) NOT NULL,
  `Sex` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL,
  `CompanyID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `Account`, `Password`, `NameChi`, `NameEng`, `Email`, `Identify`, `Birth`, `CellPhone`, `CellPhone_Spare`, `HomePhone`, `ResidenceAddress`, `MailingAddress`, `DeliveryAddress`, `RegisteredTime`, `RegisteredTimeStamp`, `Sex`, `CountryID`, `CompanyID`) VALUES
(9, 'shijie', 'kiet1234', '黃仕杰', 'Huang Shi-Jie', 'kiettam1234@gamil.com', 'H123456789', '1997-08-20', '0912-345-678', NULL, '03-1234567', '330-12 桃園市桃園區嘿嘿街1號', '220-34 新北市板橋區哈哈街2號', '220-56 新北市板橋區嗚嗚街3號', '2017-12-12 16:00:00', 2147483647, '1', 886, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `Departments`
--

CREATE TABLE `Departments` (
  `DepartmentID` int(10) NOT NULL,
  `NameChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NameEng` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ExtensionNum` int(10) NOT NULL,
  `FaxPhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CompanyID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `FollowProducts`
--

CREATE TABLE `FollowProducts` (
  `FollowID` int(10) NOT NULL,
  `ProductID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Images`
--

CREATE TABLE `Images` (
  `ImageID` int(10) NOT NULL,
  `ImageName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ImageType` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ImageSize` int(10) NOT NULL,
  `UploadTime` datetime NOT NULL,
  `UploadTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StickyImage` tinyint(1) NOT NULL,
  `Permission` tinyint(1) NOT NULL,
  `AlbumID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Permissions`
--

CREATE TABLE `Permissions` (
  `PermissionsID＿AI` int(10) NOT NULL,
  `Path` enum('Message','QRCode') COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `CustomerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `PolicyContent`
--

CREATE TABLE `PolicyContent` (
  `PolicyID` int(11) NOT NULL,
  `Content` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Products`
--

CREATE TABLE `Products` (
  `ProductID` int(10) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(10) NOT NULL,
  `PictureName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LikeNum` int(10) NOT NULL,
  `SortID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `Sorts`
--

CREATE TABLE `Sorts` (
  `SortID` int(10) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`AlbumID`);

--
-- 資料表索引 `Areas`
--
ALTER TABLE `Areas`
  ADD PRIMARY KEY (`AreaID`);

--
-- 資料表索引 `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`CompanyID`);

--
-- 資料表索引 `Counties`
--
ALTER TABLE `Counties`
  ADD PRIMARY KEY (`CountyID`);

--
-- 資料表索引 `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`CountryID`);

--
-- 資料表索引 `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- 資料表索引 `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- 資料表索引 `FollowProducts`
--
ALTER TABLE `FollowProducts`
  ADD PRIMARY KEY (`FollowID`);

--
-- 資料表索引 `Images`
--
ALTER TABLE `Images`
  ADD PRIMARY KEY (`ImageID`);

--
-- 資料表索引 `Permissions`
--
ALTER TABLE `Permissions`
  ADD PRIMARY KEY (`PermissionsID＿AI`);

--
-- 資料表索引 `PolicyContent`
--
ALTER TABLE `PolicyContent`
  ADD PRIMARY KEY (`PolicyID`);

--
-- 資料表索引 `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`);

--
-- 資料表索引 `Sorts`
--
ALTER TABLE `Sorts`
  ADD PRIMARY KEY (`SortID`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `Albums`
--
ALTER TABLE `Albums`
  MODIFY `AlbumID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Companies`
--
ALTER TABLE `Companies`
  MODIFY `CompanyID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Counties`
--
ALTER TABLE `Counties`
  MODIFY `CountyID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用資料表 AUTO_INCREMENT `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `FollowProducts`
--
ALTER TABLE `FollowProducts`
  MODIFY `FollowID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Images`
--
ALTER TABLE `Images`
  MODIFY `ImageID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Permissions`
--
ALTER TABLE `Permissions`
  MODIFY `PermissionsID＿AI` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `PolicyContent`
--
ALTER TABLE `PolicyContent`
  MODIFY `PolicyID` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Products`
--
ALTER TABLE `Products`
  MODIFY `ProductID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Sorts`
--
ALTER TABLE `Sorts`
  MODIFY `SortID` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
