-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 12 月 12 日 09:39
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
  `CreateTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

-- --------------------------------------------------------

--
-- 資料表結構 `Companies`
--

CREATE TABLE `Companies` (
  `CompanyID` int(10) NOT NULL,
  `CompanyName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CompanyAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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
  `CountyChiName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountyEngName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `HomePhone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ResidenceAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MailingAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DeliveryAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisteredTime` datetime NOT NULL,
  `RegisteredTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sex` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL,
  `CompanyID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `Account`, `Password`, `NameChi`, `NameEng`, `Email`, `Identify`, `Birth`, `CellPhone`, `HomePhone`, `ResidenceAddress`, `MailingAddress`, `DeliveryAddress`, `RegisteredTime`, `RegisteredTimeStamp`, `Sex`, `CountryID`, `CompanyID`) VALUES
(9, 'shijie', 'kiet1234', '黃仕杰', 'Huang Shi-Jie', 'kiettam1234@gamil.com', 'H123456789', '1997-08-20', '0912-345-678', '03-1234567', '330-12 桃園市桃園區嘿嘿街1號', '220-34 新北市板橋區哈哈街2號', '220-56 新北市板橋區嗚嗚街3號', '2017-12-12 16:00:00', '2017-12-12 08:38:16', '1', 886, NULL);

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
