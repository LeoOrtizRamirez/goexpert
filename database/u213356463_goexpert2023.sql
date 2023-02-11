-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-02-2023 a las 15:53:31
-- Versión del servidor: 10.5.15-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u213356463_goexpert2023`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_banners`
--

CREATE TABLE `netw_banners` (
  `bnid` int(12) NOT NULL,
  `bndate` date DEFAULT '2000-01-01',
  `bnfile` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `bntitle` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `bngrid` int(11) DEFAULT 0,
  `bnppid` int(12) NOT NULL DEFAULT 0,
  `bnorder` int(12) DEFAULT 0,
  `bnstatus` tinyint(1) DEFAULT 1,
  `bntoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bnadminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_baseplan`
--

CREATE TABLE `netw_baseplan` (
  `bpid` int(12) NOT NULL,
  `maxwidth` int(9) DEFAULT 0,
  `maxdepth` int(9) DEFAULT 2,
  `currencysym` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'JmRvbGxhcjs=',
  `currencycode` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `pay_emailname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pay_emailaddr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `bptoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_baseplan`
--

INSERT INTO `netw_baseplan` (`bpid`, `maxwidth`, `maxdepth`, `currencysym`, `currencycode`, `pay_emailname`, `pay_emailaddr`, `bptoken`) VALUES
(1, 0, 20, 'JA==', 'USD', 'Goexpert Digital', 'noreply@goexpert.digital', '|remindreg:3|, |isgenview:|, |isrecognzfreembr:|');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_configs`
--

CREATE TABLE `netw_configs` (
  `cfgid` tinyint(1) NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `site_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `site_descr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_keywrd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/logo_defaultimage.png',
  `site_emailname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `site_emailaddr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `site_phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `site_sosmed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmpny_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cmpny_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmpny_footnote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sitehits` int(12) DEFAULT 0,
  `join_status` tinyint(1) DEFAULT 1,
  `site_status` tinyint(1) DEFAULT 1,
  `site_status_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `langiso` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `admin_user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admimage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/adm_defaultimage.jpg',
  `envacc` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lickey` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowfreembr` tinyint(1) DEFAULT 0,
  `delete_freeafter` int(5) DEFAULT 0,
  `delete_expafter` int(5) DEFAULT 0,
  `multiemail2reg` tinyint(1) DEFAULT 1,
  `ismanualspr` tinyint(1) DEFAULT 0,
  `mbr_defaultimage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/mbr_defaultimage.jpg',
  `mbrmax_image_width` int(4) DEFAULT 100,
  `mbrmax_image_height` int(4) DEFAULT 100,
  `mbrmax_title_char` int(4) DEFAULT 64,
  `mbrmax_descr_char` int(4) DEFAULT 144,
  `getstart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min2payout` float DEFAULT 0,
  `validref` tinyint(1) DEFAULT 0,
  `randref` tinyint(1) DEFAULT 0,
  `defaultref` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `norefredirurl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mbroptref` tinyint(1) DEFAULT 0,
  `wdrawfee` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `cpnywlet` decimal(16,2) DEFAULT 0.00,
  `poolwlet` decimal(16,2) DEFAULT 0.00,
  `time_offset` int(2) DEFAULT 0,
  `dldir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `maxpage` tinyint(3) DEFAULT 15,
  `sodatef` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'j M Y',
  `lodatef` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'D, j M Y H:i:s',
  `maxcookie_days` int(4) DEFAULT 180,
  `treestatus` tinyint(1) DEFAULT 1,
  `treemaxwidth` smallint(9) DEFAULT 0,
  `treemaxdeep` int(12) DEFAULT 0,
  `iscrontask` tinyint(1) DEFAULT 0,
  `badunlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badiplist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bademail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vhitpoint` float DEFAULT 0,
  `fbakpoint` float DEFAULT 0,
  `lginpoint` float DEFAULT 0,
  `emailer` enum('mail','sendmail','smtp') COLLATE utf8mb4_unicode_ci DEFAULT 'mail',
  `smtphost` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpuser` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtppass` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtpencr` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `emailer1` enum('emailer','smtp') COLLATE utf8mb4_unicode_ci DEFAULT 'emailer',
  `smtp1host` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp1user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtp1pass` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtp1encr` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `emailer2` enum('emailer','smtp') COLLATE utf8mb4_unicode_ci DEFAULT 'emailer',
  `smtp2host` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp2user` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtp2pass` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `smtp2encr` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `returnmail` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_admin_on_join` tinyint(1) DEFAULT 0,
  `email_admin_copy_msgs` tinyint(1) DEFAULT 0,
  `isrecaptcha` tinyint(1) DEFAULT 0,
  `rc_securekey` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rc_sitekey` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wcodes1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wcodes1opt` tinyint(1) DEFAULT 0,
  `wcodes2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wcodes2opt` tinyint(1) DEFAULT 0,
  `goanalytics` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `autobackup_days` smallint(5) DEFAULT 0,
  `autobackup_email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `autobackup_date` date DEFAULT '2000-01-01',
  `cfgtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `softversion` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'Release',
  `installdate` date DEFAULT '2000-01-01',
  `installhash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `licdate` datetime DEFAULT '2000-01-01 00:00:01',
  `licstatus` tinyint(1) DEFAULT 0,
  `lichash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cronts` datetime DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_configs`
--

INSERT INTO `netw_configs` (`cfgid`, `site_name`, `site_url`, `site_descr`, `site_keywrd`, `site_logo`, `site_emailname`, `site_emailaddr`, `site_phone`, `site_sosmed`, `cmpny_name`, `cmpny_address`, `cmpny_footnote`, `sitehits`, `join_status`, `site_status`, `site_status_note`, `langiso`, `admin_user`, `admin_password`, `admimage`, `envacc`, `lickey`, `allowfreembr`, `delete_freeafter`, `delete_expafter`, `multiemail2reg`, `ismanualspr`, `mbr_defaultimage`, `mbrmax_image_width`, `mbrmax_image_height`, `mbrmax_title_char`, `mbrmax_descr_char`, `getstart`, `min2payout`, `validref`, `randref`, `defaultref`, `norefredirurl`, `mbroptref`, `wdrawfee`, `cpnywlet`, `poolwlet`, `time_offset`, `dldir`, `maxpage`, `sodatef`, `lodatef`, `maxcookie_days`, `treestatus`, `treemaxwidth`, `treemaxdeep`, `iscrontask`, `badunlist`, `badiplist`, `bademail`, `vhitpoint`, `fbakpoint`, `lginpoint`, `emailer`, `smtphost`, `smtpuser`, `smtppass`, `smtpencr`, `emailer1`, `smtp1host`, `smtp1user`, `smtp1pass`, `smtp1encr`, `emailer2`, `smtp2host`, `smtp2user`, `smtp2pass`, `smtp2encr`, `returnmail`, `email_admin_on_join`, `email_admin_copy_msgs`, `isrecaptcha`, `rc_securekey`, `rc_sitekey`, `wcodes1`, `wcodes1opt`, `wcodes2`, `wcodes2opt`, `goanalytics`, `autobackup_days`, `autobackup_email`, `autobackup_date`, `cfgtoken`, `softversion`, `installdate`, `installhash`, `licdate`, `licstatus`, `lichash`, `cronts`) VALUES
(1, 'GoExpert', 'https://app.goexpert.digital', '', '', '../assets/image/logo_defaultimage.png', '', 'leoordev@gmail.com', '', NULL, '', NULL, NULL, 0, 1, 1, NULL, 'es', 'goexpert', '$2y$10$qkpNzA43.P92rZH.eyVFBuICOTNecTviYO3hb2AcaWRgV7iywpvrG', '../assets/image/adm_defaultimage.jpg', '', 'N2EzZTcxZGEtN2JkZC00ZjJjLTkxNzEtODkxZmMxNDQyMWJl', 0, 0, 0, 1, 0, '../assets/image/mbr_defaultimage.jpg', 100, 100, 64, 144, NULL, 0, 1, 0, '', NULL, 0, '0|0', '0.00', '0.00', 0, '/home/u213356463/domains/goexpert.digital/public_html/app/downloads', 15, 'j M Y', 'D, j M Y H:i:s', 180, 1, 0, 0, 0, '', NULL, NULL, 0, 0, 0, 'mail', '', '', '', '', 'emailer', NULL, '', '', '', 'emailer', NULL, '', '', '', '', 0, 0, 0, '', '', NULL, 0, NULL, 0, '', 0, '', '2000-01-01', '|ccid:25882083|, |licstr:UmVndWxhciBMaWNlbnNl|, |lictype:2083|, |licbyr:aGFyb2xlbXByZW5kZQ==|, |licpk:|, |lichs:7f27bbc747ddc33d738cc69a70b48b3b|, |licdom:YXBwLmdvZXhwZXJ0LmRpZ2l0YWw=|, |licvh:62fd6e4e6639bfe03601453796cddfd9|, |liksrc:|, |lirfsh:2023-01-31 03:33:06|, |lirfshvar:|, |lirfshval:|, |langlist:eyJlbiI6IkVuZ2xpc2giLCJlcyI6IlNwYW5pc2gifQ==|, |site_subname:GoExpert|, |admin_subname:goexpert|, |isautoregplan:0|, |mbrdelopt:0|, |reflinklp:reg|, |unlowercs:1|, |disreflink:|, |diswithdraw:|, |isadvrenew:|, |isregbymbr:|, |isdupemail:|, |ismanspruname:|, |iscookieconsent:0|, |isrcapcregin:|, |isrcapcmbrin:|, |isrcapcadmin:|, |minwalletwdr:50|, |maxwalletwdr:10000|', '3.0.4', '2023-01-31', '1b9c8b7091b0b2da967ceba3d83b8ce5eb12441cf198', '2021-08-18 13:28:23', 0, 'fae25274ea4279c67d8a11e1f2b7081c', '2023-02-11 10:29:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_files`
--

CREATE TABLE `netw_files` (
  `flid` int(12) NOT NULL,
  `flgrid` int(11) DEFAULT 0,
  `fldate` date DEFAULT '2000-01-01',
  `flupdate` date DEFAULT '2000-01-01',
  `flpath` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fldescr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flsize` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT '0 Bytes',
  `fldlcount` int(12) DEFAULT 0,
  `flimage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/file_defaultimage.jpg',
  `flsticky` tinyint(1) DEFAULT 0,
  `flavalto` tinyint(1) DEFAULT 1,
  `flppids` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `flstatus` tinyint(1) DEFAULT 1,
  `fltoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_groups`
--

CREATE TABLE `netw_groups` (
  `grid` int(11) NOT NULL,
  `grtype` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `grtitle` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `groptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grorder` int(11) DEFAULT 0,
  `grtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gradminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_groups`
--

INSERT INTO `netw_groups` (`grid`, `grtype`, `grtitle`, `groptions`, `grorder`, `grtoken`, `gradminfo`) VALUES
(1, 'content', 'Marketing', NULL, 0, NULL, NULL),
(2, 'content', 'Social Media', NULL, 0, NULL, NULL),
(3, 'content', 'Trafficker', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_invoices`
--

CREATE TABLE `netw_invoices` (
  `invid` int(11) NOT NULL,
  `invdate` datetime DEFAULT '2000-01-01 00:00:01',
  `invoiceid` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `invtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invstatus` tinyint(1) DEFAULT 0,
  `invusein` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `invlast` datetime DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_mbrplans`
--

CREATE TABLE `netw_mbrplans` (
  `mpid` int(12) NOT NULL,
  `idhostmbr` int(12) DEFAULT 0 COMMENT 'based on member main mpid',
  `idmbr` int(12) DEFAULT 0,
  `mppid` int(11) DEFAULT 1 COMMENT 'based on payplan ppid',
  `isdefault` tinyint(1) DEFAULT 1,
  `reg_date` date DEFAULT '2000-01-01',
  `reg_expd` date DEFAULT '2000-01-01',
  `reg_utctime` datetime DEFAULT '2000-01-01 00:00:01',
  `reg_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reg_fee` decimal(16,2) DEFAULT 0.00,
  `renew_fee` decimal(16,2) DEFAULT 0.00,
  `mpstatus` tinyint(1) DEFAULT 1 COMMENT '0:inactive, 1:active, 2:expired, 3:pending',
  `hostspr` int(12) DEFAULT 0 COMMENT 'based on sponsor mpid',
  `idref` int(12) DEFAULT 0,
  `idspr` int(12) DEFAULT 0,
  `sprlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'based on sponsor mpid',
  `mpwidth` int(12) DEFAULT 0,
  `mpdepth` int(12) DEFAULT 0,
  `mprankid` int(11) DEFAULT 0,
  `renewtimes` int(6) DEFAULT 0,
  `recyclingit` smallint(5) DEFAULT 0,
  `cyclingbyid` int(12) DEFAULT 0,
  `rmdexp` tinyint(1) DEFAULT 0,
  `mptoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpadminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_mbrplans`
--

INSERT INTO `netw_mbrplans` (`mpid`, `idhostmbr`, `idmbr`, `mppid`, `isdefault`, `reg_date`, `reg_expd`, `reg_utctime`, `reg_ip`, `reg_fee`, `renew_fee`, `mpstatus`, `hostspr`, `idref`, `idspr`, `sprlist`, `mpwidth`, `mpdepth`, `mprankid`, `renewtimes`, `recyclingit`, `cyclingbyid`, `rmdexp`, `mptoken`, `mpadminfo`) VALUES
(1, 0, 1, 1, 1, '2023-01-30', '2023-03-01', '2023-01-30 16:05:21', '2800:e2:c880:15b3:744d:97d1:f61f', '297.00', '97.00', 1, 0, 2, 2, '|1:2|, |2:0|', NULL, NULL, 0, 0, 0, 0, 0, '|isinitpay:1|', ''),
(2, 0, 2, 1, 1, '2023-01-30', '2023-03-01', '2023-01-30 18:18:13', '2800:e2:c780:8a4:5412:6c30:8da2:', '297.00', '97.00', 1, 2, 0, 0, '|1:0|, |2:0|', NULL, NULL, 0, 0, 0, 0, 0, '|isinitpay:1|', NULL),
(3, 0, 3, 1, 1, '2023-01-30', '2023-03-01', '2023-01-30 23:58:07', '2800:e2:c780:8a4:4c8f:82bc:c987:', '297.00', '97.00', 1, 0, 0, 0, '|1:0|, |2:0|', 0, 20, 0, 0, 0, 0, 0, '|isinitpay:1|', NULL),
(4, 0, 4, 1, 1, '2023-02-06', '2023-03-08', '2023-02-06 13:59:53', '2800:e2:c780:35c8:299b:e711:ae24', '297.00', '97.00', 1, 0, 0, 0, '|1:0|, |2:0|', 0, 20, 0, 0, 0, 0, 0, '|isinitpay:1|', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_mbrs`
--

CREATE TABLE `netw_mbrs` (
  `id` int(12) NOT NULL,
  `in_date` datetime DEFAULT '2000-01-01 00:00:01',
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `byname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mbrsite_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mbrsite_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mbrsite_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mbrsite_cat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mbrsite_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/site_defaultimage.jpg',
  `mbrsite_hit` int(12) DEFAULT 0,
  `showsite` tinyint(1) DEFAULT 1,
  `mbr_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/mbr_defaultimage.jpg',
  `mbr_intro` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mbr_sosmed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mylang` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `optinme` tinyint(1) DEFAULT 1,
  `hits` int(12) DEFAULT 0,
  `log_date` datetime DEFAULT '2000-01-01 00:00:01',
  `log_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `taglabel` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mbrstatus` tinyint(1) DEFAULT 1 COMMENT '0:inactive, 1:active, 2:limited, 3:pending',
  `isconfirm` tinyint(1) DEFAULT 1,
  `ewallet` decimal(16,2) DEFAULT 0.00,
  `epoint` float DEFAULT 0,
  `mbrtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceid` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_mbrs`
--

INSERT INTO `netw_mbrs` (`id`, `in_date`, `firstname`, `lastname`, `username`, `byname`, `email`, `password`, `mbrsite_url`, `mbrsite_title`, `mbrsite_desc`, `mbrsite_cat`, `mbrsite_img`, `mbrsite_hit`, `showsite`, `mbr_image`, `mbr_intro`, `mbr_sosmed`, `phone`, `address`, `state`, `country`, `mylang`, `optinme`, `hits`, `log_date`, `log_ip`, `taglabel`, `mbrstatus`, `isconfirm`, `ewallet`, `epoint`, `mbrtoken`, `adminfo`, `deviceid`) VALUES
(1, '2023-01-30 15:59:17', 'leo', 'ortiz', 'leoordev', '', 'leoordev@gmail.com', '$2y$10$EHmUfGZrIXGOUAEbOeYXUurJ6nsrNIbhAwlRSLXbwHANZqkavFnoq', '', '', '', '-', '../assets/image/site_defaultimage.jpg', 0, 1, NULL, '', '|mbr_twitter:|, |mbr_facebook:|', '', '', '', 'CO', 'es', 1, 0, '2023-01-30 18:45:27', '2800:e2:c880:15b3:744d:97d1:f61f', '', 1, 1, '0.00', 0, NULL, '', ''),
(2, '2023-01-30 18:18:12', 'Luz', 'Ortiz', 'Mastergoexpert', '', 'goexpertdigital@gmail.com', '$2y$10$TpPQ8pNw.Bs2xrFYTfWmBuTm5yDO7mRcPzG2RfEcBqplgH3G/hdzm', '', '', '', '-', '../assets/image/site_defaultimage.jpg', 0, 1, '../assets/image/mbr_defaultimage.jpg', '', '|mbr_twitter:|, |mbr_facebook:|', '', '', '', 'CO', 'en', 1, 6, '2023-01-30 18:19:34', '2800:e2:c780:8a4:5412:6c30:8da2:', '', 1, 1, '0.00', 0, NULL, NULL, ''),
(3, '2023-01-30 19:48:33', 'Harol', 'Garcia', 'Harolgarcia', '', 'harolemprende@gmail.com', '$2y$10$9YkDm.XSlQs.iKsvMX.Zi.1ut.Ox8A5vgwzVzoj0SMcpPn7s.2A72', '', '', NULL, '', '../assets/image/site_defaultimage.jpg', 0, 1, '../assets/image/mbr_defaultimage.jpg', NULL, NULL, '', NULL, '', 'CO', 'en', 1, 0, '2023-02-10 13:11:39', '2800:e2:c780:8a4:5412:6c30:8da2:', '', 1, 1, '0.00', 0, NULL, NULL, ''),
(4, '2023-02-06 13:59:41', 'Mauricio', 'Giraldo', 'goexpert', '', 'giraldo.mauricio97@gmail.com', '$2y$10$1z8MKSiVqcPUl/IFBOjaHO7u1fRav7zxyB/ILa7GhvCDT4PizTDeu', '', '', NULL, '', '../assets/image/site_defaultimage.jpg', 0, 1, '../assets/image/mbr_defaultimage.jpg', NULL, NULL, '', NULL, '', 'CO', 'es', 1, 1, '2023-02-11 10:29:48', '2800:e2:c780:35c8:299b:e711:ae24', '', 1, 1, '0.00', 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_modules`
--

CREATE TABLE `netw_modules` (
  `mdid` int(11) NOT NULL,
  `mdgrid` int(11) NOT NULL,
  `mdtitle` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_modules`
--

INSERT INTO `netw_modules` (`mdid`, `mdgrid`, `mdtitle`) VALUES
(1, 3, 'Inducción Traffiker'),
(2, 4, 'Inducción Social Media'),
(3, 3, 'Modulo 1'),
(4, 3, 'Modulo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_notifytpl`
--

CREATE TABLE `netw_notifytpl` (
  `ntid` int(11) NOT NULL,
  `ntcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ntname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ntdesc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ntpid` int(11) DEFAULT 0,
  `ntsubject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nttext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nthtml` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ntsms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ntpush` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ntoptions` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '|email:0|, |sms:0|, |pushmsg:0|',
  `nttoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_notifytpl`
--

INSERT INTO `netw_notifytpl` (`ntid`, `ntcode`, `ntname`, `ntdesc`, `ntpid`, `ntsubject`, `nttext`, `nthtml`, `ntsms`, `ntpush`, `ntoptions`, `nttoken`) VALUES
(1, 'mbr_reg', 'Welcome Message', 'Notification send after member registration success', 0, '[[firstname]], thank you for register!', 'Hello [[firstname]],\r\n\r\nWelcome and thank you for registering!\r\n\r\nYour Account Details:\r\nName: [[fullname]]\r\nEmail: [[email]]\r\nUsername: [[username]]\r\nPassword: [[rawpassword]]\r\n\r\nPlease login to your member area at [[login_url]]\r\n\r\n\r\nBest Regards,\r\n[[site_name]]\r\n', '<p>Hello [[firstname]],</p>\r\n\r\n<p><b>Welcome and thank you for registering!</b></p>\r\n\r\n<p>Your Account Details:<br>\r\nName: [[fullname]]<br>\r\nEmail: [[email]]<br>\r\nUsername: [[username]]<br>\r\nPassword: [[rawpassword]]</p>\r\n\r\n<p>Please login to your member area at [[login_url]]</p>\r\n\r\n<p><br>\r\nBest Regards,<br>\r\n[[site_name]]<br>\r\n&nbsp;</p>\r\n', 'Welcome [[username]], thank you for registering!', 'Welcome [[username]], thank you for registering!', '|email:1|, |sms:0|, |pushmsg:0|', NULL),
(2, 'mbr_newdl', 'New Referral Signup', 'Notification send to member each time their new referral signup', 0, '[[firstname]], New Referral Signup!', 'Hi [[firstname]],\r\n\r\nCongratulations, new referral signup:\r\nName: [[dln_fullname]]\r\nUsername: [[dln_username]]\r\n\r\nKeep up the good work.\r\nBest Regards,\r\n\r\n[[site_name]]\r\n\r\n---\r\nYour email address is [[email]]', '<p>Hi [[firstname]],</p>\r\n\r\n<p><strong>Congratulations</strong>, new referral signup:</p>\r\n\r\n<p>Name: [[dln_fullname]]<br>\r\nUsername: [[dln_username]]</p>\r\n\r\n<p><br>\r\nKeep up the good work.<br>\r\nBest Regards,</p><p>[[site_name]]<br></p>\r\n\r\n<p>---<br>\r\n<em>Your email address is [[email]]</em><br>\r\n</p>\r\n', 'Congratulations, new referral signup: [[dln_username]]', 'Congratulations, new referral signup: [[dln_username]]', '|email:1|, |sms:0|, |pushmsg:0|', NULL),
(3, 'mbr_resetpass', 'Reset Password Request', 'Notification message send after member request reset password', 0, 'Password Reset Request', 'Hi,\r\n\r\nPlease use the following link to generate new password for your account:\r\n\r\n[[passwordreset_url]]\r\n\r\nBest Regards,\r\n\r\n---\r\nIf you didn\'t make any request for a password reset recently, please contact us!', '<p>Hi,</p><p>Please use the following link to generate new password for your account:</p>\r\n\r\n<p>[[passwordreset_url]]</p>\r\n\r\n<p><br>\r\nBest Regards,</p>\r\n\r\n<p>---</p>\r\n\r\n<p><em>If you did not make any request for a password reset recently, please contact us!</em></p>\r\n', '', '', '|email:1|, |sms:0|, |pushmsg:0|', NULL),
(4, 'mbr_newcm', 'New Commission Generated', 'Notification send to member each time they get new commission', 0, '[[firstname]], New Commission: [[ncm_memo]]', 'Hi [[firstname]],\r\n\r\nCongratulations, you got paid!\r\nTransaction: [[ncm_memo]]\r\nAmount: [[ncm_amount]]\r\nReferral: [[dln_username]]\r\n\r\nKeep up the good work.\r\nBest Regards,\r\n\r\n[[site_name]]\r\n\r\n---\r\nYour email address is [[email]]', '<p>Hi [[firstname]],</p>\r\n\r\n<p><strong>Congratulations</strong>, you got paid!</p>\r\n\r\n<p>Transaction: [[ncm_memo]]<br>\r\nAmount: [[ncm_amount]]<br>\r\nReferral: [[dln_username]]</p>\r\n\r\n<p><br>\r\nKeep up the good work.<br>\r\nBest Regards,</p><p>[[site_name]]<br></p>\r\n\r\n<p>---<br>\r\n<em>Your email address is [[email]]</em><br>\r\n</p>\r\n', 'Congratulations, new commission: [[ncm_memo]]', 'Congratulations, new commission: [[ncm_memo]]', '|email:1|, |sms:0|, |pushmsg:0|', NULL),
(5, 'mbr_rereg', 'Renewal Reminder', 'Notification send before member account expired', 0, '[[firstname]], renewal notification!', 'Hello [[firstname]],\r\n\r\nYour account will expire soon!\r\n\r\nAccount Details:\r\nName: [[fullname]]\r\nEmail: [[email]]\r\nUsername: [[username]]\r\n\r\nPlease login to your member area at [[login_url]]\r\n\r\n\r\nBest Regards,\r\n[[site_name]]\r\n', '<p>Hello [[firstname]],</p>\r\n\r\n<p><b>Your account will expire soon!</b></p>\r\n\r\n<p>Your Account Details:<br>\r\nName: [[fullname]]<br>\r\nEmail: [[email]]<br>\r\nUsername: [[username]]</p>\r\n\r\n<p>Please login to your member area at [[login_url]]</p>\r\n\r\n<p><br>\r\nBest Regards,<br>\r\n[[site_name]]<br>\r\n&nbsp;</p>\r\n', 'Renewal [[username]], account will expire soon!', 'Renewal [[username]], account will expire soon!', '|email:1|, |sms:0|, |pushmsg:0|', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_pages`
--

CREATE TABLE `netw_pages` (
  `pgid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pggrid` int(11) DEFAULT 0,
  `pgmdid` int(11) NOT NULL,
  `pgtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pgsubtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pgcontent` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pgavalon` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pgppids` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pgstatus` tinyint(1) DEFAULT NULL,
  `pgmenu` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pgorder` int(10) DEFAULT NULL,
  `pglang` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `pgtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_pages`
--

INSERT INTO `netw_pages` (`pgid`, `pggrid`, `pgmdid`, `pgtitle`, `pgsubtitle`, `pgcontent`, `pgavalon`, `pgppids`, `pgstatus`, `pgmenu`, `pgorder`, `pglang`, `pgtoken`) VALUES
('0', 2, 2, 'BIENVENIDO SOCIAL MEDIA', 'aHR0cHM6Ly9lbmNyeXB0ZWQtdGJuMC5nc3RhdGljLmNvbS9pbWFnZXM/cT10Ym46QU5kOUdjUjRKWFpKVlU1Wm5Nc29CbWlpOXJfbDJrSmpTbzdxNVZZU3B0XzZuRjlyY1Ayb3IzelNtUGxiV3oyWHVDOVJxVkZObkE4JnVzcXA9Q0FV', 'PHA+QklFTlZFTklETyBTT0NJQUwgTUVESUE8YnI+PC9wPg==', '|mbr:0|, |mbpp0:0|, |mbpp1:1|', '\"1\"', 1, 'BIENVENIDO SOCIAL MEDIA', 0, 'es', NULL),
('react', 3, 1, 'REACT', 'aHR0cHM6Ly9lbmNyeXB0ZWQtdGJuMC5nc3RhdGljLmNvbS9pbWFnZXM/cT10Ym46QU5kOUdjUjRKWFpKVlU1Wm5Nc29CbWlpOXJfbDJrSmpTbzdxNVZZU3B0XzZuRjlyY1Ayb3IzelNtUGxiV3oyWHVDOVJxVkZObkE4JnVzcXA9Q0FV', 'PHA+PGlmcmFtZSB3aWR0aD0iNTYwIiBoZWlnaHQ9IjMxNSIgc3JjPSJodHRwczovL3d3dy55b3V0dWJlLmNvbS9lbWJlZC93R3hEZlNXQzRXdyIgdGl0bGU9IllvdVR1YmUgdmlkZW8gcGxheWVyIiBmcmFtZWJvcmRlcj0iMCIgYWxsb3c9ImFjY2VsZXJvbWV0ZXI7IGF1dG9wbGF5OyBjbGlwYm9hcmQtd3JpdGU7IGVuY3J5cHRlZC1tZWRpYTsgZ3lyb3Njb3BlOyBwaWN0dXJlLWluLXBpY3R1cmU7IHdlYi1zaGFyZSIgYWxsb3dmdWxsc2NyZWVuPjwvaWZyYW1lPjxicj48L3A+', '|mbr:0|, |mbpp0:0|, |mbpp1:1|', '\"1\"', 1, 'BIENVENIDO', 0, 'es', NULL),
('REACT2', 3, 1, 'REACT 2', 'aHR0cHM6Ly9lbmNyeXB0ZWQtdGJuMC5nc3RhdGljLmNvbS9pbWFnZXM/cT10Ym46QU5kOUdjUjRKWFpKVlU1Wm5Nc29CbWlpOXJfbDJrSmpTbzdxNVZZU3B0XzZuRjlyY1Ayb3IzelNtUGxiV3oyWHVDOVJxVkZObkE4JnVzcXA9Q0FV', 'PHA+PGlmcmFtZSB3aWR0aD0iNTYwIiBoZWlnaHQ9IjMxNSIgc3JjPSJodHRwczovL3d3dy55b3V0dWJlLmNvbS9lbWJlZC92QXZDY2pTQUdEWSIgdGl0bGU9IllvdVR1YmUgdmlkZW8gcGxheWVyIiBmcmFtZWJvcmRlcj0iMCIgYWxsb3c9ImFjY2VsZXJvbWV0ZXI7IGF1dG9wbGF5OyBjbGlwYm9hcmQtd3JpdGU7IGVuY3J5cHRlZC1tZWRpYTsgZ3lyb3Njb3BlOyBwaWN0dXJlLWluLXBpY3R1cmU7IHdlYi1zaGFyZSIgYWxsb3dmdWxsc2NyZWVuPjwvaWZyYW1lPjxicj48L3A+', '|mbr:1|, |mbpp0:0|, |mbpp1:1|', '\"1\"', 1, 'PRIMER VIDEO', 0, 'es', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_paygates`
--

CREATE TABLE `netw_paygates` (
  `paygid` int(12) NOT NULL,
  `pgidmbr` int(12) DEFAULT 0,
  `pgdatatoken` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypalon` tinyint(1) DEFAULT 0,
  `paypalsubs` tinyint(1) DEFAULT 0,
  `paypalfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `paypalacc` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `paypaltest` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `paypal4usr` tinyint(1) DEFAULT 0,
  `coinpaymentson` tinyint(1) DEFAULT 0,
  `coinpaymentsfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `coinpaymentsmercid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `coinpaymentsipnkey` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `coinpaymentsconfirm` tinyint(1) DEFAULT 1,
  `coinpayments4usr` tinyint(1) DEFAULT 0,
  `paystackon` tinyint(1) DEFAULT 0,
  `paystackfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `paystackpub` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `paystackpin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `paystack4usr` tinyint(1) DEFAULT 0,
  `epinon` tinyint(1) DEFAULT 0,
  `epinsyntax` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `epin4usr` tinyint(1) DEFAULT 0,
  `ewalleton` tinyint(1) DEFAULT 0,
  `ewalletfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ewallet4usr` tinyint(1) DEFAULT 0,
  `manualpayon` tinyint(1) DEFAULT 0,
  `manualpaybtn` tinyint(1) DEFAULT 0,
  `manualpayfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `manualpayname` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manualpayipn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manualpay4usr` tinyint(1) DEFAULT 0,
  `testpayon` tinyint(1) DEFAULT 0,
  `testpayfee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `testpaylabel` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testpay4usr` tinyint(1) DEFAULT 0,
  `paytoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_paygates`
--

INSERT INTO `netw_paygates` (`paygid`, `pgidmbr`, `pgdatatoken`, `paypalon`, `paypalsubs`, `paypalfee`, `paypalacc`, `paypaltest`, `paypal4usr`, `coinpaymentson`, `coinpaymentsfee`, `coinpaymentsmercid`, `coinpaymentsipnkey`, `coinpaymentsconfirm`, `coinpayments4usr`, `paystackon`, `paystackfee`, `paystackpub`, `paystackpin`, `paystack4usr`, `epinon`, `epinsyntax`, `epin4usr`, `ewalleton`, `ewalletfee`, `ewallet4usr`, `manualpayon`, `manualpaybtn`, `manualpayfee`, `manualpayname`, `manualpayipn`, `manualpay4usr`, `testpayon`, `testpayfee`, `testpaylabel`, `testpay4usr`, `paytoken`) VALUES
(1, 0, '|perfectmoneyon:0|, |perfectmoney4usr:0|, |perfectmoneycfg:fHBlcmZlY3Rtb25leWFjYzp8LCB8cGVyZmVjdG1vbmV5bmFtZTp8LCB8cGVyZmVjdG1vbmV5cGFzczp8LCB8cGVyZmVjdG1vbmV5ZmVlOjB8|, |payfaston:0|, |payfast4usr:0|, |payfastcfg:fHBheWZhc3RtZXJjaWQ6fCwgfHBheWZhc3RrZXk6fCwgfHBheWZhc3RmZWU6MHwsIHxwYXlmYXN0c2JveDowfA==|, |paystackon:0|, |paystack4usr:0|, |paystackcfg:fHBheXN0YWNrcHViOnwsIHxwYXlzdGFja3Bpbjp8LCB8cGF5c3RhY2tmZWU6MHw=|, |paypalon:0|, |paypal4usr:0|, |paypalcfg:fHBheXBhbGFjYzp8LCB8cGF5cGFsc2JveDowfCwgfHBheXBhbGZlZTowfA==|, |coinpaymentson:0|, |coinpayments4usr:0|, |coinpaymentscfg:fGNvaW5wYXltZW50c21lcmNpZDp8LCB8Y29pbnBheW1lbnRzaXBua2V5OnwsIHxjb2lucGF5bWVudHNmZWU6MHw=|, |stripeon:0|, |stripe4usr:0|, |stripecfg:fHN0cmlwZW5hbWU6fCwgfHN0cmlwZXBhc3M6fCwgfHN0cmlwZWFjYzp8LCB8c3RyaXBlZmVlOjB8LCB8c3RyaXBlb3B0Y286MXw=|, |ewalleton:0|, |ewalletcfg:fGV3YWxsZXRsYWJlbDp8LCB8ZXdhbGxldGZlZTp8|', 0, 0, '0', '', 'on', 0, 0, '0', '', '', 1, 0, 0, '0', '', '', 0, 0, '', 0, 0, '0', 0, 0, NULL, '0', 'Cash or Bank', 'PHA+UGxlYXNlIHNlbmQgdGhlIHBheW1lbnQgb2YgPGI+W1tjdXJyZW5jeXN5bV1dW1thbW91bnRdXTwvYj4gKyBbW2ZlZWFtb3VudF1dID0gPGI+W1tjdXJyZW5jeXN5bV1dW1t0b3RhbW91bnRdXSBbW2N1cnJlbmN5Y29kZV1dIDwvYj5mb3IgPGI+W1twYXlwbGFuXV08L2I+IHJlZ2lzdHJhdGlvbiB0byB0aGUgZm9sbG93aW5nOjwvcD48cD5BY2NvdW50OiA8Yj4wMTIzNDU2Nzg5PC9iPjxicj5OYW1lOiA8Yj5UaGUgQm9zczwvYj48L3A+PHA+QWZ0ZXIgcGF5bWVudCBjb21wbGV0ZSwgY29uZmlybSB5b3VyIHBheW1lbnQuPC9wPg==', 1, 1, '0', 'Test Payment Sandbox', 0, NULL),
(2, 2, '|perfectmoneycfg:fHBlcmZlY3Rtb25leWFjYzp8|, |payfastcfg:fHBheWZhc3RtZXJjaWQ6fA==|, |stripecfg:fHN0cmlwZWFjYzp8|, |paystackcfg:fHBheXN0YWNrcHViOnw=|, |coinpaymentscfg:fGNvaW5wYXltZW50c21lcmNpZDp8|, |paypalcfg:fHBheXBhbGFjYzp8|', 0, 0, '0', '', 'on', 0, 0, '0', '', '', 1, 0, 0, '0', '', '', 0, 0, '', 0, 0, '0', 0, 0, 0, '0', NULL, '', 0, 0, '0', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_payplans`
--

CREATE TABLE `netw_payplans` (
  `ppid` int(12) NOT NULL,
  `ppbpid` int(12) DEFAULT 1,
  `ppname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `planinfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planlogo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/plan_defaultimage.jpg',
  `planimg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '../assets/image/plan_defaultbg.jpg',
  `dlgroupid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regfee` decimal(16,2) DEFAULT 150.00,
  `renewfee` decimal(16,2) DEFAULT 0.00,
  `expday` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `graceday` tinyint(3) DEFAULT 1,
  `expmbrmovetoid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `limitref` mediumint(8) DEFAULT 0,
  `ifrollupto` tinyint(1) DEFAULT 1,
  `minref2getcm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `cmdayhold` int(4) DEFAULT 0,
  `spillover` tinyint(1) DEFAULT 1,
  `minref4splovr` smallint(5) DEFAULT 0,
  `spill4ver` tinyint(1) DEFAULT 0,
  `matrixfillopt` tinyint(1) DEFAULT 0,
  `matrixcompression` tinyint(1) DEFAULT 1,
  `isrecycling` tinyint(1) DEFAULT 0,
  `recyclingto` int(12) DEFAULT 0,
  `recyclingfee` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recyclingcm` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmdrlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmatchdrlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmlistrnew` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmatchlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmrelist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmatchrelist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rwlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mbrpoint` float DEFAULT 0,
  `sprpointlist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planstatus` tinyint(1) DEFAULT 1,
  `plantorder` int(12) DEFAULT 0,
  `avalpaygates` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customplan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plantoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymupdate` datetime DEFAULT '2000-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_payplans`
--

INSERT INTO `netw_payplans` (`ppid`, `ppbpid`, `ppname`, `planinfo`, `planlogo`, `planimg`, `dlgroupid`, `regfee`, `renewfee`, `expday`, `graceday`, `expmbrmovetoid`, `limitref`, `ifrollupto`, `minref2getcm`, `cmdayhold`, `spillover`, `minref4splovr`, `spill4ver`, `matrixfillopt`, `matrixcompression`, `isrecycling`, `recyclingto`, `recyclingfee`, `recyclingcm`, `cmdrlist`, `cmatchdrlist`, `cmlist`, `cmlistrnew`, `cmatchlist`, `cmrelist`, `cmatchrelist`, `rwlist`, `mbrpoint`, `sprpointlist`, `planstatus`, `plantorder`, `avalpaygates`, `customplan`, `plantoken`, `paymupdate`) VALUES
(1, 1, 'Membresia Pro Full Access', 'Membresia de acceso total para afiliados promotores.', '../assets/image/logo_defaultimage.png', '../assets/image/plan_defaultimage.jpg', NULL, '297.00', '97.00', '30', 3, '', 0, 0, '0', 0, 0, 0, 0, 0, 1, 0, 0, '', NULL, '', NULL, '40%,10%,5%,5%,2%,1%,1%,1%,1%,1%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,', '40%,10%,5%,5%,2%,1%,1%,1%,1%,1%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,0,3%,', NULL, NULL, NULL, '', 0, NULL, 1, 0, NULL, NULL, '|isrenewbywallet:0|, |doreactive:|', '2023-01-30 23:56:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_peppylink`
--

CREATE TABLE `netw_peppylink` (
  `plid` int(12) NOT NULL,
  `pldatetm` datetime DEFAULT '2000-01-01 00:00:00',
  `plupdate` datetime DEFAULT '2000-01-01 00:00:00',
  `plmbrid` int(12) DEFAULT 0,
  `pllid` int(12) DEFAULT 0,
  `pltype` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT 'link',
  `plsrc` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plurl` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plstatus` tinyint(1) DEFAULT 1,
  `pltoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pladminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_points`
--

CREATE TABLE `netw_points` (
  `poid` int(12) NOT NULL,
  `podatetm` datetime DEFAULT '2000-01-01 00:00:01',
  `popoint` float DEFAULT 0,
  `pomemo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pofromid` int(12) DEFAULT 0,
  `potoid` int(12) DEFAULT 0,
  `postatus` tinyint(1) DEFAULT 0,
  `potype` tinyint(1) DEFAULT 0,
  `poppid` int(12) DEFAULT 0,
  `potoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poadminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_ranks`
--

CREATE TABLE `netw_ranks` (
  `rkid` int(11) NOT NULL,
  `rkname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rkinfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rklogo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rktodolist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rkbonuslist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rkppid` int(12) NOT NULL DEFAULT 0,
  `rkstatus` tinyint(1) NOT NULL DEFAULT 0,
  `rktoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rkadminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_sessions`
--

CREATE TABLE `netw_sessions` (
  `sesid` int(11) NOT NULL,
  `sestype` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sesidmbr` int(12) DEFAULT 0,
  `seskey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sestime` int(10) UNSIGNED DEFAULT 0,
  `sesdata` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sestoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_sessions`
--

INSERT INTO `netw_sessions` (`sesid`, `sestype`, `sesidmbr`, `seskey`, `sestime`, `sesdata`, `sestoken`) VALUES
(33, 'member', 3, '$2y$10$RTrPc8G4bbHX0dscYvocsOVecIhdqCrnBxzuVPy9pmfpYYT7R/vga', 1676052699, '|un:harolgarcia|, |ip:2800:e2:c780:8a4:4ebe:c220:553c:234e|', NULL),
(34, 'member', 4, '$2y$10$aAJC9KLR0hFYOuFOxt1bueuDwXklsGD.EufKodpvsmi7gcR.foPLi', 1676129388, '|un:goexpert|, |ip:2800:484:8f89:c92e:994c:8a80:5155:6b74|', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `netw_transactions`
--

CREATE TABLE `netw_transactions` (
  `txid` int(12) NOT NULL,
  `txdatetm` datetime DEFAULT '2000-01-01 00:00:01',
  `txpaytype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `txfromid` int(12) DEFAULT 0,
  `txtoid` int(12) DEFAULT 0,
  `txamount` decimal(16,2) DEFAULT 0.00,
  `txmemo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txbatch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `txtmstamp` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `txinvid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `txppid` int(12) DEFAULT 0,
  `txstatus` tinyint(1) DEFAULT 0,
  `txtoken` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txadminfo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `netw_transactions`
--

INSERT INTO `netw_transactions` (`txid`, `txdatetm`, `txpaytype`, `txfromid`, `txtoid`, `txamount`, `txmemo`, `txbatch`, `txtmstamp`, `txinvid`, `txppid`, `txstatus`, `txtoken`, `txadminfo`) VALUES
(1, '2023-01-30 16:05:21', 'Test Payment Sandbox', 1, 0, '297.00', 'Registration fee', '101-MON16-300522-1', '2023-01-30 16:05:24', '', 1, 1, '|REG:1|, |isapproved:1|', NULL),
(2, '2023-01-30 18:18:13', 'Test Payment Sandbox', 2, 0, '297.00', 'Registration fee', '201-MON18-302055-2', '2023-01-30 18:21:01', '', 1, 1, '|REG:2|, |isapproved:1|', NULL),
(3, '2023-01-30 23:58:07', 'Test Payment Sandbox', 3, 0, '297.00', 'Registration fee', '301-TUE10-312118-3', '2023-01-31 10:21:21', '', 1, 1, '|REG:3|, |isapproved:1|', NULL),
(4, '2023-02-06 13:59:53', 'Test Payment Sandbox', 4, 0, '297.00', 'Registration fee', '402-MON13-065954-4', '2023-02-06 13:59:57', '', 1, 1, '|REG:4|, |isapproved:1|', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `netw_banners`
--
ALTER TABLE `netw_banners`
  ADD PRIMARY KEY (`bnid`);

--
-- Indices de la tabla `netw_baseplan`
--
ALTER TABLE `netw_baseplan`
  ADD PRIMARY KEY (`bpid`);

--
-- Indices de la tabla `netw_configs`
--
ALTER TABLE `netw_configs`
  ADD PRIMARY KEY (`cfgid`);

--
-- Indices de la tabla `netw_files`
--
ALTER TABLE `netw_files`
  ADD PRIMARY KEY (`flid`);

--
-- Indices de la tabla `netw_groups`
--
ALTER TABLE `netw_groups`
  ADD PRIMARY KEY (`grid`);

--
-- Indices de la tabla `netw_invoices`
--
ALTER TABLE `netw_invoices`
  ADD PRIMARY KEY (`invid`);

--
-- Indices de la tabla `netw_mbrplans`
--
ALTER TABLE `netw_mbrplans`
  ADD PRIMARY KEY (`mpid`),
  ADD KEY `idmbr` (`idmbr`,`mppid`,`reg_date`,`idref`);

--
-- Indices de la tabla `netw_mbrs`
--
ALTER TABLE `netw_mbrs`
  ADD PRIMARY KEY (`id`,`username`);

--
-- Indices de la tabla `netw_modules`
--
ALTER TABLE `netw_modules`
  ADD PRIMARY KEY (`mdid`);

--
-- Indices de la tabla `netw_notifytpl`
--
ALTER TABLE `netw_notifytpl`
  ADD PRIMARY KEY (`ntid`);

--
-- Indices de la tabla `netw_pages`
--
ALTER TABLE `netw_pages`
  ADD PRIMARY KEY (`pgid`);

--
-- Indices de la tabla `netw_paygates`
--
ALTER TABLE `netw_paygates`
  ADD PRIMARY KEY (`paygid`),
  ADD KEY `pgidmbr` (`pgidmbr`);

--
-- Indices de la tabla `netw_payplans`
--
ALTER TABLE `netw_payplans`
  ADD PRIMARY KEY (`ppid`);

--
-- Indices de la tabla `netw_peppylink`
--
ALTER TABLE `netw_peppylink`
  ADD PRIMARY KEY (`plid`);

--
-- Indices de la tabla `netw_points`
--
ALTER TABLE `netw_points`
  ADD PRIMARY KEY (`poid`);

--
-- Indices de la tabla `netw_ranks`
--
ALTER TABLE `netw_ranks`
  ADD PRIMARY KEY (`rkid`);

--
-- Indices de la tabla `netw_sessions`
--
ALTER TABLE `netw_sessions`
  ADD PRIMARY KEY (`sesid`),
  ADD KEY `sestype` (`sestype`,`seskey`);

--
-- Indices de la tabla `netw_transactions`
--
ALTER TABLE `netw_transactions`
  ADD PRIMARY KEY (`txid`),
  ADD KEY `txdatetm` (`txdatetm`,`txfromid`,`txtoid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `netw_banners`
--
ALTER TABLE `netw_banners`
  MODIFY `bnid` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_baseplan`
--
ALTER TABLE `netw_baseplan`
  MODIFY `bpid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `netw_configs`
--
ALTER TABLE `netw_configs`
  MODIFY `cfgid` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `netw_files`
--
ALTER TABLE `netw_files`
  MODIFY `flid` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_groups`
--
ALTER TABLE `netw_groups`
  MODIFY `grid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `netw_invoices`
--
ALTER TABLE `netw_invoices`
  MODIFY `invid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_mbrplans`
--
ALTER TABLE `netw_mbrplans`
  MODIFY `mpid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `netw_mbrs`
--
ALTER TABLE `netw_mbrs`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `netw_modules`
--
ALTER TABLE `netw_modules`
  MODIFY `mdid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `netw_notifytpl`
--
ALTER TABLE `netw_notifytpl`
  MODIFY `ntid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `netw_paygates`
--
ALTER TABLE `netw_paygates`
  MODIFY `paygid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `netw_payplans`
--
ALTER TABLE `netw_payplans`
  MODIFY `ppid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `netw_peppylink`
--
ALTER TABLE `netw_peppylink`
  MODIFY `plid` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_points`
--
ALTER TABLE `netw_points`
  MODIFY `poid` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_ranks`
--
ALTER TABLE `netw_ranks`
  MODIFY `rkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `netw_sessions`
--
ALTER TABLE `netw_sessions`
  MODIFY `sesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `netw_transactions`
--
ALTER TABLE `netw_transactions`
  MODIFY `txid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
