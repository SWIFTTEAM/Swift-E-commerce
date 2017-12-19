-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 12 月 19 日 13:44
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
  `CountyID` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Areas`
--

INSERT INTO `Areas` (`AreaID`, `AreaChiName`, `AreaEngName`, `CountyID`) VALUES
(100, '中正區', 'Zhongzheng Dist', '02'),
(103, '大同區', 'Datong Dist', '02'),
(104, '中山區', 'Zhongshan Dist', '02'),
(105, '松山區', 'Songshan Dist', '02'),
(106, '大安區', 'Da’an Dist', '02'),
(108, '萬華區', 'Wanhua Dist', '02'),
(110, '信義區', 'Xinyi Dist', '02'),
(111, '士林區', 'Shilin Dist', '02'),
(112, '北投區', 'Beitou Dist', '02'),
(114, '內湖區', 'Neihu Dist', '02'),
(115, '南港區', 'Nangang Dist', '02'),
(116, '文山區', 'Wenshan Dist', '02'),
(200, '仁愛區', 'Ren’ai Dist', '02'),
(201, '信義區', 'Xinyi Dist', '02'),
(202, '中正區', 'Zhongzheng Dist', '02'),
(203, '中山區', 'Zhongshan Dist', '02'),
(204, '安樂區', 'Anle Dist', '02'),
(205, '暖暖區', 'Nuannuan Dist', '02'),
(206, '七堵區', 'Qidu Dist', '02'),
(207, '萬里區', 'Wanli Dist', '02'),
(208, '金山區', 'Jinshan Dist', '02'),
(209, '南竿鄉', 'Nangan Township', '0836'),
(210, '北竿鄉', 'Beigan Township', '0836'),
(211, '莒光鄉', 'Juguang Township', '0836'),
(212, '東引鄉', 'Dongyin Township', '0836'),
(220, '板橋區', 'Banqiao Dist', '02'),
(221, '汐止區', 'Xizhi Dist', '02'),
(222, '深坑區', 'Shenkeng Dist', '02'),
(223, '石碇區', 'Shiding Dist', '02'),
(224, '瑞芳區', 'Ruifang Dist', '02'),
(226, '平溪區', 'Pingxi Dist', '02'),
(227, '雙溪區', 'Shuangxi Dist', '02'),
(228, '貢寮區', 'Gongliao Dist', '02'),
(231, '新店區', 'Xindian Dist', '02'),
(232, '坪林區', 'Pinglin Dist', '02'),
(233, '烏來區', 'Wulai Dist', '02'),
(234, '永和區', 'Yonghe Dist', '02'),
(235, '中和區', 'Zhonghe Dist', '02'),
(236, '土城區', 'Tucheng Dist', '02'),
(237, '三峽區', 'Sanxia Dist', '02'),
(238, '樹林區', 'Shulin Dist', '02'),
(239, '鶯歌區', 'Yingge Dist', '02'),
(241, '三重區', 'Sanchong Dist', '02'),
(242, '新莊區', 'Xinzhuang Dist', '02'),
(243, '泰山區', 'Taishan Dist', '02'),
(244, '林口區', 'Linkou Dist', '02'),
(247, '蘆洲區', 'Luzhou Dist', '02'),
(248, '五股區', 'Wugu Dist', '02'),
(249, '八里區', 'Bali Dist', '02'),
(251, '淡水區', 'Tamsui Dist', '02'),
(252, '三芝區', 'Sanzhi Dist', '02'),
(253, '石門區', 'Shimen Dist', '02'),
(260, '宜蘭市', 'Yilan City', '03'),
(261, '頭城鎮', 'Toucheng Township', '03'),
(262, '礁溪鄉', 'Jiaoxi Township', '03'),
(263, '壯圍鄉', 'Zhuangwei Township', '03'),
(264, '員山鄉', 'Yuanshan Township', '03'),
(265, '羅東鎮', 'Luodong Township', '03'),
(266, '三星鄉', 'Sanxing Township', '03'),
(267, '大同鄉', 'Datong Township', '03'),
(268, '五結鄉', 'Wujie Township', '03'),
(269, '冬山鄉', 'Dongshan Township', '03'),
(270, '蘇澳鎮', 'Su’ao Township', '03'),
(272, '南澳鄉', 'Nan’ao Township', '03'),
(290, '釣魚臺', 'Diauyutai', '03'),
(300, '北區', 'North Dist', '03'),
(302, '竹北市', 'Zhubei City', '03'),
(303, '湖口鄉', 'Hukou Township', '03'),
(304, '新豐鄉', 'Xinfeng Township', '03'),
(305, '新埔鎮', 'Xinpu Township', '03'),
(306, '關西鎮', 'Guanxi Township', '03'),
(307, '芎林鄉', 'Qionglin Township', '03'),
(308, '寶山鄉', 'Baoshan Township', '03'),
(310, '竹東鎮', 'Zhudong Township', '03'),
(311, '五峰鄉', 'Wufeng Township', '03'),
(312, '橫山鄉', 'Hengshan Township', '03'),
(313, '尖石鄉', 'Jianshi Township', '03'),
(314, '北埔鄉', 'Beipu Township', '03'),
(315, '峨眉鄉', 'Emei Township', '03'),
(320, '中壢區', 'Zhongli Dist', '03'),
(324, '平鎮區', 'Pingzhen Dist', '03'),
(325, '龍潭區', 'Longtan Dist', '03'),
(326, '楊梅區', 'Yangmei Dist', '03'),
(327, '新屋區', 'Xinwu Dist', '03'),
(328, '觀音區', 'Guanyin Dist', '03'),
(330, '桃園區', 'Taoyuan Dist', '03'),
(333, '龜山區', 'Guishan Dist', '02'),
(334, '八德區', 'Bade Dist', '03'),
(335, '大溪區', 'Daxi Dist', '03'),
(336, '復興區', 'Fuxing Dist', '03'),
(337, '大園區', 'Dayuan Dist', '03'),
(338, '蘆竹區', 'Luzhu Dist', '03'),
(350, '竹南鎮', 'Zhunan Township', '037'),
(351, '頭份市', 'Toufen City', '037'),
(352, '三灣鄉', 'Sanwan Township', '037'),
(353, '南庄鄉', 'Nanzhuang Township', '037'),
(354, '獅潭鄉', 'Shitan Township', '037'),
(356, '後龍鎮', 'Houlong Township', '037'),
(357, '通霄鎮', 'Tongxiao Township', '037'),
(358, '苑裡鎮', 'Yuanli Township', '037'),
(360, '苗栗市', 'Miaoli City', '037'),
(361, '造橋鄉', 'Zaoqiao Township', '037'),
(362, '頭屋鄉', 'Touwu Township', '037'),
(363, '公館鄉', 'Gongguan Township', '037'),
(364, '大湖鄉', 'Dahu Township', '037'),
(365, '泰安鄉', 'Tai’an Township', '037'),
(366, '銅鑼鄉', 'Tongluo Township', '037'),
(367, '三義鄉', 'Sanyi Township', '037'),
(368, '西湖鄉', 'Xihu Township', '037'),
(369, '卓蘭鎮', 'Zhuolan Township', '037'),
(400, '中區', 'Central Dist', '04'),
(401, '東區', 'East Dist', '04'),
(402, '南區', 'South Dist', '04'),
(403, '西區', 'West Dist', '04'),
(404, '北區', 'North Dist', '04'),
(406, '北屯區', 'Beitun Dist', '04'),
(407, '西屯區', 'Xitun Dist', '04'),
(408, '南屯區', 'Nantun Dist', '04'),
(411, '太平區', 'Taiping Dist', '04'),
(412, '大里區', 'Dali Dist', '04'),
(413, '霧峰區', 'Wufeng Dist', '04'),
(414, '烏日區', 'Wuri Dist', '04'),
(420, '豐原區', 'Fengyuan Dist', '04'),
(421, '后里區', 'Houli Dist', '04'),
(422, '石岡區', 'Shigang Dist', '04'),
(423, '東勢區', 'Dongshi Dist', '04'),
(424, '和平區', 'Heping Dist', '04'),
(426, '新社區', 'Xinshe Dist', '04'),
(427, '潭子區', 'Tanzi Dist', '04'),
(428, '大雅區', 'Daya Dist', '04'),
(429, '神岡區', 'Shengang Dist', '04'),
(432, '大肚區', 'Dadu Dist', '04'),
(433, '沙鹿區', 'Shalu Dist', '04'),
(434, '龍井區', 'Longjing Dist', '04'),
(435, '梧棲區', 'Wuqi Dist', '04'),
(436, '清水區', 'Qingshui Dist', '04'),
(437, '大甲區', 'Dajia Dist', '04'),
(438, '外埔區', 'Waipu Dist', '04'),
(439, '大安區', 'Da’an Dist', '04'),
(500, '彰化市', 'Changhua City', '04'),
(502, '芬園鄉', 'Fenyuan Township', '04'),
(503, '花壇鄉', 'Huatan Township', '04'),
(504, '秀水鄉', 'Xiushui Township', '04'),
(505, '鹿港鎮', 'Lukang Township', '04'),
(506, '福興鄉', 'Fuxing Township', '04'),
(507, '線西鄉', 'Xianxi Township', '04'),
(508, '和美鎮', 'Hemei Township', '04'),
(509, '伸港鄉', 'Shengang Township', '04'),
(510, '員林市', 'Yuanlin City', '04'),
(511, '社頭鄉', 'Shetou Township', '04'),
(512, '永靖鄉', 'Yongjing Township', '04'),
(513, '埔心鄉', 'Puxin Township', '04'),
(514, '溪湖鎮', 'Xihu Township', '04'),
(515, '大村鄉', 'Dacun Township', '04'),
(516, '埔鹽鄉', 'Puyan Township', '04'),
(520, '田中鎮', 'Tianzhong Township', '04'),
(521, '北斗鎮', 'Beidou Township', '04'),
(522, '田尾鄉', 'Tianwei Township', '04'),
(523, '埤頭鄉', 'Pitou Township', '04'),
(524, '溪州鄉', 'Xizhou Township', '04'),
(525, '竹塘鄉', 'Zhutang Township', '04'),
(526, '二林鎮', 'Erlin Township', '04'),
(527, '大城鄉', 'Dacheng Township', '04'),
(528, '芳苑鄉', 'Fangyuan Township', '04'),
(530, '二水鄉', 'Ershui Township', '04'),
(540, '南投市', 'Nantou City', '049'),
(541, '中寮鄉', 'Zhongliao Township', '049'),
(542, '草屯鎮', 'Caotun Township', '049'),
(544, '國姓鄉', 'Guoxing Township', '049'),
(545, '埔里鎮', 'Puli Township', '049'),
(546, '仁愛鄉', 'Ren’ai Township', '049'),
(551, '名間鄉', 'Mingjian Township', '049'),
(552, '集集鎮', 'Jiji Township', '049'),
(553, '水里鄉', 'Shuili Township', '049'),
(555, '魚池鄉', 'Yuchi Township', '049'),
(556, '信義鄉', 'Xinyi Township', '049'),
(557, '竹山鎮', 'Zhushan Township', '049'),
(558, '鹿谷鄉', 'Lugu Township', '049'),
(600, '東區', 'East Dist', '05'),
(602, '番路鄉', 'Fanlu Township', '05'),
(603, '梅山鄉', 'Meishan Township', '05'),
(604, '竹崎鄉', 'Zhuqi Township', '05'),
(605, '阿里山鄉', 'Alishan Township', '05'),
(606, '中埔鄉', 'Zhongpu Township', '05'),
(607, '大埔鄉', 'Dapu Township', '05'),
(608, '水上鄉', 'Shuishang Township', '05'),
(611, '鹿草鄉', 'Lucao Township', '05'),
(612, '太保市', 'Taibao City', '05'),
(613, '朴子市', 'Puzi City', '05'),
(614, '東石鄉', 'Dongshi Township', '05'),
(615, '六腳鄉', 'Liujiao Township', '05'),
(616, '新港鄉', 'Xingang Township', '05'),
(621, '民雄鄉', 'Minxiong Township', '05'),
(622, '大林鎮', 'Dalin Township', '05'),
(623, '溪口鄉', 'Xikou Township', '05'),
(624, '義竹鄉', 'Yizhu Township', '05'),
(625, '布袋鎮', 'Budai Township', '05'),
(630, '斗南鎮', 'Dounan Township', '05'),
(631, '大埤鄉', 'Dapi Township', '05'),
(632, '虎尾鎮', 'Huwei Township', '05'),
(633, '土庫鎮', 'Tuku Township', '05'),
(634, '褒忠鄉', 'Baozhong Township', '05'),
(635, '東勢鄉', 'Dongshi Township', '05'),
(636, '臺西鄉', 'Taixi Township', '05'),
(637, '崙背鄉', 'Lunbei Township', '05'),
(638, '麥寮鄉', 'Mailiao Township', '05'),
(640, '斗六市', 'Douliu City', '05'),
(643, '林內鄉', 'Linnei Township', '05'),
(646, '古坑鄉', 'Gukeng Township', '05'),
(647, '莿桐鄉', 'Citong Township', '05'),
(648, '西螺鎮', 'Xiluo Township', '05'),
(649, '二崙鄉', 'Erlun Township', '05'),
(651, '北港鎮', 'Beigang Township', '05'),
(652, '水林鄉', 'Shuilin Township', '05'),
(653, '口湖鄉', 'Kouhu Township', '05'),
(654, '四湖鄉', 'Sihu Township', '05'),
(655, '元長鄉', 'Yuanchang Township', '05'),
(700, '中西區', 'West Central Dist', '06'),
(701, '東區', 'East Dist', '06'),
(702, '南區', 'South Dist', '06'),
(704, '北區', 'North Dist', '06'),
(708, '安平區', 'Anping Dist', '06'),
(709, '安南區', 'Annan Dist', '06'),
(710, '永康區', 'Yongkang Dist', '06'),
(711, '歸仁區', 'Guiren Dist', '06'),
(712, '新化區', 'Xinhua Dist', '06'),
(713, '左鎮區', 'Zuozhen Dist', '06'),
(714, '玉井區', 'Yujing Dist', '06'),
(715, '楠西區', 'Nanxi Dist', '06'),
(716, '南化區', 'Nanhua Dist', '06'),
(717, '仁德區', 'Rende Dist', '06'),
(718, '關廟區', 'Guanmiao Dist', '06'),
(719, '龍崎區', 'Longqi Dist', '06'),
(720, '官田區', 'Guantian Dist', '06'),
(721, '麻豆區', 'Madou Dist', '06'),
(722, '佳里區', 'Jiali Dist', '06'),
(723, '西港區', 'Xigang Dist', '06'),
(724, '七股區', 'Qigu Dist', '06'),
(725, '將軍區', 'Jiangjun Dist', '06'),
(726, '學甲區', 'Xuejia Dist', '06'),
(727, '北門區', 'Beimen Dist', '06'),
(730, '新營區', 'Xinying Dist', '06'),
(731, '後壁區', 'Houbi Dist', '06'),
(732, '白河區', 'Baihe Dist', '06'),
(733, '東山區', 'Dongshan Dist', '06'),
(734, '六甲區', 'Liujia Dist', '06'),
(735, '下營區', 'Xiaying Dist', '06'),
(736, '柳營區', 'Liuying Dist', '06'),
(737, '鹽水區', 'Yanshui Dist', '06'),
(741, '善化區', 'Shanhua Dist', '06'),
(742, '大內區', 'Danei Dist', '06'),
(743, '山上區', 'Shanshang Dist', '06'),
(744, '新市區', 'Xinshi Dist', '06'),
(745, '安定區', 'Anding Dist', '06'),
(800, '新興區', 'Xinxing Dist', '07'),
(801, '前金區', 'Qianjin Dist', '07'),
(802, '苓雅區', 'Lingya Dist', '07'),
(803, '鹽埕區', 'Yancheng Dist', '07'),
(804, '鼓山區', 'Gushan Dist', '07'),
(805, '旗津區', 'Qijin Dist', '07'),
(806, '前鎮區', 'Qianzhen Dist', '07'),
(807, '三民區', 'Sanmin Dist', '07'),
(811, '楠梓區', 'Nanzi Dist', '07'),
(812, '小港區', 'Xiaogang Dist', '07'),
(813, '左營區', 'Zuoying Dist', '07'),
(814, '仁武區', 'Renwu Dist', '07'),
(815, '大社區', 'Dashe Dist', '07'),
(817, '東沙群島', 'Dongsha Islands', '07'),
(819, '南沙群島', 'Nansha Islands', '07'),
(820, '岡山區', 'Gangshan Dist', '07'),
(821, '路竹區', 'Luzhu Dist', '07'),
(822, '阿蓮區', 'Alian Dist', '07'),
(823, '田寮區', 'Tianliao Dist', '07'),
(824, '燕巢區', 'Yanchao Dist', '07'),
(825, '橋頭區', 'Qiaotou Dist', '07'),
(826, '梓官區', 'Ziguan Dist', '07'),
(827, '彌陀區', 'Mituo Dist', '07'),
(828, '永安區', 'Yong’an Dist', '07'),
(829, '湖內區', 'Hunei Dist', '07'),
(830, '鳳山區', 'Fengshan Dist', '07'),
(831, '大寮區', 'Daliao Dist', '07'),
(832, '林園區', 'Linyuan Dist', '07'),
(833, '鳥松區', 'Niaosong Dist', '07'),
(840, '大樹區', 'Dashu Dist', '07'),
(842, '旗山區', 'Qishan Dist', '07'),
(843, '美濃區', 'Meinong Dist', '07'),
(844, '六龜區', 'Liugui Dist', '07'),
(845, '內門區', 'Neimen Dist', '07'),
(846, '杉林區', 'Shanlin Dist', '07'),
(847, '甲仙區', 'Jiaxian Dist', '07'),
(848, '桃源區', 'Taoyuan Dist', '07'),
(849, '那瑪夏區', 'Namaxia Dist', '07'),
(851, '茂林區', 'Maolin Dist', '07'),
(852, '茄萣區', 'Qieding Dist', '07'),
(880, '馬公市', 'Magong City', '05'),
(881, '西嶼鄉', 'Xiyu Township', '05'),
(882, '望安鄉', 'Wang’an Township', '05'),
(883, '七美鄉', 'Qimei Township', '05'),
(884, '白沙鄉', 'Baisha Township', '05'),
(885, '湖西鄉', 'Huxi Township', '05'),
(890, '金沙鎮', 'Jinsha Township', '082'),
(891, '金湖鎮', 'Jinhu Township', '082'),
(892, '金寧鄉', 'Jinning Township', '082'),
(893, '金城鎮', 'Jincheng Township', '082'),
(894, '烈嶼鄉', 'Lieyu Township', '082'),
(896, '烏坵鄉', 'Wuqiu Township', '082'),
(900, '屏東市', 'Pingtung City', '08'),
(901, '三地門鄉', 'Sandimen Township', '08'),
(902, '霧臺鄉', 'Wutai Township', '08'),
(903, '瑪家鄉', 'Majia Township', '08'),
(904, '九如鄉', 'Jiuru Township', '08'),
(905, '里港鄉', 'Ligang Township', '08'),
(906, '高樹鄉', 'Gaoshu Township', '08'),
(907, '鹽埔鄉', 'Yanpu Township', '08'),
(908, '長治鄉', 'Changzhi Township', '08'),
(909, '麟洛鄉', 'Linluo Township', '08'),
(911, '竹田鄉', 'Zhutian Township', '08'),
(912, '內埔鄉', 'Neipu Township', '08'),
(913, '萬丹鄉', 'Wandan Township', '08'),
(920, '潮州鎮', 'Chaozhou Township', '08'),
(921, '泰武鄉', 'Taiwu Township', '08'),
(922, '來義鄉', 'Laiyi Township', '08'),
(923, '萬巒鄉', 'Wanluan Township', '08'),
(924, '崁頂鄉', 'Kanding Township', '08'),
(925, '新埤鄉新埤鄉', 'Xinpi Township', '08'),
(926, '南州鄉', 'Nanzhou Township', '08'),
(927, '林邊鄉', 'Linbian Township', '08'),
(928, '東港鎮', 'Donggang Township', '08'),
(929, '琉球鄉', 'Liuqiu Township', '08'),
(931, '佳冬鄉', 'Jiadong Township', '08'),
(932, '新園鄉', 'Xinyuan Township', '08'),
(940, '枋寮鄉', 'Fangliao Township', '08'),
(941, '枋山鄉', 'Fangshan Township', '08'),
(942, '春日鄉', 'Chunri Township', '08'),
(943, '獅子鄉', 'Shizi Township', '08'),
(944, '車城鄉', 'Checheng Township', '08'),
(945, '牡丹鄉', 'Mudan Township', '08'),
(946, '恆春鎮', 'Hengchun Township', '08'),
(947, '滿州鄉', 'Manzhou Township', '08'),
(950, '臺東市', 'Taitung City', '089'),
(951, '綠島鄉', 'Ludao Township', '089'),
(952, '蘭嶼鄉', 'Lanyu Township', '089'),
(953, '延平鄉', 'Yanping Township', '089'),
(954, '卑南鄉', 'Beinan Township', '089'),
(955, '鹿野鄉', 'Luye Township', '089'),
(956, '關山鎮', 'Guanshan Township', '089'),
(957, '海端鄉', 'Haiduan Township', '089'),
(958, '池上鄉', 'Chishang Township', '089'),
(959, '東河鄉', 'Donghe Township', '089'),
(961, '成功鎮', 'Chenggong Township', '089'),
(962, '長濱鄉', 'Changbin Township', '089'),
(963, '太麻里鄉', 'Taimali Township', '089'),
(964, '金峰鄉', 'Jinfeng Township', '089'),
(965, '大武鄉', 'Dawu Township', '089'),
(966, '達仁鄉', 'Daren Township', '089'),
(970, '花蓮市', 'Hualien City', '03'),
(971, '新城鄉', 'Xincheng Township', '03'),
(972, '秀林鄉', 'Xiulin Township', '03'),
(973, '吉安鄉', 'Ji’an Township', '03'),
(974, '壽豐鄉', 'Shoufeng Township', '03'),
(975, '鳳林鎮', 'Fenglin Township', '03'),
(976, '光復鄉', 'Guangfu Township', '03'),
(977, '豐濱鄉', 'Fengbin Township', '03'),
(978, '瑞穗鄉', 'Ruisui Township', '03'),
(979, '萬榮鄉', 'Wanrong Township', '03'),
(981, '玉里鎮', 'Yuli Township', '03'),
(982, '卓溪鄉', 'Zhuoxi Township', '03'),
(983, '富里鄉', 'Fuli Township', '03');

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
  `CountyID_AI` int(10) NOT NULL,
  `CountyID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `CountyChiName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountyEngName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Counties`
--

INSERT INTO `Counties` (`CountyID_AI`, `CountyID`, `CountyChiName`, `CountyEngName`, `CountryID`) VALUES
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
  ADD PRIMARY KEY (`CountyID_AI`);

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
-- 資料表索引 `Images`
--
ALTER TABLE `Images`
  ADD PRIMARY KEY (`ImageID`);

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
  MODIFY `CountyID_AI` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用資料表 AUTO_INCREMENT `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `Images`
--
ALTER TABLE `Images`
  MODIFY `ImageID` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
