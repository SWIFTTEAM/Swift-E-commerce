-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 11 月 15 日 13:19
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
  `CompanyAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL
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

-- --------------------------------------------------------

--
-- 資料表結構 `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(10) NOT NULL,
  `CustomerAccount` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerPassword` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerEmail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerIdentify` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerBirth` date NOT NULL,
  `CustomerPhone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerResidenceAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerMailingAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerSex` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  `CountryID` int(10) NOT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `StickyName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 已匯出資料表的索引
--

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
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `Companies`
--
ALTER TABLE `Companies`
  MODIFY `CompanyID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Counties`
--
ALTER TABLE `Counties`
  MODIFY `CountyID` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
