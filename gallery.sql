-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 19 2017 г., 15:45
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gallery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acl_classes`
--

CREATE TABLE `acl_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_entries`
--

CREATE TABLE `acl_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `security_identity_id` int(10) UNSIGNED NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) UNSIGNED NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_object_identities`
--

CREATE TABLE `acl_object_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_object_identity_ancestors`
--

CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) UNSIGNED NOT NULL,
  `ancestor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `acl_security_identities`
--

CREATE TABLE `acl_security_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `classification__category`
--

CREATE TABLE `classification__category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `classification__category`
--

INSERT INTO `classification__category` (`id`, `parent_id`, `context`, `name`, `enabled`, `slug`, `description`, `position`, `created_at`, `updated_at`, `media_id`) VALUES
(1, NULL, 'default', 'default', 1, 'default', 'default', NULL, '2017-01-17 13:15:27', '2017-01-17 13:15:27', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `classification__collection`
--

CREATE TABLE `classification__collection` (
  `id` int(11) NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `classification__context`
--

CREATE TABLE `classification__context` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `classification__context`
--

INSERT INTO `classification__context` (`id`, `name`, `enabled`, `created_at`, `updated_at`) VALUES
('default', 'default', 1, '2017-01-17 13:12:58', '2017-01-17 13:12:58');

-- --------------------------------------------------------

--
-- Структура таблицы `classification__tag`
--

CREATE TABLE `classification__tag` (
  `id` int(11) NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_group`
--

CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user`
--

CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(2, 'admin', 'admin', 'yuyebimuj@binka.me', 'yuyebimuj@binka.me', 1, 'q60e8di3ra8kgw08gcgk8gc04ogo04c', 'xOdPo2uTVyRldx6yatNe3nemXCqBoDk0Ujmh8H5hA7gN9zh0+MRwRzu/VOjtReZ9N8PZdp0FOW+wS4wU1nMEZA==', '2017-01-19 15:13:52', 0, 0, NULL, 'bVeJZ0HuXqe4EEwP0LGC0-hN6s96X2rGEkvyChi7CN8', '2017-01-17 12:02:18', 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2017-01-17 11:58:52', '2017-01-19 15:13:52', NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(3, 'user', 'user', 'bigaj@binka.me', 'bigaj@binka.me', 1, 'qx07fs7424gw4kc40c4808ogc4og0so', 'u61/qcLKcykbF7ChVsyGVZLVStxvLsd10bW/VvaYaF7ByYjArAmomKYJ6rMZenaFmnqgQFFqYN3ZGcO3D2qeAg==', '2017-01-17 17:46:58', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '2017-01-17 13:32:28', '2017-01-17 17:46:58', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user_user_group`
--

CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `media__gallery`
--

CREATE TABLE `media__gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `media__gallery`
--

INSERT INTO `media__gallery` (`id`, `name`, `context`, `default_format`, `enabled`, `updated_at`, `created_at`) VALUES
(1, 'First gallery', 'default', 'default_small', 1, '2017-01-17 13:45:15', '2017-01-17 13:31:21');

-- --------------------------------------------------------

--
-- Структура таблицы `media__gallery_media`
--

CREATE TABLE `media__gallery_media` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `media__gallery_media`
--

INSERT INTO `media__gallery_media` (`id`, `gallery_id`, `media_id`, `position`, `enabled`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 1, 0, '2017-01-17 13:31:31', '2017-01-17 13:31:21'),
(2, 1, 2, 2, 0, '2017-01-17 13:31:31', '2017-01-17 13:31:21');

-- --------------------------------------------------------

--
-- Структура таблицы `media__media`
--

CREATE TABLE `media__media` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `media__media`
--

INSERT INTO `media__media` (`id`, `category_id`, `name`, `description`, `enabled`, `provider_name`, `provider_status`, `provider_reference`, `provider_metadata`, `width`, `height`, `length`, `content_type`, `content_size`, `copyright`, `author_name`, `context`, `cdn_is_flushable`, `cdn_flush_identifier`, `cdn_flush_at`, `cdn_status`, `updated_at`, `created_at`) VALUES
(1, 1, '6887285-images.jpg', 'Description 1', 0, 'sonata.media.provider.image', 1, 'e03e89ae3cdf936682c1fc0b242de29c0b3c63ee.jpeg', '{"filename":"6887285-images.jpg"}', 1920, 1200, NULL, 'image/jpeg', 927236, NULL, NULL, 'default', 0, NULL, NULL, NULL, '2017-01-17 16:36:31', '2017-01-17 13:26:12'),
(2, 1, '7041802-china-mountains.jpg', 'Description 2', 0, 'sonata.media.provider.image', 1, '611611d4014949e9f1268715b4fd09730ff1ca5d.jpeg', '{"filename":"7041802-china-mountains.jpg"}', 1920, 1080, NULL, 'image/jpeg', 1132303, NULL, NULL, 'default', 0, NULL, NULL, NULL, '2017-01-17 16:39:44', '2017-01-17 13:27:34'),
(3, 1, '7041805-orange-slice-hd-backgrounds.jpg', NULL, 0, 'sonata.media.provider.image', 1, '5840e40a06ddbad5c9562922e662236de51bbe9f.jpeg', '{"filename":"7041805-orange-slice-hd-backgrounds.jpg"}', 1600, 1000, NULL, 'image/jpeg', 220204, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:41:38', '2017-01-17 13:41:38'),
(4, 1, '7041809-sleep-cat-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'e049ffd9eb457c6b3ec0e3da3469709d347019ca.jpeg', '{"filename":"7041809-sleep-cat-wallpaper.jpg"}', 1920, 1200, NULL, 'image/jpeg', 359064, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:41:54', '2017-01-17 13:41:54'),
(5, 1, '7041814-fireworks-background.jpg', NULL, 0, 'sonata.media.provider.image', 1, '8fab58d196d9b4199c32a47ee66a4072793ef671.jpeg', '{"filename":"7041814-fireworks-background.jpg"}', 1920, 1420, NULL, 'image/jpeg', 431248, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:02', '2017-01-17 13:42:02'),
(6, 1, '7041817-love-couple-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, '9d25686e90c06cdf40865a7e70508e2b3e95f5c7.jpeg', '{"filename":"7041817-love-couple-wallpaper.jpg"}', 1920, 1200, NULL, 'image/jpeg', 953880, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:11', '2017-01-17 13:42:11'),
(7, 1, '7041822-lamborghini-gallardo-lp570-4-superleggera-white-front.jpg', NULL, 0, 'sonata.media.provider.image', 1, '42192d0d90fef58930ad1e931255682865c7e364.jpeg', '{"filename":"7041822-lamborghini-gallardo-lp570-4-superleggera-white-front.jpg"}', 2560, 1600, NULL, 'image/jpeg', 423077, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:19', '2017-01-17 13:42:19'),
(8, 1, '7041825-chicago-lake-shore-drive.jpg', NULL, 0, 'sonata.media.provider.image', 1, '0583d62052a18d28a7df38b2e82937353f63337b.jpeg', '{"filename":"7041825-chicago-lake-shore-drive.jpg"}', 1920, 1200, NULL, 'image/jpeg', 1973462, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:27', '2017-01-17 13:42:27'),
(9, 1, '7041825-chicago-lake-shore-drive.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'bb16dc4ec6917fd85d6ec8dbb3ad540f8f5f2d64.jpeg', '{"filename":"7041825-chicago-lake-shore-drive.jpg"}', 1920, 1200, NULL, 'image/jpeg', 1973462, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:40', '2017-01-17 13:42:40'),
(10, 1, '7041829-sweet-home-fantasy.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'ae526b97f46c240ca640680c7f5b48247a19c742.jpeg', '{"filename":"7041829-sweet-home-fantasy.jpg"}', 1920, 1200, NULL, 'image/jpeg', 640125, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:42:51', '2017-01-17 13:42:51'),
(11, 1, '7041839-enders-game_9776.jpg', NULL, 0, 'sonata.media.provider.image', 1, '507cfed90b6fb07d79d11fd9f7a00cbcc599e42d.jpeg', '{"filename":"7041839-enders-game_9776.jpg"}', 1920, 1080, NULL, 'image/jpeg', 884488, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:00', '2017-01-17 13:43:00'),
(12, 1, '7041844-evening-luxury-resort.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'be599b1c7dc251ed1c6d0d0a018219f73dd5f895.jpeg', '{"filename":"7041844-evening-luxury-resort.jpg"}', 2560, 1600, NULL, 'image/jpeg', 1439933, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:08', '2017-01-17 13:43:08'),
(13, 1, '7041849-baby-elephant-nature.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'a7f88b1f72057ce7ca5909796836870b2008813f.jpeg', '{"filename":"7041849-baby-elephant-nature.jpg"}', 2560, 1600, NULL, 'image/jpeg', 1288748, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:18', '2017-01-17 13:43:18'),
(14, 1, '7041851-franck-ribery.jpg', NULL, 0, 'sonata.media.provider.image', 1, '7c53161b2c0c9db57b46ae85568a755f32d499c6.jpeg', '{"filename":"7041851-franck-ribery.jpg"}', 1920, 1080, NULL, 'image/jpeg', 462178, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:25', '2017-01-17 13:43:25'),
(15, 1, '7041853-volkswagen-golf.jpg', NULL, 0, 'sonata.media.provider.image', 1, '13f872ff23870875db208bfee23835972d17d9e1.jpeg', '{"filename":"7041853-volkswagen-golf.jpg"}', 1680, 1050, NULL, 'image/jpeg', 223866, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:31', '2017-01-17 13:43:31'),
(16, 1, '7041856-walter-white.jpg', NULL, 0, 'sonata.media.provider.image', 1, '8cba715fad954f40a42ef25d14ec5e423164fc9a.jpeg', '{"filename":"7041856-walter-white.jpg"}', 1920, 1080, NULL, 'image/jpeg', 438619, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:37', '2017-01-17 13:43:37'),
(18, 1, '7041870-hd-wallpaper-of-nature.jpg', NULL, 0, 'sonata.media.provider.image', 1, '91e10eac35ab178d3265eee5246a56d2a0b04f2a.jpeg', '{"filename":"7041870-hd-wallpaper-of-nature.jpg"}', 1920, 1080, NULL, 'image/jpeg', 780881, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:51', '2017-01-17 13:43:51'),
(19, 1, '7041875-red-rider-winter.jpg', NULL, 0, 'sonata.media.provider.image', 1, '57ef4719d133958251deaecd70e0f56590f1126b.jpeg', '{"filename":"7041875-red-rider-winter.jpg"}', 1920, 1200, NULL, 'image/jpeg', 769987, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:43:57', '2017-01-17 13:43:57'),
(20, 1, '7041894-sniper-gost-warrior-2-siberian-strike-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, '586130651b6fe0e237c83f310453f445ab3795fa.jpeg', '{"filename":"7041894-sniper-gost-warrior-2-siberian-strike-wallpaper.jpg"}', 1920, 1200, NULL, 'image/jpeg', 680154, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:44:04', '2017-01-17 13:44:04'),
(21, 1, '7041898-jet-sunset.jpg', NULL, 0, 'sonata.media.provider.image', 1, '7edd5e87cb3c169b24059008f4da217132b22736.jpeg', '{"filename":"7041898-jet-sunset.jpg"}', 1920, 1200, NULL, 'image/jpeg', 1398909, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:44:10', '2017-01-17 13:44:10'),
(25, 1, '7041928-snow-mountain-landscape-18982.jpg', NULL, 0, 'sonata.media.provider.image', 1, '609faa780f18c8876bad50a448319482e3bc57c4.jpeg', '{"filename":"7041928-snow-mountain-landscape-18982.jpg"}', 2560, 1440, NULL, 'image/jpeg', 872021, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:44:35', '2017-01-17 13:44:35'),
(26, 1, '7041933-beautiful-backgrounds-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'e5969cb793e2c97f8ee35c453f06fe0e14c84ca5.jpeg', '{"filename":"7041933-beautiful-backgrounds-wallpaper.jpg"}', 1920, 1200, NULL, 'image/jpeg', 1043355, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:44:43', '2017-01-17 13:44:43'),
(27, 1, '7041937-killzone-shadow-fall-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'fbc98780db4c78fc1e1a8ada6d0c98996067b3e6.jpeg', '{"filename":"7041937-killzone-shadow-fall-wallpaper.jpg"}', 1920, 1080, NULL, 'image/jpeg', 234282, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 13:44:51', '2017-01-17 13:44:51'),
(28, 1, '434976-happy-valentines-day-timeline-cover.jpg', NULL, 0, 'sonata.media.provider.image', 1, '7e274940e87be6995c71da12d75cfc153daf26b2.jpeg', '{"filename":"434976-happy-valentines-day-timeline-cover.jpg"}', 1920, 1200, NULL, 'image/jpeg', 810202, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 17:32:11', '2017-01-17 17:32:11'),
(29, 1, '7041916-dark-abstract-wallpaper-for-desktop.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'f4b2bee0871cd07d96f7a83a1c71c9af28f84bfd.jpeg', '{"filename":"7041916-dark-abstract-wallpaper-for-desktop.jpg"}', 1280, 1024, NULL, 'image/jpeg', 112466, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 17:39:04', '2017-01-17 17:39:04'),
(30, 1, '7041904-short-eared-owl.jpg', NULL, 0, 'sonata.media.provider.image', 1, '924e63addcc1672a681daeec3b409da0329e1a51.jpeg', '{"filename":"7041904-short-eared-owl.jpg"}', 1680, 1050, NULL, 'image/jpeg', 256051, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 17:39:13', '2017-01-17 17:39:13'),
(31, 1, '7041860-spring-river-wallpaper.jpg', NULL, 0, 'sonata.media.provider.image', 1, '0c56c54d31555dc0d8353b598f7d235bcd93fb16.jpeg', '{"filename":"7041860-spring-river-wallpaper.jpg"}', 1920, 1080, NULL, 'image/jpeg', 991040, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 17:39:24', '2017-01-17 17:39:24'),
(32, 1, '7041902-snow-mountain.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'f83645b95c20e2cd13a66b6b669fb81818d73b20.jpeg', '{"filename":"7041902-snow-mountain.jpg"}', 1920, 1200, NULL, 'image/jpeg', 231362, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-17 17:39:35', '2017-01-17 17:39:35'),
(33, 1, '7041851-franck-ribery.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'e829f2fddf7687598608aa58e0cb86d4050c0ebd.jpeg', '{"filename":"7041851-franck-ribery.jpg"}', 1920, 1080, NULL, 'image/jpeg', 462178, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-19 13:07:23', '2017-01-19 13:07:23'),
(34, 1, '7041904-short-eared-owl.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'f212b9500d3413e6f8c62519c207b15e21998404.jpeg', '{"filename":"7041904-short-eared-owl.jpg"}', 1680, 1050, NULL, 'image/jpeg', 256051, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2017-01-19 15:14:36', '2017-01-19 15:14:36');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acl_classes`
--
ALTER TABLE `acl_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`);

--
-- Индексы таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  ADD KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  ADD KEY `IDX_46C8B806EA000B10` (`class_id`),
  ADD KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_46C8B806DF9183C9` (`security_identity_id`);

--
-- Индексы таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  ADD KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`);

--
-- Индексы таблицы `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  ADD KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_825DE299C671CEA1` (`ancestor_id`);

--
-- Индексы таблицы `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`);

--
-- Индексы таблицы `classification__category`
--
ALTER TABLE `classification__category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_43629B36727ACA70` (`parent_id`),
  ADD KEY `IDX_43629B36E25D857E` (`context`),
  ADD KEY `IDX_43629B36EA9FDD75` (`media_id`);

--
-- Индексы таблицы `classification__collection`
--
ALTER TABLE `classification__collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_collection` (`slug`,`context`),
  ADD KEY `IDX_A406B56AE25D857E` (`context`),
  ADD KEY `IDX_A406B56AEA9FDD75` (`media_id`);

--
-- Индексы таблицы `classification__context`
--
ALTER TABLE `classification__context`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `classification__tag`
--
ALTER TABLE `classification__tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_context` (`slug`,`context`),
  ADD KEY `IDX_CA57A1C7E25D857E` (`context`);

--
-- Индексы таблицы `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Индексы таблицы `fos_user_user`
--
ALTER TABLE `fos_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`);

--
-- Индексы таблицы `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_B3C77447A76ED395` (`user_id`),
  ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Индексы таблицы `media__gallery`
--
ALTER TABLE `media__gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  ADD KEY `IDX_80D4C541EA9FDD75` (`media_id`);

--
-- Индексы таблицы `media__media`
--
ALTER TABLE `media__media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5C6DD74E12469DE2` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `acl_classes`
--
ALTER TABLE `acl_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `classification__category`
--
ALTER TABLE `classification__category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `classification__collection`
--
ALTER TABLE `classification__collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `classification__tag`
--
ALTER TABLE `classification__tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `fos_user_group`
--
ALTER TABLE `fos_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `fos_user_user`
--
ALTER TABLE `fos_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `media__gallery`
--
ALTER TABLE `media__gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `media__media`
--
ALTER TABLE `media__media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Ограничения внешнего ключа таблицы `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `classification__category`
--
ALTER TABLE `classification__category`
  ADD CONSTRAINT `FK_43629B36727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `classification__category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_43629B36E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  ADD CONSTRAINT `FK_43629B36EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `classification__collection`
--
ALTER TABLE `classification__collection`
  ADD CONSTRAINT `FK_A406B56AE25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`),
  ADD CONSTRAINT `FK_A406B56AEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `classification__tag`
--
ALTER TABLE `classification__tag`
  ADD CONSTRAINT `FK_CA57A1C7E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`);

--
-- Ограничения внешнего ключа таблицы `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`),
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`);

--
-- Ограничения внешнего ключа таблицы `media__media`
--
ALTER TABLE `media__media`
  ADD CONSTRAINT `FK_5C6DD74E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `classification__category` (`id`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
