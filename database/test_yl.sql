-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2024 at 12:43 PM
-- Server version: 10.11.7-MariaDB-1:10.11.7+maria~ubu2204
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_yl`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `name` varchar(20) NOT NULL,
  `value` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Common Config for the app';

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`name`, `value`) VALUES
('app_name', 'Yes Yes Indian Super Market'),
('contact_mail', 'myg@gmail.com'),
('hq_info', '{\"name\":\"Yes Yes Indian Super Market\",\"address\":\"Indian supermartke , india\",\"location\":\"Aluva\",\"coordinates\":\"0,0,82,126\",\"name_1\":\"Rishikesh\",\"phone_1\":\"+61354522541\",\"email_1\":\"myg@gmail.com\",\"name_2\":\"Suresh\",\"phone_2\":\"+61545145425\",\"email_2\":\"mygaluva@gmail.com\"}');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(2, 'default', '{\"uuid\":\"f316abd8-c762-4fe0-b518-254421c58e68\",\"displayName\":\"App\\\\Jobs\\\\registrationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\registrationMail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\registrationMail\\\":1:{s:16:\\\"RegistrationData\\\";a:2:{s:4:\\\"name\\\";s:6:\\\"Bhamss\\\";s:5:\\\"email\\\";s:25:\\\"amruthavgovind1@gmail.com\\\";}}\"}}', 0, NULL, 1711514888, 1711514888);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyality_offers`
--

CREATE TABLE `loyality_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `offer_code` varchar(6) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `min_inv_amt` decimal(10,2) DEFAULT NULL COMMENT 'minimum invoice amount needed. Not applicable if null',
  `max_reduction` decimal(10,2) DEFAULT NULL COMMENT 'Maximum discount amount available on an order.',
  `points_required` int(11) DEFAULT NULL COMMENT 'points required for offer',
  `discount_val` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percent','amount') DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `expiry_start` datetime DEFAULT NULL,
  `expiry_end` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loyality_offers`
--

INSERT INTO `loyality_offers` (`id`, `name`, `comments`, `branch_id`, `offer_code`, `slug`, `min_inv_amt`, `max_reduction`, `points_required`, `discount_val`, `discount_type`, `usage_limit`, `expiry_start`, `expiry_end`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '100% Flat', 'Hurry Up Guys', 1012, 'AW4523', '100-flat', 3000.00, NULL, 56, 5.00, 'percent', 1, '2023-12-20 00:00:00', '2024-05-30 00:00:00', 1, '2024-05-03 11:03:17', '2024-05-22 07:27:13', NULL),
(2, 'Flat-80%', 'Come Hurry', 1000, '22U329', 'flat-80', 1000.00, NULL, 20, 400.00, 'amount', 1, '2024-05-03 00:00:00', NULL, 1, '2024-05-03 05:53:38', '2024-05-03 05:53:38', NULL),
(3, 'cxc', 'cxcxc', 1000, '3BIS99', 'cxc', NULL, NULL, NULL, NULL, NULL, 2313, '2024-05-15 00:00:00', NULL, 1, '2024-05-03 06:30:47', '2024-05-03 06:30:51', '2024-05-03 06:30:51'),
(4, 'Flat 50%', 'Come on fast', 1008, 'GZCT23', 'gfgf', 400.00, 5000.00, 10, 100.00, 'amount', 2, '2024-04-20 00:00:00', '2024-04-20 00:00:00', 1, '2024-05-15 10:30:31', '2024-05-21 09:49:29', NULL),
(5, 'summer sale', 'Come on hURRAY', 1000, 'XPSX0X', 'summer-sale-', 2000.00, 2000.00, 50, 50.00, 'percent', 2, '2024-04-20 00:00:00', '2024-04-20 00:00:00', 1, '2024-05-31 05:42:15', '2024-05-31 11:53:27', NULL),
(6, 'Eid offer', 'vjbfhwtjb', 1006, 'XNI7DR', 'eid-offer', 365.00, 523.00, 23, 252.00, 'amount', 2, '2024-06-02 00:00:00', '2024-06-04 00:00:00', 1, '2024-05-31 09:55:55', '2024-05-31 09:57:48', '2024-05-31 09:57:48'),
(7, '50% off', '50% off', 1000, 'F70YQ7', '50-off', 500.00, NULL, 1, 1.00, 'percent', NULL, '2024-04-20 00:00:00', '2024-04-20 00:00:00', 1, '2024-06-01 05:53:21', '2024-06-01 05:53:55', '2024-06-01 05:53:55'),
(8, '50% off', 'Come Hurry	up', 1000, 'Z9GUQE', '50-off', 1000.00, NULL, 1, 1.00, 'percent', NULL, '2024-04-20 00:00:00', '2024-04-20 00:00:00', 0, '2024-06-01 05:54:38', '2024-06-03 05:24:27', '2024-06-03 05:24:27'),
(9, '50% off', 'Limited period offer', 1000, 'LQUL4S', '50-off', 1000.00, NULL, 1, 50.00, 'percent', NULL, '2024-06-03 00:00:00', '2024-05-31 00:00:00', 1, '2024-06-03 05:26:27', '2024-06-03 05:26:27', NULL),
(10, '70% off', 'Come on hurry up', 1000, 'C4UWDE', '70-off', 1000.00, NULL, 1, 10.00, 'amount', NULL, '2024-05-28 00:00:00', '2024-05-31 00:00:00', 1, '2024-06-03 05:36:09', '2024-06-03 06:20:19', '2024-06-03 06:20:19'),
(11, '50% off', '50% off', 1000, 'I04JJE', '50-off', 5000.00, NULL, 1, 1.00, 'percent', NULL, '2024-05-29 00:00:00', '2024-05-28 00:00:00', 1, '2024-06-03 09:36:03', '2024-06-03 09:36:03', NULL),
(12, 'loyalty offers 80%', 'loyalty offers 80%', 1015, 'ZEX8Q1', 'loyalty-offers-80-', 1000.00, 1000.00, 50, 1000.00, 'percent', 2, '2024-06-05 00:00:00', '2024-06-06 00:00:00', 1, '2024-06-04 07:15:11', '2024-06-04 07:15:11', NULL),
(13, 'fbb LOyalty', 'fbb LOyalty', 1012, 'DB0KW4', 'fbb-loyalty', 1000.00, 999.00, 50, 100.00, 'percent', 2, '2024-06-05 00:00:00', '2024-06-10 00:00:00', 1, '2024-06-04 09:19:51', '2024-06-04 09:19:51', NULL),
(14, 'testabc', 'testabctestabc', 1014, 'KSMBBO', 'testabc', 1000.00, 1000.00, 50, 100.00, 'percent', 2, '2024-05-28 00:00:00', '2024-05-31 00:00:00', 1, '2024-06-06 04:12:54', '2024-06-06 04:35:44', '2024-06-06 04:35:44'),
(15, 'testabc', 'testabctestabctestabc', 1014, 'U182EA', 'testabc', 1000.00, 1000.00, 50, 100.00, 'percent', 2, '2024-06-15 00:00:00', '2024-06-10 00:00:00', 1, '2024-06-06 04:36:40', '2024-06-06 04:41:03', '2024-06-06 04:41:03'),
(16, 'testabc', 'testabctestabc', 1014, '0QDUXK', 'testabc', 1000.00, 1000.00, 50, 1000.00, 'percent', 2, '2024-06-15 00:00:00', '2024-06-10 00:00:00', 1, '2024-06-06 04:42:13', '2024-06-06 04:42:13', NULL),
(17, '50% off', '50% off', 1014, 'CYDWRO', '50-off', 100.00, NULL, 1, 1000.00, 'percent', NULL, '2024-05-30 00:00:00', '2024-05-29 00:00:00', 1, '2024-06-06 05:26:45', '2024-06-06 05:26:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_rules`
--

CREATE TABLE `loyalty_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_amt` decimal(10,2) NOT NULL COMMENT 'Minimum purchase value for receiving the point',
  `point_received` int(11) NOT NULL COMMENT 'Points in reference',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Rules in which a user gets loyalty points';

--
-- Dumping data for table `loyalty_rules`
--

INSERT INTO `loyalty_rules` (`id`, `min_amt`, `point_received`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 100.00, 1, '2024-05-13 09:42:57', NULL, NULL),
(4, 300.00, 2, '2024-05-13 09:42:57', NULL, NULL),
(5, 500.00, 5, '2024-05-13 09:42:57', '2024-06-05 07:27:24', NULL),
(6, 1000.00, 10, '2024-05-13 09:42:57', NULL, NULL),
(7, 2500.00, 15, '2024-05-13 09:42:57', NULL, NULL),
(8, 5000.00, 50, '2024-05-13 09:42:57', NULL, NULL),
(9, 5500.00, 55, '2024-06-05 06:29:23', '2024-06-05 06:29:37', '2024-06-05 06:29:37'),
(10, 5500.00, 55, '2024-06-05 06:31:04', '2024-06-05 06:32:48', NULL),
(11, 400.00, 4, '2024-06-06 04:11:52', '2024-06-06 04:13:04', '2024-06-06 04:13:04'),
(12, 900.00, 9, '2024-06-06 05:23:02', '2024-06-06 05:23:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_rules1`
--

CREATE TABLE `loyalty_rules1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `every_pur_amnt` decimal(10,2) NOT NULL COMMENT 'Minimum purchase value for receiving the point',
  `receives_point` int(11) NOT NULL COMMENT 'Points in reference',
  `till_amount` decimal(10,2) NOT NULL,
  `post_process` int(11) NOT NULL COMMENT 'change name',
  `calc_type` enum('add','multiply') NOT NULL,
  `sort` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Rules in which a user gets loyalty points';

--
-- Dumping data for table `loyalty_rules1`
--

INSERT INTO `loyalty_rules1` (`id`, `every_pur_amnt`, `receives_point`, `till_amount`, `post_process`, `calc_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 100.00, 1, 300.00, 2, 'multiply', NULL, '2024-05-02 18:09:17', NULL, NULL),
(2, 150.00, 2, 800.00, 5, 'add', NULL, '2024-05-02 18:09:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_rules2`
--

CREATE TABLE `loyalty_rules2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pur_val` decimal(10,2) NOT NULL COMMENT 'Minimum purchase value for receiving the point',
  `point_val` int(11) NOT NULL COMMENT 'Points in reference',
  `calc_type` enum('add','multiply') NOT NULL,
  `sort` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Rules in which a user gets loyalty points';

--
-- Dumping data for table `loyalty_rules2`
--

INSERT INTO `loyalty_rules2` (`id`, `pur_val`, `point_val`, `calc_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 100.00, 1, 'add', NULL, '2024-05-02 18:09:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_22_095822_create_oauth_auth_codes_table', 2),
(5, '2024_03_22_095823_create_oauth_access_tokens_table', 2),
(6, '2024_03_22_095824_create_oauth_refresh_tokens_table', 2),
(7, '2024_03_22_095825_create_oauth_clients_table', 2),
(8, '2024_03_22_095826_create_oauth_personal_access_clients_table', 2),
(9, '2024_03_22_100040_create_personal_access_tokens_table', 3),
(10, '2024_04_09_203321_create_cache_table', 0),
(11, '2024_04_09_203321_create_cache_locks_table', 0),
(12, '2024_04_09_203321_create_failed_jobs_table', 0),
(13, '2024_04_09_203321_create_job_batches_table', 0),
(14, '2024_04_09_203321_create_jobs_table', 0),
(15, '2024_04_09_203321_create_oauth_access_tokens_table', 0),
(16, '2024_04_09_203321_create_oauth_auth_codes_table', 0),
(17, '2024_04_09_203321_create_oauth_clients_table', 0),
(18, '2024_04_09_203321_create_oauth_personal_access_clients_table', 0),
(19, '2024_04_09_203321_create_oauth_refresh_tokens_table', 0),
(20, '2024_04_09_203321_create_password_reset_tokens_table', 0),
(21, '2024_04_09_203321_create_personal_access_tokens_table', 0),
(22, '2024_04_09_203321_create_sessions_table', 0),
(23, '2024_04_09_203321_create_store_offers_table', 0),
(24, '2024_04_09_203321_create_stores_table', 0),
(25, '2024_04_09_203321_create_user_transactions_table', 0),
(26, '2024_04_09_203321_create_users_table', 0),
(27, '2024_04_09_203324_add_foreign_keys_to_store_offers_table', 0),
(28, '2024_04_09_203324_add_foreign_keys_to_user_transactions_table', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('89e4387257abc4dc662766de10ca8b8ba09e4f522d8a6811435ea3694b8d64903265fd3bc38e429f', 1, 1, 'AppName', '[]', 0, '2024-03-22 04:43:21', '2024-03-22 04:43:21', '2025-03-22 10:13:21'),
('e5a4e2fd48c8680890c1573ade7fe09e51790aacd700f62a2ce444ea9b6746093daf62e414f8952b', 1, 1, 'AppName', '[]', 0, '2024-03-22 04:49:39', '2024-03-22 04:49:39', '2025-03-22 10:19:39'),
('eff41b0190c50992c7ba02ad17717a31ef06343d0f29c8c6ca2b02b3bfa2c461031c81d3fa98e802', 1, 1, 'AppName', '[]', 0, '2024-03-22 04:50:00', '2024-03-22 04:50:00', '2025-03-22 10:20:00'),
('64eb71f3bab553a2b9fe1a08546612bd5d58ceeed7636805d33eb5cdcd2ff51a08ef0b0230937372', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:05:14', '2024-04-25 00:05:14', '2025-04-25 05:35:14'),
('bab83590ebed8cf35f84e59c8e7b5a56972dc6c516a41cec0f37eb79bca7200a55e637ed921e0302', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:07:41', '2024-04-25 00:07:41', '2025-04-25 05:37:41'),
('fa2bef60bc02375b25505262958b628f31d0d3f80460156b502f0ef848caff2d315e8130668476e2', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:11:32', '2024-04-25 00:11:32', '2025-04-25 05:41:32'),
('be32411409469e36c30f1b116438c029f6db29b545c788862a41ca4ad6cb34c1b20cf5cf95666071', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:12:15', '2024-04-25 00:12:15', '2025-04-25 05:42:15'),
('986aac8664281741d2a06853e2e6e1e33156e74215e9d2ecec9754a9e0b84cb45866ca279ca84ff0', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:12:48', '2024-04-25 00:12:48', '2025-04-25 05:42:48'),
('ec6f411428665d86b259b8984d837986ef917ebb7652773c0dedbd7edda8a9cfffe22887be89f4c8', 9, 1, 'AppName', '[]', 1, '2024-04-25 00:19:31', '2024-04-25 00:26:46', '2025-04-25 05:49:31'),
('b1c00a4de0c2b63a244b3a401ea52ebe995be3fb650293067d619b97d63078aba3d4e48a4f8c3876', 9, 1, 'AppName', '[]', 1, '2024-04-25 00:27:02', '2024-04-25 00:27:08', '2025-04-25 05:57:02'),
('6356897c59c61d4ce6360477df631d3352336d74d04360b59d18add6141b7e7278abd39b82b9444d', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:29:35', '2024-04-25 00:29:36', '2025-04-25 05:59:35'),
('4a531605dca7b842b20be96397cd53d57f2ef82f835bbcbb0ba86c2c2bf0b28c5d47ef89f3d297b2', 9, 1, 'AppName', '[]', 0, '2024-04-25 00:30:13', '2024-04-25 00:30:13', '2025-04-25 06:00:13'),
('e6c3522f7c37415f04d6f7df2e8d394a573946dfffe97c00fdcce73d3ddf3f4644c31567d904c120', 9, 1, 'AppName', '[]', 1, '2024-04-25 00:30:37', '2024-04-25 00:33:14', '2025-04-25 06:00:37'),
('5afc1089c9302ad414509951fe7ca435c17097bd4a1bcd5ed0e63b9248a0f7184e9e155b4893745a', 9, 1, 'AppName', '[]', 1, '2024-04-25 01:08:57', '2024-04-25 01:09:16', '2025-04-25 06:38:57'),
('ad41b92bf0ffa5e53b23935bfd1d63d338e8366e0d6f5bff11d4b501989da696b5a6de4398eb98ed', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:21:28', '2024-04-25 01:21:28', '2025-04-25 06:51:28'),
('7cbeb0cc921d0ca43bc1c28db5d002509e1eb709bb2ee83e179629699cc9b92ceec65a21f856ad63', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:22:33', '2024-04-25 01:22:34', '2025-04-25 06:52:33'),
('a03c04b0aa88c1ec79f1d585042cb22a5874576658a9eb60c9822df51259ea011e8ad0c29ccb3a6b', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:23:35', '2024-04-25 01:23:35', '2025-04-25 06:53:35'),
('4f5af8103738bd64841a1db2f8b1924b4f918a00f828394ca5d16786cc638d8d63b23540ed71b698', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:25:20', '2024-04-25 01:25:20', '2025-04-25 06:55:20'),
('1ca25a0bff73cd1e13ba89c0ca0ad26a242a5191e27e23a4228854bc56c2c88e6257593f223d5de9', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:28:16', '2024-04-25 01:28:16', '2025-04-25 06:58:16'),
('7f861c6658e63c28d151c0253d18c487317e23642719dc0a35182681e5bdbb0492c9684066edfa85', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:28:47', '2024-04-25 01:28:47', '2025-04-25 06:58:47'),
('74b5add1d284aa50b0939fff27407b25e06a3f576ea1ed391a5aecf62419b7531c700a076295c8ce', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:29:00', '2024-04-25 01:29:00', '2025-04-25 06:59:00'),
('6fac73b6bf73897f0ac4c8a79ba10be5f8cbf41a577a284f31727e3e59c1cf90a573cf6d80fd9658', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:29:40', '2024-04-25 01:29:40', '2025-04-25 06:59:40'),
('5136f558b5a05ed6a9fc9fb9e18ab96527fa434c297156836e2b7a378f1ed726c8b288422496c5fd', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:30:29', '2024-04-25 01:30:29', '2025-04-25 07:00:29'),
('722e7e0a7cd8dc1615ca7ddd6358000b597124caf331b900bccc07ca38bc259e94f210fc06be7557', 9, 1, 'AppName', '[]', 0, '2024-04-25 01:31:51', '2024-04-25 01:31:51', '2025-04-25 07:01:51'),
('9333b6a0af7cd0584f4c9c10f096ddbcbd26df1edf207f1d300a18ff57f42d45551201c1e9a26c9a', 9, 1, 'AppName', '[]', 1, '2024-04-25 01:32:20', '2024-04-25 01:32:24', '2025-04-25 07:02:20'),
('81fa5a3ffaafaadb97dc6062205db49f0a6e6657b6ff6a13f5347adb006865b94600a22c8dc38fa5', 9, 1, 'AppName', '[]', 1, '2024-04-25 01:53:13', '2024-04-25 01:53:18', '2025-04-25 07:23:13'),
('c985745eb678be2fe35c0686feb3c76edfae006444c261c1d921ec7e6a9b97d2c6723e02096567f8', 9, 1, 'AppName', '[]', 1, '2024-04-25 05:01:02', '2024-04-25 05:01:06', '2025-04-25 10:31:02'),
('5d7742719bc1848867246215bae358257ba3502dadfd2d2d9fdc6801c4935818d9de224cdbb8ec80', 9, 1, 'AppName', '[]', 1, '2024-04-28 23:29:28', '2024-04-28 23:31:07', '2025-04-29 04:59:28'),
('ffc6341495ebb7fa572307d8a69d23cfca39beec9a216356804bb2c8663c0108721febb500663951', 9, 1, 'AppName', '[]', 1, '2024-04-28 23:31:12', '2024-04-28 23:38:08', '2025-04-29 05:01:12'),
('398dc5976af6e62fe91d5af97cbad9f41276116c057e86c089c3e235a9381ad7d1cf1e5085520869', 9, 1, 'AppName', '[]', 0, '2024-04-28 23:38:11', '2024-04-28 23:38:11', '2025-04-29 05:08:11'),
('37db34a6555243df2f8d7e815b168dc3b628d6e8b2fce69e168b9cd2996f2a1bf2615f4e42b469a1', 9, 1, 'AppName', '[]', 1, '2024-04-28 23:39:59', '2024-04-28 23:51:35', '2025-04-29 05:09:59'),
('63fd8fcc2eea27528b9c5ed6522d0a8ad19fc6da7465cbe74194c3550ee05ec1234e793ae4185dcc', 25, 1, 'AppName', '[]', 1, '2024-04-28 23:51:52', '2024-04-28 23:53:05', '2025-04-29 05:21:52'),
('86f9e9e118247f3c7707b83275ecc7036e8fabf86c9de00a8ce60ddc36d45db2491f4de0593c7157', 25, 1, 'AppName', '[]', 1, '2024-04-28 23:53:23', '2024-04-28 23:57:36', '2025-04-29 05:23:23'),
('42ebbac0ab13ac2e9c05ba70873a59859e0bd45bf7b3173e71a3592e731d427a42e25fe4966d676f', 25, 1, 'AppName', '[]', 0, '2024-04-29 00:05:36', '2024-04-29 00:05:36', '2025-04-29 05:35:36'),
('767da3beb802989d53db29ae1d27706fd218c8677483420415071e286f44880d6abcceac985a4a78', 25, 1, 'AppName', '[]', 0, '2024-04-29 00:06:22', '2024-04-29 00:06:22', '2025-04-29 05:36:22'),
('a478bd96e7628b6333a7012dc2d398a6974935c3571576bb7082b42b37f5761371353d4eab85fde4', 25, 1, 'AppName', '[]', 0, '2024-04-29 00:08:02', '2024-04-29 00:08:02', '2025-04-29 05:38:02'),
('876c9c062c34f32dba6a5350022726b093f9542b9ae49806872df9f1d84341394a7a7e3b596ec3b4', 25, 1, 'AppName', '[]', 0, '2024-04-29 00:09:41', '2024-04-29 00:09:41', '2025-04-29 05:39:41'),
('2d858b19c83c0a73a605bff008e3184c7a11229b1e33138fac485bdb73d8854d6dbaec4c9cb9b2af', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:01:54', '2024-04-29 01:01:54', '2025-04-29 06:31:54'),
('e203b1b2ecb45f81a68e4229f78a1acb101057ff3eef556616cb2247536011b77cd1b78bbe0c95ac', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:05:50', '2024-04-29 01:05:50', '2025-04-29 06:35:50'),
('089bbe7adf8579fdaf1d4774aac8bbf9f722cfcc625e4c000632774a371fe5a82a11c16c0f944da5', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:39:28', '2024-04-29 01:39:28', '2025-04-29 07:09:28'),
('678a3e02e334fabf4c9bfc1341e60debb8146e82a2adeb905ea59e1986c197e0acb7f57bee159db6', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:40:23', '2024-04-29 01:40:23', '2025-04-29 07:10:23'),
('221c2db20ed7814b290d6491d0d815588531d57f21d05b121eb80e6a2a72415400eb6e65827383d0', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:40:51', '2024-04-29 01:40:51', '2025-04-29 07:10:51'),
('830e8627fcde26a491f4d022b85ff75902743dccfd971880401b775954593dd36b66cfac41533e64', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:43:45', '2024-04-29 01:43:45', '2025-04-29 07:13:45'),
('34eeb69252fcb6b348585fcf0120ead97dac0c8d0d49388b66af0905d59667dcab50e730d78b46ba', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:44:06', '2024-04-29 01:44:06', '2025-04-29 07:14:06'),
('2dc8468c94c8435640b6b63777e0a0e764f29a65f7674d848418840630737923932bb5e13dd01479', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:46:20', '2024-04-29 01:46:20', '2025-04-29 07:16:20'),
('6ddf7c0f99c03b6808c11b76eef64e697d34528957ad76496b0976e5da039c3fa0e907b219bada7b', 25, 1, 'AppName', '[]', 1, '2024-04-29 01:46:21', '2024-04-29 01:47:24', '2025-04-29 07:16:21'),
('2b57c50387ac6625257c3a0600e4f61586103cfb58d58452d3f2f99fd7cca9dfb6cdc8e87ed93055', 25, 1, 'AppName', '[]', 1, '2024-04-29 01:48:43', '2024-04-29 01:48:54', '2025-04-29 07:18:43'),
('aa54976b61b45d5f2e8b05e5b2332b77a8cb23292c9a3456917f0bf303262fd53f6d43093ba1ef02', 25, 1, 'AppName', '[]', 1, '2024-04-29 01:50:08', '2024-04-29 01:50:43', '2025-04-29 07:20:08'),
('9dc5485843022297fcdb41d018680fbe8aac013e3c9715b932a75a53fd086c4b0573793239df2f15', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:51:08', '2024-04-29 01:51:08', '2025-04-29 07:21:08'),
('f1cd5ccfa14127dae1d403defc98e82773a7eaa40f2f6216f8469d17eab0123711de6f3a644707c6', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:52:10', '2024-04-29 01:52:10', '2025-04-29 07:22:10'),
('f61b484e6ccc0d0d867fc2c51d3162499a2585768b07a9fa06dead11f9cada6ddf707ca6cbb04f06', 25, 1, 'AppName', '[]', 0, '2024-04-29 01:52:53', '2024-04-29 01:52:53', '2025-04-29 07:22:53'),
('2af891bc2a55e19c9096dac55c23d2f83d8d6783ddbbcc920474b4178ee1274e8da52b2a2097e37b', 25, 1, 'AppName', '[]', 1, '2024-04-29 01:53:43', '2024-04-29 01:54:39', '2025-04-29 07:23:43'),
('23f1cbe256423e91c0a3f4438291f1bc886230c08830765e3155e673bff01b607d38312c3b1984c2', 25, 1, 'AppName', '[]', 0, '2024-04-29 03:19:35', '2024-04-29 03:19:35', '2025-04-29 08:49:35'),
('969425129cd003fc8bedccdcd546142d4f7e16ef694a36ddc108bdad219c79f3f55eb3ecb85fc9fa', 25, 1, 'AppName', '[]', 0, '2024-04-30 00:26:15', '2024-04-30 00:26:15', '2025-04-30 05:56:15'),
('37d41cbc7ca67e290cb95b88e3c8f0cb9c4e700aeacc73b7b6da0d27e4a7f5663e7c67d9e7b37444', 25, 1, 'AppName', '[]', 0, '2024-05-02 22:58:06', '2024-05-02 22:58:06', '2025-05-03 04:28:06'),
('89d50d9c792482887b812ce4ea0b699ec5d6a5f81e5f3bd583f22cd278e062134e917a33125f0702', 25, 1, 'AppName', '[]', 1, '2024-05-02 23:01:27', '2024-05-02 23:04:12', '2025-05-03 04:31:27'),
('caf6779d8cff02d1a30254e871014f7b8e43d798b5a2413b787e5078b124b2d66048e00b94358105', 25, 1, 'AppName', '[]', 0, '2024-05-02 23:04:36', '2024-05-02 23:04:36', '2025-05-03 04:34:36'),
('bfb1250e2ca3d1ab5a2e035c19babef7b6222ba74d8801c6e35c2718e065acc88f00076afb930f74', 25, 1, 'AppName', '[]', 1, '2024-05-03 03:26:40', '2024-05-07 23:01:17', '2025-05-03 08:56:40'),
('c9a27dedb7475d75e7f54f1d7ff96f39ba04a63cc273b046e4313d3b9d31ea8dd861ae15626865a1', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:28:26', '2024-05-03 03:28:26', '2025-05-03 08:58:26'),
('80f7b6b6c5be112b045571d02b2d6066febab633a462a4fa419ed22acdd285327447519d859ab09f', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:35:20', '2024-05-03 03:35:20', '2025-05-03 09:05:20'),
('2b989da792e463f5a600a7e45aa50f7d7c57784fa1af1fcb0a6448476cd5951101113c5c56312144', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:36:47', '2024-05-03 03:36:47', '2025-05-03 09:06:47'),
('3a657a7080a495a8e007e8c89fa636677b3c142371ed988880226fc7944e9f817fb264f8dfcd1260', 25, 1, 'AppName', '[]', 1, '2024-05-03 03:39:06', '2024-05-06 00:55:59', '2025-05-03 09:09:06'),
('343dbd24a0beb6d771bae94a8865f4399296ea45ad3893139c04786fb93ea83a918453256734cd9f', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:43:47', '2024-05-03 03:43:47', '2025-05-03 09:13:47'),
('b3267a4b6eba26ed6fd8769ed576399877a55e2892ba6ea33685d4f5d6f030bf712eda99af0724a6', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:44:11', '2024-05-03 03:44:11', '2025-05-03 09:14:11'),
('f6afd89e6e2302962dfb5f1cf0f214dcd333031bc320a1bde21805061297a0e54dae0e1bd4e8af1c', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:44:31', '2024-05-03 03:44:31', '2025-05-03 09:14:31'),
('498f9bdc0e1377ba5a0996d1679c5d82c9ad76b66b761b8b3ae29515a4f43eac78be6f60b62d7ff1', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:47:15', '2024-05-03 03:47:15', '2025-05-03 09:17:15'),
('7ddecf1d169d54ecef9875552753cb0829a3a17455d7d36b1bf1a5f50d8e687b118aa286a54c7ec4', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:47:34', '2024-05-03 03:47:34', '2025-05-03 09:17:34'),
('aaeed4c1f09825507a78050e6d11f54164b24969c86cae79f7b624661fea7a1d7dab97339a767dd6', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:47:47', '2024-05-03 03:47:47', '2025-05-03 09:17:47'),
('69c47148d9859f1ef6b857dcdee5d32c7638db0eb17889c5c5cc0ef8880400275ef884a8e71ea8a7', 25, 1, 'AppName', '[]', 0, '2024-05-03 03:49:53', '2024-05-03 03:49:53', '2025-05-03 09:19:53'),
('b9961a294273b873967904097b6a29bc19982f7bd5acb300b17278b20f6f17186b161b3b4a2b78ab', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:06', '2024-05-03 04:18:06', '2025-05-03 09:48:06'),
('379fca5bfe540faebb4b53d7931bca838f6a993e87461134b0abbf3c652c7512baa65fb5f3ffdea5', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:06', '2024-05-03 04:18:06', '2025-05-03 09:48:06'),
('cb4329fa033f6d7bd07e566b596e4c9360d3f14f37f77f2f89086fad49786aa618fdbd42be99e361', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:07', '2024-05-03 04:18:07', '2025-05-03 09:48:07'),
('1c24e8d9c196a5c1476aee2affdd68f80b1b2f5979f9dc3cd16f4e62982395ab167638e021a2e2a1', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:35', '2024-05-03 04:18:35', '2025-05-03 09:48:35'),
('342047c59febeb2be768bb9431220d1241a0eb380dc3596c7a95390da2d07ac357536c0a04128a71', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:36', '2024-05-03 04:18:36', '2025-05-03 09:48:36'),
('018fde397d3ab48c7851d4466b6c76c07e660a6fad25431cdd7fd2c2f3c579ab49e9057f7858fbe9', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:18:53', '2024-05-03 04:18:53', '2025-05-03 09:48:53'),
('d4ba030459ffb3ef08c2a25be1cdcca34f374d08d504722c6189de013404900ddc7ede9a34543dfd', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:19:51', '2024-05-03 04:19:51', '2025-05-03 09:49:51'),
('9006099b711a12f0f2414e1c286afd075fcda1c9fbdb30885f2f4e443274f3c006c7df8a57f98ef3', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:20:47', '2024-05-03 04:20:47', '2025-05-03 09:50:47'),
('d093662448ef3de69fc304d72ec5f54f52ecfdccf981a94b1b71684d32f3b3fa06e3254677180bbf', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:24:06', '2024-05-03 04:24:06', '2025-05-03 09:54:06'),
('640920773ac4ff290cfcd691ad8c202d4985618eab61b9e2576f305b3a1d560c9edf9798c1a16bba', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:25:09', '2024-05-03 04:25:09', '2025-05-03 09:55:09'),
('2edf98230bfb1b5f6cabf35457742efa06351837a3e4afb333f35bb22e22e415764a33c98926497d', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:25:27', '2024-05-03 04:25:27', '2025-05-03 09:55:27'),
('2dbd1ff2c47242d8adc4356562ef3b60cd017cf370efc1900a8f96362b0f07ce45220ba090a4de25', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:25:54', '2024-05-03 04:25:54', '2025-05-03 09:55:54'),
('e5c57325e312845e2cb80372da3b85735da0692c23e84c2445e0c84bcaa22eed5be3da7903294d7f', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:26:48', '2024-05-03 04:26:48', '2025-05-03 09:56:48'),
('ff1477a548c3cd088ebfdb45abf4a1ee5770883eb29ca7f275a773720533a2aafe2121c97e9d5a8e', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:27:19', '2024-05-03 04:27:19', '2025-05-03 09:57:19'),
('a47012fd68fe36534f463ef7f1e35fb39b98c83b03f951f5f02ddf96c244aaae7835fbe87d707ed5', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:27:59', '2024-05-03 04:27:59', '2025-05-03 09:57:59'),
('dbaa4f04309f417b9c34f350504aec65907cdacbea876e2f37fab4eb1c1918cc5acc14c771824543', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:28:10', '2024-05-03 04:28:10', '2025-05-03 09:58:10'),
('43830fe8715e41c4b34c35b85f8b777a88080601bd9b9007b4978f7afe547524bf45f691b8544f99', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:28:45', '2024-05-03 04:28:45', '2025-05-03 09:58:45'),
('1a2dc5d13d05b215f66d3831822978b703bae45c4f16f5f95cdfaf52530a7b679c6cf2b9b77af83e', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:30:05', '2024-05-03 04:30:05', '2025-05-03 10:00:05'),
('8eea97e789abdce2c89ad205e4d943ca785f811c94bf2ee817f854e1ee39244fa965593e73b6a072', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:32:05', '2024-05-03 04:32:05', '2025-05-03 10:02:05'),
('f1562b32073a36094a4705387652dee518558e731d4a3d6ecccf3f91e68d8ad186f5d5beca694964', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:32:33', '2024-05-03 04:32:33', '2025-05-03 10:02:33'),
('5fc88368a3be1ba5a01677d3b61854459c1a0983198efa7a25362766cad64d5c057d3197c1962f76', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:32:49', '2024-05-03 04:32:49', '2025-05-03 10:02:49'),
('0aa0e7699323592ada694ee8422d2d3f8a9506fb04bfbbfc5d8e2289c005b91ee5170b41eb9c1182', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:38:46', '2024-05-03 04:38:46', '2025-05-03 10:08:46'),
('85a4d0902302d37a641e068daa4794a0989fb15b07069d51e484b4ce3f951554464b9266fb331c38', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:39:09', '2024-05-03 04:39:09', '2025-05-03 10:09:09'),
('ec2bdb0407f66ed5f40206fccbb9114cc3b34410efb4a701acfa760e1f0d4b250bd6728156697062', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:40:20', '2024-05-03 04:40:20', '2025-05-03 10:10:20'),
('90c4d549d99dfce0a845a633003de04eb9200c5e754a1887920ded72588f32181efbb2ec23e434bf', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:41:45', '2024-05-03 04:41:45', '2025-05-03 10:11:45'),
('d72c2002f3d0bb1c0050484ccd6c98ca9989b0d1ac865ea9a1a12224a8a3a78daf7c95e41efdf075', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:42:25', '2024-05-03 04:42:25', '2025-05-03 10:12:25'),
('53357bfccc94123ae8abf34bd25749eab8107449b634e0c4594b8161134f2a05f5d458718691748c', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:43:47', '2024-05-03 04:43:47', '2025-05-03 10:13:47'),
('e464122ba20feac50c9f41c3c48d1106083602c9c73d211bc7ad77f2b64b0a242416bf0c16c70a87', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:44:10', '2024-05-03 04:44:10', '2025-05-03 10:14:10'),
('5292ee698902be25294f958da0e262e37c4f4ede48a2381a2b21490d9bd8451c02e5580a8cf53679', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:47:22', '2024-05-03 04:47:22', '2025-05-03 10:17:22'),
('3a567671b0084bdeb5d60eca0e0f4b2986b16959f3b87fcaaec2a032594456a451e7d0cbed53ec23', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:47:47', '2024-05-03 04:47:47', '2025-05-03 10:17:47'),
('c35e6fe3b83bb949f7c0b084ce6d5772ce8d314244e41ca4434d6f6b5fe61bd8e746d530d65853c2', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:48:09', '2024-05-03 04:48:09', '2025-05-03 10:18:09'),
('81addb27a89ac457af38c3831a17778d38d1f02d2b397e636f42f6dac6abee9fc3e6be7182dafe7d', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:48:34', '2024-05-03 04:48:34', '2025-05-03 10:18:34'),
('14048282dde988d127fc698817d7d7bd9ff37acaa1a033ee04b96fa95355edb040816a8f6d99e4a4', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:49:52', '2024-05-03 04:49:52', '2025-05-03 10:19:52'),
('07deecba35f325591359c71dc66c3de799ebf18fbb96282fe5de70f9ecbcab46d6738a07d5666804', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:50:20', '2024-05-03 04:50:20', '2025-05-03 10:20:20'),
('0075f349db1cd63aa83d0845095cf927afd1a04f69f3392b32308b6260c44fdc12906f51d6a89cab', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:50:43', '2024-05-03 04:50:43', '2025-05-03 10:20:43'),
('d517289fed22c6eeeca6369f78435fea65e0f84810e48e2f960b7153c533fa064ebdfa9b0a157be7', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:51:20', '2024-05-03 04:51:20', '2025-05-03 10:21:20'),
('64f97a11096106a529002fc500802e37b873641e5b06038284176fe1265d17e1d12f6c583262da51', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:51:41', '2024-05-03 04:51:41', '2025-05-03 10:21:41'),
('c85ef410c14cbf698f52a8915709e0c08eea6ec45e5cf0f7daa60fa24f651cb3d222494445c84821', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:52:09', '2024-05-03 04:52:09', '2025-05-03 10:22:09'),
('83204cc98664b3f323e8b1eaa3041f138ac94a239aa08ad8b6d5c2a31c6afdf4b456bb9b76c11025', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:53:00', '2024-05-03 04:53:00', '2025-05-03 10:23:00'),
('1472db5194383be4384b84425a8f9192c998dd9cf75a328acabe91d8e73eab032f166bda0ecbedb3', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:53:23', '2024-05-03 04:53:23', '2025-05-03 10:23:23'),
('f487355a2b48964da4b161939263e7447cda67f057f778acf674ebc807b1379e485c9cf685360298', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:54:07', '2024-05-03 04:54:07', '2025-05-03 10:24:07'),
('7a7dc69d39213e61d28c65c748c7dffaffdecf10cc1f615128eb9d79dda712fded1a70684ed6085a', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:54:40', '2024-05-03 04:54:40', '2025-05-03 10:24:40'),
('5900ef802d522bf05cef28ab22c7e5b9f52f05864dd1b3dd7e2768dbe5ed206ca7b3e4b685b6061c', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:55:57', '2024-05-03 04:55:57', '2025-05-03 10:25:57'),
('d3cc64fd2e0ee676c3b6f778a8f3237bd7e37042816de51886715fab6c0c968043a2786d5c1f776a', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:58:49', '2024-05-03 04:58:49', '2025-05-03 10:28:49'),
('4e00a923b20479d7cbb541e4177f1912e43d0a3c59e63072c657991886166e24b22d4f68303fb7c9', 25, 1, 'AppName', '[]', 0, '2024-05-03 04:59:49', '2024-05-03 04:59:49', '2025-05-03 10:29:49'),
('2d245fbddac6f3f1d589c9027d1eb08a219f3cb4f7748d7cd499789eda47a7d2933c31bd01208647', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:01:19', '2024-05-03 05:01:19', '2025-05-03 10:31:19'),
('0081332f71eea15f837828f7dbfca094449100d68ccc58f7f12a0d5c24a1416cf9c0a4dc02757484', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:03', '2024-05-03 05:02:03', '2025-05-03 10:32:03'),
('c77a205536e51d30f3ad2d0a3ec8b1a42e56dfc65375e0c5c87d7aeec6245dbd54a736947a961569', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:03', '2024-05-03 05:02:03', '2025-05-03 10:32:03'),
('805e1967404afd02a8dcc856f533bb95b387ace3d1c8763c22dca52af2aa092d7ad44424e2972aeb', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:05', '2024-05-03 05:02:05', '2025-05-03 10:32:05'),
('7baa1ff7b2997ef303b21e6a3fc27335985bc5cd229343d3ad758401b7c10c5c1e07976199bb87d6', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:17', '2024-05-03 05:02:17', '2025-05-03 10:32:17'),
('915d88c8eb93debafcee32f9973028752ce496370276948d3041789a7af2717b31b8aa1700881a00', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:17', '2024-05-03 05:02:17', '2025-05-03 10:32:17'),
('dff19753e5d3a599d4609240e5b565bae5ad259a28fcd914d758d498fdf66a8ebe931392caeef661', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:39', '2024-05-03 05:02:39', '2025-05-03 10:32:39'),
('e37d86f0260231c2fde30a7bd1d8e92f8de23e75fd67b8fbac521c378e46ad5dae371e54c3e96cf9', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:02:53', '2024-05-03 05:02:53', '2025-05-03 10:32:53'),
('068565d3e1bd6a52c6387495484b598a754e38b97991be22b5e31cfd5a50fddd0fc52666c67b892a', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:05:05', '2024-05-03 05:05:05', '2025-05-03 10:35:05'),
('8337e8842c60d8179fa227d7c708a4317b2b280e4aca05ebea0dd0e79425fa1d1bd9d343d48d2c93', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:05:40', '2024-05-03 05:05:40', '2025-05-03 10:35:40'),
('ea32ef4e21a029d7c8a296500bd3f19507212397a1df15cf5a3a8a0c25eb048701e6a7b31800e3d2', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:06:08', '2024-05-03 05:06:08', '2025-05-03 10:36:08'),
('5ed242e89c0f27c9b7b645c97c1b6e3a7c84f08167881bb3ee03be457bf744c59587b56903ae77b3', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:06:36', '2024-05-03 05:06:36', '2025-05-03 10:36:36'),
('8fe8d8b51640b37c233d50f9b8550b6adbc12f955701d688accb7adf93d63352e09a53456e276778', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:09:30', '2024-05-03 05:09:30', '2025-05-03 10:39:30'),
('812b8d76383b8dab95f0d9095efffcd6985450ca51d332fe7c3b363ecb9b7f97fc13cfbc2c654847', 25, 1, 'AppName', '[]', 0, '2024-05-03 05:10:12', '2024-05-03 05:10:12', '2025-05-03 10:40:12'),
('95cfd2b2491c08218f655d3f219b7e5974a10580756dfad824e94e60d7b5575a17f7048ef45adbbf', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:23:43', '2024-05-05 22:23:43', '2025-05-06 03:53:43'),
('f78bb34f6347e5df3f796866fbebff61466c358d6ac37983161eee6b23e9731a4d599a721613246b', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:43:48', '2024-05-05 22:43:48', '2025-05-06 04:13:48'),
('591cec3735d16df6be7ec8ae40d8499d1a11d3316a02a2e4496e3598a860619aa6fb44d2d4f5ff86', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:45:05', '2024-05-05 22:45:05', '2025-05-06 04:15:05'),
('9eb23e2c99e5dbf3e35f06263ceadf535659a7033fe5d8a26d61438c2305da9cd3af86d277684862', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:46:26', '2024-05-05 22:46:26', '2025-05-06 04:16:26'),
('b5e107ff92d185aad6807b8c2eeaae7bb063001aeb60f43fac14c12bb67f8930ddd39a561040a09c', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:52:28', '2024-05-05 22:52:29', '2025-05-06 04:22:28'),
('dd45d8ebb2da95d17c22cfe242e164a956001882979df8e32a3666ff827970d9fd5a751e67258b72', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:53:09', '2024-05-05 22:53:09', '2025-05-06 04:23:09'),
('494a19a848ad7d20df9af2eb17af1361ddb3c8a57a8bca36d8685261a44c22a4992732c5ce3b2c91', 25, 1, 'AppName', '[]', 0, '2024-05-05 22:55:03', '2024-05-05 22:55:03', '2025-05-06 04:25:03'),
('66d50fb24ad86f763aa531ad4ed489cb5ac71d94d8d4913002fc4e250db577e847e6e3324091a487', 25, 1, 'AppName', '[]', 0, '2024-05-06 01:42:58', '2024-05-06 01:42:58', '2025-05-06 07:12:58'),
('36463ad5793d8bf186f4cd15330940d5122b633fbd8aa2b800c25088ffb479bebcc723e9b3930c9a', 25, 1, 'AppName', '[]', 0, '2024-05-06 03:17:41', '2024-05-06 03:17:41', '2025-05-06 08:47:41'),
('a00e9a49dbe63bb51ade9c9119eeafd1f863da1ecaf3e064e10a8a72d8a5481c0e288f59650762f7', 25, 1, 'AppName', '[]', 1, '2024-05-06 03:40:41', '2024-05-06 05:11:47', '2025-05-06 09:10:41'),
('2666f2521791632f9bcb1b688da98279a17f6a0f9d43db41edd4381979ec474d502161644cdccb21', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:20:59', '2024-05-06 05:21:10', '2025-05-06 10:50:59'),
('897cbb4c52ef780f1a7da822165b6ec2d4f710a6db21a5669a74243955d76112e7d7474abaa636ec', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:22:00', '2024-05-06 05:22:24', '2025-05-06 10:52:00'),
('fd5a21692ac44ee58add7ec93df88c2fdc7c697d6dd87526aa4c6e10db00dfefd6b419ebb138fbe8', 25, 1, 'AppName', '[]', 0, '2024-05-06 05:22:36', '2024-05-06 05:22:36', '2025-05-06 10:52:36'),
('e9008696da07cd80b3c6b5abfe1218cb6b9904f7a9f120cfd1b63cc2e19152bb246fa0967c9a7f43', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:22:50', '2024-05-06 05:23:04', '2025-05-06 10:52:50'),
('12522df94557e27143a0f3b03c29531c751c1a6bedaccb6224eecf3f5e807b179680fd27f5e06e7a', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:34:11', '2024-05-06 05:35:27', '2025-05-06 11:04:11'),
('b9b1ee131b41e186c1073f260edf27b7a4c78b4518f03e534463119c31f1c754d3f3c891fec221b0', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:36:31', '2024-05-06 05:37:00', '2025-05-06 11:06:31'),
('5b840dd6264b1cdcc7f2a9b44ae86e6b084bab4089fadb61bc190092452476a4825ee5644d1088dd', 25, 1, 'AppName', '[]', 0, '2024-05-06 05:39:25', '2024-05-06 05:39:25', '2025-05-06 11:09:25'),
('89d547f75e65886a13a626c28960190e0fba8aea3bd72bb27b95f3b5142424653058b8194ba7b18b', 25, 1, 'AppName', '[]', 1, '2024-05-06 05:45:53', '2024-05-06 05:45:56', '2025-05-06 11:15:53'),
('57efc3aee26593e7b3c5fcdd65a0e99a527b639de98036253298960eb4d4b028184a38139641718e', 34, 1, 'AppName', '[]', 0, '2024-05-06 05:56:45', '2024-05-06 05:56:45', '2025-05-06 11:26:45'),
('00af3437e86223e7ded27da55b21dc4f115ccec5def9d376013d17d06cac1f446cf2dc9eda45cd49', 25, 1, 'AppName', '[]', 0, '2024-05-06 05:57:24', '2024-05-06 05:57:24', '2025-05-06 11:27:24'),
('2e0d8dce584c42096b52fd880925a761e4b6f9327378dc141c13c684ceb76bf13aad31b7a48b702c', 34, 1, 'AppName', '[]', 0, '2024-05-06 05:58:08', '2024-05-06 05:58:08', '2025-05-06 11:28:08'),
('6c237aa92cc76519c08f2b775f17a6ec5decda1e8626a7a185945023ca9a0fb298b73ab71f132cb0', 34, 1, 'AppName', '[]', 0, '2024-05-06 05:58:44', '2024-05-06 05:58:44', '2025-05-06 11:28:44'),
('2dca3598c181878e84a9a28cf68a553909e048b5a4c00d537c12a1de04260c16a2fbbc4c9d5d2130', 34, 1, 'AppName', '[]', 0, '2024-05-06 05:59:16', '2024-05-06 05:59:16', '2025-05-06 11:29:16'),
('096893d9cc803de889691656f5cbf156b433d37a7334bf21f0ad869f594f641c9bac37b268cf00e4', 25, 1, 'AppName', '[]', 0, '2024-05-06 06:00:08', '2024-05-06 06:00:08', '2025-05-06 11:30:08'),
('8751d3168295f37172d8b81eee47d26ef5a6e729f282bec60ccd046e853f76026309a03fde405625', 36, 1, 'AppName', '[]', 0, '2024-05-07 12:07:51', '2024-05-07 12:07:51', '2025-05-07 17:37:51'),
('53930b55051d33651ad699708ca9fe6505e9bba005467745ff311a4e87dcda3309a6ba0e740308bc', 25, 1, 'AppName', '[]', 0, '2024-05-07 12:15:25', '2024-05-07 12:15:25', '2025-05-07 17:45:25'),
('5b20c6b65a2325bfd5090ff491a99e037eef8859ab1ac12b232a391bfaa386e9d5933bb142ff0a9e', 34, 1, 'AppName', '[]', 0, '2024-05-07 22:22:51', '2024-05-07 22:22:51', '2025-05-08 03:52:51'),
('8580871a390bd74272c9968d5017c5f574ee063c80f6ca0501461b730d3591b676d3244c7ba031a4', 34, 1, 'AppName', '[]', 0, '2024-05-07 22:39:13', '2024-05-07 22:39:13', '2025-05-08 04:09:13'),
('8d191934b6e21391112d58de1eb37277b9c9d182fde2ef2f1ef43e205186dcf40ae3431374bae6ea', 34, 1, 'AppName', '[]', 0, '2024-05-07 22:39:36', '2024-05-07 22:39:36', '2025-05-08 04:09:36'),
('92a45f09241704b41c4d6a8288a48d336956f5376ff9bd2542d67bef15ac76db33c0247ed89b6ccc', 34, 1, 'AppName', '[]', 0, '2024-05-07 22:55:53', '2024-05-07 22:55:53', '2025-05-08 04:25:53'),
('bf9bf3e950de771829e41cad7633ea9159661a3730133340e3c0eeae6a30c6e1482eeaed8ff7b367', 25, 1, 'AppName', '[]', 1, '2024-05-07 23:06:07', '2024-05-07 23:24:57', '2025-05-08 04:36:07'),
('f1bef16050b9651d0a381b31a211894aecaf39c4a11ee9e8ccd2d5032b12fb6461af3f1d1365bab6', 25, 1, 'AppName', '[]', 0, '2024-05-07 23:16:47', '2024-05-07 23:16:47', '2025-05-08 04:46:47'),
('8d7aa1c1caee0becd79e53354f86c65e08ae36d8b8f103b0d95ab35ea1b90450eab3eff04c6d69fc', 38, 1, 'AppName', '[]', 0, '2024-05-08 03:07:47', '2024-05-08 03:07:47', '2025-05-08 08:37:47'),
('8c2ca566c5de511c1f2f6f5caa322c7e38e8fed2dd9289b23476d5cd8538bf7ba96ab808c932192f', 38, 1, 'AppName', '[]', 0, '2024-05-08 03:08:50', '2024-05-08 03:08:50', '2025-05-08 08:38:50'),
('fb9b9785ccec73532d54765575b63fd86028ddbf079314bdfb132a41c00a3f72f9104f05fdc5e71d', 39, 1, 'AppName', '[]', 0, '2024-05-08 03:11:01', '2024-05-08 03:11:01', '2025-05-08 08:41:01'),
('118d612c8149093f3498f3f1c7b960eced4db8ea55fe6d8bf5cca0dc874964e8db3d62769546c9af', 39, 1, 'AppName', '[]', 0, '2024-05-08 03:17:26', '2024-05-08 03:17:26', '2025-05-08 08:47:26'),
('b157ba4e49565ed23b315f65a50970a8bea4e5e09738ad3b686fc64fec0adf9eac59658edf9ac4f6', 39, 1, 'AppName', '[]', 0, '2024-05-08 03:17:55', '2024-05-08 03:17:55', '2025-05-08 08:47:55'),
('c05d04e77c81cdaea9e5b24da9b53ab16ac83290f053fa20f7de2add791e0bc417a7564476692a50', 39, 1, 'AppName', '[]', 0, '2024-05-08 03:20:39', '2024-05-08 03:20:39', '2025-05-08 08:50:39'),
('57b4695198ac6b155c5c0459d867e279317927f5b5c636182bd0c1360924ec06c5fade19c49143c7', 40, 1, 'AppName', '[]', 0, '2024-05-08 03:46:21', '2024-05-08 03:46:21', '2025-05-08 09:16:21'),
('793a6814f88191d9e98a10c22a34a26d832af8d9145cbcb5506cf6dc8c272c4ce4603fa7aaf5a9d2', 41, 1, 'AppName', '[]', 0, '2024-05-08 06:46:14', '2024-05-08 06:46:14', '2025-05-08 12:16:14'),
('29d6a79232b6c3b938131f32b7a76d4ffb936618bf9bcf39dec911f1a404df65ed6ae345b23cf4b8', 41, 1, 'AppName', '[]', 0, '2024-05-08 06:56:29', '2024-05-08 06:56:29', '2025-05-08 12:26:29'),
('dcbbe7ae78710ef9b62246ae9473ee615e514f1f0e0ed0d5b336c978f3d289025066fd552db8e249', 41, 1, 'AppName', '[]', 0, '2024-05-08 06:58:47', '2024-05-08 06:58:47', '2025-05-08 12:28:47'),
('887a7dedc1c1bb5feb11db91249bc82dbd842f292dbfb75eb0c70e7a96ee917a68accd1a7b6f75f6', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:36:29', '2024-05-08 11:36:29', '2025-05-08 17:06:29'),
('a56d637b0f150f2562af515758ef3975f5955bd06bf3b2592e00f9124f756615a0918777d1d84673', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:38:41', '2024-05-08 11:38:41', '2025-05-08 17:08:41'),
('6059d89b464f7696fc364c3f782ca16d81116716fc355171a3670458a47fbb19db6e1990eb605840', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:40:25', '2024-05-08 11:40:25', '2025-05-08 17:10:25'),
('86bea0eef53849971d038353bce4781e244e7107203ae45a24af150cb44cdf955b14614055ad5b87', 38, 1, 'AppName', '[]', 0, '2024-05-08 11:49:08', '2024-05-08 11:49:08', '2025-05-08 17:19:08'),
('87da845a08f4696856876a50fd28a2692868e1e8f6f7e5582544755682dd0ae2e7c5a9c6b5baeee3', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:52:21', '2024-05-08 11:52:21', '2025-05-08 17:22:21'),
('a732fc864a64bc51a862219179b66f01d2471c1978110cc3c11e95015a6305d031cdc9cccc1e088a', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:54:24', '2024-05-08 11:54:24', '2025-05-08 17:24:24'),
('7b64cf188559def6ecd1c1b5a3e10a16a7089ba02c0c1e9f44be07dbcea9c4c9fdd334bb79b03455', 42, 1, 'AppName', '[]', 0, '2024-05-08 11:55:51', '2024-05-08 11:55:51', '2025-05-08 17:25:51'),
('9cf94a7ffefa0824e6a8ab893f381739bb40730dafac8b5b07df66100128785c06fc8d107521711f', 42, 1, 'AppName', '[]', 0, '2024-05-08 12:00:52', '2024-05-08 12:00:52', '2025-05-08 17:30:52'),
('d93af9eacb13ae5161ec3bbee27acd02725528421fed46b28dcf518d9c7afec91ac86c0c198037d8', 42, 1, 'AppName', '[]', 0, '2024-05-08 12:02:15', '2024-05-08 12:02:15', '2025-05-08 17:32:15'),
('416bffdfcd113e0c433c61c2b4a11c4f15a98e68a0040251851d350c3c69df3be244f44a13372fd7', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:14:03', '2024-05-08 22:14:03', '2025-05-09 03:44:03'),
('4910be72a630ec530cb3a860ac1c202570cc700f3869dd606ac42957ad7f5842ab8c56a080556a32', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:16:27', '2024-05-08 22:16:27', '2025-05-09 03:46:27'),
('5209795afe0852896e9cc03af07e8ac2b62f0491e38c3baeb4eec9d793ee4c8c668720571cda2204', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:27:09', '2024-05-08 22:27:09', '2025-05-09 03:57:09'),
('14cd9ee5940183a838ccfe39dbffea4594f299228b74fb541dd6e6014e3f8604fc6f19c23840048c', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:40:07', '2024-05-08 22:40:07', '2025-05-09 04:10:07'),
('af4d88586361adf1ffcb88fafd93674b03d3f6716f8d091336713abaea896815429b1cb71a3a120f', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:42:31', '2024-05-08 22:42:31', '2025-05-09 04:12:31'),
('d3ca48f6543f990b3215423c514b1ac1c239adb020ce659fce1d98ea290c7a27a2cf6a38383aac13', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:44:20', '2024-05-08 22:44:20', '2025-05-09 04:14:20'),
('8bf3e4a69294c621ecbbf5fd0d563e47d7c67c51d90fc84ec862618e713fe48d13d8605639947f99', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:47:27', '2024-05-08 22:47:28', '2025-05-09 04:17:27'),
('0e5d0c5a86b66a79673b5f9123603fdea20d41f63e71ac128bb03895675757d6ad58f2116b828cef', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:50:31', '2024-05-08 22:50:31', '2025-05-09 04:20:31'),
('0e51df68dc38ebb9ec7ae6eff6c23bc8abf53fb00001b70d627c437aa65011c577e01a438eceb5aa', 42, 1, 'AppName', '[]', 0, '2024-05-08 22:55:25', '2024-05-08 22:55:25', '2025-05-09 04:25:25'),
('4b2866584ae5581c3dc2759b313dc8d99076a9a74dd129e6643e049bd4120dd3479c165a367f1fb3', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:06:32', '2024-05-08 23:06:32', '2025-05-09 04:36:32'),
('0b2efe7d78bbf1ece09c112e6fe20697f5f7327453940931db62f95b20b0fb67647e037b2b1676db', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:13:51', '2024-05-08 23:13:51', '2025-05-09 04:43:51'),
('d8763c30ac5a82915bde94acad41d9bfb50308106c8ca84d21d45bc560f458ced6a4613a038fd6a0', 38, 1, 'AppName', '[]', 0, '2024-05-08 23:14:45', '2024-05-08 23:14:45', '2025-05-09 04:44:45'),
('81c6f6bb90b5a125fd406e2b9b27ed1a12ab6d9980a3b016dd3096b354f20a08e3fcb0235cac71e6', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:18:30', '2024-05-08 23:18:30', '2025-05-09 04:48:30'),
('704013be4628bb9b3619197ac28058e3e3598c09361322866ed81b39b11b01585a9a220b2429f061', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:27:30', '2024-05-08 23:27:30', '2025-05-09 04:57:30'),
('feff63354352791163361e1798d644f7d6c5f5d610f89a754ba66b64409238181c4acd2ce81384d1', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:39:07', '2024-05-08 23:39:07', '2025-05-09 05:09:07'),
('2a12c68fddab359211e4e61fff9187247db9cdf922d09d6c93fb55ca767f256463a09a5f14d34ba7', 38, 1, 'AppName', '[]', 1, '2024-05-08 23:39:13', '2024-05-15 06:32:30', '2025-05-09 05:09:13'),
('0fca6166ada36c66b9f28ab9173a99d291deded6fd2c80ec4a687626e0e08193888451c04ac6a36e', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:40:41', '2024-05-08 23:40:41', '2025-05-09 05:10:41'),
('87d10faf7a77c503ae74a3f993db56c88db4913bee978241de87fc70c56bbae5511daabb66e38060', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:41:55', '2024-05-08 23:41:55', '2025-05-09 05:11:55'),
('84bf7a9fdbea9d32631ba4deca28bc20c360a73cd8bee10a4b8e447b9f7179d6065bbc6779dcdcae', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:45:37', '2024-05-08 23:45:37', '2025-05-09 05:15:37'),
('98db0d2c34670cbab5e866bc56e94e1b1068a5ed87058ae4e798f514014184df4cecaca921cd55f8', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:52:25', '2024-05-08 23:52:25', '2025-05-09 05:22:25'),
('f9d2eae1a138d745a6aa8d7475d4a1f27726fb06ec039350b7aa95ea8b86f1960905eb54379878f1', 42, 1, 'AppName', '[]', 0, '2024-05-08 23:58:39', '2024-05-08 23:58:39', '2025-05-09 05:28:39'),
('7242eddf5a3abcc444d39e3a55eaec41d370af37940b7f23cc2a72968bdfdc5b4100cf4bbfdba22d', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:00:52', '2024-05-09 00:00:52', '2025-05-09 05:30:52'),
('57db98561978c241cb090805679479783a00575fc5a22dc3e5b64ca453c6ef49062e47e609ab642a', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:09:17', '2024-05-09 00:09:17', '2025-05-09 05:39:17'),
('74c021d0f376c57f71e38a92a2178d195a7e06b0e897e8025b4f435babf69b465d1fc42c1d57d83d', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:12:11', '2024-05-09 00:12:11', '2025-05-09 05:42:11'),
('a16aca90b547ee12f9019437ccb683c3ebe8cd8159eb5ba19eb5f4070abc7f7b573fee6aa1649d42', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:14:47', '2024-05-09 00:14:47', '2025-05-09 05:44:47'),
('9f1a487d1a8483ad2a68a29e54b6a9ad58ea5ddeebe6ee4d56837bd25ce35bcc783fd548e91de70f', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:18:22', '2024-05-09 00:18:22', '2025-05-09 05:48:22'),
('2ab2ad66fdbe12e1887b9ec29d1fab76fa9289c4d1138261ca9af03a2e9378b18230a02b57e77f23', 42, 1, 'AppName', '[]', 0, '2024-05-09 00:29:25', '2024-05-09 00:29:25', '2025-05-09 05:59:25'),
('839f8df530087a688b2212ac6e129bcda4ad3094c4bcf967170e3e8d4628f03b261788a328d62b49', 42, 1, 'AppName', '[]', 0, '2024-05-09 04:03:55', '2024-05-09 04:03:55', '2025-05-09 09:33:55'),
('077b8e94df37c24be900f8b792e8aeebc599516c740f8b5288c29427f6fd105ebfd6703e639e1b9d', 42, 1, 'AppName', '[]', 0, '2024-05-09 04:06:55', '2024-05-09 04:06:55', '2025-05-09 09:36:55'),
('cd6f2647459d0fc036a992848cf1555a602db8417c51653c166dfa156db29682e6bf02e998390c2f', 42, 1, 'AppName', '[]', 0, '2024-05-09 04:39:54', '2024-05-09 04:39:54', '2025-05-09 10:09:54'),
('d4f86da1ee6f64f63948aed9aad22c9c7fb7ffb73442e34f1083d40097b251a54a358c84c71f0fff', 42, 1, 'AppName', '[]', 0, '2024-05-09 06:15:41', '2024-05-09 06:15:41', '2025-05-09 11:45:41'),
('0f58c04509e71303fe834d05a72c057fa59dff08bdee22859aa5c42c252ad90a7315520f8d83594a', 42, 1, 'AppName', '[]', 0, '2024-05-09 23:10:21', '2024-05-09 23:10:21', '2025-05-10 04:40:21'),
('37404ad69f093792c12a7ba95b2cefc726638aca70f55d9d1f34f02016e3d683675dc79a84a06e0e', 42, 1, 'AppName', '[]', 0, '2024-05-09 23:13:30', '2024-05-09 23:13:30', '2025-05-10 04:43:30'),
('b394fa038f7d52b867a9ed8c8c301101b5090357ce1a490e38054ab0a22d521bbc7ebcaf62bd52e1', 42, 1, 'AppName', '[]', 0, '2024-05-09 23:15:57', '2024-05-09 23:15:57', '2025-05-10 04:45:57'),
('e56cfaa01de45c0942fa7da6d0260593fc287edb1d93bcd5b78e1d19f7cb597df8909bbe9a0eb0a6', 42, 1, 'AppName', '[]', 0, '2024-05-09 23:37:40', '2024-05-09 23:37:40', '2025-05-10 05:07:40'),
('3a759a4de4745324a1710ca73fb65e1d70f1ccd3f514a6a045539e68fbbdec14a92eee99e2ed8fbd', 42, 1, 'AppName', '[]', 0, '2024-05-10 02:56:20', '2024-05-10 02:56:20', '2025-05-10 08:26:20'),
('c79cd0f552a5d59c128cc91be95524e3a3e2493a57362ed0298882c36710251cb2717ac8c5628d77', 42, 1, 'AppName', '[]', 0, '2024-05-10 02:57:49', '2024-05-10 02:57:49', '2025-05-10 08:27:49'),
('0becbe9966de6759aca429cf8fc0fd6fa9fc89cabb79c11846686e5af2218154d39c7a8e0c1b5a30', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:00:27', '2024-05-10 03:00:27', '2025-05-10 08:30:27'),
('0b703484fa4de14b869426a3c8e87466d3b978e44a2d713ddf7ef6a9c39db8f205d9e22439273517', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:01:14', '2024-05-10 03:01:14', '2025-05-10 08:31:14'),
('594deef98228124f1eeda63d0f76cdbad0aab4b76b680c69d8649ead6248fed09c9bfd9a20f1cf02', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:08:08', '2024-05-10 03:08:08', '2025-05-10 08:38:08'),
('224fb97dbe8c44b30b9670143e4b7ce81255a805c2f8221c25ef9303dac8aa16b40daaf174644b8c', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:12:39', '2024-05-10 03:12:39', '2025-05-10 08:42:39'),
('2558fdea255c0a98b935d0da59d308d129d0e6035a538703e56523369ca6177dbe5fe3868f433372', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:14:44', '2024-05-10 03:14:44', '2025-05-10 08:44:44'),
('50f60539a62ce17dac4225fb770ed73a34c97d1d119ed13d6bdcf349a83427ff7eaa42051a1b0a48', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:17:01', '2024-05-10 03:17:01', '2025-05-10 08:47:01'),
('215b3113e5b4186ce88b0d722880770407673425909e4a1e53206fa95650fb885b160aa0642eeae6', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:19:07', '2024-05-10 03:19:07', '2025-05-10 08:49:07'),
('ee509091454425e5e3a06d3d191caea76c9648752dcffbd5def404994428e2c19f1e3a34a45876d4', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:20:13', '2024-05-10 03:20:13', '2025-05-10 08:50:13'),
('fadfd4ad5ea515503e4e99ee10f622e622cfb9fee8741d25a2c043d3d6396d9cb9a75eb284277d57', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:20:52', '2024-05-10 03:20:52', '2025-05-10 08:50:52'),
('b649b13106ed2c3f6013cb80e30aa65a1f3d8c2a642465a6e94de065ff4e8149be890d09910330e9', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:21:37', '2024-05-10 03:21:37', '2025-05-10 08:51:37'),
('be7f4825e5bd64065286421c83b23f5eaeaa01fafaed6c864f5578253e0827e27e7e362a11e958bf', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:23:22', '2024-05-10 03:23:22', '2025-05-10 08:53:22'),
('ea9744c745c33d53fea4442aa7b2d42c6b5bd5842c629ad875b01bf84095f02d70acf1c29ac51306', 42, 1, 'AppName', '[]', 0, '2024-05-10 03:24:51', '2024-05-10 03:24:51', '2025-05-10 08:54:51'),
('bff670f4c4de618f002031ff596113b9de027a8da608341ff9d44507a021e5f26da18163e7082a52', 42, 1, 'AppName', '[]', 0, '2024-05-10 20:01:03', '2024-05-10 20:01:03', '2025-05-11 01:31:03'),
('f73b7a8da13cdba48939dd94edc1778d456bb68408c4fcae39d4b58307a0bc0db4727eb09339c06b', 42, 1, 'AppName', '[]', 0, '2024-05-10 20:01:27', '2024-05-10 20:01:27', '2025-05-11 01:31:27'),
('f106cf22bd21579ef62e427bdb9dc818c5218313d06807f565cb6a9983181dc60d377a0bc009e84c', 42, 1, 'AppName', '[]', 0, '2024-05-10 20:02:30', '2024-05-10 20:02:30', '2025-05-11 01:32:30'),
('afe7a27222722561955f0b76df08fde88bbedbe11e6306670899c73b4957e2ef39a7422cbf3a5297', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:15:22', '2024-05-11 07:15:22', '2025-05-11 12:45:22'),
('62cf772fbef23c59f5687a83b52a46c4066308bc90a39be79b5fa2a0d22c328cdbc0d490bb8f7e52', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:15:26', '2024-05-11 07:15:26', '2025-05-11 12:45:26'),
('04ccf345eb00977803cc504f5300b413999fb2e9533b70f492bce68c570a261d02c32752fef04695', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:15:33', '2024-05-11 07:15:33', '2025-05-11 12:45:33'),
('fd3dec9cf7c98f4c2e135589e375dbab5da29207e10cadf0b2c4b1f3ef4256aaad4ec4045efe8f9c', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:18:07', '2024-05-11 07:18:07', '2025-05-11 12:48:07'),
('48466b73e6165e2c1c4471c5d3141063125a3b0ebc8566508a1e42249b1948f536c44c956c5a4609', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:21:17', '2024-05-11 07:21:17', '2025-05-11 12:51:17'),
('be7d603661da0009f1ad058c833dab9189048b7d9f615dc46a7a3b1e7ff23c6618d9453f71ec42ee', 42, 1, 'AppName', '[]', 0, '2024-05-11 07:24:45', '2024-05-11 07:24:45', '2025-05-11 12:54:45'),
('5a0d351576e040f693a2de8c38751234c440d7d8d1b33e27b38dccc2868faeeb342a958c88a8113c', 42, 1, 'AppName', '[]', 0, '2024-05-11 08:48:00', '2024-05-11 08:48:00', '2025-05-11 14:18:00'),
('a906469821fad25f94a5ece4cdb740db33124962cccd98e86008e42627c7f357e66f736ce7b64fea', 42, 1, 'AppName', '[]', 1, '2024-05-11 08:54:46', '2024-05-11 08:57:42', '2025-05-11 14:24:46'),
('e71b727a83696e5e2a7afff4667eadf18c4b9e899e5939532e9250f3ba7b5f6adb96050cd476fe7d', 42, 1, 'AppName', '[]', 0, '2024-05-11 15:02:36', '2024-05-11 15:02:36', '2025-05-11 20:32:36'),
('324ad46529b9ffff3770811b2bf598cc889e8dee485dd2c11bca0fb6475291261a4c4f92c94c3fd1', 42, 1, 'AppName', '[]', 0, '2024-05-11 15:10:27', '2024-05-11 15:10:27', '2025-05-11 20:40:27'),
('ee16b0dcd289c2f76c8da14a01edca8d1c4be60d35fe6e5056a8ea62ce09dfea60b86b4719c55813', 42, 1, 'AppName', '[]', 1, '2024-05-11 20:25:16', '2024-05-11 20:26:21', '2025-05-12 01:55:16'),
('b11c379975b680173c5a4885f260369b0b9c935ff8f5a80d22585a9b6bca8f97a17faaf50645ebe8', 42, 1, 'AppName', '[]', 0, '2024-05-11 20:46:08', '2024-05-11 20:46:08', '2025-05-12 02:16:08'),
('86b92f04325cf49a3d7212c406497fc9c599709bbe645203d78194afac18df072ac17232804af0fb', 42, 1, 'AppName', '[]', 0, '2024-05-12 00:00:19', '2024-05-12 00:00:19', '2025-05-12 05:30:19'),
('8f0657e9968f17196f104d20ab8e2f5ad77959dbcd2e259f8ce05888e624d7ff64a1feb40907621e', 42, 1, 'AppName', '[]', 0, '2024-05-12 22:18:47', '2024-05-12 22:18:47', '2025-05-13 03:48:47'),
('86733d4edc0dd14f50036865f5956e2da2eabd17ce352fe75741fbe67a9b4e3ab4777b9c4a89ee24', 42, 1, 'AppName', '[]', 0, '2024-05-13 00:48:46', '2024-05-13 00:48:46', '2025-05-13 06:18:46'),
('624aad6cc528db00091beef5c89c0f8135f8f40573e7d8ad8059aec1ebf59438d2ee1ab2f58d2ab5', 42, 1, 'AppName', '[]', 0, '2024-05-13 01:25:52', '2024-05-13 01:25:52', '2025-05-13 06:55:52'),
('37dfa2b0c8dc1941ce6edd56dc830a2c03239e52128aef2b6291a4a36848b5b66a395bd25c6448ce', 42, 1, 'AppName', '[]', 0, '2024-05-13 01:54:25', '2024-05-13 01:54:25', '2025-05-13 07:24:25'),
('cd68a9aef94e8ebf97a6967e03c019c12b7cbffc6504f183b39b78b1042cb26000bb7ab54a6bdee6', 42, 1, 'AppName', '[]', 0, '2024-05-13 01:59:45', '2024-05-13 01:59:45', '2025-05-13 07:29:45'),
('057ee9231c094f2681108c11ed296febdb432b59221cada037fc91df05968aaedeb9ddd1da3dfa91', 42, 1, 'AppName', '[]', 0, '2024-05-13 02:04:18', '2024-05-13 02:04:18', '2025-05-13 07:34:18'),
('6df6bf41e8773a629b79ca5093f39b098b8c11180b19cb3ce1f77f2af017408c096fe17f20fdda81', 42, 1, 'AppName', '[]', 0, '2024-05-13 03:23:46', '2024-05-13 03:23:46', '2025-05-13 08:53:46'),
('766a4132ef84b4ae11d220c57cc9636a5bb4086a36cb666d2a7b810f1988a3fea3bca6c53cb5e042', 42, 1, 'AppName', '[]', 0, '2024-05-13 04:33:04', '2024-05-13 04:33:04', '2025-05-13 10:03:04'),
('bacaa8b52037263f37e670e7c28610bfdaf3ba2d5b4ecda5c78afedd1e65486508adbd29f3b1bf52', 42, 1, 'AppName', '[]', 0, '2024-05-13 04:43:31', '2024-05-13 04:43:31', '2025-05-13 10:13:31'),
('2f02dfaa395e679f3ceb48f1c746e9f827e6d4ddda5166a1822730ff46e17633cfe5dfea15e13335', 42, 1, 'AppName', '[]', 0, '2024-05-13 05:07:37', '2024-05-13 05:07:37', '2025-05-13 10:37:37'),
('5dd3c626a9192155775ea5e235db113d31ab546ea7413bcc2689ced867c44a17992abcb279c7c558', 42, 1, 'AppName', '[]', 0, '2024-05-13 05:14:20', '2024-05-13 05:14:20', '2025-05-13 10:44:20'),
('9cd47025317f27ebfc4ad80438f6d8ccc23e0b844116d4ecef88ff1900d311a2728e50eeed40d9a1', 42, 1, 'AppName', '[]', 0, '2024-05-13 05:57:55', '2024-05-13 05:57:55', '2025-05-13 11:27:55'),
('e39b00376b8dd74247223ed8aedb9a9215f7e8681d3c8c6e1d1c0f1ba851ba42adb6a328827ad4e6', 42, 1, 'AppName', '[]', 0, '2024-05-13 06:29:48', '2024-05-13 06:29:48', '2025-05-13 11:59:48'),
('7dbd6e56eba71a639489ae233ab261b7f560180bbee928fc5924e5761b895d4824e0eb672600bece', 42, 1, 'AppName', '[]', 0, '2024-05-13 10:49:03', '2024-05-13 10:49:03', '2025-05-13 16:19:03'),
('45a143fd545b72d7905c4da19da4e508bec3632c581af1412d7faf42258e6f1d7bbc44ebbe31a871', 42, 1, 'AppName', '[]', 0, '2024-05-13 11:52:05', '2024-05-13 11:52:05', '2025-05-13 17:22:05'),
('2f85d1e9ce9eb58d5b44defd3b70a90b2845327702625eb1fa1aa8503408de3f294c59eb6ee8ff06', 1, 1, 'AppName', '[]', 0, '2024-05-13 13:20:10', '2024-05-13 13:20:10', '2025-05-13 18:50:10'),
('0c4325a45532ff3874369a6b1074f8c174d4700bb415d6ceaba58e32aa7dfacc842fa6e824bec150', 42, 1, 'AppName', '[]', 0, '2024-05-13 22:54:25', '2024-05-13 22:54:25', '2025-05-14 04:24:25'),
('9cbe8354834e01b025f322a0c815e3a59d387dffc62a8815ed8f3ff291196f7ff0c787301ea55c0a', 42, 1, 'AppName', '[]', 0, '2024-05-13 22:56:38', '2024-05-13 22:56:38', '2025-05-14 04:26:38'),
('817fa659aabbe09781a754ed4b316daff2db5826572ebea3d4368752fe928be91f5cb52c25340566', 42, 1, 'AppName', '[]', 0, '2024-05-13 22:59:54', '2024-05-13 22:59:54', '2025-05-14 04:29:54'),
('1346733fabb456a6fc44e90a4e484e76705f0211d5512a80645e2f4e36b3a5cee044f13bdf3f786a', 42, 1, 'AppName', '[]', 0, '2024-05-13 23:09:09', '2024-05-13 23:09:09', '2025-05-14 04:39:09'),
('ab4055ab722fea9d87c75e623dc1d1c32d87846b822c7539eccbb8657af9b31d8781bb7311c49fec', 42, 1, 'AppName', '[]', 0, '2024-05-13 23:13:02', '2024-05-13 23:13:02', '2025-05-14 04:43:02'),
('649543e75cae1e97d11fd7ff3e4a8fbff26d60039282fdbd9694ec4c966ffd1f66549ebf316eeb61', 42, 1, 'AppName', '[]', 0, '2024-05-13 23:38:39', '2024-05-13 23:38:39', '2025-05-14 05:08:39'),
('b2fb114767e3e6586d902b16097b594a46c6c48f7edf2a57771c187b61f563366cb05c65babc9655', 42, 1, 'AppName', '[]', 0, '2024-05-14 00:08:05', '2024-05-14 00:08:05', '2025-05-14 05:38:05'),
('2b6427d33dc4d94aa486db127b44a48df7d90469eb6ec8060d60bd2cf6568de46472106717910aab', 42, 1, 'AppName', '[]', 0, '2024-05-14 00:50:54', '2024-05-14 00:50:54', '2025-05-14 06:20:54'),
('58be35be20a1d3d96478be25efeb9aae699c02f21aa397ce9900c1280359b17cd220e612d82f11e0', 42, 1, 'AppName', '[]', 0, '2024-05-14 00:51:06', '2024-05-14 00:51:06', '2025-05-14 06:21:06'),
('12feffd2b04bfc85e1dd03a0cb623b946c53702749f29060574fb15b78e42ba6a7c877ff862f99fa', 42, 1, 'AppName', '[]', 0, '2024-05-14 00:58:49', '2024-05-14 00:58:49', '2025-05-14 06:28:49'),
('e42b6735ac05a456e0d8cd282e05b1cd70b9ab3817571cf5fda8e31846f43e5671f921b344f063d6', 42, 1, 'AppName', '[]', 0, '2024-05-14 01:21:19', '2024-05-14 01:21:19', '2025-05-14 06:51:19'),
('a40ed5868f060d4a4bc16de22d58a41d02f3da89ecfca2e5918fd50e383d62463ec17ec947551780', 42, 1, 'AppName', '[]', 0, '2024-05-14 22:46:48', '2024-05-14 22:46:48', '2025-05-15 04:16:48'),
('2868688e6df9d57235c57e93af31152e2d0c9666a68beeea45c333cc268569f8407aa1be9fe5cc72', 42, 1, 'AppName', '[]', 0, '2024-05-14 22:47:06', '2024-05-14 22:47:06', '2025-05-15 04:17:06'),
('4e9967af5fed941595e09729eab61c7d0ccff96952e747cba4eea791a4946f8c1ae4b1d8e60b4615', 42, 1, 'AppName', '[]', 0, '2024-05-14 22:59:55', '2024-05-14 22:59:55', '2025-05-15 04:29:55'),
('3ff46ec36d4f1020d4d17e92effe82b436072e6ea804d020dfd10b9fbea3a30911879b8fccb4538b', 42, 1, 'AppName', '[]', 0, '2024-05-14 23:05:30', '2024-05-14 23:05:30', '2025-05-15 04:35:30'),
('66f859ffcb64c88d9a0569549f42fa5dc54414b74a5ff9ce7a047928ee3492b1350ea34d00969563', 42, 1, 'AppName', '[]', 0, '2024-05-14 23:22:47', '2024-05-14 23:22:47', '2025-05-15 04:52:47'),
('d0544e83904255ecfb00b5cc4118ae5357fcbffa6840fac9d1c998a0662c7c2b2d246cd03ff0e87b', 42, 1, 'AppName', '[]', 0, '2024-05-15 01:45:25', '2024-05-15 01:45:25', '2025-05-15 07:15:25');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('bf3bfdc5cafa520224f4dc7d7b01c2fcf672414aa6e79e910d94d88cb88427d09d930515b7ec42de', 42, 1, 'AppName', '[]', 0, '2024-05-15 06:20:15', '2024-05-15 06:20:15', '2025-05-15 11:50:15'),
('b57fd0bc0de02cf06a71ed0fe7fcfc3329f37ea2ad4f65af68ff0953b417ca92f91c5d8c53d45913', 42, 1, 'AppName', '[]', 0, '2024-05-16 03:06:00', '2024-05-16 03:06:01', '2025-05-16 08:36:00'),
('5f830041c79a3d4946c41992604a10cddf3ece3b1f701ff2aa1d6f1046199e1861cefac2a0a44af7', 42, 1, 'AppName', '[]', 0, '2024-05-16 04:16:18', '2024-05-16 04:16:18', '2025-05-16 09:46:18'),
('8e2f522d82a2fec4797632c13139dc6ae2973afd314cb24dbb1dd132831f1e7bc685519bcf058ffc', 42, 1, 'AppName', '[]', 0, '2024-05-16 05:06:08', '2024-05-16 05:06:08', '2025-05-16 10:36:08'),
('948fd87d530f6557a1a3684e808959ad918a2ff34b3b38c106c567ca0963dfb21b6c27d71639f6d8', 42, 1, 'AppName', '[]', 0, '2024-05-16 10:42:54', '2024-05-16 10:42:54', '2025-05-16 16:12:54'),
('6f289373c5d99aecb87584fc008cc199646920b378e6e43ca08fd06b420682abb12aa135d21accfd', 42, 1, 'AppName', '[]', 0, '2024-05-16 22:16:42', '2024-05-16 22:16:42', '2025-05-17 03:46:42'),
('f2e7bceb249d9dfbdd31c5ea6f2ea735cf3d436217591b85d8ec2df50852221f80ff71598644b4a9', 42, 1, 'AppName', '[]', 0, '2024-05-16 23:30:32', '2024-05-16 23:30:32', '2025-05-17 05:00:32'),
('a39cd4cba5a0b20796a911fc875d48d92171f7c63c0c1fc609855be6dd3623c2409fa39da0e13110', 42, 1, 'AppName', '[]', 0, '2024-05-16 23:38:39', '2024-05-16 23:38:39', '2025-05-17 05:08:39'),
('0e5e73535c268700cc3943283a772f7a4e3f844d95f81475b2afc30f29cbcb124796efc222c90f43', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:28:34', '2024-05-17 00:28:34', '2025-05-17 05:58:34'),
('fcda9b7bcffc75acb86087bd4c174c78a3cdc12200297da4246dd7b0a2e58e398c804cd8077aabe4', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:30:33', '2024-05-17 00:30:33', '2025-05-17 06:00:33'),
('f0cc6548f5467248a8cea6da1037b6829fa5cb7d3bfc7e1f8eeb0b603ef7b5f53e24f87d37b4bf5a', 42, 1, 'AppName', '[]', 1, '2024-05-17 00:31:13', '2024-05-17 00:35:05', '2025-05-17 06:01:13'),
('cd537b7d1ad369c184059d4938a6e11318967ea836c9386eacef2ab904747010203c166223c48398', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:32:53', '2024-05-17 00:32:53', '2025-05-17 06:02:53'),
('18fb3bf33cf83b351b5dd18ebbd8c9b32f25c763b3d4a6d92f9850270c04be74b6580f6bafc5bab3', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:36:44', '2024-05-17 00:36:44', '2025-05-17 06:06:44'),
('446938c6c9eea01af679fe4d46217cb6978a62b3d96691cd4c6167587023c90a0b69ac0329d1ae5a', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:38:43', '2024-05-17 00:38:43', '2025-05-17 06:08:43'),
('a14ae82ad4bc6e67adad1108831f1a6716befc11dd401e426cd9918bbad666798e2620958d4f5672', 42, 1, 'AppName', '[]', 0, '2024-05-17 00:39:15', '2024-05-17 00:39:15', '2025-05-17 06:09:15'),
('0aeeee35cc847961d2e3d6a65fd7e65968ba3df1d5e56bcd00843224c5887225bed8756e9b6404de', 42, 1, 'AppName', '[]', 0, '2024-05-17 01:54:24', '2024-05-17 01:54:24', '2025-05-17 07:24:24'),
('16e425a24667c3300ad8298e3537c06444a382f7b256f3c711abe7c3521ad2a8ee64b323f69b4d08', 42, 1, 'AppName', '[]', 0, '2024-05-17 01:57:28', '2024-05-17 01:57:28', '2025-05-17 07:27:28'),
('142cb50e0d43c333c94e4b2fd2014fbcb041160561f25cbf1afe366118df5737db8e3ddc4f1db7fc', 42, 1, 'AppName', '[]', 0, '2024-05-17 02:27:33', '2024-05-17 02:27:33', '2025-05-17 07:57:33'),
('6e934f7343e87f1b397090adb81b815b978a8b991421267192102d4ae746b421670bff0e1554312e', 42, 1, 'AppName', '[]', 0, '2024-05-17 03:12:12', '2024-05-17 03:12:12', '2025-05-17 08:42:12'),
('9b7435b92a151e76b78c9c09fbef61571ce6cbd58e28c9ce6d23441357fd1e55b93fc37c6d766261', 42, 1, 'AppName', '[]', 0, '2024-05-17 03:34:09', '2024-05-17 03:34:09', '2025-05-17 09:04:09'),
('1d15f5e03dd8f886d4a7fbe3ef9e4c261554d9322d7cb15b0c09744130c16e786be379445efff363', 42, 1, 'AppName', '[]', 0, '2024-05-17 04:57:55', '2024-05-17 04:57:55', '2025-05-17 10:27:55'),
('a603bb2a6cda849fe04dcefddd0bf6d47652f4947309799d1cb85863be564cd79ec2506bf699e109', 42, 1, 'AppName', '[]', 0, '2024-05-17 05:26:16', '2024-05-17 05:26:16', '2025-05-17 10:56:16'),
('5bd74b88589c54554ec89a4f09c6950fdcd3a83255beb149faa355829df1aac43a94e4191b001bf6', 42, 1, 'AppName', '[]', 0, '2024-05-17 05:46:57', '2024-05-17 05:46:57', '2025-05-17 11:16:57'),
('537980d6cb77c4531b5ea44b48cebf38f11707bbc31f0329e21b6cbf33160057ab63b8461019bbc6', 42, 1, 'AppName', '[]', 0, '2024-05-17 05:57:03', '2024-05-17 05:57:03', '2025-05-17 11:27:03'),
('b4f4d770f48c6e9e1fcb488b02870ff4ccf4bc1e08a779dac5d26f8bf009d33cb918f878733f116e', 42, 1, 'AppName', '[]', 0, '2024-05-17 06:52:39', '2024-05-17 06:52:39', '2025-05-17 12:22:39'),
('88dc42586320e2e705b2094245415321b8e91c13726b2deb3fe442e9ad4a4334a04fd25bbc425827', 66, 1, 'AppName', '[]', 0, '2024-05-17 06:56:02', '2024-05-17 06:56:02', '2025-05-17 12:26:02'),
('4d909d5ad7b7a643ef3ffa12e236b9fb559ff2228cd0ff1f710692e48caea26a17bd11ff8d0fae5b', 66, 1, 'AppName', '[]', 0, '2024-05-17 06:58:30', '2024-05-17 06:58:30', '2025-05-17 12:28:30'),
('f72f9ac75a4777d97375d40383b567b3d5f2c384352f0c571d98836554d2f3814d86cc92f3ee2c43', 42, 1, 'AppName', '[]', 0, '2024-05-17 09:12:50', '2024-05-17 09:12:50', '2025-05-17 14:42:50'),
('cd3f42512b6dbd4d3794b0a0e3b306aa9401c3221f68dd3fa8106632a39bb453ea9bce2df76b126c', 42, 1, 'AppName', '[]', 0, '2024-05-17 09:49:47', '2024-05-17 09:49:47', '2025-05-17 15:19:47'),
('758cec7aef917444343df56b5ef268641e5346597f465ba213d3df9f04b64357ce1ab8d71b84c792', 42, 1, 'AppName', '[]', 0, '2024-05-17 09:51:27', '2024-05-17 09:51:27', '2025-05-17 15:21:27'),
('74055e3fd6b7e9095e7dcdae757e4ea84724a6189d9b6576d972e55b53ca0312ccd68f9c0e1f20a3', 42, 1, 'AppName', '[]', 0, '2024-05-17 09:53:01', '2024-05-17 09:53:01', '2025-05-17 15:23:01'),
('ab843ee6ff1b625647b7f8b67a860815efd2a5cf80a49842616650108b1bf01c81c36e47ca52ed3b', 68, 1, 'AppName', '[]', 0, '2024-05-17 09:58:39', '2024-05-17 09:58:39', '2025-05-17 15:28:39'),
('95f375aef2cb5e47fe16a11f30d96b764b04ba9b8acbafaf4328b8ca73bb7e6f80d0b0a3f46ab688', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:02:55', '2024-05-17 10:02:55', '2025-05-17 15:32:55'),
('ba20a5e3f251cdd970643fe0de31a4a36cf114071e15a7c0570e47cf55be2005761b3b7c2887ba26', 42, 1, 'AppName', '[]', 0, '2024-05-17 10:11:10', '2024-05-17 10:11:10', '2025-05-17 15:41:10'),
('1c3a6be0dc5ff70ece924af59b87bcaca4b3d6650057cab67cf9f590707340cf2df07de1afb3e89c', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:12:36', '2024-05-17 10:12:36', '2025-05-17 15:42:36'),
('a48b22562d412d7640234c118338585cb132bbdb1ef072962a80df90b1c87306b39e29fc366013ee', 42, 1, 'AppName', '[]', 0, '2024-05-17 10:16:18', '2024-05-17 10:16:18', '2025-05-17 15:46:18'),
('d3fafafef784374e171bfaaeb76feb7b80b20bc7dcdd4c0001e64e67ff938fed54c814bddf082f70', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:22:58', '2024-05-17 10:22:58', '2025-05-17 15:52:58'),
('9b45310ab79c87095ecb295b315e4a8806535d0af94e6ad5946c245d96bd1e75fb0d99f303994e1d', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:32:11', '2024-05-17 10:32:11', '2025-05-17 16:02:11'),
('9236cf2fab597a7d057d3a3e29d7eca739428ced2eb0de91adf79920c452cf29e4fab6a2d2021adc', 42, 1, 'AppName', '[]', 0, '2024-05-17 10:32:39', '2024-05-17 10:32:39', '2025-05-17 16:02:39'),
('d2aa213c631c8b413014f68cfb7260fb00f61d54ede1538e165fa316b43293630045ce8b6c985a4c', 69, 1, 'AppName', '[]', 0, '2024-05-17 10:34:50', '2024-05-17 10:34:50', '2025-05-17 16:04:50'),
('3f424b699d00e2b78b23b78aad462890f81e90f017411b481ab3ffeec76af1361416ae4e1354e1c9', 69, 1, 'AppName', '[]', 0, '2024-05-17 10:41:05', '2024-05-17 10:41:05', '2025-05-17 16:11:05'),
('e23760bb92fc71cd73687d78ffff5af4a5a2b6ccaa6e52cb5bf69c9c9f92d9d51603ad0ca5e99d86', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:42:11', '2024-05-17 10:42:12', '2025-05-17 16:12:11'),
('9899a48df0acb25405edc67b535a6e0b2915aa201ed27add3281ce9cb3708ba3aca9b329c7d8a309', 42, 1, 'AppName', '[]', 0, '2024-05-17 10:42:49', '2024-05-17 10:42:49', '2025-05-17 16:12:49'),
('9914ee32a665b56ba71980ab9a81074b02a45c0a38e38e26b4a4a4be857e3f50c13951adc1d0c6e5', 68, 1, 'AppName', '[]', 0, '2024-05-17 10:51:28', '2024-05-17 10:51:28', '2025-05-17 16:21:28'),
('546caced2489256e545e79790ef82ddb530c71a5f696075d9b4371ee002a0a9c81c19e56ba52d676', 68, 1, 'AppName', '[]', 0, '2024-05-17 11:04:38', '2024-05-17 11:04:38', '2025-05-17 16:34:38'),
('732dd70116655ebfccc3e3dcfd36f60914a141bbd48fb62adcea9228a59959b9f65226a4931f2eb4', 42, 1, 'AppName', '[]', 0, '2024-05-17 12:27:20', '2024-05-17 12:27:20', '2025-05-17 17:57:20'),
('6bc04caca408a1352c1ccb5dddc8db07a4340f0387f8f9488c2f0680328b58724e141ff302d9c792', 70, 1, 'AppName', '[]', 0, '2024-05-17 12:49:26', '2024-05-17 12:49:26', '2025-05-17 18:19:26'),
('3569ec4259857cbabbd630d1efec0e872d144bf855f42f864482f1b71b1f588969353120531bcbca', 70, 1, 'AppName', '[]', 0, '2024-05-17 13:42:37', '2024-05-17 13:42:37', '2025-05-17 19:12:37'),
('d08b6e4f7acabce6a436a6016c361b7cdfa6545cdb9cd35c3c96f1c475153a05af2e723beb5ff71d', 70, 1, 'AppName', '[]', 0, '2024-05-17 13:53:01', '2024-05-17 13:53:01', '2025-05-17 19:23:01'),
('0f59a53e07d500b81117f47469c7bc8ad8a4fb647fe46d82b1d5ceb276169390224928dfdfe50b9b', 42, 1, 'AppName', '[]', 0, '2024-05-17 20:37:36', '2024-05-17 20:37:36', '2025-05-18 02:07:36'),
('74d61e5819bf5f9d5a1f88e396142d85f8be7502b77a47d779d5c322136d6d40023f0c2db204dea5', 42, 1, 'AppName', '[]', 0, '2024-05-17 20:39:59', '2024-05-17 20:39:59', '2025-05-18 02:09:59'),
('a77899cbeb32a9a48541a39e79bde40fd84fa62851e9508c6106daf4a280a8fac1fe691cad86b07d', 42, 1, 'AppName', '[]', 0, '2024-05-17 20:43:36', '2024-05-17 20:43:36', '2025-05-18 02:13:36'),
('feff865e2cdcd74018bfbcc3a3cc7c0b53375e75e4193da6b7cd8dd75ad12529f465d1416286079c', 42, 1, 'AppName', '[]', 0, '2024-05-17 21:01:26', '2024-05-17 21:01:26', '2025-05-18 02:31:26'),
('bd08f555be8df7507e0c1b4140c973b21d1215a6ab38428725c8c8f7782f396dd53d121d85073a4d', 88, 1, 'AppName', '[]', 0, '2024-05-19 17:39:39', '2024-05-19 17:39:39', '2025-05-19 23:09:39'),
('ed676c460442d9de6059a0d7721cb5a3b469430bfc6662b8bbbecb45647062b7f3aacb8f59ac8efb', 89, 1, 'AppName', '[]', 0, '2024-05-19 17:47:13', '2024-05-19 17:47:13', '2025-05-19 23:17:13'),
('83448a6e4616797824b17b4d96ed43f50274b0e7bb8d55c443d28fa75395421b00a6cf222c9e3a9c', 89, 1, 'AppName', '[]', 0, '2024-05-19 17:52:28', '2024-05-19 17:52:28', '2025-05-19 23:22:28'),
('0f2b48424c00d6225fb703baf651e5ca264f981fda6c2511a1bec2a9802f7a5bddc2ceaf6b3bc9bd', 89, 1, 'AppName', '[]', 0, '2024-05-19 17:59:02', '2024-05-19 17:59:02', '2025-05-19 23:29:02'),
('cb53fe4ae7d10f12e969efe87e051f76741eb0815c714494e8d9c497dc38f5f19e56348304cf02ac', 89, 1, 'AppName', '[]', 0, '2024-05-19 18:00:35', '2024-05-19 18:00:35', '2025-05-19 23:30:35'),
('0bce352b1c9d996affc9dec9f422a25df3a63662a9bbf94afbde2dea47a7b08a625b79c81f445d0a', 88, 1, 'AppName', '[]', 0, '2024-05-19 18:37:43', '2024-05-19 18:37:43', '2025-05-20 00:07:43'),
('768a492287ea620fe873c32b56f1f199a07ade188eb418dd2f19f02e24f0b866cd145d5e43e97ae0', 90, 1, 'AppName', '[]', 0, '2024-05-19 18:47:16', '2024-05-19 18:47:16', '2025-05-20 00:17:16'),
('c199db7ad29d3cb67c32192e941501ed50756ea5ed26dcb8c2c644b972c4addf4d4654470b6646a4', 42, 1, 'AppName', '[]', 0, '2024-05-19 18:56:54', '2024-05-19 18:56:54', '2025-05-20 00:26:54'),
('9be0ccb021a40b442accbd7d6797472ce8a383da711693153a19aca171fa8d5849f5bed7f84d2841', 42, 1, 'AppName', '[]', 0, '2024-05-19 18:58:45', '2024-05-19 18:58:45', '2025-05-20 00:28:45'),
('dba195ced9df776669f16738a55213d1835c5b1e70cd98b65b7263c3ec880015ae21109368825296', 91, 1, 'AppName', '[]', 0, '2024-05-19 19:00:53', '2024-05-19 19:00:53', '2025-05-20 00:30:53'),
('07b24376ffc805e12b881d3e551ba44d2f4db4cf6d6ad50b0fd7818b03d221a5bb5504d0d8fe6537', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:06:13', '2024-05-19 19:06:13', '2025-05-20 00:36:13'),
('eccb5da705d1051fc50ddb54c0d198fa58a131e3f276c637ae61abdb631c6c43b4740b2b69fa45f3', 92, 1, 'AppName', '[]', 0, '2024-05-19 19:08:28', '2024-05-19 19:08:28', '2025-05-20 00:38:28'),
('c01bb55d5b73ba46a2ba7d9df6a11b9d88df0986ef5587522bbbc14e81eeeeed974818400af51931', 92, 1, 'AppName', '[]', 0, '2024-05-19 19:09:33', '2024-05-19 19:09:33', '2025-05-20 00:39:33'),
('6e380d1494af85d797213c633f9bab42cc0e67f3f83c0a144c91c73f38879120867cd25187ec5161', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:16:13', '2024-05-19 19:16:13', '2025-05-20 00:46:13'),
('490971f28b1bdcee27a7318ec7b096508cc31a08db21b7b34c8adf05b73f68492989a935675377fb', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:20:58', '2024-05-19 19:20:58', '2025-05-20 00:50:58'),
('5eaf4d57bcb02249c53fb1e0cb204180c0c2ba8a29284d3d773ead840c4196cc55078154578d8922', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:21:09', '2024-05-19 19:21:09', '2025-05-20 00:51:09'),
('19e52f06edb350bc66e081cdf0f3e0f76fe4c5cd3252d8c03161286d132cd88cff1989a9033bcf32', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:22:39', '2024-05-19 19:22:39', '2025-05-20 00:52:39'),
('5007db5fb3b640353a9aa2c8e535cb98859a9a9167c3aa59eb9a44c77707e8ed4cc39709a208c7d8', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:25:43', '2024-05-19 19:25:43', '2025-05-20 00:55:43'),
('1dd8b8889adbb6b9357f92f3a8590513bc62e9691d219a6269ca5ace6499f8aed86ee2677e5d5761', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:26:32', '2024-05-19 19:26:32', '2025-05-20 00:56:32'),
('cbbee520ae7c16422e342bf1bee3d2bd86a5f81ca20af0dc5b823799097a83f1a7ea8d78d60dfac2', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:30:34', '2024-05-19 19:30:34', '2025-05-20 01:00:34'),
('ef93459ee5f8ec73f281fb1d0fac0d9964e665b8644aaf60980f07cccd720c2f44bddda14656046b', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:31:01', '2024-05-19 19:31:01', '2025-05-20 01:01:01'),
('bb0fc2e1a4663bb7d13cbb9d968bb4b3616a4020efa2ab88fe2b700b5cad720399260a18a6d890e2', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:31:53', '2024-05-19 19:31:53', '2025-05-20 01:01:53'),
('34746c0ca82efa805434f94005e12969eeb551d4984bb8a3f6efb81f5f855e9dfe279770b6341332', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:32:14', '2024-05-19 19:32:15', '2025-05-20 01:02:14'),
('9ace566df9894758010e97a285a3fd7d769a153d78b3aede83891ed07a4ab211eb4e766d45d13ceb', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:40:48', '2024-05-19 19:40:48', '2025-05-20 01:10:48'),
('7d3442e95adf34173f804d1044dbfaa2c73cff0b1e837fcf27b65691b05fd5a12603743fb7c120d8', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:41:10', '2024-05-19 19:41:10', '2025-05-20 01:11:10'),
('5fb32d5fff0c278a5ff29b872dd6d1c66cc7e03a36b348c50180dcd1df0e504814492cf8cd981c2c', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:46:57', '2024-05-19 19:46:57', '2025-05-20 01:16:57'),
('471539e7072defe93f5aa814061d921007ce0e57552571887a4729f2a46f071a1c014d3c8379a749', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:47:15', '2024-05-19 19:47:15', '2025-05-20 01:17:15'),
('d4eb7df6c7990b6156b92559b3fb641af3760812c4a6cd1ab16283ee709fab662b4efa926b453927', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:50:53', '2024-05-19 19:50:53', '2025-05-20 01:20:53'),
('1daffb40dba7fc6fbcf1146f26133b62c3f9434ba1a3bc0335df705562c6faecdaed574d35e1284d', 93, 1, 'AppName', '[]', 0, '2024-05-19 19:51:53', '2024-05-19 19:51:53', '2025-05-20 01:21:53'),
('4b948fa9ac36c22fecac1a8d012478f82f410c5d80792798c688728374ca94d34d8c49942d0234f1', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:52:23', '2024-05-19 19:52:23', '2025-05-20 01:22:23'),
('d099c5809ebafb4565a57ceddcb836913808970cfcf8f8d0870eea7e35bd67fa8cdebb2ce47ec23d', 42, 1, 'AppName', '[]', 0, '2024-05-19 19:53:29', '2024-05-19 19:53:29', '2025-05-20 01:23:29'),
('8cf38c56f5015370628d7154a724bc825429f2b5049551f56ba2b65b4d21451e674b959d0163c4b1', 94, 1, 'AppName', '[]', 0, '2024-05-19 22:33:15', '2024-05-19 22:33:16', '2025-05-20 04:03:15'),
('8beaf5647e5e7cbd9faaf0b8be6ab88831d6c61432a9e2edf39ce4b2e9a021baf1d92832e5917282', 42, 1, 'AppName', '[]', 0, '2024-05-19 22:38:28', '2024-05-19 22:38:29', '2025-05-20 04:08:28'),
('f015a42030b8a03851b2b6114faf173298495c71f49754b8597bc1bcd618cd6eafed261fa9d5b4a1', 42, 1, 'AppName', '[]', 0, '2024-05-19 22:52:36', '2024-05-19 22:52:36', '2025-05-20 04:22:36'),
('6bbde360246ed246f1adb290ae85e2d8610e875ed23f8ca1709d7d93c2bb28cd4c7ba823c16f14ab', 42, 1, 'AppName', '[]', 0, '2024-05-19 22:52:47', '2024-05-19 22:52:47', '2025-05-20 04:22:47'),
('541aee741442252d800eb92c750b79483b02e4e8f526a4c2c2e42223ac914446ff4f0b0c73063822', 94, 1, 'AppName', '[]', 0, '2024-05-19 22:53:58', '2024-05-19 22:53:58', '2025-05-20 04:23:58'),
('148f1aa1986aa6da2ce3f7f5202898f3b9076ef0093b332817de87dbb52a0a54f86c692bb8479d68', 94, 1, 'AppName', '[]', 0, '2024-05-19 22:54:38', '2024-05-19 22:54:38', '2025-05-20 04:24:38'),
('9af3f93f5522aacd863723b3893b448f0b89b54157e2d8c4539210d94ebef4c88ec5843f95c1aade', 94, 1, 'AppName', '[]', 0, '2024-05-19 23:41:55', '2024-05-19 23:41:55', '2025-05-20 05:11:55'),
('6b28056c11aeefa0a9c63748ace5556339a389615ad0b9d015ec6b9d543143da24c06ea89e59453e', 42, 1, 'AppName', '[]', 0, '2024-05-19 23:43:40', '2024-05-19 23:43:40', '2025-05-20 05:13:40'),
('c1e6f1d967bbec508352c1993d642a743ab833774bb8db4508fbefe1e1e9e12effbff9a270f18f30', 42, 1, 'AppName', '[]', 0, '2024-05-20 00:22:44', '2024-05-20 00:22:44', '2025-05-20 05:52:44'),
('a9f2374ff39b183d07e4e1f5ad87f1360f6f2e4ee0463419a170419083f0904ee30ce8b995e784c1', 42, 1, 'AppName', '[]', 0, '2024-05-20 01:14:33', '2024-05-20 01:14:33', '2025-05-20 06:44:33'),
('eced43f8aee8063dd9583ba6b04631ec1376e54d62f5299e241044f11d399b35754a79fd34ffd43d', 94, 1, 'AppName', '[]', 0, '2024-05-20 01:19:32', '2024-05-20 01:19:32', '2025-05-20 06:49:32'),
('c12cfa09f7efecf8d8d12d2dfb3b67ddf7095ffbb8d062ee548da4142b3b389dbbc2708762ae3069', 42, 1, 'AppName', '[]', 0, '2024-05-20 03:28:44', '2024-05-20 03:28:44', '2025-05-20 08:58:44'),
('bdf80a2409de917b952269d1dfd0d39cc89240a752249efeb39b81557c36bbfa47090a12c8f9fd1a', 42, 1, 'AppName', '[]', 0, '2024-05-20 03:43:48', '2024-05-20 03:43:49', '2025-05-20 09:13:48'),
('5ca55d6847214a1faa2a7c7a311ae4df0768c60f002b40b973a7811ef943846265df25db11ed2629', 42, 1, 'AppName', '[]', 0, '2024-05-20 03:52:35', '2024-05-20 03:52:35', '2025-05-20 09:22:35'),
('c7a7a9835b138ee04219858a1cdfa8a4a82d8cf15b28cbf252cbc85d2f4ee02e045b32f0e8966ff3', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:00:36', '2024-05-20 04:00:36', '2025-05-20 09:30:36'),
('52f23aed06d36dd975e7648c2c7dfe070788bb8880e6ee4265fa86278ea837673a23be9d872a35e0', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:05:39', '2024-05-20 04:05:39', '2025-05-20 09:35:39'),
('523eae2e0c530492377e08c7feb738917e5273a7f65044ebf7feb485b55253ea2028074f53cdc15b', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:08:16', '2024-05-20 04:08:16', '2025-05-20 09:38:16'),
('d9bab6e6a028ff99af75992bff5633dabebb5b725549c4218f4d0f27242d903018adefc89adec86c', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:11:37', '2024-05-20 04:11:37', '2025-05-20 09:41:37'),
('ce22b5f3ad900cc527f8672d3ea0069951c7fb30ef70269c1f3df5b8141f22809fcb165eab14a2c8', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:23:53', '2024-05-20 04:23:53', '2025-05-20 09:53:53'),
('41768fbbabbb5e13998afa3dacac9d2c4722225ae9f930d215ce697705f39244b5a4a76909fef744', 42, 1, 'AppName', '[]', 0, '2024-05-20 04:37:38', '2024-05-20 04:37:38', '2025-05-20 10:07:38'),
('e829878368462c3e829f29360015c1e61eac8e3f7efaff6ab65d96f926610bd6e4419350765c01ad', 42, 1, 'AppName', '[]', 0, '2024-05-20 20:22:14', '2024-05-20 20:22:14', '2025-05-21 01:52:14'),
('44f403081d19751edabde75ca4f3db06735f6ca72d50f4aec314e8c7718a56c1d3ae3d2c29729b2a', 42, 1, 'AppName', '[]', 0, '2024-05-20 20:24:12', '2024-05-20 20:24:12', '2025-05-21 01:54:12'),
('57fc735a8646ce983fcd34fe12e2ecf1c7f7f68a34cced39aa72949695e6443d1154b2a9fd485901', 42, 1, 'AppName', '[]', 0, '2024-05-20 20:34:21', '2024-05-20 20:34:21', '2025-05-21 02:04:21'),
('56bd332991a14460d070cc96d3bf0a5ee3504eacee4e72fd4ed268f69a74424aec16f80802560a75', 102, 1, 'AppName', '[]', 0, '2024-05-20 21:38:15', '2024-05-20 21:38:15', '2025-05-21 03:08:15'),
('6971a5bc79f07c21afb07d2fe38ce429fde419435d077c3cbb9687396f8b8be1d60de9a4e36e1e65', 42, 1, 'AppName', '[]', 0, '2024-05-20 22:39:24', '2024-05-20 22:39:24', '2025-05-21 04:09:24'),
('58f9f0e79520d0a0636eb66f90d53d6b709f18b2b1a5964cad7ab7f2b0509993b2877fa35e48976e', 94, 1, 'AppName', '[]', 0, '2024-05-20 23:09:57', '2024-05-20 23:09:57', '2025-05-21 04:39:57'),
('23fa495de064b19a3e63a6959f7c093dec83ca641b683080035fe4213f7fe4006284354b62709c54', 42, 1, 'AppName', '[]', 0, '2024-05-20 23:34:57', '2024-05-20 23:34:57', '2025-05-21 05:04:57'),
('f7ee013065d879ac9496936be297f11694591dee3a4e04729d3ba1bb288e082b180c0faa594c1872', 103, 1, 'AppName', '[]', 0, '2024-05-20 23:51:12', '2024-05-20 23:51:12', '2025-05-21 05:21:12'),
('3025fea1473c39b09be78b4ebcc2591eaffabfc7aa8604ecb0afd5694a6f3c1c817987a3fe9562e4', 42, 1, 'AppName', '[]', 0, '2024-05-21 00:23:43', '2024-05-21 00:23:43', '2025-05-21 05:53:43'),
('0614d0d05545e4c88ef68a18810a75363b0588199ddf6436d8ce409784021ba47b2ded7c5164dfbf', 42, 1, 'AppName', '[]', 0, '2024-05-21 00:28:33', '2024-05-21 00:28:33', '2025-05-21 05:58:33'),
('266db69b25056cd7882d66ca7853c0c16260f28e10b2c92767d5b60ccd1cedc85ad0081e6dc890af', 42, 1, 'AppName', '[]', 0, '2024-05-21 00:47:11', '2024-05-21 00:47:11', '2025-05-21 06:17:11'),
('6f2b8b57d386b7a466f6de63453f4ba268fc3dccb1ee1b17ce42a43052651e8d24a73e479797568d', 42, 1, 'AppName', '[]', 0, '2024-05-21 00:47:38', '2024-05-21 00:47:38', '2025-05-21 06:17:38'),
('d97de4752cca19e897a17b5e71e83e60d113166bebf1bfa7fde6983d8e5231d8ebe52be186a7cf9f', 42, 1, 'AppName', '[]', 0, '2024-05-21 01:07:50', '2024-05-21 01:07:50', '2025-05-21 06:37:50'),
('282840dd7ce6cd121454e1b8f69de8e60e5f9981345d96ce1ad94cd80528ad0d10e486ad056b0717', 103, 1, 'AppName', '[]', 0, '2024-05-21 01:27:38', '2024-05-21 01:27:38', '2025-05-21 06:57:38'),
('0f0b99131c6a2cc8978cb39db4e9a739c8efbed72dd89dfc387e3e30c8626d307e89af9b2891a328', 42, 1, 'AppName', '[]', 0, '2024-05-21 04:43:22', '2024-05-21 04:43:22', '2025-05-21 10:13:22'),
('b54d5ec504808b15f3abb4475063c11c7b5b35d2e186b9ad7fb9af5bb77a6a2c51adf3e918a8a94b', 42, 1, 'AppName', '[]', 0, '2024-05-21 04:55:04', '2024-05-21 04:55:04', '2025-05-21 10:25:04'),
('52877ca76288e54bf57ed67f58710f8ead23b7ea1fd67f536423b96777b0405e3a309a0a79751315', 42, 1, 'AppName', '[]', 0, '2024-05-21 04:56:12', '2024-05-21 04:56:12', '2025-05-21 10:26:12'),
('b779bc827e995ae286341ab86219ecf4c97c5b01fbb801c88f1e54b0b496c590dddcfa61914e6e42', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:00:44', '2024-05-21 05:00:44', '2025-05-21 10:30:44'),
('f820efe73f832555d36fce30bb7206ccc3e88d65197c937eeab7a1c323f88a752537f023c88f5ba8', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:03:21', '2024-05-21 05:03:21', '2025-05-21 10:33:21'),
('256512c346cf1939d48fdf9b8b84d7e4d4026a9a3c7f86f17425d7f03a74fabcf5b465fcccc4fad2', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:03:40', '2024-05-21 05:03:40', '2025-05-21 10:33:40'),
('97de552582bd921567e0edae65cdd612e8876dfcf2ae769e1dc4405de67d89864c31278e357d3f23', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:04:32', '2024-05-21 05:04:32', '2025-05-21 10:34:32'),
('fbdc47757e75c254adcc533138509838780b09adedb19acf86b22df16d896008571c3b11104eaea2', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:05:25', '2024-05-21 05:05:25', '2025-05-21 10:35:25'),
('4fb149db4edf5ae650ef3f1b55a3070869d1cde098e6d7cc11415d244b1e09d842343247b61f8533', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:07:44', '2024-05-21 05:07:44', '2025-05-21 10:37:44'),
('4338801b0065d7c6c31cbfd45ed5724405450727f87e8e9e75e2aa9447030c4e14a03957a8be5325', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:22:57', '2024-05-21 05:22:57', '2025-05-21 10:52:57'),
('12ea53b7e7fe5df87e76f84e5807e6b19917eb8eb1ca258ac7032a37fd8b4ab2cbd326639826d44a', 42, 1, 'AppName', '[]', 0, '2024-05-21 05:41:29', '2024-05-21 05:41:29', '2025-05-21 11:11:29'),
('decebf4ed63aaf9604fbd44918d8798dfa069d3f26525a664e39c669857293fbe305efdb8df63ac0', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:02:45', '2024-05-21 06:02:45', '2025-05-21 11:32:45'),
('3c1ca7f348e98b656fcace2e3f078c061f49fa50bba15cd2be1a85e4ceb6b7049ed882a7d2d1e0d3', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:05:43', '2024-05-21 06:05:43', '2025-05-21 11:35:43'),
('b5aacaa5a173ada5a0ecbfe2faf5696d179f8d9e4c43846d188e8d5bd3ac598f79a97b099d121245', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:07:31', '2024-05-21 06:07:31', '2025-05-21 11:37:31'),
('067a45be8349595588109e51bf4e7da9d3fdc00a1fa1259a815d579dabae51b74a4e72d62ad855c9', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:08:53', '2024-05-21 06:08:53', '2025-05-21 11:38:53'),
('ed5194ecd9c4397d3ad8f49ab961054541e67d543d8f1dfa76cfb8eb327a015c66e6fddaa387ff62', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:10:53', '2024-05-21 06:10:53', '2025-05-21 11:40:53'),
('385d5d74eacd23fee779615752cb1235ec0d8eeda7be99e8bab0c81db6753c1cd8cc0f8bea85513f', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:12:29', '2024-05-21 06:12:29', '2025-05-21 11:42:29'),
('77b2c1ab3e9465b8ca6b2df3789c4b1f2a3d244d783f9b8e22cf01905c9b003aa0f7efdb72862cdb', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:14:41', '2024-05-21 06:14:41', '2025-05-21 11:44:41'),
('650c6267cc12c73255ec732068a4c5bcb49a9e981d5fbd4abf844107fc517179193f4a0b131182cf', 42, 1, 'AppName', '[]', 0, '2024-05-21 06:30:35', '2024-05-21 06:30:35', '2025-05-21 12:00:35'),
('17c1fcc394303db14cc9f35eef8d5e17b8613c42b5a3f3af574701db719d25098e7bf0abe0d055b7', 42, 1, 'AppName', '[]', 0, '2024-05-21 09:38:00', '2024-05-21 09:38:00', '2025-05-21 15:08:00'),
('ec324ce6266542e30af34e879ee1700bec77df69f4af4a3b5d8b47fbe96317b191a8f310883164aa', 42, 1, 'AppName', '[]', 0, '2024-05-21 09:39:27', '2024-05-21 09:39:27', '2025-05-21 15:09:27'),
('cf85e9cde4fb8856d9e89bed711bfa81ff7e12b601875c5c9a978bda8bb897aff413f4f33e3597ac', 42, 1, 'AppName', '[]', 0, '2024-05-21 09:41:08', '2024-05-21 09:41:08', '2025-05-21 15:11:08'),
('c47a71841c443a264ba9f4c2a341a2993d28aa827b4219acaafa04372e55ca48a47f6419433ad46e', 42, 1, 'AppName', '[]', 0, '2024-05-21 09:41:31', '2024-05-21 09:41:31', '2025-05-21 15:11:31'),
('59741cc11b3840932a8803cac5005929f0c8aa941eeba944be46fdbcc330259000db00ab7f96bbd9', 42, 1, 'AppName', '[]', 0, '2024-05-21 09:42:53', '2024-05-21 09:42:53', '2025-05-21 15:12:53'),
('2f95c31dbdb6b3b97807e6176c29eee0cf594e49b9566fe5f6320e6aca86c2c66573654d0286708c', 42, 1, 'AppName', '[]', 0, '2024-05-21 10:54:09', '2024-05-21 10:54:09', '2025-05-21 16:24:09'),
('c2531c64fe914dadd02526808d5c6e8b53c8aa940003c2b3bcc46080dcb55781252cb6d83f3cbcc2', 42, 1, 'AppName', '[]', 0, '2024-05-21 10:58:38', '2024-05-21 10:58:38', '2025-05-21 16:28:38'),
('2402ca56883768dda83b3a37ed63bbeae78899e654462fd95c5a3162a15e58c914c4f5b127e55245', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:00:37', '2024-05-21 11:00:37', '2025-05-21 16:30:37'),
('c4efd3ef2cd181fe93e455bd8adfdac7d7589cabb1691992574ad062d81a3a6dfdee5cda57505434', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:01:25', '2024-05-21 11:01:25', '2025-05-21 16:31:25'),
('cd0115d95ecbfa3d8912b88fd17de32149305daaaa74b5cda2e4a6712e1f69d18a21f1cb2b71940a', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:22:39', '2024-05-21 11:22:39', '2025-05-21 16:52:39'),
('a580688534f7ed94b89103a35361743bff4a38767edcc1740fccaf52b62b8c9cd3df86e20137c30a', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:23:53', '2024-05-21 11:23:53', '2025-05-21 16:53:53'),
('6489cb7aef7eb9826c7185f29fbeb32dd8e5c8f67ef5cbe086ecd1061588d9a20261b87a84e77fba', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:26:20', '2024-05-21 11:26:20', '2025-05-21 16:56:20'),
('6490e3f31c35ba03710b51eb3a69d4b36112b889065a62a22a16debc2e67db00284e740bc742eb67', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:50:20', '2024-05-21 11:50:20', '2025-05-21 17:20:20'),
('18d9a19a6fd3e6c374d178e010c22432f1c9627ab42e529aa45be5fbd051df8d278114d0c576d658', 42, 1, 'AppName', '[]', 0, '2024-05-21 11:57:08', '2024-05-21 11:57:08', '2025-05-21 17:27:08'),
('89c3c83ced0d89eb6dae19cbda37970851c13ce60c7ba506ab1245220abe568d213a6eedfa04fa45', 42, 1, 'AppName', '[]', 0, '2024-05-21 12:05:15', '2024-05-21 12:05:15', '2025-05-21 17:35:15'),
('5e9be1a4f4bad92dad310d90bd0946ac816725f4f6a44c3df1b03a7d4be566e7fcab4d0c9372003d', 42, 1, 'AppName', '[]', 0, '2024-05-21 12:05:48', '2024-05-21 12:05:48', '2025-05-21 17:35:48'),
('cd2623baafc5b3b52f2ef32bd48a25a53e061b0068c856a8f599e43df7e4735271ca8b21c681ef43', 42, 1, 'AppName', '[]', 0, '2024-05-21 12:09:01', '2024-05-21 12:09:01', '2025-05-21 17:39:01'),
('03d815a423a58062c30859a3a7b79f2fd30737c8cd4353c73ac98db302c7363a861424621e26363f', 42, 1, 'AppName', '[]', 0, '2024-05-21 12:11:41', '2024-05-21 12:11:41', '2025-05-21 17:41:41'),
('ac83e8d4358f60f8c2db5026f2deb274514ccc359b293bc020c55f46a8c0d53bab892ce2c59eae03', 42, 1, 'AppName', '[]', 0, '2024-05-21 12:14:20', '2024-05-21 12:14:20', '2025-05-21 17:44:20'),
('7836563512c9ec135f13cbcfaf79f6019a0077e6807b97bfc2223bdcf930deb6094d503d052bca2f', 42, 1, 'AppName', '[]', 0, '2024-05-21 22:11:43', '2024-05-21 22:11:43', '2025-05-22 03:41:43'),
('8cddba090fe42df073fbcb4948be16a456bdc834667724abc9fcc017edb22a7876f7974afa1e1703', 42, 1, 'AppName', '[]', 0, '2024-05-21 23:29:35', '2024-05-21 23:29:35', '2025-05-22 04:59:35'),
('77142adbc390f528477af95874878b93c4a863d7edf666df1f6b6baa2ac61ac160940fd374fd91fa', 42, 1, 'AppName', '[]', 0, '2024-05-21 23:30:10', '2024-05-21 23:30:10', '2025-05-22 05:00:10'),
('88d0d3aec4b0247794a3cd8651de53c46cb1c2e2814ceae4cd50c9df4e8ee85e71990fd2ed8c07ba', 42, 1, 'AppName', '[]', 0, '2024-05-21 23:41:13', '2024-05-21 23:41:13', '2025-05-22 05:11:13'),
('7928cb1e2baaea7b8151fee0157ab35fe37f87336240777695df0a4c220566dc74d4248d470b2dae', 42, 1, 'AppName', '[]', 0, '2024-05-22 00:13:28', '2024-05-22 00:13:28', '2025-05-22 05:43:28'),
('902f17e5c50172f8358d0d5f95c1aa1939a2c6716f270fa6ef8685fed6c245702c7a609eddcf2012', 42, 1, 'AppName', '[]', 0, '2024-05-22 01:17:40', '2024-05-22 01:17:40', '2025-05-22 06:47:40'),
('9d75fe2babd935d694608c1a1ddb2d9ce2f33ec6c9b409abe7aa695504ec0a0e2ab57a6e6ba0d489', 42, 1, 'AppName', '[]', 0, '2024-05-22 01:22:18', '2024-05-22 01:22:18', '2025-05-22 06:52:18'),
('5eef50b48080a43293b208839c4851885a886fe54118724fcf76782c9a880bc042d792292d705733', 94, 1, 'AppName', '[]', 0, '2024-05-22 01:41:50', '2024-05-22 01:41:50', '2025-05-22 07:11:50'),
('0dd06f3318a32197fa9cdf6710e2a89c49db7caf53f35ce417ed29adf64c580c4ea6fd2f4d32cd9d', 42, 1, 'AppName', '[]', 0, '2024-05-22 01:52:57', '2024-05-22 01:52:57', '2025-05-22 07:22:57'),
('ded2df3e6c0948233c11196a26a7b393c32dd3841ab36e6e7ac3cb66ec8136fdfeb5497fb0d9b051', 42, 1, 'AppName', '[]', 0, '2024-05-22 01:57:46', '2024-05-22 01:57:46', '2025-05-22 07:27:46'),
('541e5cbc6f3fa8e42ab59402d7a718a49c42c2b091737f3d7f9cd173724c8e22e566a9b7d7417074', 103, 1, 'AppName', '[]', 0, '2024-05-22 02:03:04', '2024-05-22 02:03:04', '2025-05-22 07:33:04'),
('7858870be89793ab0a22b34959b9a0f21aeb6fd4d402eaf4e818342aab099b33258032c9708d7407', 42, 1, 'AppName', '[]', 0, '2024-05-22 02:06:56', '2024-05-22 02:06:56', '2025-05-22 07:36:56'),
('bf11eb774a6b241c95d1c6378fcb5e2b78abbe2bf2302a572d5ae761703d5603a89b58e410058ee7', 42, 1, 'AppName', '[]', 0, '2024-05-22 02:08:07', '2024-05-22 02:08:07', '2025-05-22 07:38:07'),
('cc1790bcb887730d4b1e45c1df6bb8beb30ca2cda350fb2b18d55d49e6ecde309fbd4db52b073d36', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:11:30', '2024-05-22 03:11:30', '2025-05-22 08:41:30'),
('fba672139c719a0e17dbae83972d20a70fad9153366ad50c8190aa1d5cde10406571e650330bce8f', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:25:46', '2024-05-22 03:25:46', '2025-05-22 08:55:46'),
('2aea81a141ac3ec5ee5c8d568769013ca050fd49c5f6baf4db4ee03af7d03ce01d2df9083e364f8f', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:28:29', '2024-05-22 03:28:29', '2025-05-22 08:58:29'),
('a558268082ec4c0f3c0238bc3d99477f256554b7dc2844ff2c2087932862442b53403afacf66b353', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:31:52', '2024-05-22 03:31:52', '2025-05-22 09:01:52'),
('6a7456f524ab6481216ba73679af5df9308fcb811846e0d6a60a355f75c26d87b7adeb606bc1c01f', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:34:24', '2024-05-22 03:34:24', '2025-05-22 09:04:24'),
('5b3cdfeda61972352b4e06011cc7f98e3e5d4312d6ac05c5b6b0ef1766a698908edf183a3b96eb3f', 42, 1, 'AppName', '[]', 0, '2024-05-22 03:41:44', '2024-05-22 03:41:44', '2025-05-22 09:11:44'),
('ed821f14230812bb53c43bfcbdefbb2f9a221222b67ae5fe82dee51c5d515202402f4aa3b18f08f0', 42, 1, 'AppName', '[]', 0, '2024-05-22 04:11:20', '2024-05-22 04:11:20', '2025-05-22 09:41:20'),
('95c30d8e1c4f092dae4996c4271875e63fc65b6cf8519678d7b04a3693aefe90ede37b06451b6438', 106, 1, 'AppName', '[]', 0, '2024-05-26 22:29:17', '2024-05-26 22:29:17', '2025-05-27 03:59:17'),
('10b2d61dcbb61023de84b967867c508845a25d5cb85d80c00201f869982d474eec8e49c9655dfc81', 107, 1, 'AppName', '[]', 0, '2024-05-26 23:27:23', '2024-05-26 23:27:23', '2025-05-27 04:57:23'),
('de7d96b335628a432589eab1e2d4d6839533615a53fa7f0c49baebcbbdbf74664572337490eab0a0', 107, 1, 'AppName', '[]', 0, '2024-05-26 23:51:48', '2024-05-26 23:51:48', '2025-05-27 05:21:48'),
('5b539a27c6199f26e1ea1dc0a0d51125aff8f18aeb0d8a14da47e44e9a1403bdee2f13867089bbc0', 107, 1, 'AppName', '[]', 0, '2024-05-26 23:52:48', '2024-05-26 23:52:48', '2025-05-27 05:22:48'),
('a824972bb467e3b488fe6c4eb2909c522783736b841bdef229fbc87e516a6eeaaa2fb6411dbdcd5d', 107, 1, 'AppName', '[]', 0, '2024-05-26 23:59:18', '2024-05-26 23:59:18', '2025-05-27 05:29:18'),
('eaf9adff676c5cf4f9ee3dc8c6f98eeb29c0acbdcb03ddc3e89f69c2f880642c10d28e4fa243796f', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:03:44', '2024-05-27 00:03:44', '2025-05-27 05:33:44'),
('455e205b6b507c723c17bb04b56ed6a6197ba28d936bf7a5efb22894e12d1312ee7ec38224e3a8b3', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:13:30', '2024-05-27 00:13:30', '2025-05-27 05:43:30'),
('078007693571cc4954a2cf92c6d6d8a27f24daff3694e2c85d6eaf12ff5284db8de7f29651ad0119', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:20:02', '2024-05-27 00:20:02', '2025-05-27 05:50:02'),
('5aabb6a6d171c602fa11510ea1d6d94590d45b8b0e8f8a9dfb7069434f93608200acc8b8df58a8ad', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:22:40', '2024-05-27 00:22:40', '2025-05-27 05:52:40'),
('e77d14a90cbfbd05125174df711769d4873ee14c42c1c8ddd75de50bace6a52400df97957af2cba6', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:28:01', '2024-05-27 00:28:01', '2025-05-27 05:58:01'),
('2a55e4a3bdc0d8604aaf6eaf668001fdcfb4cbf05d393134944eb0041b6215adf1ffefeecf4f9734', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:36:38', '2024-05-27 00:36:38', '2025-05-27 06:06:38'),
('2b7c81183ce2b1177b43782d1812cc0601e399f236f72f9a614c9e6f8f93acb22d0113e60ff4b423', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:38:14', '2024-05-27 00:38:14', '2025-05-27 06:08:14'),
('874e3b95bb294f8ea447643be4f00e1663432c544b07b8286cd721afc789bd76b43223a310893cce', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:40:39', '2024-05-27 00:40:39', '2025-05-27 06:10:39'),
('3760615a0e1dedac64f547079b06a22f34100756779c7227f25d760863f142ad1f9197b19217b062', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:46:55', '2024-05-27 00:46:55', '2025-05-27 06:16:55'),
('67c16464668f16dfc718cdfa2f1d86a389a5213016cb06cf21a1fa6a9c7f1848b38f8b9bddad4647', 107, 1, 'AppName', '[]', 0, '2024-05-27 00:54:44', '2024-05-27 00:54:44', '2025-05-27 06:24:44'),
('9f9f0431ac05b8ad92376a120c554740d8f6380804fac3fc91ee047733cdf0b03001b291c13708fa', 107, 1, 'AppName', '[]', 0, '2024-05-27 01:00:16', '2024-05-27 01:00:16', '2025-05-27 06:30:16'),
('ad9f7fc8d1353f64f98fad1711114530061cba3a27e1f40023bd9cc974fb2d335cf7ec70b63227a1', 107, 1, 'AppName', '[]', 0, '2024-05-27 01:05:59', '2024-05-27 01:05:59', '2025-05-27 06:35:59'),
('e01b1643bdc3a000ea6b152ee3c78b9b0b684c573de44e7834458f33a0179c0ce65d1e1d1e6b96cc', 107, 1, 'AppName', '[]', 0, '2024-05-27 01:11:15', '2024-05-27 01:11:15', '2025-05-27 06:41:15'),
('20301bfff891aceb927a3fcb9a72b881e4fc53dca7ee4dafe57ff30ee3130bfb77d2078587f8e803', 107, 1, 'AppName', '[]', 0, '2024-05-27 01:22:08', '2024-05-27 01:22:08', '2025-05-27 06:52:08'),
('0bc38799466400f29af2854eb68fa6d7bf640194a15bd614264a8a16dd7dc9bb21dd9fde998ce434', 107, 1, 'AppName', '[]', 0, '2024-05-27 02:56:46', '2024-05-27 02:56:46', '2025-05-27 08:26:46'),
('679177a0d2d68255553381d2d29c6c833a3098ce0582fba2fa3710602d0e3e33cf5f6dd728f5272e', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:01:36', '2024-05-27 03:01:36', '2025-05-27 08:31:36'),
('baf20f91eb1c5345ce6757cf32ef15cde649308dc620979667abcf510710fe203a5203225eef63bb', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:08:26', '2024-05-27 03:08:26', '2025-05-27 08:38:26'),
('1a88c6e53c4af48f70a0877bc20da6db8a12bfe4b9902e5c80ea19046d88259a76fbd6a3ccb433e7', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:18:29', '2024-05-27 03:18:29', '2025-05-27 08:48:29'),
('46f3f577719a25a8a71bb25b69d95b57b924d4f264ddf110482a8e73872b9ff564ff9c85eab682d3', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:21:13', '2024-05-27 03:21:13', '2025-05-27 08:51:13'),
('30bfaea9d3b851fdb55b65978909b2ba377c0b61db97cc81f85443e42706c75c30bb1a5533e67e48', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:33:49', '2024-05-27 03:33:49', '2025-05-27 09:03:49'),
('92fb30d3d4f2207f31794bd238683be57fe41b774d3974eedc085d307341e8cdba86f3217d95e430', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:38:51', '2024-05-27 03:38:51', '2025-05-27 09:08:51'),
('8080433677a121873b83f62f8385150e21b5e94da058ea911f4df422b2fd6c8d8203515cd0bb5fbb', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:39:54', '2024-05-27 03:39:54', '2025-05-27 09:09:54'),
('feba3731f8e2374e9904bc92c231dfdeefd7f056066713000d1340db580d48e8bf5a53d4cfe1b0cb', 107, 1, 'AppName', '[]', 0, '2024-05-27 03:46:09', '2024-05-27 03:46:09', '2025-05-27 09:16:09'),
('f55cf96dcf95700d9ad14c22b63024546c9df3638670d2145ba85088d4b503c59d30974f4c063fa2', 49, 1, 'AppName', '[]', 1, '2024-05-27 05:38:38', '2024-05-27 05:40:34', '2025-05-27 11:08:38'),
('66f106c303efd201af0aa52938e2e2607985543df1a7e32523094fbb3f14535fed901850dd86d2fd', 49, 1, 'AppName', '[]', 0, '2024-05-27 05:39:43', '2024-05-27 05:39:44', '2025-05-27 11:09:43'),
('17dce0b07bf7549b2caa88f7696f4106155b8869c1e1c058e3aa8436563e08c5c63533a639bdf833', 42, 1, 'AppName', '[]', 0, '2024-05-27 05:40:55', '2024-05-27 05:40:55', '2025-05-27 11:10:55'),
('e9322f61049a26b7b857322d41161726718dcb7c1322e92772e6ca7064be3eb18fc2036c3b7c2f39', 108, 1, 'AppName', '[]', 0, '2024-05-27 05:43:01', '2024-05-27 05:43:02', '2025-05-27 11:13:01'),
('45e883b70d89f837b03a4977861948d1880c86b42c9776a215a0a28310eeb85014c45952ba8c7dee', 109, 1, 'AppName', '[]', 0, '2024-05-27 05:51:46', '2024-05-27 05:51:46', '2025-05-27 11:21:46'),
('b19be89fa39d56c8461e6523d53d8f88b29fc9c7239afed5842a3b3d0b77c5f566109096bd3330a9', 107, 1, 'AppName', '[]', 0, '2024-05-27 05:55:08', '2024-05-27 05:55:08', '2025-05-27 11:25:08'),
('548c26e5d385eb2a741fb7e498b11146a0e0f9a34122e45fb63acca54293313e87f21820dcb62752', 109, 1, 'AppName', '[]', 0, '2024-05-27 06:07:45', '2024-05-27 06:07:45', '2025-05-27 11:37:45'),
('bdaa0bebe0713987143f7937cf253239bb4c7baa602f234606231f524c36fcf93ef9e0f955a612f0', 109, 1, 'AppName', '[]', 0, '2024-05-27 06:20:33', '2024-05-27 06:20:33', '2025-05-27 11:50:33'),
('94febb212d3a2b44e2d4e04d6345a3ac24e38680a55f2df34e0468e81c0fc0eb66f926dc19254f65', 109, 1, 'AppName', '[]', 0, '2024-05-27 06:26:45', '2024-05-27 06:26:45', '2025-05-27 11:56:45'),
('953c344dfa13e71e4fae6490fa74a161ecf912af7dfe73de1fb241e27a152c6f48dc4aa8a15769e0', 109, 1, 'AppName', '[]', 0, '2024-05-27 06:29:31', '2024-05-27 06:29:31', '2025-05-27 11:59:31'),
('616bba730bc19ad309cc591369da90ef3b4ca397e6fe21d015b2c90dd43d5c0180c1025c140b49ba', 107, 1, 'AppName', '[]', 0, '2024-05-27 06:29:34', '2024-05-27 06:29:34', '2025-05-27 11:59:34'),
('f5c12f3442b668343f63f2c19e80d2b358bc78ab63e8e506ff6ff6d90686f6d679768f004c739018', 107, 1, 'AppName', '[]', 0, '2024-05-27 22:43:44', '2024-05-27 22:43:44', '2025-05-28 04:13:44'),
('7fb97fab3471229cc16e25252d1778a7a19ddb75db014cf60f9ccd2cdd7cba1dd047aec90672c28a', 107, 1, 'AppName', '[]', 0, '2024-05-27 22:48:32', '2024-05-27 22:48:32', '2025-05-28 04:18:32'),
('1c6ec668f5de1eae1bb361244c018e996969b6e9d28fd8d35d9b05c453f8aa226398007d7d474065', 107, 1, 'AppName', '[]', 0, '2024-05-27 22:54:47', '2024-05-27 22:54:47', '2025-05-28 04:24:47'),
('1b45e4d0d0d4acfbdf91848b7304e0de3c96efb9f38503ac3ca87a42b48086d9cd0ac40a0b82ff49', 107, 1, 'AppName', '[]', 0, '2024-05-27 22:59:35', '2024-05-27 22:59:35', '2025-05-28 04:29:35'),
('a3998cca682fc7ea36c2d5b5a3315412a10524f6fa83ca7096cddb663ba14bbd7ddc0c9cadc4fd95', 107, 1, 'AppName', '[]', 0, '2024-05-27 23:21:50', '2024-05-27 23:21:50', '2025-05-28 04:51:50'),
('6ee9bb6cf6ed5a7ed791c517158ddef8d85b482f7df49c6281c40cd52b1110681b89fd27ebf7f5a3', 109, 1, 'AppName', '[]', 0, '2024-05-27 23:22:46', '2024-05-27 23:22:46', '2025-05-28 04:52:46'),
('b198ea61eeb2834fc2bc1910a1fb60b103c922624dc46651065dcacc763ff6aaaa8d259d1f915a2c', 107, 1, 'AppName', '[]', 0, '2024-05-27 23:26:26', '2024-05-27 23:26:26', '2025-05-28 04:56:26'),
('d16f69b6a368c88edf4d8620bfe1d52826ab1f359aa0e9aa490ded10b0aa5cc13a33d8f4b2a3b76f', 111, 1, 'AppName', '[]', 0, '2024-05-27 23:40:35', '2024-05-27 23:40:35', '2025-05-28 05:10:35'),
('a6b393ab29b6b97245264774f7760492c3efcb312e265dfe7899bd0618b52cd0952e46d5e2def26b', 109, 1, 'AppName', '[]', 0, '2024-05-28 00:01:35', '2024-05-28 00:01:35', '2025-05-28 05:31:35'),
('1ed2262b9da3c0883f67df45a124b6769d08f2f11c5956061dd631be327b2ff2f273a8045c8f7a95', 107, 1, 'AppName', '[]', 0, '2024-05-28 00:48:40', '2024-05-28 00:48:40', '2025-05-28 06:18:40'),
('472e69bb2714dd6afec14bc7954d9def574a830b577a3b120860c940c6a927fd0d9f97ccea8cb805', 109, 1, 'AppName', '[]', 0, '2024-05-28 01:05:53', '2024-05-28 01:05:53', '2025-05-28 06:35:53'),
('53e8ac5154a269e6e07782a9291207a4c56e9443dcf7faac103f52a1b372a4ebf7326c39a5f7549b', 107, 1, 'AppName', '[]', 0, '2024-05-28 01:17:51', '2024-05-28 01:17:51', '2025-05-28 06:47:51'),
('74cc9be313098f1c1ef9ed9af8173208546a2f2008342e0fc3b9db278d30bddd3a93334fcab92596', 107, 1, 'AppName', '[]', 0, '2024-05-28 01:20:29', '2024-05-28 01:20:29', '2025-05-28 06:50:29'),
('2680a9ee0ce876ec3cd10f5c4e413942f46a3b2da0b768876402f7f172cdc6122e85c75b238f57b8', 107, 1, 'AppName', '[]', 0, '2024-05-28 01:24:26', '2024-05-28 01:24:26', '2025-05-28 06:54:26'),
('a5766e493f2216ef2682d419eb6339ffb8e5818d6ea66946c226dd35f8da5e3227bdd194050dcddf', 107, 1, 'AppName', '[]', 0, '2024-05-28 01:33:51', '2024-05-28 01:33:51', '2025-05-28 07:03:51'),
('6a74c40cd0c5b43188f9e33847a155530ab7973e4e2b73680692b4b5796c3316888a6710da0c67f4', 107, 1, 'AppName', '[]', 0, '2024-05-28 01:40:59', '2024-05-28 01:40:59', '2025-05-28 07:10:59'),
('b24478076fc6449093ab050412d878cdc7d6c99d83c0a3153547a0c2b1acaa3af9c04805ea2c1961', 111, 1, 'AppName', '[]', 0, '2024-05-28 02:44:13', '2024-05-28 02:44:13', '2025-05-28 08:14:13'),
('591ddbb8bea53545a04764b06c710a2b349b28142db0eab452450041ff57232d4246aa836e5f3c31', 107, 1, 'AppName', '[]', 0, '2024-05-28 02:49:28', '2024-05-28 02:49:28', '2025-05-28 08:19:28'),
('487e25f45f34f09e6fad6e1ca5cdc5409f785bbb133b56337bb36b182880655d74850bb05c1912e5', 107, 1, 'AppName', '[]', 0, '2024-05-28 03:01:14', '2024-05-28 03:01:14', '2025-05-28 08:31:14'),
('4fa9e69c7da95c37eaf171c2ab17345272ce3a228d7e4e4c781ab44911f895c70ee9afb57f61f815', 111, 1, 'AppName', '[]', 0, '2024-05-28 03:13:38', '2024-05-28 03:13:38', '2025-05-28 08:43:38'),
('1eea30ceeb6ebc3765a501f0214406382b55817a337d95d567f1b7f4c6b877b244b5baff35c662ad', 111, 1, 'AppName', '[]', 0, '2024-05-28 03:17:29', '2024-05-28 03:17:29', '2025-05-28 08:47:29'),
('e7bc7a2928892222c7ae5b909b0733449972911337c56931dd27bba616ea1452aae120b58375f44d', 107, 1, 'AppName', '[]', 0, '2024-05-28 04:02:14', '2024-05-28 04:02:14', '2025-05-28 09:32:14'),
('e5a69c083b59f5f768a1c0e85beb534704ffa54f0a1d46fda6c097d203205afa48d8eb333f74d44c', 107, 1, 'AppName', '[]', 0, '2024-05-28 04:09:59', '2024-05-28 04:09:59', '2025-05-28 09:39:59'),
('3eb9db428598bbe40dc2d0eed0a06cc2fef0947fbdd00e9fc02d5473e45e2b5fe93b5e78c3334170', 112, 1, 'AppName', '[]', 0, '2024-05-28 04:11:09', '2024-05-28 04:11:09', '2025-05-28 09:41:09'),
('439af667664d9828fce5b5b4f21f6557846005a51e9bdad73bd64db061aa704ee23f91ab9cc22d4a', 107, 1, 'AppName', '[]', 0, '2024-05-28 04:11:46', '2024-05-28 04:11:46', '2025-05-28 09:41:46'),
('8d8f2a616c0dedc2665d311afa110e9dd8f418f84e824d8b7af0c3806cd7c6b9c8f066cbb3f03e1f', 111, 1, 'AppName', '[]', 0, '2024-05-28 04:24:02', '2024-05-28 04:24:02', '2025-05-28 09:54:02'),
('4a3f511f4922f28a3b93d122d3361e086309746310591fe26576e76910bb03ab4fa9542b165978ed', 112, 1, 'AppName', '[]', 0, '2024-05-28 04:29:51', '2024-05-28 04:29:51', '2025-05-28 09:59:51'),
('abdc8d66fbc4a8497efc9086fa44a51d0f05c4e4e70e0690adea60f876488226d0eaeabc0f0dfb66', 113, 1, 'AppName', '[]', 0, '2024-05-28 04:31:42', '2024-05-28 04:31:42', '2025-05-28 10:01:42'),
('538f4c67429b2bd575ae461269c694d8ee9eeff44667cce2c8b0188eaa4616e10643439b6851668d', 111, 1, 'AppName', '[]', 0, '2024-05-28 06:12:56', '2024-05-28 06:12:56', '2025-05-28 11:42:56'),
('51dc4182ef35384708b6cbc7e971dc2ef18c65dddfee54bcc4a373ba71bacb68553cffb0e151d02e', 114, 1, 'AppName', '[]', 0, '2024-05-28 06:31:08', '2024-05-28 06:31:08', '2025-05-28 12:01:08'),
('abdc9aa4023098e3e4265aee10b12c4f730da31539613b2cc3cc18be3f43d5f938be68aaf300e124', 107, 1, 'AppName', '[]', 0, '2024-05-28 06:50:46', '2024-05-28 06:50:46', '2025-05-28 12:20:46'),
('cccc85c1d85ff60d98d2bd0952c8c83b1d0dd441baed26b8f7c0f73eb5cf9e0b051eef99f680e41d', 114, 1, 'AppName', '[]', 0, '2024-05-28 06:53:07', '2024-05-28 06:53:07', '2025-05-28 12:23:07'),
('06d76980e2d5622ae83f84c0ee2abea21f147ec2753988d132098680a3471e0d0e11f6ded26d00d3', 114, 1, 'AppName', '[]', 0, '2024-05-28 06:55:45', '2024-05-28 06:55:45', '2025-05-28 12:25:45'),
('4a6a4ef72b8c71b8b021623691eae6479c786f7023bca64d1799334d2415b8219ceb061b98e78b80', 112, 1, 'AppName', '[]', 0, '2024-05-28 06:57:55', '2024-05-28 06:57:55', '2025-05-28 12:27:55'),
('1589187a78fb88a73bd6136aab8349dec2f063e7d118441db1653de7b1a87fab6feae5b129e883d3', 112, 1, 'AppName', '[]', 0, '2024-05-28 06:58:02', '2024-05-28 06:58:02', '2025-05-28 12:28:02'),
('db0e2b00b7f620ac3fe62c882776e405fc00cbef655f90cdd488e5275f79448c8b96ab6aec634658', 107, 1, 'AppName', '[]', 0, '2024-05-28 06:59:18', '2024-05-28 06:59:18', '2025-05-28 12:29:18'),
('a6f48bc358f23332c8d783b3e7671352296ec6f4e2b555ca7072eee2e6e7384a0b112f0d60edb996', 107, 1, 'AppName', '[]', 0, '2024-05-28 06:59:44', '2024-05-28 06:59:44', '2025-05-28 12:29:44'),
('5a10425ba1205b7db8a2c11cb58ba4791d7536c8ec8df4a913648c411707e36cd9229d0a7bf9d671', 49, 1, 'AppName', '[]', 0, '2024-05-28 22:25:22', '2024-05-28 22:25:22', '2025-05-29 03:55:22'),
('cd3cf94133db906d3cbad1c90d87182e0d29b6fb577d87f23b46c09f291bdd48d8e10ac84da2d893', 112, 1, 'AppName', '[]', 0, '2024-05-28 22:29:01', '2024-05-28 22:29:01', '2025-05-29 03:59:01'),
('9207286dd50f845de9957fd46aaa778a0607e920c1955dcdb245452a1c50166ff4c5cafdab861507', 107, 1, 'AppName', '[]', 0, '2024-05-28 22:31:02', '2024-05-28 22:31:02', '2025-05-29 04:01:02'),
('a15b13f0467c23da7fc9e1934fbc6ac6bf02c8ac43cf49da9d04d3aa2043b031da6bd3a6ab2a9618', 112, 1, 'AppName', '[]', 0, '2024-05-28 22:38:18', '2024-05-28 22:38:18', '2025-05-29 04:08:18'),
('c530b0c0d11f6656f1469b76a7adacf480bbbcea3fdeb490503b0bf58d2390cfef10aa7f828ac1f1', 112, 1, 'AppName', '[]', 0, '2024-05-28 22:43:03', '2024-05-28 22:43:03', '2025-05-29 04:13:03'),
('3f66832fff55cb5f618b2f0c2be4c288b6a5893d55de2023a2f703fca1ce95ee097ba88acdb12891', 112, 1, 'AppName', '[]', 0, '2024-05-28 22:43:03', '2024-05-28 22:43:03', '2025-05-29 04:13:03'),
('d4583d706c2ab7f329c99f6740907cd09777ec80faddd3cc16ceecfe5d27f724547d878c712fd231', 107, 1, 'AppName', '[]', 0, '2024-05-28 23:03:22', '2024-05-28 23:03:22', '2025-05-29 04:33:22'),
('9c2b4b488189fdc9d316f47f0912f89b44a1621657b6fdc644ca8db6b403896da1b8200125b649da', 107, 1, 'AppName', '[]', 0, '2024-05-28 23:11:14', '2024-05-28 23:11:14', '2025-05-29 04:41:14'),
('99a3976e6d1a15ea1cfde4aa8074bedadfb7ab88906ab4945974f53a4abe111d36ddf4ed2e0496ff', 112, 1, 'AppName', '[]', 0, '2024-05-28 23:12:47', '2024-05-28 23:12:47', '2025-05-29 04:42:47'),
('7340f4b840ec0e888647013444d7378736b05d567a28ad8bc9732ac27529cb08b66437d2befa8521', 107, 1, 'AppName', '[]', 0, '2024-05-28 23:38:22', '2024-05-28 23:38:22', '2025-05-29 05:08:22'),
('20bbaafdaefaa7d1cd0698151702a46de4e15671f6ca2107ee2d29cefd259c60bf8753ea1e2400d0', 107, 1, 'AppName', '[]', 0, '2024-05-29 00:20:35', '2024-05-29 00:20:35', '2025-05-29 05:50:35'),
('ea9c8a611e2425a4836af772a2231e45525f1685a32e1688dd12ce5abf43547966569892c255a479', 107, 1, 'AppName', '[]', 0, '2024-05-29 00:57:04', '2024-05-29 00:57:04', '2025-05-29 06:27:04'),
('acd0ed1188a5350242a674303bfe950ca5ea278176dc80988eddcefaac9d2cd20b364497ca86d99a', 112, 1, 'AppName', '[]', 0, '2024-05-29 05:57:58', '2024-05-29 05:57:58', '2025-05-29 11:27:58'),
('a4ac2d5a904726cdeb312b7acb6d98f7fa5be7f32a4d8b8db140aae104f4561260595350f055fbd5', 119, 1, 'AppName', '[]', 0, '2024-05-29 06:02:45', '2024-05-29 06:02:45', '2025-05-29 11:32:45'),
('64ca9590e45df22251be7775482d5430c1c36585c157d906551edcce7c52fa7f5f95242a8fde82a7', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:03:13', '2024-05-29 06:03:13', '2025-05-29 11:33:13'),
('91e677899b078985b2e86f3531c18d322a18aa60cd56af0b3a1722cfe8b0633ee94c73463f7801db', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:06:01', '2024-05-29 06:06:01', '2025-05-29 11:36:01'),
('f47acddfa14636a5f31ffec6715021f3b577d4c10423cc0579e97620baef99f30f5e87f9b8bc8352', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:10:45', '2024-05-29 06:10:45', '2025-05-29 11:40:45'),
('c9b09a6c9c46490ab596577335baa11322f93c0927fb397d324b4cd817c863641895eb15427b7370', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:25:19', '2024-05-29 06:25:19', '2025-05-29 11:55:19'),
('3b2ad91edd4842366ba7ded8582913e274459af5671b9fc858242e4d94a4d849f658bb8c569c5fd5', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:25:33', '2024-05-29 06:25:33', '2025-05-29 11:55:33'),
('9458a0228dba9184afa7c0f1821441eda06d4ab48b1578bff6a253097ead8772b7f57bf6542cc2dd', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:35:33', '2024-05-29 06:35:33', '2025-05-29 12:05:33'),
('4b6ab042bed2990f21c53632bf469c5db9bfa0a947d7c5b14417bdb6bc8ee7fc2508a948a8df87e6', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:43:07', '2024-05-29 06:43:07', '2025-05-29 12:13:07'),
('e141bf70850c34a80c93eeaa8d72d3959905c219b6fcd432c7065f53e26884a40c02e1105082d149', 112, 1, 'AppName', '[]', 0, '2024-05-29 06:47:15', '2024-05-29 06:47:15', '2025-05-29 12:17:15'),
('4baba9e6a52cfa25895bc221e6542487da0857d2494b0accef87fe69e167ca0c2863f6b853da7b91', 112, 1, 'AppName', '[]', 0, '2024-05-29 19:24:59', '2024-05-29 19:24:59', '2025-05-30 00:54:59'),
('98460cf9701b3fb482da4c3946ece94960626bc038782a6d6ee4b9a78a234c6e0b000bc2eaa3e277', 112, 1, 'AppName', '[]', 0, '2024-05-29 19:41:53', '2024-05-29 19:41:53', '2025-05-30 01:11:53');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('b42ba2c9abd0d8f6a877f63db7ee63c22a59a04b6ec357e5e8e4c967ac7e3a37506757b8b441d4a6', 112, 1, 'AppName', '[]', 0, '2024-05-29 19:52:24', '2024-05-29 19:52:24', '2025-05-30 01:22:24'),
('c4aca5fe70854b7e120c554a69728ca4d43d1dd26f69f4ccce8b9b8bd36aadfc9fe9e8eca0e97620', 112, 1, 'AppName', '[]', 0, '2024-05-29 22:38:22', '2024-05-29 22:38:22', '2025-05-30 04:08:22'),
('4106fcc8030236e229ef914bfa1a45977591aac57d27cc8cf2ac3d6f35acee83ea4a77cacb874826', 112, 1, 'AppName', '[]', 0, '2024-05-29 22:41:20', '2024-05-29 22:41:20', '2025-05-30 04:11:20'),
('4f8b9382b448c3109d7b84b84690652a130c449ee288653b8dc51ab01205ce74db80d3d138b63508', 112, 1, 'AppName', '[]', 0, '2024-05-29 23:08:26', '2024-05-29 23:08:26', '2025-05-30 04:38:26'),
('dd791c76e7f52c70bf7732e6ad424dc6fd0cd85f634ef24e7fe319039ebda2fdf5d171002d82a640', 112, 1, 'AppName', '[]', 0, '2024-05-29 23:32:30', '2024-05-29 23:32:31', '2025-05-30 05:02:30'),
('9750c3c8d71bbd03fa7045307241913e698997aac61b1d96783b1397b30f271c20083fcbcf618b4d', 112, 1, 'AppName', '[]', 0, '2024-05-29 23:32:50', '2024-05-29 23:32:50', '2025-05-30 05:02:50'),
('ce7d0292a1aadcd26e645f0b17d865e0f2ddbb97a066cfd3a8bf6e88a32421d5079cba9e88567f2b', 112, 1, 'AppName', '[]', 0, '2024-05-29 23:40:13', '2024-05-29 23:40:13', '2025-05-30 05:10:13'),
('23f2a85ca7d4e83da6e87260bee1503b8dc34637581c7caf5b555c03e2b0ac130669e335ff1d16e4', 109, 1, 'AppName', '[]', 0, '2024-05-29 23:43:34', '2024-05-29 23:43:34', '2025-05-30 05:13:34'),
('1c3899146950e3dce3a519b8d6a4c4dd8c60e74790512e8fc43c09a14cc0e8ca294254b8952ec3db', 134, 1, 'AppName', '[]', 0, '2024-05-29 23:51:32', '2024-05-29 23:51:32', '2025-05-30 05:21:32'),
('e9ef14b754fa279c863ce9ead3e84f7f9d90025380fd78fe16c3766091849432757ea22a3f1962fe', 135, 1, 'AppName', '[]', 0, '2024-05-29 23:52:49', '2024-05-29 23:52:49', '2025-05-30 05:22:49'),
('c85d45ca8ca6e0ee485282fa56e444a01502ae2e03fe2f2b4aae2e401a0250a03f1b4d897f69f348', 136, 1, 'AppName', '[]', 0, '2024-05-29 23:58:08', '2024-05-29 23:58:08', '2025-05-30 05:28:08'),
('562e658a311cf26b53fbb4cfc84b702dcb1a9bc292c170919fd315f4ecbf178bee38ad1be0888c10', 112, 1, 'AppName', '[]', 0, '2024-05-30 00:06:03', '2024-05-30 00:06:03', '2025-05-30 05:36:03'),
('e91e3d16fd59e539ab7ccfaceb2f71f63773412ce676c6f57cfc8c0882c2704301fb2b62d74c36c5', 112, 1, 'AppName', '[]', 0, '2024-05-30 00:06:47', '2024-05-30 00:06:47', '2025-05-30 05:36:47'),
('8d79ccb9b9ec75973a4e9ac1cb3b09b629ec9e1f5cec2e3f4e385eb38b66f0b0c665a6e6c71f3ab9', 119, 1, 'AppName', '[]', 0, '2024-05-30 00:19:41', '2024-05-30 00:19:41', '2025-05-30 05:49:41'),
('80624c5997b7b0dc4466ac7a9ec02692967edbf84facf3a1717fe04633ee95f7d211c8243e7c27c7', 112, 1, 'AppName', '[]', 0, '2024-05-30 01:03:51', '2024-05-30 01:03:51', '2025-05-30 06:33:51'),
('254d6cc36b60574a8bcb4a0c067b988af17ae14c96538f4ba39f5093a82eaf97263c1d0b8b843ab1', 112, 1, 'AppName', '[]', 0, '2024-05-30 01:13:36', '2024-05-30 01:13:36', '2025-05-30 06:43:36'),
('770ea75bf44ffdd6390b58bb0c4910079989e13a660b767667a7b8f463c005bf104879a6f0ef2a5f', 112, 1, 'AppName', '[]', 0, '2024-05-30 01:24:55', '2024-05-30 01:24:55', '2025-05-30 06:54:55'),
('8268b3374f4be65a1b0354f2cead57f2d33c8a87d4e78c7948bad310066a8a95faf013148fd3531b', 112, 1, 'AppName', '[]', 0, '2024-05-30 01:46:38', '2024-05-30 01:46:38', '2025-05-30 07:16:38'),
('898fb9a23335466a9c6623b2d4d8da5e420f3a2616746c0839413375876a4e66afe82f99d838bf9a', 112, 1, 'AppName', '[]', 0, '2024-05-30 06:05:31', '2024-05-30 06:05:31', '2025-05-30 11:35:31'),
('eeb444fa326f36a5c16a35bc52cac1666f0f126bb0b6d9e082fa947657254211a72865abd5b373d8', 112, 1, 'AppName', '[]', 0, '2024-05-30 22:38:43', '2024-05-30 22:38:43', '2025-05-31 04:08:43'),
('ad775cd4661af3b4eb121ca6ff86c9b3f95bf596d33ce45a4f26789a1825a5b2e02ea518355b5ea0', 112, 1, 'AppName', '[]', 0, '2024-05-30 23:14:38', '2024-05-30 23:14:38', '2025-05-31 04:44:38'),
('69cac5a088e1a03405a13327afcc750a4473e06545fdbe6f274430897cbdca69beb8ab7fef4e4732', 112, 1, 'AppName', '[]', 0, '2024-05-31 00:44:51', '2024-05-31 00:44:51', '2025-05-31 06:14:51'),
('0cf9ecc8e5ea358cd954abe53e1d5c65c192bce6e93df6511e94f87dcd4725f1922910a6afbe97a9', 112, 1, 'AppName', '[]', 0, '2024-05-31 00:55:07', '2024-05-31 00:55:07', '2025-05-31 06:25:07'),
('1938d12a7f73bd42b59d08ae7b7effb73e1aa208e37f984528e4667c4a577911e3f86a3a0773d616', 136, 1, 'AppName', '[]', 0, '2024-05-31 01:23:15', '2024-05-31 01:23:15', '2025-05-31 06:53:15'),
('e2f94ec772a30576caa6be405612b6f76db2a5c9283d679546df23ad4380cc12939aa2b4a279ab5a', 112, 1, 'AppName', '[]', 0, '2024-05-31 01:24:40', '2024-05-31 01:24:40', '2025-05-31 06:54:40'),
('b45e287f35cee46851a98ba6dc71158fc2f8f8e6083880a527de791df2950814c4ade2730ebeaeba', 112, 1, 'AppName', '[]', 0, '2024-05-31 01:25:18', '2024-05-31 01:25:18', '2025-05-31 06:55:18'),
('5cafb8fe6e3afc100c1f7390571aeaefdab973812a0b18c79570269f70fdb6fc837bdb2a59660ccb', 136, 1, 'AppName', '[]', 0, '2024-05-31 01:25:58', '2024-05-31 01:25:58', '2025-05-31 06:55:58'),
('bb349c34ddcce16bf8823a6f1b55e6bd2ac0b9596980f50b8a8d52ff8dab3181584b585e3ead445b', 112, 1, 'AppName', '[]', 0, '2024-05-31 01:26:33', '2024-05-31 01:26:33', '2025-05-31 06:56:33'),
('b774b53f38bf93112ca18e8bbc27e19efae4a70c90493b55b767c076ad959f1d5f46842b59a35c22', 112, 1, 'AppName', '[]', 0, '2024-05-31 03:26:03', '2024-05-31 03:26:03', '2025-05-31 08:56:03'),
('f89c2cd1597fa259c72109c192b40a9daa224fd26523e9c713e03ddd522ca9124b52b6548bfd7afb', 112, 1, 'AppName', '[]', 0, '2024-05-31 03:43:44', '2024-05-31 03:43:44', '2025-05-31 09:13:44'),
('a557aab891d269537171286272e53f6d74f019c2e2a8cbf7f2ba1721db5c66fadf98d4b59db5f474', 112, 1, 'AppName', '[]', 0, '2024-05-31 04:00:31', '2024-05-31 04:00:31', '2025-05-31 09:30:31'),
('42e31025e566629e47b2e4f1afbedcf8d08f1f82af614efc3600de70bb1a1f004db84a37a6c7168b', 112, 1, 'AppName', '[]', 0, '2024-05-31 04:47:47', '2024-05-31 04:47:47', '2025-05-31 10:17:47'),
('820272c81e4b7768f5a280c6eaba007e4763d5f6ca5aa811002d5f96135ecd28e9455e2a1136e98a', 112, 1, 'AppName', '[]', 0, '2024-05-31 04:48:57', '2024-05-31 04:48:57', '2025-05-31 10:18:57'),
('dfdaa35dd775252e690b6382f15c381c0f62b6f92818c263957d3999f8991b49fdeca709b534b0cd', 112, 1, 'AppName', '[]', 0, '2024-05-31 05:11:39', '2024-05-31 05:11:39', '2025-05-31 10:41:39'),
('c89660e7f06d1913b92aeddae90c085032764bb5db84bf82d727ff1107cd4ac739427637038ef59e', 112, 1, 'AppName', '[]', 0, '2024-05-31 05:29:32', '2024-05-31 05:29:32', '2025-05-31 10:59:32'),
('de9057f89a0c58717cc5e3e16947e9c7f6f0167d20fff5f81e9919be7ce09aaf8e2824c6133f0b87', 112, 1, 'AppName', '[]', 0, '2024-05-31 05:32:23', '2024-05-31 05:32:24', '2025-05-31 11:02:23'),
('bd6d21cdcbc84d516fa640d4e9f02a9ddfa9e79a2659cc20a99d87055258dedbab8ad67654243cd7', 112, 1, 'AppName', '[]', 0, '2024-05-31 05:49:51', '2024-05-31 05:49:51', '2025-05-31 11:19:51'),
('d5fd502c91866e2ad931347c0834c981acdb6b92b39e957b2b26e0318ba38fe8bb7f661251b2ffd0', 112, 1, 'AppName', '[]', 0, '2024-05-31 05:59:27', '2024-05-31 05:59:27', '2025-05-31 11:29:27'),
('426c3315179f2ef842972d6444a054ec66031499cd98465ecde75b9b61913acc2bc1312d511e5c4e', 112, 1, 'AppName', '[]', 0, '2024-05-31 06:04:04', '2024-05-31 06:04:04', '2025-05-31 11:34:04'),
('461565cfe174ca2a4c680c2bdd0e4be508d297b07941e814217b174cc29206f6142b4712173c6361', 112, 1, 'AppName', '[]', 0, '2024-05-31 06:11:51', '2024-05-31 06:11:51', '2025-05-31 11:41:51'),
('90a3f19804ac643e991f73d43228d738cd19f79e5c136e0194aee1d464e99548b554490e778066d3', 112, 1, 'AppName', '[]', 0, '2024-05-31 06:41:22', '2024-05-31 06:41:22', '2025-05-31 12:11:22'),
('339840bf06ac8684a9ad10dfcb94f9dad517defc278acbce81789afa6c038eba7d0be999965b9445', 112, 1, 'AppName', '[]', 0, '2024-05-31 06:44:32', '2024-05-31 06:44:32', '2025-05-31 12:14:32'),
('f02c2c39fd4931ef1d1b492f396e8074ea9af7789c3b0450bf5d0d9f879c7390b55a591021d3bab4', 112, 1, 'AppName', '[]', 0, '2024-05-31 06:46:05', '2024-05-31 06:46:05', '2025-05-31 12:16:05'),
('614e1a5c171c59be0617695eba1330462eacfb14c1c34718076bb908da32e3e98f676b9c6e1b93af', 112, 1, 'AppName', '[]', 0, '2024-05-31 23:04:50', '2024-05-31 23:04:50', '2025-06-01 04:34:50'),
('f2605ecc9b2d0d2f4f479d1ffbbfef99c88e1e8de2600a56e1716a6d024f31f6672c308f0bcbe466', 112, 1, 'AppName', '[]', 0, '2024-05-31 23:09:55', '2024-05-31 23:09:55', '2025-06-01 04:39:55'),
('cd7dc029eba86076901ac35e4497bb7cb0dbc7da8c93c9ec5012b139c529cd17a7450a55f82e6383', 112, 1, 'AppName', '[]', 0, '2024-06-01 00:43:08', '2024-06-01 00:43:08', '2025-06-01 06:13:08'),
('e895ce290688024f29793d39299ed0c7ea0de4cd6a4e649f9d8cae47c4d30e521c37e40172f836e1', 112, 1, 'AppName', '[]', 0, '2024-06-01 00:51:57', '2024-06-01 00:51:57', '2025-06-01 06:21:57'),
('50c6aadead39565f4dc9133637edd9b79aa5c275b7724295e2732788bd118c453aedb69c2809536e', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:17:17', '2024-06-01 01:17:17', '2025-06-01 06:47:17'),
('4658bdbfd78db74767fc2f6495f9fe527d0c5602ae7abb855290c53d1103e3b916b8ef9d24eda9a1', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:21:37', '2024-06-01 01:21:37', '2025-06-01 06:51:37'),
('a7ba865c6914dbb741b1c847c879509c9a1ae486c70dc5bd74977b649880c62cbf5968d11e4e6e6c', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:23:58', '2024-06-01 01:23:58', '2025-06-01 06:53:58'),
('5a9d1286b268e504a00ea31c6f30ee6bb9c4fc9613c85baca115599b7c8d4c04704fc8eba606f8a0', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:28:07', '2024-06-01 01:28:07', '2025-06-01 06:58:07'),
('27d816f58342f938883efb6a25fbe2169e5ccbf21841684e01854896da36806ac2035910ba86500e', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:31:19', '2024-06-01 01:31:19', '2025-06-01 07:01:19'),
('4ac4b448993a674bd066d2b771a8c89ac70ed9fc9e0c659427e64e0009f87cf6d09f8dbd54dc4cf1', 154, 1, 'AppName', '[]', 0, '2024-06-01 01:32:01', '2024-06-01 01:32:01', '2025-06-01 07:02:01'),
('b9c1830e4801554708aacb99c39a33d5eed77f0c298fc6953428fb76b8a2c2bcb5ebb3c83a6be863', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:40:59', '2024-06-01 01:40:59', '2025-06-01 07:10:59'),
('de90ad70b3b8d859feb5bba9bddbc8d2f9cfadd5039229cf26867701ff143e650534f6b396d80d02', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:44:40', '2024-06-01 01:44:41', '2025-06-01 07:14:40'),
('8916e67666c71179c42767805c7480a9957bbc6ab1a12f5f7b52aa9f14981585e741be1dd7db10dd', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:52:21', '2024-06-01 01:52:22', '2025-06-01 07:22:21'),
('d3f5da291871b76748cb2acd5106faf33f1df65634c0bec9c1242227a625ef9bbf35b4c2e22a564d', 112, 1, 'AppName', '[]', 0, '2024-06-01 01:56:52', '2024-06-01 01:56:52', '2025-06-01 07:26:52'),
('83ad327ab3e39ecad8cdb414e87c984ade5f525f49f8e7cfa22933242c800e2ec01f4ffc5c4ce94d', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:00:22', '2024-06-01 02:00:22', '2025-06-01 07:30:22'),
('43c5030bb2a935518621240a6f183e473f4d4fc896d6058202b0594ddc70989f6fec329a78f80443', 154, 1, 'AppName', '[]', 0, '2024-06-01 02:11:43', '2024-06-01 02:11:43', '2025-06-01 07:41:43'),
('98360db688f55c3d6f581c63afed75857fbfb9845c85cfeb1c7e7762555474010a29c1ba9074a1fb', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:12:19', '2024-06-01 02:12:19', '2025-06-01 07:42:19'),
('a479c477066d7a59ee16acf73ff8bd1d40b1f94b24dfd84ce74fa76bf39940b5f2dcc979652b9ffa', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:16:28', '2024-06-01 02:16:28', '2025-06-01 07:46:28'),
('fbe09a32a5dd7a7234529fcbcfe12ac6d89897debd67963d255365c40eeecb2497fc046b59696d34', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:17:07', '2024-06-01 02:17:07', '2025-06-01 07:47:07'),
('061564d5ce94d360769afa421e3362aa6086823a1345afe411cbbab489d45649a2988a4c234be616', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:21:52', '2024-06-01 02:21:52', '2025-06-01 07:51:52'),
('09ba8f5d60d38eab32c0a4930fd8f0bc18d660c59a8c78258be07305ca30ec26f668472dc47a6966', 112, 1, 'AppName', '[]', 0, '2024-06-01 02:25:26', '2024-06-01 02:25:26', '2025-06-01 07:55:26'),
('9a076106f5e90cb7b389121bdf86dec82e6eeb7fc200d3dbfcfe5252a694782961ed351c56cadbe9', 154, 1, 'AppName', '[]', 0, '2024-06-01 02:48:56', '2024-06-01 02:48:56', '2025-06-01 08:18:56'),
('5feb1eeaf12e6830542a7cf4859351f32b49c7b35625f76f0cf6a7df00ec9366b5284a85b5d7bd59', 112, 1, 'AppName', '[]', 0, '2024-06-01 03:04:23', '2024-06-01 03:04:23', '2025-06-01 08:34:23'),
('b6c5842d90b2fad204e0c71ea2544036b0dd15ae7fbb9b1e62f9f7768788a109f9d22d0661eb7959', 158, 1, 'AppName', '[]', 0, '2024-06-01 03:51:27', '2024-06-01 03:51:27', '2025-06-01 09:21:27'),
('4443374c94dae36a2e5169a9ffbf9f13266f0243dbbb928e8df979c147af8fba2eb6b41a19b69c93', 112, 1, 'AppName', '[]', 0, '2024-06-01 03:52:59', '2024-06-01 03:52:59', '2025-06-01 09:22:59'),
('e4ae33e32bc0899d42993fccdbfcb2a920ddd3c7be00c1acf8ae009db5f00d500a5986d2d6bacc5b', 112, 1, 'AppName', '[]', 0, '2024-06-01 03:54:04', '2024-06-01 03:54:05', '2025-06-01 09:24:04'),
('ebe8f71c76fd31d33d6ac2a08aec6faa917b785a53f9004c48f0d7944d5aceabea79dcc1a902292b', 112, 1, 'AppName', '[]', 0, '2024-06-01 04:24:10', '2024-06-01 04:24:10', '2025-06-01 09:54:10'),
('8240ad37342cb7552eda21f15d57ddd877153b3383d9db706af12f8ff74bd88fbd1e3a4cef8913d3', 112, 1, 'AppName', '[]', 0, '2024-06-01 05:31:58', '2024-06-01 05:31:58', '2025-06-01 11:01:58'),
('83615a5a9b1da29b56daad4765cb03173e8451c893b645306539f59fd7d2c3c81ea4d9d77bcfc26e', 112, 1, 'AppName', '[]', 0, '2024-06-01 05:43:11', '2024-06-01 05:43:11', '2025-06-01 11:13:11'),
('2debb47c26993115ec1fc94bc52df72002c835d9e5b5bc081321a05b8fc2f38322e998c845a66658', 112, 1, 'AppName', '[]', 0, '2024-06-01 05:51:45', '2024-06-01 05:51:45', '2025-06-01 11:21:45'),
('1336cf0e9dbcf353b4ea2e78cd9ba24d54af0919f55b63c66cbb206567cfae7486f3489839165550', 162, 1, 'AppName', '[]', 0, '2024-06-02 08:15:15', '2024-06-02 08:15:15', '2025-06-02 13:45:15'),
('a40e569d309ff6ba7269469b4f8a9e9fe59dff07100d72f0965115a1bbd4cdb898f147236036e64c', 119, 1, 'AppName', '[]', 0, '2024-06-02 22:14:56', '2024-06-02 22:14:56', '2025-06-03 03:44:56'),
('befb0aa1ac1a00e3d89b8be07557586018de0b01f74c7879e83c848b020ec5f3ceba152be0a245c6', 112, 1, 'AppName', '[]', 0, '2024-06-02 22:22:16', '2024-06-02 22:22:16', '2025-06-03 03:52:16'),
('d5ceffd78cacfb59aa35f54ff2f175d4c5f1d52880e7787610c1c6a5a93459e7e60f580e58b1af9e', 167, 1, 'AppName', '[]', 0, '2024-06-02 22:54:08', '2024-06-02 22:54:08', '2025-06-03 04:24:08'),
('5e0fde2a5116f3b002e1c3cfaa2b5ecc05875aa61da8542581ff890950df7d134ba5b2755c9e16ee', 112, 1, 'AppName', '[]', 0, '2024-06-02 22:56:35', '2024-06-02 22:56:35', '2025-06-03 04:26:35'),
('96238b0413749730a597e8c759ad7f32e24fddd801613780e6e5a1c4c5af6e6f74b81b9e6a426a42', 162, 1, 'AppName', '[]', 0, '2024-06-02 23:00:14', '2024-06-02 23:00:14', '2025-06-03 04:30:14'),
('e049018bf579f76f8303264055ac5b602615845021daf8a51720d5b09ee3b9cf95669f6626f69cd7', 168, 1, 'AppName', '[]', 0, '2024-06-02 23:23:00', '2024-06-02 23:23:00', '2025-06-03 04:53:00'),
('9052047438894bf0db3ccbe8b5e8ead3fcdbcda3725440eb4f4806f1206947b353d921cfdf6574fd', 112, 1, 'AppName', '[]', 0, '2024-06-02 23:28:33', '2024-06-02 23:28:33', '2025-06-03 04:58:33'),
('dca676bccb26e18294adbc1fd224df56f2a9fa4788a4b05e500f6d10c5bf742dd2680efbc3db88a4', 112, 1, 'AppName', '[]', 0, '2024-06-03 00:05:12', '2024-06-03 00:05:12', '2025-06-03 05:35:12'),
('5b240209c3e9726d47bd59faa56ea1c02738145d50a9070a03689ced79f05e0717a7e6c5310d034f', 112, 1, 'AppName', '[]', 0, '2024-06-03 00:49:58', '2024-06-03 00:49:58', '2025-06-03 06:19:58'),
('dda38ed9f128ff1cec643fd366f6d7f6ec7f3037fce4c73877852355903baf38e05d299dc585d3b2', 112, 1, 'AppName', '[]', 0, '2024-06-03 01:38:38', '2024-06-03 01:38:38', '2025-06-03 07:08:38'),
('ae73ff9cfaeac6d799978425410ef654563ad686a5d739c0a7db887f691c7df08a9e5be45292ce82', 173, 1, 'AppName', '[]', 0, '2024-06-03 01:58:53', '2024-06-03 01:58:53', '2025-06-03 07:28:53'),
('ec397f0db6d3a7c84fc656132a171a640f690dff499f94ef31635139d69e80d0a0ceafa7654b62bd', 112, 1, 'AppName', '[]', 0, '2024-06-03 03:15:08', '2024-06-03 03:15:08', '2025-06-03 08:45:08'),
('e560c2654b704603696e4db1d4dafd6514fbe2fd3e34fec65815e64d2f543bce85da28ccddf41530', 112, 1, 'AppName', '[]', 0, '2024-06-03 03:28:13', '2024-06-03 03:28:13', '2025-06-03 08:58:13'),
('c1de2cc2e2369b3ff0c5f34dc01102d01ac222137e23c11204628b057628f8ed8f37012b25d7915d', 112, 1, 'AppName', '[]', 0, '2024-06-03 03:32:29', '2024-06-03 03:32:29', '2025-06-03 09:02:29'),
('d922a4ef3090822ac308969ced23f11ba74edf3b74f3058d50ce87bf4a11d7efb4afab1e414e78e5', 112, 1, 'AppName', '[]', 0, '2024-06-03 03:47:32', '2024-06-03 03:47:32', '2025-06-03 09:17:32'),
('bb9556c6125e75a237237c40e17a361c03229754771cb2895f785f13471941c14530a1c585c9e00b', 112, 1, 'AppName', '[]', 0, '2024-06-03 04:14:40', '2024-06-03 04:14:40', '2025-06-03 09:44:40'),
('0df88c3c401c008d8bc18aa14a51018051d8e500ddace87cb560360c9d629b84fccddc88f3f99225', 112, 1, 'AppName', '[]', 0, '2024-06-03 04:40:31', '2024-06-03 04:40:31', '2025-06-03 10:10:31'),
('043ec96892db8417d10bf877d85662f6a9fe5406f31c031d1ea7dc6e01d863ac51d34bc9d614c044', 112, 1, 'AppName', '[]', 0, '2024-06-03 04:53:37', '2024-06-03 04:53:37', '2025-06-03 10:23:37'),
('c361badc970360e05691b3daa2c98b9376ccad69f4e44aba1b418a2f8d6dc83c701e45e553a648d1', 112, 1, 'AppName', '[]', 0, '2024-06-03 04:54:57', '2024-06-03 04:54:57', '2025-06-03 10:24:57'),
('d3bcf522975c53979bf111a4c02e4f042729ae1db12b5d8630280fa05dc0f1895b5d899b928aa3bc', 112, 1, 'AppName', '[]', 0, '2024-06-03 05:06:10', '2024-06-03 05:06:10', '2025-06-03 10:36:10'),
('177988f8d8ee174e71aa91eef2d7588e4e60eb50065d2c7a879def1b4178d9ad4556e679ec640689', 112, 1, 'AppName', '[]', 0, '2024-06-03 05:28:24', '2024-06-03 05:28:24', '2025-06-03 10:58:24'),
('3923cc5f908cce7b2076ee64b5fb16e24e9db7fe0c2986e67255153e0702da5633d1199c7381a5cf', 112, 1, 'AppName', '[]', 0, '2024-06-03 22:27:18', '2024-06-03 22:27:18', '2025-06-04 03:57:18'),
('39acfc8c0d97580ea586b862e454d3f9fc2307d7380502f4f902afdae141f4091db7b5515c832e1e', 112, 1, 'AppName', '[]', 0, '2024-06-03 22:29:44', '2024-06-03 22:29:44', '2025-06-04 03:59:44'),
('757f6fd85deaab48ca97b642fb4923b533e621955e9fb5e9f77c718d1f3306d87df52e3ed70c8ffe', 112, 1, 'AppName', '[]', 0, '2024-06-03 22:52:42', '2024-06-03 22:52:42', '2025-06-04 04:22:42'),
('5675b646dc440c77b458720934e58df07f2adcbdc0755298fb3f52f03f1549e516ed9b82cb20d507', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:03:56', '2024-06-03 23:03:56', '2025-06-04 04:33:56'),
('09cf998f72ffba629f49152def03e24e517faf07f105323c2b468ccf680dda320ae78c61dab07eae', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:12:56', '2024-06-03 23:12:56', '2025-06-04 04:42:56'),
('d4baf7fb040cfa8efcbdf3c31509098caf43a8529469621ef8a96b3fddf7902d9da1aea94205b77f', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:16:47', '2024-06-03 23:16:48', '2025-06-04 04:46:47'),
('02559fa131a04a0624e0ba8ea1562625edef4ca7a611d7285bebed13cf8c7650e04736fb86fd7c89', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:25:16', '2024-06-03 23:25:16', '2025-06-04 04:55:16'),
('0d467a3dd96728f8d842dcd36836109bb58d44bdd68d387d5ee835cf9ddbe64788bdf57b54292daa', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:30:47', '2024-06-03 23:30:47', '2025-06-04 05:00:47'),
('026730fa0baed62fd73ce2ad07a0e903596e7fbe935198db33beedc75cdb545069a29f34ab5a2100', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:35:10', '2024-06-03 23:35:10', '2025-06-04 05:05:10'),
('976930c830c9372ee88aa12ff945c260196eaef0c93922464dbf7394a0894b091c1f21e4bfcbbb98', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:36:36', '2024-06-03 23:36:36', '2025-06-04 05:06:36'),
('3af9c886f191b8f0243dce98683981a41ad72dfc353791f842a000d331c6a39f427679e6dbda8f68', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:48:51', '2024-06-03 23:48:51', '2025-06-04 05:18:51'),
('49d1274edc521cdbb677bfbc736784425db6566e8c3ed0a1ee04ead8411e876ec6a048c7052dafff', 112, 1, 'AppName', '[]', 0, '2024-06-03 23:50:28', '2024-06-03 23:50:28', '2025-06-04 05:20:28'),
('b973e539716f6b30b97cd079b711f9ed67b3a09434f882ced5e4fffe5fddd5916e27d9de42e55b65', 112, 1, 'AppName', '[]', 0, '2024-06-04 01:16:48', '2024-06-04 01:16:48', '2025-06-04 06:46:48'),
('d58f59e39c9890b39fe05de11796253c9459062abd28b7e95ad5a1d5ced536fa5d0f186e8464ac80', 112, 1, 'AppName', '[]', 0, '2024-06-04 01:26:06', '2024-06-04 01:26:06', '2025-06-04 06:56:06'),
('055e75adb86773f5515fc3fe4d0bc8f41f7b591217ab4df5354af69e4973a5f4bff560602946dfd3', 112, 1, 'AppName', '[]', 0, '2024-06-04 01:51:09', '2024-06-04 01:51:09', '2025-06-04 07:21:09'),
('12db7b09deee3aa401274557092bd92f4411c358b01079e5f43584e3d35adcd3d2a6389a337d4fa4', 112, 1, 'AppName', '[]', 0, '2024-06-04 01:57:57', '2024-06-04 01:57:57', '2025-06-04 07:27:57'),
('3d9a1665920cb3e67b8aefd0197fdfcf4630589f66e049aceb089d0247791af69f0e7be66df14464', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:36:21', '2024-06-04 02:36:21', '2025-06-04 08:06:21'),
('fd93bd6267c2718fb174f06c33f05693c3ed8158e9571c68b3f940f5cb3625fd779d23c6bad40373', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:38:08', '2024-06-04 02:38:08', '2025-06-04 08:08:08'),
('16ca9e73a576e864e1df5338e1e6cceee42dfcf98a3093111874d29ffce0a75df2cd16e7e021aa21', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:38:24', '2024-06-04 02:38:24', '2025-06-04 08:08:24'),
('a7de5c191b9782fe044d720df4808136124561f82f85367711e7a2c430246f5136893e1b11c7cac7', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:40:02', '2024-06-04 02:40:02', '2025-06-04 08:10:02'),
('fddcc4b83543f30926cb10ee5ce66f3abd8b38b35e250790d2c3c12d95c1f93080c0278e286e1912', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:41:18', '2024-06-04 02:41:18', '2025-06-04 08:11:18'),
('d80218457a34389c31a34f0ef87d9cd4df114a4c3462b988e7a08f7b05c3ed4fc044557c08a740c6', 112, 1, 'AppName', '[]', 0, '2024-06-04 02:42:39', '2024-06-04 02:42:39', '2025-06-04 08:12:39'),
('18dc68f620d5ad5a93e79df1f79dd1906e98ac6b1b7516aafc26a9ef402d26547a21af82cace7287', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:09:01', '2024-06-04 03:09:01', '2025-06-04 08:39:01'),
('b4b105330daea1f926874c694d88095f97275e15b8dbf86c31835e74148934500df40277c6e764d8', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:12:21', '2024-06-04 03:12:21', '2025-06-04 08:42:21'),
('6d7387b2a78f6be89e79f5e8798e24b439b6916a7966978d1e2c4e2c003e7883ea606aa86c465c13', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:19:26', '2024-06-04 03:19:26', '2025-06-04 08:49:26'),
('e1933271308d67b9b32172de876e09925f362f0c163666568c4fc4f8f643de3126d9807fde30bf1c', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:19:46', '2024-06-04 03:19:46', '2025-06-04 08:49:46'),
('3aebdc971ebda2710f0507446c7e48f6cccd2eeb0b2dca1514138fa3c82b34a08c1e8fc0c359fa9d', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:23:14', '2024-06-04 03:23:14', '2025-06-04 08:53:14'),
('7737683d282fc4d9fa7cbe4aceb452b76dc2e57f96dafaf25ece7c746490cfe51ecbb0b15810900a', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:25:54', '2024-06-04 03:25:54', '2025-06-04 08:55:54'),
('c7036d8d60c51d067b5d5fb17bacbfc931d77930b29cfc561eda83cc7f8a28ca42c3250f14e4d482', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:26:59', '2024-06-04 03:26:59', '2025-06-04 08:56:59'),
('c558a8fd4db3b5d758df6148a79f808ea3990c743e9d73d818a4a2d220f628d808574c5176c887c9', 112, 1, 'AppName', '[]', 0, '2024-06-04 03:54:07', '2024-06-04 03:54:07', '2025-06-04 09:24:07'),
('2717ea7fff3c84422e137287bafd5ffdc2a249b23ac361a12eb18b5bbe469c028ff3bc3364f1554b', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:08:43', '2024-06-04 04:08:43', '2025-06-04 09:38:43'),
('b897a3066fae0a31a3e5f4200a4a0e2282852666d3d7f5db4ed00ecef6b5124d7185a8270f8f71e5', 175, 1, 'AppName', '[]', 0, '2024-06-04 04:09:48', '2024-06-04 04:09:48', '2025-06-04 09:39:48'),
('2f1fe9c1e0f307877e4fdb92a07d0a4bdcfd0942427796188c01626739a96eaaca5290a2296b52ed', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:31:56', '2024-06-04 04:31:56', '2025-06-04 10:01:56'),
('31174bd380f3095cff5796344d098b2c1768f4db6b7cc23230e5fa26b3a2282850cc36446ff225b1', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:35:58', '2024-06-04 04:35:58', '2025-06-04 10:05:58'),
('aea1417adbb38edc85a170f35d2b425e0cc2679577732106e99946bed572c7cd7daf0a9c645e1953', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:38:25', '2024-06-04 04:38:25', '2025-06-04 10:08:25'),
('f5db5adddd8e1b201abd0e90214c4360a58c86b9e66fd43480137690a5a5fc468a062008a6a29bd9', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:39:45', '2024-06-04 04:39:45', '2025-06-04 10:09:45'),
('9dc908565d23e1661a057f1f11b46e0e6c0a480e575de7583e3302e44450b66265ab3d44c2fb71d5', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:44:16', '2024-06-04 04:44:16', '2025-06-04 10:14:16'),
('c822ca026c6cd4cb758c2d245049f961fce8e0923a82c17c77bf945503192ecfe817b0553d394fc8', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:50:06', '2024-06-04 04:50:06', '2025-06-04 10:20:06'),
('d7baf1054be0f00d9701947bb5a0cbfefaf0a0f9c465ac22f9f9335e642e2e96bf3bf6abb3cf1186', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:51:25', '2024-06-04 04:51:25', '2025-06-04 10:21:25'),
('6da9a9e73fbb838c25188c1d4b90bde41635504f9e799c587aeb2f0d70dee194e7d6455d0ee659f5', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:55:16', '2024-06-04 04:55:16', '2025-06-04 10:25:16'),
('37c6fef04fc69335e480f7bbe7dded2a73ffca684aa264383f875a3a32520ddcb2b0184a8ac3e9cd', 112, 1, 'AppName', '[]', 0, '2024-06-04 04:59:13', '2024-06-04 04:59:13', '2025-06-04 10:29:13'),
('c29d70fe4bd98145a592fc76186c1e54853146b828de43cde177217326c9763f5a2081e450778651', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:00:35', '2024-06-04 05:00:35', '2025-06-04 10:30:35'),
('33066a6c5764c958bc83ea38d9971e61a9ebf6548aa231da7e2945aad6a8fd21513175ba0071f7a6', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:01:30', '2024-06-04 05:01:30', '2025-06-04 10:31:30'),
('1e07aa3fb48b2343a485eb9cfaf2e5d37d770e28cd3a33ee1e3714b36d08bf18730d867372df6c28', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:07:30', '2024-06-04 05:07:30', '2025-06-04 10:37:30'),
('77010c68618a0bcae6316ef21bbf7004ca2b2825a8123cb54b6be9f2e504e6130116286552827496', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:08:36', '2024-06-04 05:08:36', '2025-06-04 10:38:36'),
('fbba0d98325280a81889eec4726efabd95750238c8b078ae27103764797a547b8e1b9b6d0847c61f', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:22:07', '2024-06-04 05:22:07', '2025-06-04 10:52:07'),
('bf89384f133790eec4cdf1fb5a6eb9ea327c8656ecee5cff282b7ebadb7134e30274371771bf0707', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:41:54', '2024-06-04 05:41:54', '2025-06-04 11:11:54'),
('36f53c7b1ddc464620067bef3530ed5c12a244d26768aff9e23af68bf60ded0a54c4c75114e772c1', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:44:40', '2024-06-04 05:44:40', '2025-06-04 11:14:40'),
('f913811f55bcdfc353084f7b8b320a549f56bcce100bb6106869f2649940ddb0bbf82708dbc55544', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:51:27', '2024-06-04 05:51:27', '2025-06-04 11:21:27'),
('92cfd246b81dc49100ba0f5bbc55efe1112171316684c37cfd39507f348d299e503b04cc4233b1c3', 112, 1, 'AppName', '[]', 0, '2024-06-04 05:56:00', '2024-06-04 05:56:00', '2025-06-04 11:26:00'),
('c809519b4747cf592c37463bd7126d37d5a8693aa582613d8c0add67353d3db15cfe80ea3182551b', 112, 1, 'AppName', '[]', 0, '2024-06-04 06:15:33', '2024-06-04 06:15:33', '2025-06-04 11:45:33'),
('88a548e59bde99b8b91c974d9ed4c64eed2c8d906b8e0d628dd92a7288034f62546bce71421e7b44', 112, 1, 'AppName', '[]', 0, '2024-06-04 06:18:25', '2024-06-04 06:18:25', '2025-06-04 11:48:25'),
('65eaec3a36dc5274f61070b39c37d3e31b8929b1f103d6d3710ec6f882407210faa74d04aefc7e24', 112, 1, 'AppName', '[]', 0, '2024-06-04 06:35:18', '2024-06-04 06:35:18', '2025-06-04 12:05:18'),
('982c9bf05d0554c0e38deb37483a0087606dd4bde1075a099e53d218e4201ede41ab25a8e61777ad', 112, 1, 'AppName', '[]', 0, '2024-06-04 06:38:24', '2024-06-04 06:38:24', '2025-06-04 12:08:24'),
('7dfcbcf30e8b4e6b1522539c1b64688614b878ca089e27534c2c6a9e9adc5057e57999c00be43610', 112, 1, 'AppName', '[]', 0, '2024-06-04 09:01:21', '2024-06-04 09:01:21', '2025-06-04 14:31:21'),
('a5d981a2eb1d835bb9017d270bc5f30c81c2b93a1a3081fa714dfc7e9d60091fa632fbf11c7b84d9', 112, 1, 'AppName', '[]', 0, '2024-06-04 09:54:38', '2024-06-04 09:54:38', '2025-06-04 15:24:38'),
('a58b05975dc12da19e3d5baa54ad56d437c476cd59e39c1b8c6cbf23adad1367bb9d23121411d23a', 112, 1, 'AppName', '[]', 0, '2024-06-04 09:55:49', '2024-06-04 09:55:49', '2025-06-04 15:25:49'),
('8d75e9dacd87318151dab236664c708d16a85aa10ecd10fb388b298c32142e887cf49899425dff4e', 112, 1, 'AppName', '[]', 0, '2024-06-04 09:58:25', '2024-06-04 09:58:25', '2025-06-04 15:28:25'),
('9a5a0d54952e8daf7f896de915e303d30c396bd3c319430d4e3282dce1cedf2a0ffe03b14622a526', 112, 1, 'AppName', '[]', 0, '2024-06-04 09:59:13', '2024-06-04 09:59:13', '2025-06-04 15:29:13'),
('5d5b7cdaccd17714c9ae7edf779979741fca11372f690f339a537b842915efe390b59771b7e0f7a2', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:02:42', '2024-06-04 10:02:42', '2025-06-04 15:32:42'),
('bab585dec1036e19f350157cc79c621a73fa08f28d3443b98986c5bb97019c0cfcbb2e252f28bf94', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:35:59', '2024-06-04 10:35:59', '2025-06-04 16:05:59'),
('1a3c10ed951d45c471553ca77a54425a952af0bda84a5a9334f033d1b4d3cfda7fba65d366ac0960', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:38:59', '2024-06-04 10:38:59', '2025-06-04 16:08:59'),
('de466ed2ff003f56ec94bb3a7e00d3bbf95d9a5ae8a235505f5535334d13a35421722dad77e0a6d8', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:42:45', '2024-06-04 10:42:45', '2025-06-04 16:12:45'),
('1fe8e0680da29d202aecabde9ab2fbdffd2c457e1fd14938a2241042de81505566e23f8a4056ba6d', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:45:21', '2024-06-04 10:45:21', '2025-06-04 16:15:21'),
('e7de102bcf98ca8ca47c1247ee020d80ff16b96bb90f8a82255a795fd50f1cd5e34cc7335e4541b2', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:50:06', '2024-06-04 10:50:06', '2025-06-04 16:20:06'),
('c824bc1e49f0f4687bb2842415a880e4faa7d40859f60c4b991d96c989f793e3399083dc3e3c91e9', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:53:22', '2024-06-04 10:53:22', '2025-06-04 16:23:22'),
('fe16250ced373d6bea85d3b066d10a1f6506fdea67881f244c5c735d72aacd93857e18a78ae1e715', 112, 1, 'AppName', '[]', 0, '2024-06-04 10:56:40', '2024-06-04 10:56:40', '2025-06-04 16:26:40'),
('ce0e971554fb1f99c264ac0c585bb30276b791f6ea8b0ddc5be0d2078d89f7bafe4fc472c3e948ca', 112, 1, 'AppName', '[]', 0, '2024-06-04 12:26:40', '2024-06-04 12:26:40', '2025-06-04 17:56:40'),
('ffc8c6f49e8addb29e86f368b546a27ba802513381e631a5c0a2ec6f018c7541b18b3bba9e8dd03c', 112, 1, 'AppName', '[]', 0, '2024-06-04 12:32:05', '2024-06-04 12:32:05', '2025-06-04 18:02:05'),
('7f9a0b380b16f2ec5a0143f7c134feed884f65b777b2023c57aeed179ba89e5dace090c2bd1f6101', 112, 1, 'AppName', '[]', 0, '2024-06-04 12:49:15', '2024-06-04 12:49:15', '2025-06-04 18:19:15'),
('eef5f48a2e053a33fbe86cc4415acf61e6ffafcf82dd03381713f19e03bc4ef3450bb970411edef8', 112, 1, 'AppName', '[]', 0, '2024-06-04 12:49:32', '2024-06-04 12:49:32', '2025-06-04 18:19:32'),
('8a8a6e3c4c772b2b75500725b6b98c9d8a8a85a1ff1b30fd45ab14a254912eac1f7d955e6f22e32d', 112, 1, 'AppName', '[]', 0, '2024-06-04 13:16:05', '2024-06-04 13:16:05', '2025-06-04 18:46:05'),
('d3d0b7dbeb4a49e5d96079866eade0406d54961611ae2ed3ecebfbc8b047fe3a2f5b347b54714308', 112, 1, 'AppName', '[]', 0, '2024-06-04 19:22:44', '2024-06-04 19:22:44', '2025-06-05 00:52:44'),
('40afed9b8eef4649712f242a65840740fb23aaa9e84191a01889683ada4b26b12489513f42572acf', 112, 1, 'AppName', '[]', 0, '2024-06-04 19:45:45', '2024-06-04 19:45:45', '2025-06-05 01:15:45'),
('33bf7d8c7a697c177a37f8cdd85403742b09a5451d95fad1bdfb95a11c6d148d9b1d05778d7d0def', 112, 1, 'AppName', '[]', 0, '2024-06-04 19:47:05', '2024-06-04 19:47:05', '2025-06-05 01:17:05'),
('4d67d94a81f281181f0ab9e86ea4a18c01984258a94eec1dcb301e644e23ae3fea0838d20b516aef', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:05:24', '2024-06-04 20:05:24', '2025-06-05 01:35:24'),
('3dae9499e5d406fbef534fdca0469edf409464a246e7efcf19078102c7ef673033aa68eb3f163020', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:10:52', '2024-06-04 20:10:52', '2025-06-05 01:40:52'),
('5dd5078842814825a562dc7e70e2307cb63f83a31dd03e0aab5ca25078e761daa012b660202a5a01', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:14:18', '2024-06-04 20:14:18', '2025-06-05 01:44:18'),
('96955a80a556d12da3611291a8c9b70594313edbc4fafbfcea53df5abfae34d3572e7a5d5f053025', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:22:23', '2024-06-04 20:22:23', '2025-06-05 01:52:23'),
('897c2d44a1813e61a5361d1d61ed9e3424e7c59af8831662850aaa4275cc73addd587cb18c350e91', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:25:15', '2024-06-04 20:25:15', '2025-06-05 01:55:15'),
('52942d6f39f9b98c2e4010df14b9cec4ac15210cac1ba2a403c97b9eb2b035ed7949f0e1b70fce12', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:26:17', '2024-06-04 20:26:17', '2025-06-05 01:56:17'),
('6d33556e15fb3c8080883d217104c064b9345b86e8b68504ff9eec0cacb272f78f6e46800623d04a', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:27:50', '2024-06-04 20:27:50', '2025-06-05 01:57:50'),
('10c6f3f7b4fe524043c6e04112ffcddff70a2f6fcad772ac3fe5eb01c3d3545f5511ee57ab9af0d7', 112, 1, 'AppName', '[]', 0, '2024-06-04 20:46:03', '2024-06-04 20:46:03', '2025-06-05 02:16:03'),
('bab95ab4934fbd600eb79930289a5828c907df930b81d292f607658544ed86dd98ba7a6b73bc3e51', 112, 1, 'AppName', '[]', 0, '2024-06-04 22:29:52', '2024-06-04 22:29:52', '2025-06-05 03:59:52'),
('a85a693a3346d76d44a20e0a8290d9137dce144014e9e3815202291e7382d342905d8c7959133457', 177, 1, 'AppName', '[]', 0, '2024-06-04 22:42:32', '2024-06-04 22:42:32', '2025-06-05 04:12:32'),
('26ccb3f78fe2ed083b991ab52fd6464e680dc121f4f6c0c16333041d997af424b78d715cdb99cbef', 112, 1, 'AppName', '[]', 0, '2024-06-04 22:51:24', '2024-06-04 22:51:24', '2025-06-05 04:21:24'),
('95c12f6d45c2e7bb9f9f6cf6d55206e0dad80508167f9fda1096695162b1ee4a9c6293bcd6e2f13a', 177, 1, 'AppName', '[]', 0, '2024-06-04 22:58:42', '2024-06-04 22:58:42', '2025-06-05 04:28:42'),
('d5be759dc271d310113b3a56eda886ae646b95079d4a6aea96eb59646722b0bc9a13c141986cf491', 162, 1, 'AppName', '[]', 0, '2024-06-04 22:59:12', '2024-06-04 22:59:12', '2025-06-05 04:29:12'),
('0c0ec058d59884bdbb7545f9ed1941d583b3e4fa2fc3c9a8801c7c84ebf027db1f506b9c8fc18533', 112, 1, 'AppName', '[]', 0, '2024-06-04 22:59:16', '2024-06-04 22:59:16', '2025-06-05 04:29:16'),
('d97d5bfd676facfb628af32f0dce00693b7299d492994a606a1c89357e074d68a7a8db49e4341e91', 112, 1, 'AppName', '[]', 0, '2024-06-04 23:09:20', '2024-06-04 23:09:20', '2025-06-05 04:39:20'),
('58218e9ce4b5d75c7cb1a58a723a6645ce3c7b664ee3ee3158f442de6b4a953526d42dabba9364d8', 177, 1, 'AppName', '[]', 0, '2024-06-04 23:10:02', '2024-06-04 23:10:02', '2025-06-05 04:40:02'),
('0eed6ff5cb8830cac9292af181fdc0da70f35f077e333e071706164bcdc2f7f8b7ac1e9e61815dec', 112, 1, 'AppName', '[]', 0, '2024-06-04 23:29:58', '2024-06-04 23:29:58', '2025-06-05 04:59:58'),
('3a8e9703937d8582d4f53ad6e8247c32a4ec6f40cc548607b8e403762b2083ff08dc685d36c1bb4b', 179, 1, 'AppName', '[]', 0, '2024-06-04 23:32:45', '2024-06-04 23:32:45', '2025-06-05 05:02:45'),
('0e1afaf429d492c3568c02bc4c7863206f548df5da6a8c7163f790570f76339b3725f9b089faf058', 177, 1, 'AppName', '[]', 0, '2024-06-04 23:33:06', '2024-06-04 23:33:06', '2025-06-05 05:03:06'),
('be5a5e3b344a930bbe1ff4f898e1869b3b4821015bc2c3e81dec852df40c6e629d30b328c955ca72', 112, 1, 'AppName', '[]', 0, '2024-06-04 23:34:10', '2024-06-04 23:34:10', '2025-06-05 05:04:10'),
('cafb94141d0e0a0378971b2c4861b2cbd22e0df8243d8aa06cc6a01672d34baf51c966ca62cd9b58', 179, 1, 'AppName', '[]', 0, '2024-06-04 23:35:57', '2024-06-04 23:35:57', '2025-06-05 05:05:57'),
('8f1cdc146ed2c0e89831c50bbbbaa2165a7a05f2a46f8bcf463868da050e7e8fe8d6db464da8a4a0', 177, 1, 'AppName', '[]', 0, '2024-06-04 23:36:41', '2024-06-04 23:36:41', '2025-06-05 05:06:41'),
('5e8d44cd58912210078c64aceec6c76cb6db8965eea3494f79dff99a9699ee05e3e5c96582679794', 112, 1, 'AppName', '[]', 0, '2024-06-04 23:43:48', '2024-06-04 23:43:48', '2025-06-05 05:13:48'),
('c1ff65a3ea40f8c9440d7f7711cfb9e19a08f643b0e902bcfe3b15129e779aeb999381b4b682b07a', 179, 1, 'AppName', '[]', 0, '2024-06-05 00:01:54', '2024-06-05 00:01:54', '2025-06-05 05:31:54'),
('208713cf5d68c13b10a1f941834de452c487ce65d3b0f59c1c046a5133c497cc2f8739bed6b3469a', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:07:51', '2024-06-05 00:07:51', '2025-06-05 05:37:51'),
('ce4a27323b940bd5428b4162c046d68360e4626540714d5d763ff0a7337ed3d6460f91c71022bcb0', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:11:33', '2024-06-05 00:11:33', '2025-06-05 05:41:33'),
('3ddea0f23d68ac83838d69334668fed45ae6cfc4263422d0461a4dd73064accab273e7cf2e01bc6c', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:19:08', '2024-06-05 00:19:08', '2025-06-05 05:49:08'),
('f04e632586046d1809377eb657c98b1d4a89cb45227f93b3f51f528fde4721ad0ed3809432729aac', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:19:49', '2024-06-05 00:19:49', '2025-06-05 05:49:49'),
('77051a841b1bae9f89f8eab8f9a510494ad1e14943fff6f01823d08f06ed48a4e7d668f5eaf74a83', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:20:01', '2024-06-05 00:20:01', '2025-06-05 05:50:01'),
('355ee34e57755684226712ae2fe9ef53189267985eb5f64e19c2fe8390d6ca9140bfcf5ec107f7d9', 179, 1, 'AppName', '[]', 0, '2024-06-05 00:20:46', '2024-06-05 00:20:46', '2025-06-05 05:50:46'),
('c9dd2b70d146a6874b592accc1e47e8201ed20e34d2c0d8fc0df7d3362c964957130d6238eabe716', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:27:13', '2024-06-05 00:27:13', '2025-06-05 05:57:13'),
('4e0e7a28fc8b4a6c19d09d5ea3631ff4fdee0bca1858d165f8165da252b93d5629634a65b7678a57', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:32:28', '2024-06-05 00:32:28', '2025-06-05 06:02:28'),
('ca30ca355696c1440331b44dca8b62e40065652443cea47f225aee09cde6a21612b54c889b28d95d', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:36:45', '2024-06-05 00:36:45', '2025-06-05 06:06:45'),
('2d04eb5c79cf936ee9c6d72ed0663904c796e3b5363901375830dcff6499ffbb947bef6a682b0113', 112, 1, 'AppName', '[]', 0, '2024-06-05 00:43:24', '2024-06-05 00:43:24', '2025-06-05 06:13:24'),
('ad52e18b87ad00bcb879d0fdcb947aa3a804add24ac2e62e0ccd18a897c76ad1e6238cf69a6e4f3c', 112, 1, 'AppName', '[]', 0, '2024-06-05 01:14:22', '2024-06-05 01:14:22', '2025-06-05 06:44:22'),
('af623ebd193f0e29d3bef6ee7341ec5508ceba6212c51a0193f0dce51abb0885c5b6ee4366082337', 112, 1, 'AppName', '[]', 0, '2024-06-05 01:18:16', '2024-06-05 01:18:16', '2025-06-05 06:48:16'),
('70000b24bf7bdcf9ba1eee54b6ffa3defebb16136c4c56f7ffff2f46a16f499ce62d3a26123b20c9', 112, 1, 'AppName', '[]', 0, '2024-06-05 01:46:57', '2024-06-05 01:46:57', '2025-06-05 07:16:57'),
('bbf5274c26f1b42c7ba3e17e07c362c6e4fec950137e37f6722970960f823f826b89eeefabcf986a', 112, 1, 'AppName', '[]', 0, '2024-06-05 01:59:42', '2024-06-05 01:59:42', '2025-06-05 07:29:42'),
('15562d2e19e891e0e0bfc303fe62be89381e0b2b0aa9f1bf152f76a76469eec63b1654edf3534117', 112, 1, 'AppName', '[]', 0, '2024-06-05 02:00:56', '2024-06-05 02:00:56', '2025-06-05 07:30:56'),
('cc416cb5d99d9372ad0e7e18da1fb9f84cfc2cb96a72d92a3ce1c343892bea086dc1e54dc094b565', 112, 1, 'AppName', '[]', 0, '2024-06-05 02:03:04', '2024-06-05 02:03:04', '2025-06-05 07:33:04'),
('ea8f2b7afc89956aa82280ab9d63fb283caf07b72aea544aba6e6df4c84f071bd4ecabe094f47ef1', 112, 1, 'AppName', '[]', 0, '2024-06-05 03:13:02', '2024-06-05 03:13:02', '2025-06-05 08:43:02'),
('4f829c898572ff0d474a53009450baa0efcb959dae8bba343593fcf0fb59141024eb7f2abc4da7f0', 112, 1, 'AppName', '[]', 0, '2024-06-05 03:39:18', '2024-06-05 03:39:18', '2025-06-05 09:09:18'),
('5c51f853679601eabd58483d21985e5e047babf73dab14b3a9746916a56ad7317ad0fb5869f34ff4', 112, 1, 'AppName', '[]', 0, '2024-06-05 04:01:30', '2024-06-05 04:01:30', '2025-06-05 09:31:30'),
('7b6224f68b737d6717f843aced47cdcafe16a9269d14ab44e0ce26e8f7baab35ddd90583616a721f', 112, 1, 'AppName', '[]', 0, '2024-06-05 04:11:39', '2024-06-05 04:11:39', '2025-06-05 09:41:39'),
('c7a00997a0afe85f73cc667e303c9a51c90cf407ae153b007ec4b377c60a85e90d1a8ae688abdd6f', 112, 1, 'AppName', '[]', 0, '2024-06-05 04:17:55', '2024-06-05 04:17:55', '2025-06-05 09:47:55'),
('2be3be9d45754d10884f111a998a52ffea369e27ee93dd0810f7e63740d3408fc7fa47fb177b5f72', 177, 1, 'AppName', '[]', 0, '2024-06-05 04:27:09', '2024-06-05 04:27:09', '2025-06-05 09:57:09'),
('e46e0a0233809c13f1129e642270ae6c36d208f669e590163b8704e38eb0f1117551d858039abe23', 179, 1, 'AppName', '[]', 0, '2024-06-05 04:29:34', '2024-06-05 04:29:34', '2025-06-05 09:59:34'),
('55a9dcc18e559196af988b193a213098cbe2ccabe0800ff028d82a33eedc8afb2f4e4d4f0de60574', 179, 1, 'AppName', '[]', 0, '2024-06-05 04:29:47', '2024-06-05 04:29:47', '2025-06-05 09:59:47'),
('135006ae34cb422f3045b1ddff46d39a23fe9254c7e97d576b0706e7925488b76252f35f54bd2b23', 179, 1, 'AppName', '[]', 0, '2024-06-05 05:31:07', '2024-06-05 05:31:07', '2025-06-05 11:01:07'),
('bf95a32e94b3fdfd809d7cf2d79ef1d4a360a9652108a8bab0378c06a74cb13da7ba48671bfdce22', 179, 1, 'AppName', '[]', 0, '2024-06-05 05:40:35', '2024-06-05 05:40:35', '2025-06-05 11:10:35'),
('de7bde7dcdf329e1c6389bb10af64e521e73a33107d756b823b6f03b300b60d97fd6ff3b9bee2f3c', 179, 1, 'AppName', '[]', 0, '2024-06-05 06:32:02', '2024-06-05 06:32:02', '2025-06-05 12:02:02'),
('1f32901890b49d3ce271e1f8e95fcf4e9c4771ef7e2eba9d2f079111f64af4067e13cd3603385f71', 179, 1, 'AppName', '[]', 0, '2024-06-05 06:41:50', '2024-06-05 06:41:50', '2025-06-05 12:11:50'),
('d2df897da4f3d4d5deccfd7466437c07b0c0628f20cc7725c9f6679092ce4cb7f23242f3988e190c', 179, 1, 'AppName', '[]', 0, '2024-06-05 06:49:04', '2024-06-05 06:49:04', '2025-06-05 12:19:04'),
('5e21cc7d275461265b1f84de41f15cd3ae40e0691ef14808e29eb09fb1e3c768c99e152d34755d6c', 177, 1, 'AppName', '[]', 0, '2024-06-05 10:28:00', '2024-06-05 10:28:00', '2025-06-05 15:58:00'),
('90749e37b9bf2f7e3ebaddaff65474aa39ecdac3f1971480d07932c0062259f6b80c76544861cb96', 177, 1, 'AppName', '[]', 0, '2024-06-05 17:24:14', '2024-06-05 17:24:14', '2025-06-05 22:54:14'),
('bfa04b23cbbf1f643ccb163a936bbb1698f5e116da29fde8043f9bec512c34cd3a0c65c901ed6fe5', 177, 1, 'AppName', '[]', 0, '2024-06-05 17:51:59', '2024-06-05 17:51:59', '2025-06-05 23:21:59'),
('d5843bbc114ba1e5593102436871303a324946b6b9d9ce7beaab49e458968f69579d2ff4bdc182e1', 177, 1, 'AppName', '[]', 0, '2024-06-05 18:08:26', '2024-06-05 18:08:26', '2025-06-05 23:38:26'),
('dc8df1b7745a62a3b0de44ae5139289bea8f1420a180abb68eabd74f0903f0c918924742e3b0ada9', 177, 1, 'AppName', '[]', 0, '2024-06-05 18:15:50', '2024-06-05 18:15:50', '2025-06-05 23:45:50'),
('aaba79572b21df4c7d5a78fd37115d656b88c50899bdffa242f211da08bf4ca25a849e3a7279e4fd', 177, 1, 'AppName', '[]', 0, '2024-06-05 18:55:00', '2024-06-05 18:55:00', '2025-06-06 00:25:00'),
('32081d2db508b59703e0c58ba17866150a04e63b423d3e4a77bbd67b341a238316973df2054d4acd', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:04:10', '2024-06-05 19:04:10', '2025-06-06 00:34:10'),
('85cc084b25147a333d8e4a027e259bca232c3c67ddca49cd0a57b6162e435db9eaa69d73d83868f4', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:04:27', '2024-06-05 19:04:27', '2025-06-06 00:34:27'),
('79cfdd168731e4f2908838dd9783b57599742dc626f7a502268bd63705210175ea83bf212f922575', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:13:02', '2024-06-05 19:13:02', '2025-06-06 00:43:02'),
('3fc7e2cc306dad268409866146968302008726e1db41b8846a33be132bf1b4801694f065e2bb733b', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:18:29', '2024-06-05 19:18:29', '2025-06-06 00:48:29'),
('52920ee6e101d8a48a54d794c7ddcb57f63839f8f4ff49138a6d5d18e974a5940dacf41c6d9d7645', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:18:47', '2024-06-05 19:18:47', '2025-06-06 00:48:47'),
('4f083ae3c639d413bb4135c3109f7c6cbef676fda13a61efa68d2169204d26d6dceb90e9c63483a7', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:22:16', '2024-06-05 19:22:16', '2025-06-06 00:52:16'),
('88b96abd17d5d6c71c3e6c6a11325c779721ddcbd9f3dde392e93df819176dc743a30ea216c8fa1e', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:22:28', '2024-06-05 19:22:28', '2025-06-06 00:52:28'),
('80b47200cfee60b2f070d66a6534483bf87626bffa43816ac490467ec9d287d571cc5917f7b32a8e', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:22:39', '2024-06-05 19:22:39', '2025-06-06 00:52:39'),
('03c2d0866ae29241142f8cc9ded878fa01f344c554f6070fa00e2b2bca6e042cdabb98e778b053a2', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:29:53', '2024-06-05 19:29:53', '2025-06-06 00:59:53'),
('54512d5c45363e840279d9c93445739305ca9e034007020b70f8a1fbf909afb1b9df29e0c6898758', 177, 1, 'AppName', '[]', 0, '2024-06-05 19:42:19', '2024-06-05 19:42:19', '2025-06-06 01:12:19'),
('bb819cf0a2648abea8fd3f051dde53f307543c5703d3e596ca53fcd7465bd9fcd17eb38f6ae481ab', 177, 1, 'AppName', '[]', 0, '2024-06-05 20:09:12', '2024-06-05 20:09:12', '2025-06-06 01:39:12'),
('24819f994ad5dd465add5c66d1d107857992964f0dd745c242079ba33cd6ceec578bdfe324217c09', 177, 1, 'AppName', '[]', 0, '2024-06-05 20:11:34', '2024-06-05 20:11:34', '2025-06-06 01:41:34'),
('3c4cda7d466f56735980be65271b6b84b7ae0f4dfb19ef9c8b5e9211391335a0bd1ac2f3082c3b81', 177, 1, 'AppName', '[]', 0, '2024-06-05 20:23:03', '2024-06-05 20:23:03', '2025-06-06 01:53:03'),
('564a5b565431d6617f94f8c3042933e23e4fb95dafe0777fe7c3c5cc3a70c2d7c35d30a5a04d7329', 177, 1, 'AppName', '[]', 0, '2024-06-05 20:24:31', '2024-06-05 20:24:32', '2025-06-06 01:54:31'),
('6a5b577c4dfc02c544fd7d3f5eac402bb2d94c460a448e3900de8737e1fa7ce7f4f5e532bea82d62', 177, 1, 'AppName', '[]', 0, '2024-06-05 22:10:35', '2024-06-05 22:10:35', '2025-06-06 03:40:35'),
('2264fe34e6c9951a642347a4d991fa11ab7d474b2898c92fa165ef8ac7918b11d15b2a1fb36f7c2c', 177, 1, 'AppName', '[]', 0, '2024-06-05 22:19:30', '2024-06-05 22:19:30', '2025-06-06 03:49:30'),
('21236d78c34cf581c874b4de8e59f4740af40cbab5a33b4326d64daa78d4e058e6ae265bfd764035', 177, 1, 'AppName', '[]', 0, '2024-06-05 22:36:32', '2024-06-05 22:36:32', '2025-06-06 04:06:32'),
('62d4aad14cd7f8f194e4d3503cff595395004517a6df2b4460626efd1489820c5b608a006d38215d', 177, 1, 'AppName', '[]', 0, '2024-06-05 22:44:40', '2024-06-05 22:44:40', '2025-06-06 04:14:40'),
('c1151c065d562f7334f35c7b9775799f7880d63ae768c643259270f392ad136a636e99107fdd81c1', 179, 1, 'AppName', '[]', 0, '2024-06-05 22:47:26', '2024-06-05 22:47:26', '2025-06-06 04:17:26'),
('d9157a07f264fe24dc20b16774dd9e49eafb6fe066019916c7e8654f0c4b82816ce756736126f9c8', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:01:40', '2024-06-05 23:01:40', '2025-06-06 04:31:40'),
('50566832be31cdfd1669a9ef2597649765264a7de5961ab9685f705864465cf9110e757c52baeb4c', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:06:49', '2024-06-05 23:06:49', '2025-06-06 04:36:49'),
('73119963ed35b2e32053cabc3d7438065f33db84c3680f23867eaba261d4faf8d6b149c641cad8f9', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:31:36', '2024-06-05 23:31:36', '2025-06-06 05:01:36'),
('6560ce928b64627637ee3206d481aa2dcb13d583f312595bb33604cb807138965bf1acc2cc2819c5', 158, 1, 'AppName', '[]', 0, '2024-06-05 23:39:44', '2024-06-05 23:39:44', '2025-06-06 05:09:44'),
('365d2d6a0909c339f8c4611a2def2a61f4b426b3a82b44356998702d279e0e917d580423dc27540e', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:48:14', '2024-06-05 23:48:14', '2025-06-06 05:18:14'),
('b0c869895093c813bc09abd6ae18c996bebdaa7a6857c17785adce40c911f80602aadadf95d3e3ca', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:55:11', '2024-06-05 23:55:11', '2025-06-06 05:25:11'),
('1f0a69528ebc3d285f554e64e0fe5af4fbd7860ca678f8e5a00b9326cdcf73611409f8b528ce9069', 177, 1, 'AppName', '[]', 0, '2024-06-05 23:55:37', '2024-06-05 23:55:37', '2025-06-06 05:25:37'),
('a2f44b82941fe25bc1317d123026569435c1b6c4d4a473a019245abc452ce7c69f28805940c2c8d3', 113, 1, 'AppName', '[]', 0, '2024-06-06 00:08:10', '2024-06-06 00:08:10', '2025-06-06 05:38:10'),
('b897e264a7afc346c37e07bf8f4f8897d9631c7e03d6cad49064b4903a906aa03e593929836ffd64', 177, 1, 'AppName', '[]', 0, '2024-06-06 03:25:00', '2024-06-06 03:25:00', '2025-06-06 08:55:00'),
('9046cc99140b87e13cd10d506ee10abb331f563dbfd56ba46188f7f77fd2ceda9caead8cb92747be', 177, 1, 'AppName', '[]', 0, '2024-06-06 04:28:15', '2024-06-06 04:28:15', '2025-06-06 09:58:15'),
('809b7b1a4776008f29f737599b44a749f431225d8214ce877ac1cd16a5c29af25730265f1aada09e', 168, 1, 'AppName', '[]', 0, '2024-06-06 04:48:16', '2024-06-06 04:48:16', '2025-06-06 10:18:16'),
('b9f683be8e1e1f6e70be83526c27ea5df7d71479e9d4bc06229e5cc6677fc92e3a406f96281bfa39', 168, 1, 'AppName', '[]', 0, '2024-06-06 04:52:59', '2024-06-06 04:52:59', '2025-06-06 10:22:59'),
('120415e071d0a35d0e9d2e8a6dae3c724490c8ebe8ec2a382cfec14b8b70aa5a37216dbe2394b04e', 177, 1, 'AppName', '[]', 0, '2024-06-06 04:53:44', '2024-06-06 04:53:44', '2025-06-06 10:23:44'),
('0def39c0451c15e6735f3f86fb7d9064c95a52575c011fe1a7987d40ce225af5603d76f9b3ad50e0', 168, 1, 'AppName', '[]', 0, '2024-06-06 04:54:32', '2024-06-06 04:54:32', '2025-06-06 10:24:32'),
('8b5fbc398dd6b0eb297d9d79a8d3cc6ad00f610833425d9f37e991cc5daac64fee0fd0c0eab9a3d9', 177, 1, 'AppName', '[]', 0, '2024-06-06 05:08:01', '2024-06-06 05:08:01', '2025-06-06 10:38:01'),
('4bbac807d3f7d38adbc022965a8809cf5b143c6a3be20474994841d296f00c4d9be58db5c2797e4e', 168, 1, 'AppName', '[]', 0, '2024-06-06 05:12:06', '2024-06-06 05:12:06', '2025-06-06 10:42:06'),
('ad5ea348666cca6409c9aa3daccbb9c4cbe96d7ac3cfae6f008d438240bc49f85e11f3698f3699f1', 168, 1, 'AppName', '[]', 0, '2024-06-06 06:10:18', '2024-06-06 06:10:18', '2025-06-06 11:40:18'),
('83290c14de2fa590105b6053fb34e5fc650c87f03556042c98f9a338d2cfd680360d5eda3fecfd58', 168, 1, 'AppName', '[]', 0, '2024-06-06 06:21:58', '2024-06-06 06:21:58', '2025-06-06 11:51:58'),
('d5b53edce73fbcf5aa20291a981a5767c3a712b5d6b93dad6acb86a28b8005b421a90fcb6f00991e', 163, 1, 'AppName', '[]', 0, '2024-06-06 06:43:03', '2024-06-06 06:43:03', '2025-06-06 12:13:03'),
('bfc51f92deb0231d67afc4e25623a2754441d22b019da1660cb4f96c655799691449dd8b059367d5', 163, 1, 'AppName', '[]', 0, '2024-06-06 06:44:04', '2024-06-06 06:44:05', '2025-06-06 12:14:04'),
('3c5aab8f0a3ada2a03dbf3d6ba4c3ffaa75a9157d31e50c4e29bb295020b5cfe58002747c75b7221', 163, 1, 'AppName', '[]', 0, '2024-06-06 06:45:16', '2024-06-06 06:45:16', '2025-06-06 12:15:16'),
('606c2138cc1e268a0f7d8dabf8b05e0361fdbd84cd431239dd0e948124e05fd05b1749baf0a01121', 154, 1, 'AppName', '[]', 0, '2024-06-06 06:54:34', '2024-06-06 06:54:34', '2025-06-06 12:24:34'),
('f22ed2577e7c5b0ee52fea0e3e1960d00d9743328ca8e866b991655d1307d75607b5c0ace7a043de', 154, 1, 'AppName', '[]', 0, '2024-06-06 06:55:47', '2024-06-06 06:55:47', '2025-06-06 12:25:47'),
('7d4f5b704269e7f3b70f29a3ffe22c19413aa456adf05ae26f682ddf6ed3a104d326dc235d360c21', 154, 1, 'AppName', '[]', 0, '2024-06-06 06:56:10', '2024-06-06 06:56:10', '2025-06-06 12:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'v5gj39jzH4IdwkpvNF3CBdZfALqMHtSlaqrq4U0b', NULL, 'http://localhost', 1, 0, 0, '2024-03-22 04:28:29', '2024-03-22 04:28:29'),
(2, NULL, 'Laravel Password Grant Client', '2qtj8MS013mYUsBrwovFMR9tglfRzWSdlnmcIGLl', 'users', 'http://localhost', 0, 1, 0, '2024-03-22 04:28:29', '2024-03-22 04:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-03-22 04:28:29', '2024-03-22 04:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_offer_rule`
--

CREATE TABLE `ref_offer_rule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_offer_tc`
--

CREATE TABLE `ref_offer_tc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('evYAS3N0JwXfvPMdesxh0w2HUkVtKEUjJrhRWIT1', 50, '152.58.214.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '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', 1717677694),
('MkVRjnKWGnprqWDS5LORKlwx8GLyiEEZ7sSMdztP', NULL, '49.37.234.235', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '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', 1717676908),
('3nWWMdpjEMCQ8P1ipogu3e629U1cyY1BHbhMsjBB', NULL, '106.205.160.166', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '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', 1717677088);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6w2MpanCc1MVptyksKbZY2Km6IIj7pzR8uYyKc2i', 50, '49.37.234.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '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', 1717676150),
('jstUrEG7PMjXYQqyPyjczrjYUcbtvuPGSjtZe1bC', 169, '49.37.234.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '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', 1717676629);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `address` text DEFAULT NULL,
  `coordinates` varchar(100) DEFAULT NULL,
  `email_1` varchar(50) DEFAULT NULL,
  `email_2` varchar(50) DEFAULT NULL,
  `phone_1` varchar(20) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `location`, `active`, `address`, `coordinates`, `email_1`, `email_2`, `phone_1`, `phone_2`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1000, 'Pittapilly Store', 'Angamaly', 1, 'zxzxzx', 'Pittappillil Agencies Angamaly', 'myg@gmail.com', NULL, '+617852952078', NULL, '2024-04-23 11:00:04', '2024-06-06 11:24:53', NULL),
(1001, 'Sharavanas', 'Angamaly', 1, 'ddff', 'Hotel Saravana Bhavan Puthuyakavu', 'dfdddfd@gmail.com', NULL, '+213777777236', '+263888777999', '2024-04-23 06:25:33', '2024-05-31 07:22:22', NULL),
(1002, 'gfgf', 'gfgfgfgfg', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 06:31:36', '2024-04-23 06:36:37', '2024-04-23 06:36:37'),
(1003, 'dfdffdfdf3434434', '3rrerer', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 09:38:58', '2024-04-25 09:39:17', '2024-04-25 09:39:17'),
(1004, 'Myg', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 09:31:36', '2024-05-15 04:28:04', '2024-05-15 04:28:04'),
(1005, 'lulu mall', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-09 09:32:45', '2024-05-15 04:28:09', '2024-05-15 04:28:09'),
(1006, 'Oberon mall', 'Kochi', 1, '34, 195 Road, NH Bye Pass, Padivattom, Edappally, Ernakulam, Kochi, Kerala 682024', 'Oberon Mall', 'oberon@sales.com', NULL, '7744118855', NULL, '2024-05-15 04:14:14', '2024-05-15 09:13:18', NULL),
(1007, 'Forum mall', 'Maradu', 1, 'NH-66, Vyttila, Aroor Bypass, near to Kundanoor, Maradu, Kochi, Kerala 682304', 'test', 'forum@sales.org', NULL, '8855228855', NULL, '2024-05-15 04:15:25', '2024-05-15 04:16:01', '2024-05-15 04:16:01'),
(1008, 'Forum mall', 'Maradu', 1, 'NH-66, Vyttila, Aroor Bypass, near to Kundanoor, Maradu, Kochi, Kerala 682304', 'Forum mall', 'forum@sales.org', NULL, '8877887788', NULL, '2024-05-15 04:20:15', '2024-05-15 09:13:29', NULL),
(1009, 'kjnjn', 'jnjin', 1, 'kjnkjn', 'hughugyu', 'jnjn@gmail.com', NULL, '7898745898', NULL, '2024-05-15 07:38:34', '2024-05-15 07:38:43', '2024-05-15 07:38:43'),
(1010, 'ddaa', 'sdsdsd', 1, 'abc', '321323', 'myg@gmail.com', NULL, '+914342434342', NULL, '2024-05-17 09:57:18', '2024-05-21 10:03:51', '2024-05-21 10:03:51'),
(1011, 'Smart Bazar', 'Kochi', 1, 'VKS Arcade, Edappally - Pukkattupady Rd, Thykkavu, Edappally, Ernakulam, Kerala 682021', 'ubaid', 'smart@sales.co.in', NULL, '98562', '78965', '2024-05-21 09:58:26', '2024-05-21 09:58:59', NULL),
(1012, 'FBB', 'Kochi', 1, 'one mall Shastri Nagar, Maradu, Kochi, Ernakulam, Kerala 682304', 'Jhon', 'nucleus@sales.co.in', NULL, '+919587451258', '+213784598745', '2024-05-21 10:01:20', '2024-06-03 06:48:32', NULL),
(1013, 'jgi', 'jg', 1, 'jdffgn', 'dfiuhgu', 'dfjg@gmail.com', NULL, '+61656546548', NULL, '2024-05-21 10:05:02', '2024-05-21 10:05:40', '2024-05-21 10:05:40'),
(1014, 'A to Z', 'India', 1, 'A to Z', 'Kochi', 'test123@gmail.com', NULL, '+919497765879', '+919497765879', '2024-06-03 06:22:25', '2024-06-06 07:25:13', '2024-06-06 07:25:13'),
(1015, 'Al baik', 'Al-Balad', 1, 'Jeddah - 2775 King Abdulaziz District Al-Balad', 'xyz', 'albaik@foods.co.in', NULL, '+966789025698', '+966789025888', '2024-06-03 07:14:36', '2024-06-03 07:17:10', NULL),
(1016, 'Yes Yes Indian Supermarket', 'Tarneit', 1, 'Tarneit Central Shopping Centre\r\nShop 2A/540 Derrimut Road\r\nTarneit VIC 3029, Australia', '5M7R+5F Tarneit, Victoria, Australia', 'hari@agatebc.com', NULL, '+618590960219', NULL, '2024-06-03 09:21:38', '2024-06-03 09:21:38', NULL),
(1017, 'Yes Yes Indian Super Market', 'Australia', 1, 'Australia', '867816,54', 'contact@sales.org', 'contact@saupport.org', '+543258965588', '+543258965588', '2024-06-06 10:02:06', '2024-06-06 10:02:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_offers`
--

CREATE TABLE `store_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `offer_code` varchar(6) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `offer_rule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`offer_rule`)),
  `offer_tc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`offer_tc`)),
  `min_inv_amt` decimal(10,2) DEFAULT NULL COMMENT 'minimum invoice amount needed. Not applicable if null',
  `max_inv_amt` decimal(10,2) DEFAULT NULL COMMENT 'Maximun discound amount avail by one user',
  `points` int(11) DEFAULT NULL COMMENT 'points required for offer',
  `discount` decimal(10,2) DEFAULT NULL,
  `type` enum('Percentage','Amount') DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `expiry_start` datetime DEFAULT NULL,
  `expiry_end` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_offers`
--

INSERT INTO `store_offers` (`id`, `name`, `comments`, `branch_id`, `offer_code`, `slug`, `offer_rule`, `offer_tc`, `min_inv_amt`, `max_inv_amt`, `points`, `discount`, `type`, `usage_limit`, `expiry_start`, `expiry_end`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Flat 50%', 'On every purchase of 1000', 1000, NULL, 'flat-50', NULL, NULL, 2000.00, 10000.00, 5, 10.00, 'Percentage', 2, '2023-12-20 00:00:00', '2023-12-20 00:00:00', 0, '2024-04-23 14:25:22', '2024-06-01 06:07:52', NULL),
(9, 'Flat 20% Offer', 'Hurry up Guys', 1001, 'J22ERH', 'flat-20-offer', NULL, NULL, NULL, NULL, NULL, 0.00, 'Percentage', 1, NULL, NULL, 1, NULL, NULL, NULL),
(12, 'Flat 100%', 'Hurrry Up', 1000, '7QZQWC', 'flat-100', NULL, NULL, 1000.00, 10000.00, 20, 10.00, 'Percentage', 2, '2024-04-23 00:00:00', '2024-04-30 00:00:00', 1, '2024-04-25 10:12:35', '2024-04-25 10:25:58', NULL),
(13, 'Rishikesh', 'dsfdf', 1006, 'XR5M53', 'rishikesh', NULL, NULL, 323.00, NULL, 21, 123.00, 'Amount', NULL, '2024-05-18 00:00:00', '2024-05-28 00:00:00', 1, '2024-05-17 09:53:46', '2024-05-17 09:53:46', NULL),
(14, 'Rishikesh', 'jhkn', 1001, 'OYQONG', 'rishikesh', NULL, NULL, 323.00, NULL, 21, 123.00, 'Amount', NULL, '2024-04-20 00:00:00', '2024-04-30 00:00:00', 1, '2024-05-17 09:53:46', '2024-05-22 09:15:09', NULL),
(15, 'Rishikesh', 'dsfdf', 1000, 'WV0CMM', 'rishikesh', NULL, NULL, 323.00, NULL, 21, 123.00, 'Amount', NULL, '2024-05-18 00:00:00', '2024-05-28 00:00:00', 1, '2024-05-17 09:53:46', '2024-05-17 09:53:46', NULL),
(16, 'Rishikeshdsd', 'rrrewsdsdsd', 1006, 'GY8MXV', 'rishikesh', NULL, NULL, 2323.00, 32.00, 23, 34.00, 'Amount', NULL, '2024-04-20 00:00:00', NULL, 1, '2024-05-17 09:54:48', '2024-05-17 09:55:31', NULL),
(17, 'Rishikesh', 'rrrew', 1000, '0QZNW5', 'rishikesh', NULL, NULL, 2323.00, 32.00, 23, 34.00, 'Amount', NULL, '2024-05-29 00:00:00', NULL, 1, '2024-05-17 09:54:48', '2024-05-17 09:54:48', NULL),
(18, 'monsoon sale', 'Its sale', 1012, 'CLZS36', 'monsoon-sale', NULL, NULL, 2000.00, 1000.00, 20, 50.00, 'Percentage', 2, '2024-04-20 00:00:00', '2024-04-20 00:00:00', 0, '2024-05-21 11:42:11', '2024-06-06 09:58:44', NULL),
(19, 'shirin', 'sale', 1012, '4ASFOE', 'shirin', NULL, NULL, 1000.00, NULL, 50, 50.00, 'Percentage', NULL, '2024-05-23 00:00:00', NULL, 1, '2024-05-22 09:11:19', '2024-05-22 09:11:19', NULL),
(20, 'offer sale', 'FBB offer sale', 1012, '2KIMNJ', 'offer-sale', NULL, NULL, 1000.00, 1000.00, 100, 500.00, 'Percentage', 2, '2024-06-01 00:00:00', '2024-06-03 00:00:00', 1, '2024-05-31 11:51:55', '2024-05-31 11:51:55', NULL),
(21, '70% off', 'Hurry up', 1000, 'UNW5HQ', '70-off', NULL, NULL, 2000.00, NULL, 3, 2.00, 'Percentage', NULL, '2024-06-01 00:00:00', '2024-06-16 00:00:00', 1, '2024-06-01 06:20:40', '2024-06-01 06:20:40', NULL),
(22, '50% off', '50% off', 1014, '2F6OHI', '50-off', NULL, NULL, 1000.00, NULL, 1, 10.00, 'Percentage', NULL, '2024-05-28 00:00:00', '2024-05-27 00:00:00', 1, '2024-06-03 06:27:27', '2024-06-03 06:27:27', NULL),
(23, 'winner winner chicken dinner :)', 'grab urs now.....', 1015, '6QYHOD', 'winner-winner-chicken-dinner-', NULL, NULL, 1000.00, 998.00, 50, 1000.00, 'Percentage', 2, '2024-06-03 00:00:00', '2024-06-05 00:00:00', 1, '2024-06-04 06:56:24', '2024-06-04 06:56:24', NULL),
(24, 'big baik days', 'june 04', 1015, 'QKUJT2', 'big-baik-days', NULL, NULL, 1000.00, 999.00, 50, 1000.00, 'Percentage', 2, '2024-06-05 00:00:00', '2024-06-05 00:00:00', 1, '2024-06-04 06:59:24', '2024-06-04 06:59:24', NULL),
(25, '50% off', 'Hurry up', 1015, 'MKIVFD', '50-off', NULL, NULL, 2000.00, NULL, 1, 1.00, 'Percentage', NULL, '2024-05-28 00:00:00', '2024-05-29 00:00:00', 1, '2024-06-06 08:59:48', '2024-06-06 08:59:48', NULL),
(26, '50% off', 'Hurry up', 1000, '2WCC22', '50-off', NULL, NULL, 1000.00, NULL, 1, 1.00, 'Percentage', NULL, '2024-06-06 00:00:00', NULL, 1, '2024-06-06 11:27:45', '2024-06-06 11:32:08', '2024-06-06 11:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 5 COMMENT '1.Super Admin 2.Admin 3.Branch manager 4.cashier\r\n5.Users',
  `password` varchar(191) NOT NULL,
  `branch` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wallet_used` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wallet_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `mode` enum('light','dark') DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `customer_id`, `name`, `email`, `phone`, `image`, `role_id`, `password`, `branch`, `wallet_total`, `wallet_used`, `wallet_balance`, `email_verified_at`, `remember_token`, `mode`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 510035, 'Jayakrishnan', 'ceo@cyberfort.co.in', NULL, NULL, 2, '$2y$12$00vfcUsiOVQAXKHJy6fiiOfhY3KE4GJ5GhE6DfvPOGBmt/J6iBPvu', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, 510037, 'Jayakrishnan', 'ceo1@cyberfort.co.in', NULL, NULL, 2, '$2y$12$d397TypuxUSwZe4l5FgTgOgg4YoH3AWnfrPY6T.9vg9EMUhUSV0hi', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(5, 510040, 'Rishikesh P S', 'rishikesh111@gmail.com', NULL, NULL, 1, '$2y$12$yZL0fHAPMLkkzKYJn0xj5uPXe/YbzGU25DpSPd9X4FK3T5rEQ03va', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 0, NULL, '2024-04-25 05:24:06', '2024-04-25 05:24:06'),
(6, 510041, 'hhg', 'eee@gmail.com', NULL, NULL, 3, '$2y$12$cWPfBrTCVwsYS7E0XtkituXRbPjLynThyL1NSb1oJLla6DXoVPqlG', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, '2024-04-23 11:57:57', '2024-04-23 11:57:57'),
(7, 510042, 'Rishi', 'dsa', NULL, NULL, 2, '$2y$12$IN4oERpESjbR3YygXXm/OuanmDp5ydKQtW1NxnUr2/fBZGUAgu7Xy', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, '2024-04-25 05:24:11', '2024-04-25 05:24:11'),
(8, 510043, 'Rishi', 'rishi@gamil.com', NULL, NULL, 2, '$2y$12$ufv3ppYXc1valrdxf7KVZuThD9d4zygAXRvbbrxkv.q7XcNGsB9AG', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(9, 510044, 'Rishikesh', 'rishi@gmail.com', NULL, NULL, 2, '$2y$12$C1TM2eo75XNhiib1A1uba.cSgPXjAt8bkTp7nREyr9ZEhwHVGQ8By', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(10, 510045, 'Ajay', 'ajay@gmail.com', NULL, NULL, 3, '$2y$12$VykJ2aumGCZ2Wd/ml7nMkeS7V0vEZLQ1O8P6NiEYbwHiLTr3JWUzO', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(11, 510046, 'Adarsh', 'adarsh@gmail.com', NULL, NULL, 2, '$2y$12$KFtG1f/hjYUcLhe/Hyp8sups6bA1wBAe/1CoMuaLO7NKMpRPJH1LK', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(12, 510047, 'Appu', 'appu@gmail.com', '+355789522222', NULL, 3, '$2y$12$UTwnA2oaJAVih.eVXFHRruD9LNj3qV4OWdla9nrHKyNLWOLf3.m1y', 1001, 20.00, 0.00, 20.00, NULL, NULL, NULL, 1, NULL, '2024-06-03 06:38:21', NULL),
(13, 510048, 'Arun mohan', 'arun@gmail.com', NULL, NULL, 2, '$2y$12$mqYTJn2ZYcuzNqOqHhFhuOdN4PvLHn3FcyQyiKEombECmiFSzx9Dy', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, '2024-05-16 06:36:28', NULL),
(14, 510049, 'Abijith', 'abi@gmail.com', '9344521765', NULL, 2, '$2y$12$Ksmi.K/TQ0t9lTiXPQhQduhZR9zrSMHKAe.Wq0JoqB8fdwZmeAgiq', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, '2024-04-27 05:42:06', NULL),
(17, 510052, 'Varun', 'varun@gmail.com', '+61668784685', NULL, 2, '$2y$12$tJw3sy2cw/fkUciTt1GHh.QEMMxS1370ghOePDMfdPAfw9v5Kcl5O', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 0, NULL, '2024-06-01 06:08:24', NULL),
(18, 510053, 'Devika', 'devika@gmail.com', '9045567348', NULL, 2, '$2y$12$k/d4DbJ2JNFWYAfekgmZnOmZOmGD4AUR5YMq/sy.cvgaS3N3v4sci', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, NULL, '2024-04-25 15:48:58', NULL),
(19, 510054, 'Anamika', 'anu@gmail.com', '9745487425', NULL, 2, '$2y$12$vxZer293O.7VVKC0lr1/qe2VZT./gUwFZtHUn05W9Mas1waHuGMEO', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-04-27 11:13:26', '2024-04-27 05:43:26', NULL),
(20, 510055, 'Rishikesh', 'rishi11@gmail.com', '+61999888999', NULL, 3, '$2y$12$YdPB9ATdndcBx11h9uMWE.6CnLSZuKY8cepnE7YqdCYE7NlqpcrHG', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-04-27 11:19:58', '2024-05-21 09:01:08', NULL),
(21, 510056, 'Aksahy', 'aku@gmail.com', '7994233196', NULL, 5, '$2y$12$W5f94PNuCLbr6z1ZTEVlVuKIgcaiVBcGL22EVzzTrpElkZ50.aPuG', 1000, 51.00, 0.00, 51.00, NULL, NULL, NULL, 1, '2024-04-27 11:44:29', '2024-06-06 12:11:23', NULL),
(22, 510057, 'Test', 'Test@gmail.com', '+919258741758', 'testimonial-3.jpg', 5, '$2y$12$4FyD89BXy9aMay72wx8NpOhZC7wUXzaS0pYWvzMsoAem2eih5V46K', 1001, 15.00, 0.00, 15.00, NULL, NULL, NULL, 1, '2024-04-27 16:12:49', '2024-06-03 10:13:50', NULL),
(23, 510058, 'Akash', 'Akash@gmail.com', '+617845367802', NULL, 4, '$2y$12$UryACp/vzaJKjmqFQjQHAuqFCS6shdwL6UV7O91jWaE2SyXV9XhXS', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-04-27 16:45:17', '2024-05-31 10:02:58', NULL),
(24, 510059, 'Hari', 'hari@gmail.com', '9745487425', NULL, 1, '$2y$12$Fgryx5I8.95ZSu7OzSXYVe.WpSdCy.N4BYJ2gyCV02UWnEHhSraeO', NULL, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-04-27 17:10:46', '2024-05-13 18:12:21', NULL),
(25, 510060, 'Adeep', 'krishnan@gmail.com', '7994233194', 'testimonial-2.jpg', 5, '$2y$12$4MtwA/NVp4CYIh/2Svvwd..vzwGswtehVfD9WzNKMf6DH9yW3N8d2', 1005, 110.00, 20.00, 90.00, NULL, NULL, NULL, 0, '2024-04-29 10:21:24', '2024-05-31 09:46:25', NULL),
(26, 510061, 'Appu', 'appu1@gmail.com', '7994233190', NULL, 5, '$2y$12$c91bW1L9rLihmrm3v5cZ9OQToBGngoJ6f40R.RRxA.c.Fq1VRDZ5y', NULL, 9.00, 0.00, 9.00, NULL, NULL, NULL, 1, '2024-05-03 10:03:51', '2024-06-06 12:41:07', NULL),
(27, 510062, 'Appud', 'appu2@gmail.com', '7994233192', NULL, 5, '$2y$12$RRQetFA6Ml0B7M2z8L6ts.0Y8DGpZT1Z6rU02jcyKzS2wp3maDvTq', NULL, 18.00, 0.00, 18.00, NULL, NULL, NULL, 1, '2024-05-03 15:34:19', '2024-06-06 11:20:10', NULL),
(28, 510063, 'Subith', 'subith@gmail.com', '8848055651', NULL, 5, '$2y$12$Ajhb2z2m/a0x6d6ODMqQdOaZtzllBxVJNVKTs9tOLn3f8a.SyXM3S', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-03 16:31:00', '2024-05-03 11:01:00', NULL),
(29, 510064, 'Appud', 'appu5@gmail.com', '+376789542', NULL, 5, '$2y$12$kHFfutKhJtojgYxyWS7HT.lXzceol1I3SLbNG0To6rR23jXTOblmK', 1006, 50.00, 0.00, 50.00, NULL, NULL, NULL, 1, '2024-05-03 17:24:46', '2024-06-03 06:38:53', NULL),
(30, 510065, 'adeeeb', 'addeeb@gmail.com', '8848055653', NULL, 5, '$2y$12$mjl6EymnCQBSuFNMDONOmOXcioAUwoDrQ.6m3BXS2EeljUuwftlES', NULL, 10.00, 0.00, 10.00, NULL, NULL, NULL, 1, '2024-05-03 17:25:33', '2024-05-17 10:02:40', NULL),
(31, 510066, 'Appu', 'appu11@gmail.com', '7924233192', NULL, 5, '$2y$12$ozYZO9zyneRl4k0zDZTCfOziC6VzvSK4P58yl3rv4D2V7wIrK7fFm', NULL, 0.00, 10.00, -10.00, NULL, NULL, NULL, 1, '2024-05-06 10:18:03', '2024-05-21 09:06:11', NULL),
(32, 510067, 'Appus', 'appu11s@gmail.com', '7924233292', NULL, 5, '$2y$12$Th4ofyqIccCoJwEINYaoPeMk6KOsvCTH9kOCCiauLAY9xddGpP/L.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-06 10:20:22', '2024-05-06 04:50:22', NULL),
(33, 510068, 'Adeevbnnhff', 'adeebabu655@gmail.com', '8848055656', NULL, 5, '$2y$12$yeEOAg5vpOi7oNDDBPiVO.1vdBZlxYr4gzKkewV2ysWWR8bDLH0/m', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-06 10:26:56', '2024-06-06 11:39:16', '2024-06-06 11:39:16'),
(34, 510069, 'Adeep', 'jyakrishnan@gmail.com', '7994233194', 'testimonial-2.jpg', 5, '$2y$12$JEwWhWPk0wWJZy65xzNoM.6lWSPPd3I9SmxQbu4E6UZebRRGCM9S6', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-06 16:56:00', '2024-05-15 03:41:35', '2024-05-15 03:41:35'),
(35, 510070, 'Aravind', 'aravind22@gmail.com', '8848055691', NULL, 5, '$2y$12$Jy81d/XDuMwtIP1B9xU.pO2cEjrByMRqOZI4ZAEXA.EBNIY1NjteC', NULL, 15.00, 0.00, 15.00, NULL, NULL, NULL, 1, '2024-05-06 17:03:29', '2024-05-13 17:37:07', NULL),
(36, 510071, 'Rahul', 'adeebabu007@gmail.com', '8848044651', NULL, 5, '$2y$12$uz0e2mh1Jc5gp5vqAbRwm.gPfsS7fxLcW56s0mIoaqFBWWafal4Sy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-07 23:06:55', '2024-05-07 17:36:55', NULL),
(37, 510072, 'Jayakrishnan', 'jayakrishnan@gmail.com', '8848077652', NULL, 5, '$2y$12$FKi6lyy8.mCpKRgMiB2o4uCSq9EWNRiy4j82TS1e.nkumiBQ3bddO', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-08 09:36:55', '2024-05-08 04:06:55', NULL),
(38, 510073, 'Appu', 'appu111@gmail.com', '7994233111', NULL, 5, '$2y$12$Ym8nPQAR4C5P8TB0sCZc4O4CxLhsn87mkCmKazKq8m85J/dugDaGO', 1000, 20.00, 0.00, 20.00, NULL, NULL, NULL, 1, '2024-05-08 14:07:25', '2024-05-09 05:10:58', NULL),
(39, 510074, 'tert', 'adeeb3@gmail.com', '885803453', 'Screenshot_2024-05-13-10-18-00-825_com.example.yes_loyality.jpg', 5, '$2y$12$5/LYkkRm8dE2VbDqLMUlYe.rZklnvmvItgDu4f8FmkPb00V2oFA6u', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-08 14:10:31', '2024-06-04 09:35:36', '2024-06-04 09:35:36'),
(40, 510075, 'amruta', 'amruta@gmail.com', '+617224233190', NULL, 5, '$2y$12$oe0cmEfl5P/cGg9qX5CuC.456UTmeEkLn3OomBqsIQLtnKJQ8ByJy', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 0, '2024-05-08 14:45:54', '2024-05-22 09:33:29', NULL),
(41, 510076, 'prithvi', 'prithvi@gmail.com', '7224233134', NULL, 5, '$2y$12$3VeLiLblM.ymz7s40sdRMuK5xKDakui0vWICSzhvVuffN8LzGbHmq', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-08 17:44:42', '2024-05-08 12:14:42', NULL),
(42, 510077, 'Harivv', 'harik3@gmail.com', '7994233194', 'IMG-20240522-WA0024.jpg', 5, '$2y$12$qHS85oHWq4TLiDcRHkGcRe7zKEsVzIXbp1MrcnBK3ocbMUV49iydu', 1000, 60.00, 0.00, 60.00, NULL, NULL, NULL, 1, '2024-05-08 22:35:30', '2024-06-04 09:35:14', '2024-06-04 09:35:14'),
(43, 510078, 'Ramu', 'ramu23@gmail.com', '8848066759', NULL, 5, '$2y$12$FN2vWCqODfSglCaUfr53dOPCI.tBGKAK97ctJpe27hVuRtqIe9Ci6', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-11 19:07:45', '2024-05-11 13:37:45', NULL),
(44, 510079, 'Cristiano', 'cr7@gmaio.com', '64649797879', NULL, 5, '$2y$12$V2FdxiHgFoVQ2yWG2XV8juDgOYzYhmuixLR9oTco8mgxJlCAiTERe', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-11 19:13:52', '2024-05-11 13:43:52', NULL),
(45, 510080, 'Messi', 'leo@gmail.com', '8848077653', NULL, 5, '$2y$12$u/4C8259u134ERfYmKSlfuoNQTiNiPLkxCt00UraZkjXI/QoiYceG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-11 19:29:12', '2024-05-11 13:59:12', NULL),
(46, 510081, 'Messi', 'leyyyo@gmail.com', '1148077653', NULL, 5, '$2y$12$A/f6DqknnE8y9dJA6Pkw3um1KHji4IKnq8tfg/DfaWO0sdhKpt6ni', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-11 19:29:42', '2024-05-11 13:59:42', NULL),
(47, 510082, 'hdhdhdhdh', 'ravipillai@gmail.com', '949681963458', NULL, 5, '$2y$12$alArSr5MTqvPz/c4IznaOugKjREB/aphxp.MLnM/1LEhJpuPsKTIS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-11 19:36:29', '2024-05-11 14:06:29', NULL),
(48, 510083, 'Qyahdjbd', 'bsnsns@gmail.com', '99464578746', NULL, 5, '$2y$12$5Cv8mCgTqVb.mqOQ.d3HFuuKk3U1MrLFnrc2DSRN3LqWtSkDwagDC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-13 12:16:03', '2024-05-13 06:46:03', NULL),
(49, 510084, 'superadmin', 'superadmin@gmail.com', '22 2', 'blk.jpeg', 1, '$2y$12$e/kLpu3n6FqepW6MPW5FzuxLY5MfaBzzXR8yfGA/GR2MZLclM1Stq', 1006, 0.00, 0.00, 0.00, NULL, NULL, 'light', 1, '2024-05-13 23:11:21', '2024-06-06 07:11:42', NULL),
(50, 510085, 'Admin', 'admin@gmail.com', '+93545566998', 'WhatsApp Image 2024-06-03 at 12.08.04 PM.jpeg', 2, '$2y$12$SFFyYMbiQI2GSNsngBPFMu92Kz8P.kLxpoiIU7C.uNZV3wyJoy0cK', 1006, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-05-13 23:14:51', '2024-06-06 07:08:24', NULL),
(51, 510086, 'branchmanager', 'branchmanager@gmail.com', '+919745712856', 'blk.jpeg', 3, '$2y$12$xr/jfnTkyFUtnnUQ/.KCT.pdcLCRJ9n7G932dLS8jqIlN50Mxd.Fq', 1000, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-05-13 23:15:36', '2024-06-06 11:19:48', NULL),
(52, 510087, 'cashier', 'cashier@gmail.com', '+355774411552', NULL, 4, '$2y$12$hQn5XpdmCI6HItzfVs6MkOF5YnFwUoh5XeX.4R8FwcJ.D4c0JVqsu', 1000, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-05-13 23:16:07', '2024-06-06 09:51:05', NULL),
(53, 510088, 'shirin', 'shirin@gmail.com', '9996663332', NULL, 4, '$2y$12$h81Jb2RADl.PRVfpmyxcU.E0ztV80PUfuxi/tO.n9QBKRc9Tz2I/i', 1008, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-05-15 09:41:53', '2024-06-06 11:38:43', '2024-06-06 11:38:43'),
(54, 510089, 'Lisa', 'lisa@gmail.com', '74058', NULL, 4, '$2y$12$gxylD5Gho93MPXExd4SGaeYA2wxuN5PL2Ionlu0vSTKFXO1PWQX2S', 1008, 0.00, 0.00, 0.00, NULL, NULL, 'light', 1, '2024-05-15 12:16:05', '2024-05-31 06:19:09', NULL),
(55, 510090, 'hyder', 'hyder@gmail.com', '7744774477', NULL, 5, '$2y$12$tZE9pFrwxnWzoCrjf0d8p.eUBduGT.6k8wpEKtIkAUIjiPV4uRZIK', NULL, 70.00, 10.00, 60.00, NULL, NULL, NULL, 1, '2024-05-15 12:49:56', '2024-05-17 05:09:04', NULL),
(56, 510091, 'ramla', 'ramla@gmailcom', '9874511111', NULL, 5, '$2y$12$.xuETg3jOF1XxAVjQRzAiuqo3NCyzrjrDAYgG6iNFeqgD0U65frHC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-15 12:58:26', '2024-05-15 07:28:51', '2024-05-15 07:28:51'),
(57, 510092, 'Jenny', 'jenny@gmail.com', '8989898989', NULL, 5, '$2y$12$nRbL.v0YEu7wGBViPgd5CeqjSsl62vDbBH4ruT4cXye0ol9ao4iKe', NULL, 50.00, 0.00, 50.00, NULL, NULL, NULL, 1, '2024-05-15 14:07:32', '2024-05-15 08:39:23', NULL),
(58, 510093, 'jisoo', 'jisoo@gmail.com', '7539586666', NULL, 4, '$2y$12$FGrIENWOwkcprnBo.C4kDO0snms4XzSwY3iT9YFncXECVUJz.LRVO', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-15 14:08:15', '2024-05-15 08:38:15', NULL),
(59, 510094, 'raju', 'raju@gmailcom', '4455445544', NULL, 4, '$2y$12$UW7CXAaV.Vz2GdXlQi2dP.7gYURxYfHgDGuTaaq3ii4rcpS7ssvwq', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-15 15:00:45', '2024-05-15 09:30:45', NULL),
(60, 510095, 'manobal', 'manobal@gmail.com', '7414521212', NULL, 4, '$2y$12$c09igR.RLcXwylzN9JmjZeky/3KXqKWtFgRREKldf02S0NrP2sf7a', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-15 15:29:47', '2024-05-15 10:01:07', NULL),
(61, 510096, 'bhama', 'bhama@gmail.com', '7414744444', NULL, 5, '$2y$12$1GduUrkSPheuNQn.JvHp5esih104FgkR4sv/tO4Ojh1sIkEL7opO2', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-16 16:29:34', '2024-05-16 10:59:34', NULL),
(62, 510097, 'satya', 'satya@gmail.com', '9857474477', NULL, 5, '$2y$12$KvVycGAo1Ns1H9ND/sja/upUS69vSCb/rsMUxbbxak7wHVL136LQ6', NULL, 65.00, 0.00, 65.00, NULL, NULL, NULL, 1, '2024-05-16 16:30:57', '2024-05-16 11:06:09', NULL),
(63, 510098, 'hwasa', 'hwasa@gmail.com', '7896868686', NULL, 3, '$2y$12$s39CfY6twEXq29Cm8qbhle9LYwsH5EsrTF4zmeqBCSM18f3XghGYG', 1001, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 10:14:54', '2024-05-31 09:48:37', NULL),
(64, 510099, 'Rishikesh p s', 'rishi22@gmail.com', '+919834267890', NULL, 3, '$2y$12$FesSnYGzmD9V3nakjtKXp.35AjgA5h58dkK67nN5CuvkeiJNnUoHm', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 15:28:56', '2024-05-17 10:00:34', NULL),
(65, 510100, 'Hariharakumar', 'harik8@gmail.com', '+914494233190', NULL, 5, '$2y$12$j9eS5ffe.RCrzmbAldx2u.lvmjodee29Z8Uw47dtYAzeNbARtfV1e', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 17:49:31', '2024-05-22 03:56:03', NULL),
(66, 510101, 'hdjdjd', 'dhdh@gmail.com', '959494', NULL, 5, '$2y$12$w7oXuXTEsDMGHR8rMOynZO.KYASn2MmRTPj1dOrcct4sErVOHk2bK', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 17:55:30', '2024-05-17 12:28:43', NULL),
(67, 510102, 'Appu', 'harik5@gmail.com', '7224233192', NULL, 5, '$2y$12$3lyWOTzfmlcmvV8dkA/.CeWg3xaI4p5/IQNyA9hdRHh.DBvL6FnBS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 20:10:51', '2024-05-17 14:40:51', NULL),
(68, 510103, 'jk Thoppil', 'jk@gmail.com', '1994233190', NULL, 5, '$2y$12$KRp.J6GV0Em8hlsqwuiq2.VX.Qc1NhWPF/lQaf/7s1Ie8tP6GU9Se', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 20:56:38', '2024-05-21 07:22:42', '2024-05-21 07:22:42'),
(69, 510104, 'AdeebAbu', 'adeeb755@gmail.com', '9496626356', NULL, 5, '$2y$12$u53M8AqT3hOMRoryIF0K7uOEsZK4pl0bz9aail6QcW/w2en4Uffx2', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 21:34:28', '2024-05-17 16:04:28', NULL),
(70, 510105, 'Appu', 'adeeb007@gmail.com', '3994233190', NULL, 5, '$2y$12$i3RR1YgcSHLW9xUOywd4j.a7XF2xv4dQlL1.XXI2cQuEUkUPDm/te', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-17 23:48:24', '2024-05-17 18:18:24', NULL),
(71, 510106, 'Appu', 'appu7@gmail.com', '12294233190', NULL, 5, '$2y$12$AU3h3JgZp6sBtosA1Yb0LOiL2GLvfGGT92gNoCiGGDZzlPoSZUfv2', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 05:41:15', '2024-05-18 00:11:15', NULL),
(72, 510107, 'Appu2', 'appu455@gmail.com', '+376854269', NULL, 5, '$2y$12$YK8hwpBcR.6eB6YXga5cuOVrhivUE6f813MVWwd3xLoQtPK8OQPZW', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 05:47:56', '2024-06-03 06:42:16', NULL),
(73, 510108, 'Shanthan', 'shanthan@gmail.com', '4456279643', NULL, 5, '$2y$12$fVyQjdP9r3hdY/RjkgnTnu/HG7WRiwgFcQ9z1HnlYlz8DIb46rbla', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 06:00:02', '2024-05-18 00:30:02', NULL),
(74, 510109, 'scdsfsdfd', 'dfvdf@gmail.com', '31545654765', NULL, 5, '$2y$12$anlYEZ.N31OHdNHio4opAeefFxQf8o4k2sd/E/wVPDixxdtbsHwBi', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 06:59:29', '2024-05-18 01:29:29', NULL),
(75, 510110, 'dgfdgf', 'dgdf@gmail.com', '3454354645675', NULL, 5, '$2y$12$CvUSZXwK56Vh/ilJ5As7DuEFceMGGJtkWU4Sgxb0PBiU/zL0FjjqC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:06:56', '2024-05-18 01:36:56', NULL),
(76, 510111, 'wdeefe', 'weewf@gmail.com', '43543543', NULL, 5, '$2y$12$HYpGJq0J5n.hpL2Bv0Z6LOZdEk1mwqkmUoGB6rj.SdAV3ks8YlxLW', NULL, 10.00, 0.00, 10.00, NULL, NULL, NULL, 1, '2024-05-18 07:09:42', '2024-05-31 11:07:37', NULL),
(77, 510112, 'dcdfd', 'fdgf@gmail.com', '345354656767', NULL, 5, '$2y$12$u9O.qml2w36gw1iO7/5ibewFWVqSQ3OWLQ8GVsirN4sC0DaTdka6S', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:13:13', '2024-05-18 01:43:13', NULL),
(78, 510113, 'dcdfd', 'fdsgf@gmail.com', '3354656767', NULL, 5, '$2y$12$S0hsk1hggvNJVICoRiNA8eT2Bpx4bkTJti2DxtWo2Rsfc7y6f3p.u', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:13:41', '2024-05-18 01:43:41', NULL),
(79, 510114, 'gdfgfh', 'fhfg@gmail.com', '2345435435', NULL, 5, '$2y$12$MYXza8hUBVbJvhsqgALBqeRdgFdn.O.aGWK7MrqJzu6r/TVJobzjO', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:15:46', '2024-05-18 01:45:46', NULL),
(80, 510115, 'ddfgf', 'fgdf@gmail.com', '3453467567', NULL, 5, '$2y$12$6PzWyj8MIGQruFpYMXNZj.WzUfQ.2kD3puOw6WDI6AdxRJBN8fZve', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:18:00', '2024-05-18 01:48:00', NULL),
(81, 510116, 'dgdfhfgh', 'dsfdfg@gmail.com', '34654645765', NULL, 5, '$2y$12$tjs2gkS3BN87XYjtCJc0w.UZw70Vc1BG4abqLPVSefjGsJKB5iL7S', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 07:22:16', '2024-05-18 01:52:16', NULL),
(82, 510117, 'Appu', 'appus5@gmail.com', '72294233190', NULL, 5, '$2y$12$hf4IJDCXfLefMGqlnDvSTulekrOISQu8YRSSefNMFNb4sj3z1BuMe', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 08:08:42', '2024-05-18 02:38:42', NULL),
(83, 510118, 'dfgdfy', 'rtytr@gmail.com', '55435464563', NULL, 5, '$2y$12$Bh5SvwNxDZs.iTKv8BRSb.yK34wEcuYH0qD1LXVNbqXHnvWmQ8kcW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-18 14:44:44', '2024-05-18 09:14:44', NULL),
(84, 510119, 'Adeed34b', 'neymar6xcv5@gmail.com', '8848055652', NULL, 5, '$2y$12$OzPU2IxolX6NdTwTfT4zs.2yJ1FtdM4hDbYLaev73/qhmqQy8bjEm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-19 07:13:05', '2024-05-19 01:43:05', NULL),
(85, 510120, 'fhghg', 'gf@gmail.com', '5756765834', NULL, 5, '$2y$12$yaYwRgi22nC/AEYUloHPh.GzihfQGBNBq5JJ.QMwhshwqtiqBTMzu', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-19 21:10:30', '2024-05-19 15:40:30', NULL),
(86, 510121, 'hjjjj', 'yshshshs@gmail.com', '8843055656', NULL, 5, '$2y$12$IIIDImcqH94dSh9UJO0EeO.1c9tCXAbJ1dQdggn4wGftEsiBVqZIO', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-19 21:28:38', '2024-05-19 15:58:38', NULL),
(87, 510122, 'p', 'jdjdjd@gmail.com', '65649484546', NULL, 5, '$2y$12$wLN7jRmNyHQQc86WiZ.B2eH1VAtEDBqNn71M9JFNQuSHLpiBcFKWC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-19 21:34:39', '2024-05-19 16:04:39', NULL),
(88, 510123, 'Adrianoss', 'adriano007@gmail.com', '4448055651', NULL, 5, '$2y$12$7QvRRLwwkbc0azjQZqztM.tNwVGsDydZy3Fe8RX/bcMaZIAbtaMNa', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 04:37:43', '2024-05-20 00:09:33', NULL),
(89, 510124, 'messihjdjd', 'adeeb@gmail.com', '9496767653', NULL, 5, '$2y$12$fKY2eOsZRgG2Sk19mgxc3u6Vi.171ms1/qhZqutFkNvfe4B7x8eYa', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 04:45:58', '2024-05-19 23:47:12', NULL),
(90, 510125, 'ghgvcxvc', 'gh@gmail.com', '7875675675', NULL, 5, '$2y$12$h6r.jMkhmLM7SU7s0FMl2O9PpMbZ/.TANqwlR0spI8rpVYip9fNDa', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 05:46:36', '2024-05-20 00:17:48', NULL),
(91, 510126, 'lucasgmailcefom', 'lucas@gmail.com', '1148055651', NULL, 5, '$2y$12$OBB0GdsG08NJuPApUGsC4eIer.NTOP.g5yKSIvmGAkDpc5S6/0wnG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 06:00:26', '2024-05-20 00:31:20', NULL),
(92, 510127, 'Adeeb Acxcxbubacker', 'aseebabu65@gmail.com', '4848055651', NULL, 5, '$2y$12$GgCgkSBbKq8sbwVNFciqeefhagOO0sC2sDp0mexrOPtF3qXfG06s.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 06:07:41', '2024-05-20 00:38:47', NULL),
(93, 510128, 'Larryhh', 'Larry@gmail.com', '+61786544567', NULL, 4, '$2y$12$0yTSqylALvZnQDj8RnUJRuDfPo17OuNRmYoClaaJka5HCT8QpzQpu', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 06:19:04', '2024-05-20 00:53:12', NULL),
(94, 510129, 'P shirin', 'shirin1@gmail.com', '7744778888', 'WipeOut26_02_2022_092647.238000.jpg', 5, '$2y$12$c/l67t1AiPZX8CUrTgVu1.SIsSZLvFcmL2ATVNvOeLkw8qZf3s6sy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 09:32:10', '2024-06-06 11:38:53', '2024-06-06 11:38:53'),
(95, 510130, 'Rishikesh p s', 'test1010@gmail.com', '9028172839', NULL, 5, '$2y$12$QtfmkdjhDxKgXBfpbAGu6.JZYcUqWKylyXQZlTy2SmYDhYNxySwTG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 10:46:17', '2024-05-20 05:16:17', NULL),
(96, 510131, 'rahul', 'rahul@gmail.com', '562562512', NULL, 5, '$2y$12$ljHaN2A7IqnEih4nCgjdFe7pXq7gMoH/zqZhzI4S5XAjPfa26LE42', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 10:52:20', '2024-05-20 05:22:20', NULL),
(97, 510132, 'hsnsn', 'sgshsh@gmail.com', '64649484849', NULL, 5, '$2y$12$C7.iJY.s5YBvQIlfddezgOoQ.FeOhT6iXCd2r/nOXEpElgGTHLJjO', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 11:01:44', '2024-05-20 05:31:44', NULL),
(98, 510133, 'dgfdh', 'fghfg@gmail.com', '3543645757', NULL, 5, '$2y$12$ZFsLnQYp7eNYUD0DIyLSJevM3KRBtX6NIRyU8rQm5gI0XW/iPJ2za', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 11:04:41', '2024-05-20 05:34:41', NULL),
(99, 510134, 'dgfdh', 'fgshfg@gmail.com', '3543645727', NULL, 5, '$2y$12$acjOhMdvxJGzQBUyiP/Aw..vx4eq2OgfmbBuNg4Bw5xMVMaYTqk5C', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 11:04:58', '2024-05-20 05:34:58', NULL),
(100, 510135, 'hsnsn', 'sgsshsh@gmail.com', '69649484849', NULL, 5, '$2y$12$.SuFiQZYJiVGmSF8s90qguvWCynXA2NYkJJMvN52yH413mWfzmQSS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 11:05:40', '2024-05-20 05:35:40', NULL),
(101, 510136, 'fdgfgh', 'ggh@gmail.com', '11848055651', NULL, 5, '$2y$12$3t/p6X9B3N1DlMYCwFsLEumzANb6Z1Qbqy3QYHrktSBgn1.Ptnt5C', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-20 11:10:18', '2024-05-20 05:40:18', NULL),
(102, 510137, 'Hari Ramanathan', 'hari@agatebc.com', '9497116928', NULL, 5, '$2y$12$ku0NDJGSwTq1q4oGunZMQOHZr.D//yXgAVcmvUzReCi4AQSVVhOBG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-21 08:37:52', '2024-05-21 03:07:52', NULL),
(103, 510138, 'Django', 'Django@gmail.com', '9858574111', NULL, 5, '$2y$12$O1IFTNVtC1bNPDUzIyTXCeQ3yTSq5tbTs3zFM8JZGjjZmbYXxi/zq', NULL, 50.00, 10.00, 40.00, NULL, NULL, NULL, 1, '2024-05-21 10:50:41', '2024-05-22 10:27:37', NULL),
(104, 510139, 'olivia', 'olivia@gmail.com', '+439243565856999', NULL, 5, '$2y$12$2pMUTBHJaH6.AiBP2IadFesCJxllXW2ObDGf8N6S/rsL4QfnQxUv6', 1006, 100.00, 0.00, 100.00, NULL, NULL, NULL, 1, '2024-05-22 12:29:38', '2024-05-22 07:09:14', NULL),
(105, 510140, 'zenher', 'zenher@gmail.com', '+431414741474111', NULL, 4, '$2y$12$LdMhd.uOzZye1hO.yUakVeGqZ2WzmfP3bnoh/f21MY7tN.BpmXdAK', 1012, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-22 12:31:24', '2024-05-22 07:01:24', NULL),
(106, 510141, 'Subash Tkyyy', 'subash799@gmail.com', '8846055651', NULL, 5, '$2y$12$9D.N1usVGEphjqOpu0YE4eYWLSnjZZ8DArumEB2FxtxFzFJK4F5O2', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-27 09:28:53', '2024-05-27 03:59:54', NULL),
(107, 510142, 'vishnujejeujjji', 'vishnu655@gmail', '7994233331', 'WipeOut25_20_2022_102502.331000.jpg', 5, '$2y$12$245Wcg/2Axweb.PhbtOBsOkYGbP.yu47YizKCGtVNaMJ8qBiXyBpm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-27 10:26:56', '2024-05-29 07:35:48', NULL),
(108, 510143, 'Adeep', 'user100@gmail.com', '7994233333', 'Contact-us.jpg', 5, '$2y$12$dixnFjuiE/EsbWKD5ib38e4ndvKUIlnx39KGLlv4NXQ5C19F5Ih1a', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-27 16:42:31', '2024-05-27 11:14:06', NULL),
(109, 510144, 'faima', 'faima@gmailcom', '99966633333', 'IMG_20240528_120915.jpg', 5, '$2y$12$m7IFm8EF2id/ZWbec8qi1u3SHPl7wt.PFXJlIty.FQks8/IzMnDkG', NULL, 195.00, 112.00, 83.00, NULL, NULL, NULL, 1, '2024-05-27 16:49:33', '2024-05-28 06:46:12', NULL),
(110, 510145, 'zain', 'zain@gmail.com', '35789625446', NULL, 5, '$2y$12$p/5E0V8ZX7qXc4dfnVzB6OH2HoY2mO7zE3YmtwaxjWMg1Jni8LFmW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-28 10:35:58', '2024-05-28 05:05:58', NULL),
(111, 510146, 'taniyataniyaaaaaaaaaaa', 'taniyatanu@gmail', '6687546318', 'IMG_20240528_120915.jpg', 5, '$2y$12$k0/KG1ySgBZPSE2gfbmIY.LXPAsDOndd6hU74Yspxtmctuc3ec3Ou', NULL, 85.00, 20.00, 65.00, NULL, NULL, NULL, 1, '2024-05-28 10:37:35', '2024-05-29 09:34:17', NULL),
(112, 510147, 'Vipin', 'vispin@gmail.com', '+918856066654', 'WipeOut26_02_2022_092647.238000.jpg', 5, '$2y$12$KlfxzPEIAFo5E16vzPZFhu1SipV9qHWhiV2qjEjiyQ3M6Js4R5pUW', NULL, 211.00, 70.00, 141.00, NULL, NULL, NULL, 1, '2024-05-28 15:09:50', '2024-06-06 11:21:20', '2024-06-06 11:21:20'),
(113, 510148, 'mini', 'mini@gmail.com', '9856885255', NULL, 5, '$2y$12$1G2IU67LPybb2cSwuIs6Eu6RfgVpQJsyFXPU8DQHIOWXJ4tVIbsG.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-28 15:31:25', '2024-05-29 09:21:45', NULL),
(114, 510149, 'amrutha', 'amrutha@gmail.com', '9685324417', 'WipeOut27_02_2022_092721.009000.jpg', 5, '$2y$12$ccGHKsA6fPYQPvcTpbfi0OJD5e.lpuFgNg5YZ/h8sMFq8YPlwmJki', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-28 17:28:19', '2024-05-28 12:26:21', NULL),
(115, 510150, 'gsgsh', 'rqy@gmail', '8686467668', NULL, 5, '$2y$12$PB6RpRH8sJfm3omu67mSVObncRbZq6F2NcMtkIkbyZpFzfcSsZPZ.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 13:07:34', '2024-05-29 07:37:34', NULL),
(116, 510151, 'daniel', 'daniel@gmail', '9807451632', NULL, 5, '$2y$12$O/Bqm81Quv1GiYx3iAN9ieS5jK8wPun8jNMAoTBOw47u5ar0YT1tS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 13:09:14', '2024-05-29 07:39:14', NULL),
(117, 510152, 'henry', 'henry@gmail', '9845632211', NULL, 5, '$2y$12$BWBOXu9SjD.PCNz1TvF8vu6F4DBpZ4yyczxOnFWcZik04ZLyAT0oy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 13:10:20', '2024-05-29 07:40:20', NULL),
(118, 510153, 'tezza', 'tezza@gmailcom', '+213741582555', NULL, 5, '$2y$12$fh6AYN22Az2jAPxZANUuS.PpsWRu72dDJ5WueFi5BJeH4IlWVcyay', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 14:46:38', '2024-05-29 09:16:38', NULL),
(119, 510154, 'Teena Samuel  Koshi', 'teena@gmail.com', '9865326565', 'WipeOut51_28_2022_095144.981000.jpg', 5, '$2y$12$1zRNyw/bix17vun7V8/hOuAix22TiUccoRtVqdIl/aqQPSbZnXTsa', NULL, 150.00, 20.00, 130.00, NULL, NULL, NULL, 1, '2024-05-29 17:01:49', '2024-05-30 06:34:58', NULL),
(120, 510155, 'Teena Samuel Koshi', 'tom@gmail.com', '9865326569', NULL, 5, '$2y$12$G.M.V4ClrPwTxhn0DIM95efiZaHMT5Nh/PmTQnVJw4y9lM5svUAcW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 17:13:10', '2024-05-29 11:43:10', NULL),
(121, 510156, 'jerina', 'jerina@gmail.com', '66', NULL, 5, '$2y$12$kw5/XJZ/f7jS35p9pDysFud2uoC1C1EtvZMnrbuDHFpuY70T.69yG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-29 17:37:36', '2024-05-29 12:07:36', NULL),
(122, 510157, 'emin', 'emin@gmail', '2588745665', NULL, 5, '$2y$12$jSF4fMvW.Qeg.BSLG9.di.2v4S0n3lK3MWOyrCcv3E0wWFRB.XFB2', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 09:53:01', '2024-05-30 04:23:01', NULL),
(128, 510163, 'jocker', 'jocker@gmail', '5552366696354', NULL, 5, '$2y$12$v6ww7ZL/iHIk5rX4qTC8v.mCV35Lx5IIpQZJsy4LEjC1stiej.v4i', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 09:54:38', '2024-05-30 04:24:38', NULL),
(130, 510165, 'hgvhgf', 'hari45@gmailfhghd', '79956464', NULL, 5, '$2y$12$2Jqa3P1/m5dzt7vEu3XB9eJsPojLscGiMt.olLg8h6yAvTCL4wGZi', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 09:58:27', '2024-05-30 04:28:27', NULL),
(131, 510166, 'dfhuu', 'ggdg@gmail.com', '545', NULL, 5, '$2y$12$KdpMX3op5t4I.RnqvwWT5.WDQdCI3YO1yhiTQ7eZSTFkgF9QcCLI6', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:28:28', '2024-05-30 04:58:28', NULL),
(132, 510167, 'dfhuu', 'gdhdjjsjhh@gmail.com', '12222', NULL, 5, '$2y$12$CnAJnMH7Ks6iOfRa/6L2f.xNw9GmDn0cQxA8h81fWvAzdIoFLpYLm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:29:05', '2024-05-30 04:59:05', NULL),
(133, 510168, 'adamjohn', 'adamjohn@gmail.com', '258976431346', NULL, 5, '$2y$12$cdBPi3BqWnw3PA8vVsKJ4exXW1wietYQLGC2Sz183JGO//9jShdcK', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:38:26', '2024-05-30 05:08:26', NULL),
(134, 510169, 'Shyamauuu', 'shyamg@gmail.com', '665694845454', 'IMG-20240529-WA0123.jpg', 5, '$2y$12$KJucLWLbDo8KGIfcikoWe.DtUrVNhjqlOlB2yYxDN8CPMrXP17Z8q', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:50:43', '2024-05-30 05:23:01', NULL),
(135, 510170, 'User1000', 'user1000@gmail.com', '7994233339', 'testimonial-1.jpg', 5, '$2y$12$ic0Sp5VDIIhzNVC8xz6c.eccjlh4T8jJetxdMFnYkk3ZcIb1OyJXq', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:52:20', '2024-05-30 05:25:00', NULL),
(136, 510171, 'User10000', 'user10000@gmail.com', '7994233338', 'testimonial-1.jpg', 5, '$2y$12$hD/MDSO1TvF0O4.D.Gx0QOrJmKFUO2vAXhPvVOM337slrAaSZGBAq', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-30 10:57:43', '2024-05-30 05:28:24', NULL),
(137, 510172, 'farook', 'farook@gmail.com', '+213458888888', NULL, 5, '$2y$12$eWPPwESvv5gQ17mo6TjTEebW5T07mo3jHvUo54UlLkjAG5zI0vtLO', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 11:04:43', '2024-05-31 05:34:43', NULL),
(138, 510173, 'Raju', 'rajuy566@gmail.com', '+918848055651', NULL, 5, '$2y$12$qK/gmlR42FjWpvI3NZOZ.uP7AQtkjGPe4hYRDQIyPH0wbGXv01XTm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 14:58:45', '2024-05-31 09:28:45', NULL),
(139, 510174, 'User10000', 'ussder10000@gmail.com', '+919474838267', NULL, 5, '$2y$12$h8pLRyHTduGSkDRYF15ozOOTqAyQ16ekj2mnHU7.4WUx1eWmCQCt6', NULL, 10.00, 0.00, 10.00, NULL, NULL, NULL, 1, '2024-05-31 14:59:10', '2024-06-05 12:11:23', NULL),
(140, 510175, 'Raju', 'rajughy566@gmail.com', '+918348055651', NULL, 5, '$2y$12$vo9YD4FIPz4J21n/p/Z1P.9bV04chMjklv6P7T5f.e8pbtTKaNqLS', NULL, 100.00, 0.00, 100.00, NULL, NULL, NULL, 1, '2024-05-31 14:59:31', '2024-05-31 11:11:16', NULL),
(141, 510176, 'User10000', 'ussddser10000@gmail.com', '+919474838262', NULL, 5, '$2y$12$Yg7yLBCpTCmfytxdzOONB.Fv2Kc/iMQ6UsOt.t/ONjhgJdabbfeJW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:26:48', '2024-05-31 09:56:48', NULL),
(142, 510177, 'User10000', 'usssddser10000@gmail.com', '+919474838263', NULL, 5, '$2y$12$chxJ75W3ItccwoeHIzn5je5b1h1BV04.Gbl6La2TuT.TfXwgaLHKi', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:28:48', '2024-05-31 09:58:48', NULL),
(143, 510178, 'User10000', 'ussdsddser10000@gmail.com', '+919474838264', NULL, 5, '$2y$12$shRv4aHoobV7gkAMay1K5.GxJNQnyL.gatLtdSWqvwP7dncTS6CrG', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:29:01', '2024-05-31 09:59:01', NULL),
(144, 510179, 'hsjsjs', 'shhsh@gmail.com', '+919474838266', NULL, 5, '$2y$12$yIm6gxV32/Xl.FBXUM4xz.o2YmB6DBSgJovjt0sL11was.0dDaBbe', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:30:03', '2024-05-31 10:00:03', NULL),
(145, 510180, 'hdujdjd', 'usjsjsj@gmail.com', '+919809465260', NULL, 5, '$2y$12$IkyLqOy3ZqL6Vi91PoyxYOdKiJzuO/Ux/Oxf.pYUQUj6sUZWyHcn.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:40:07', '2024-05-31 10:10:07', NULL),
(146, 510181, 'hdujdjd', 'ursjsjsj@gmail.com', '+919819465260', NULL, 5, '$2y$12$MRvNvOAIHt9b.DIYYtZxieWZ5Tj/SeOv6jvxNR8H1d04NEFtNArSK', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:40:32', '2024-05-31 10:10:32', NULL),
(147, 510182, 'User10000', 'ussddsddser10000@gmail.com', '+918118055954', NULL, 5, '$2y$12$Kv1MZvSvBWVB65zy0uUA9O4pdvPpgMke.HgyaWatwZ8F/mGx.okgS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:45:31', '2024-05-31 10:15:31', NULL),
(148, 510183, 'fkgvh', 'hsjsj@gmail.com', '+918018055954', NULL, 5, '$2y$12$R95gsB3eJA37MmK6g2ZBceaM.LhMZKTHLlqu7OyYSepWbEm/pbM8C', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 15:45:45', '2024-05-31 10:15:45', NULL),
(149, 510184, 'User100000', 'user101@gmail.com', '+16463624888', NULL, 5, '$2y$12$nEKKUEw80K5W6jtDenKTSuQjUrGWNOYaiU7nDk567XBkReqzMg0N6', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 16:40:00', '2024-05-31 11:10:00', NULL),
(150, 510185, 'User10000', 'ussfddsddser10000@gmail.com', '+918111055954', NULL, 5, '$2y$12$AuG2XeS9CT.vHgwCZQjIHuAxTjitXx2XsNliHbEPXpFU1LkLHlilW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 16:42:59', '2024-05-31 11:12:59', NULL),
(151, 510186, 'hdhs', 'shsbsb@gmail.com', '+61450123456', NULL, 5, '$2y$12$7kJ4y6JIJPIsiN/C9l8xceYLudnivAawDHtv4nKx04jW0BKeOn1C.', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 17:43:19', '2024-06-04 09:36:10', '2024-06-04 09:36:10'),
(152, 510187, 'hdhs', 'shsbsgb@gmail.com', '+61450123453', NULL, 5, '$2y$12$JyOyZsuocOM9T4md6YRHuueCfTgy/NFizJQNq33OYYFFCor8y/oQy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-05-31 17:43:48', '2024-05-31 12:13:48', NULL),
(153, 510188, 'Preethy', 'agateuser15@gmail.com', '+919497765896', NULL, 5, '$2y$12$jBGg1YyXbzzcLe5vf75gn.p75y2ZvE20I3xz8RkyfpuT.gxgKHYXe', NULL, 10.00, 0.00, 10.00, NULL, NULL, NULL, 1, '2024-06-01 11:13:11', '2024-06-06 04:43:56', NULL),
(154, 510189, 'yusra yaser malol', 'yusra@gmail.com', '+919856467856', 'WipeOut26_02_2022_092647.238000.jpg', 5, '$2y$12$w06.UIXnyYof8vVeO0GZnurHlV73DLBpEkMDHeZT928aUcfZFXQhS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-01 12:28:00', '2024-06-01 08:33:38', NULL),
(158, 510193, 'Agate', 'agateuser16@gmail.com', '+919497765966', NULL, 5, '$2y$12$Pt1rviIr.UOkTGH.qi9ch.EWBgjZTgKkvnu7lWFQJrabSOJaeUlKa', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-01 14:50:22', '2024-06-06 09:08:24', NULL),
(161, 510196, 'Preethy', 'agateuser14@gmail.com', '+919400768009', NULL, 5, '$2y$12$uAudjJ0qz8oxiS/3L6rJmOC9/rReslLVZV1LSJYBedwXnuO1w4F7S', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-01 16:38:11', '2024-06-06 06:37:52', '2024-06-06 06:37:52'),
(162, 510197, 'Vipin', 'vipin@gmail.com', '+61450 123 445', 'Screenshot_2024-05-28-15-12-16-034_com.jpg', 5, '$2y$12$PwPqSprOFxIQ1cVfgSfZo.MwH7cUdRoNUXfaSppAAkiCcmEKW6TAi', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-02 19:14:17', '2024-06-03 04:46:30', NULL),
(163, 510198, 'nusri', 'nusri@gmail.com', '+918096532211', NULL, 5, '$2y$12$MDPMZZ3jLKcS2/X10NotA.Gb8Ik.ZOCtuHiJNKLX1uzqoccCO/Djq', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 09:39:48', '2024-06-06 12:15:50', '2024-06-06 12:15:50'),
(164, 510199, 'fathima nusri', 'nusri8@gmail.com', '+918509674411', NULL, 5, '$2y$12$GhJ2CBAdBBTmR9AWxghup.C6m4G5Wqdya6uVUOenwpHvYn/mGK1Bm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 09:47:03', '2024-06-03 04:17:03', NULL),
(166, 510201, 'rahila', 'rahila@gmail.com', '+919607415235', NULL, 5, '$2y$12$rJNE8oxK8oEtFhISnu46/Oysx61g/f7vhvi0R4Vgn.Dysjqd0mvWC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 09:51:34', '2024-06-03 04:21:34', NULL),
(167, 510202, 'kenza', 'kenza@gmail.com', '+919745821122', 'IMG-20240603-WA0011.jpg', 5, '$2y$12$shubS4va3WxkTixMtg2D/eB6cpbnwSen0TQvgYhskMxhUbRMbIwRy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 09:53:43', '2024-06-03 04:24:27', NULL),
(168, 510203, 'razik', 'razik@gmail.com', '+919856774411', NULL, 5, '$2y$12$q.Ag/bPRa2fuZW5V/2xn/OvEfbwzHCZWxgwcn5xPOVbWnbGEiVmeS', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 10:22:23', '2024-06-06 11:52:47', '2024-06-06 11:52:47'),
(169, 510204, 'Agate Administrator', 'agateuser01@gmail.com', '+61481276278', NULL, 1, '$2y$12$ZMOXIotCQQ3Sf2KK8z4pxuDfjkWmaExXohEfescfJ15F13IqWXe/G', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 11:29:49', '2024-06-03 05:59:49', NULL),
(170, 510205, 'YesYes Administrator', 'agateuser02@gmail.com', '+61428263738', 'Screenshot_2024-05-28-15-12-16-034_com.jpg', 2, '$2y$12$JkFBPA86d4pdk1MoWs9axegRXuLLkY13kIsfbDiIIVgPwiXITj./6', 1006, 0.00, 0.00, 0.00, NULL, NULL, 'dark', 1, '2024-06-03 11:38:03', '2024-06-06 10:40:12', NULL),
(172, 510207, 'now test', 'nowtest@gmail.com', '+919608777777', NULL, 5, '$2y$12$hPXk9qPrRp7pvW479HEfkeReMGunBBKEB/sZviyF9s7e28nO1blnS', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 12:39:29', '2024-06-03 07:23:30', '2024-06-03 07:23:30'),
(173, 510208, 'oglet', 'oglet@gmail.com', '+919608720202', NULL, 5, '$2y$12$F4iNNZym8ZPYnU6PjTp2duDC5a8iqzbgACM5nKqgSnNpLZ9cB0BxW', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-03 12:56:06', '2024-06-04 06:41:37', '2024-06-04 06:41:37'),
(174, 510209, 'oglet', 'oglet8@gmail.com', '+919874115566', NULL, 4, '$2y$12$Rs5GG2Q8YoVv62ornfpye.lZAQc1Khg6e8FvF0ie36x55IVkZQkrC', 1015, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-04 12:08:25', '2024-06-04 06:38:25', NULL),
(175, 510210, 'deo', 'deo@gmail.com', '+4557456982', NULL, 5, '$2y$12$hp6.DkOs85nJHU7WOudSveUYmXizDrt2fGMkqE38IWxtmPiYFDwDC', 1000, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-04 15:08:48', '2024-06-04 09:38:48', NULL),
(176, 510211, 'dani', 'dani@gmail.com', '+918502147896', NULL, 5, '$2y$12$SYhgPm4TZBD7rRIqPSbxiO4iCAtTlunYxD/bkVRVPjXXOsK7DUqqy', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-04 15:14:51', '2024-06-04 09:44:51', NULL),
(177, 510212, 'Rishi', 'rishi123@gmail.com', '+61412345678', NULL, 5, '$2y$12$PoJxafR3Wtyx8LMkmKOs2OrceOwAfRTwX.MhikUbj3HoceFZ5GTXm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-05 09:40:08', '2024-06-06 11:30:07', '2024-06-06 11:30:07'),
(178, 510213, 'mayuga', 'mayuga@gmail.com', '+917994540902', NULL, 5, '$2y$12$2BAKOS.3spG4JnvSsfbxruP77nTfGZESKPUdQyQ0hfzbX7otEynkm', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-05 10:17:49', '2024-06-05 04:47:49', NULL),
(179, 510214, 'shabnas', 'shabnas@gmail.com', '+917994787377', NULL, 5, '$2y$12$o8g9Ew07xzzIzrpsw3P6QenW0cqQjnBcjJRYvjZs6wvFPho1kbWjC', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-05 10:29:23', '2024-06-05 04:59:23', NULL),
(180, 510215, 'Agate14', 'agateuser14+1@gmail.com', '+919497787980', NULL, 5, '$2y$12$m2z9L5.9ezV08yDLbGI21.8yIWHSjrV6D2uNmArmiyow.i0q.YMIe', 1014, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-06 12:09:23', '2024-06-06 06:40:04', '2024-06-06 06:40:04'),
(181, 510216, 'pree', 'pree123@gmail.com', '+61978998889', NULL, 5, '$2y$12$FLdkzdo5uXQpOQxrrotgNO4FWvGelmDCV1uaPC63gwuPFps37C5ji', NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-06 15:20:00', '2024-06-06 09:50:00', NULL),
(182, 510217, 'falaq', 'falaq78@gmail.com', '+260958741569', NULL, 5, '$2y$12$E3FBtDrYgghfrqinv6gv7euEFacz82lgovk3.0BpoMIRbjGVCcDeO', 1006, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-06 15:22:34', '2024-06-06 09:56:41', NULL),
(183, 510218, 'safa', 'safa23@gmail.com', '+919854753254', NULL, 4, '$2y$12$YQaQhYqSjgQiKzZMcZacJO5IcJZjnsSsCTS6y8DskSlOGLSSs79hO', 1016, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, '2024-06-06 15:36:18', '2024-06-06 10:06:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_transactions`
--

CREATE TABLE `user_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `cashier_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `invoice_amt` decimal(10,2) NOT NULL,
  `offer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coins` int(11) DEFAULT NULL,
  `coin_type` enum('debit','credit') NOT NULL,
  `final_amt` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_transactions`
--

INSERT INTO `user_transactions` (`id`, `user_id`, `store_id`, `cashier_id`, `invoice_no`, `invoice_amt`, `offer_id`, `coins`, `coin_type`, `final_amt`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 1000, 23, '55415', 2000.00, NULL, 20, 'credit', 2000.00, '2024-05-08 11:21:25', '2024-05-08 11:21:25', NULL),
(2, 10, 1000, 23, '34890', 2000.00, NULL, 20, 'credit', 2000.00, '2024-05-08 11:41:28', '2024-05-08 11:41:28', NULL),
(3, 9, 1000, 23, '34654', 3000.00, NULL, 30, 'credit', 3000.00, '2024-05-08 11:42:29', '2024-05-08 11:42:29', NULL),
(4, 9, 1000, 23, '34634', 3000.00, NULL, 30, 'credit', 3000.00, '2024-05-08 11:43:14', '2024-05-08 11:43:14', NULL),
(5, 13, 1000, 23, '55422', 2000.00, 2, 30, 'debit', 1400.00, '2024-05-08 11:43:27', '2024-05-08 11:43:27', NULL),
(6, 49, 1000, 23, '55414', 2000.00, NULL, 20, 'credit', 2000.00, '2024-05-08 11:48:00', '2024-05-08 11:48:00', NULL),
(7, 12, 1000, 23, '55780', 2000.00, NULL, 20, 'credit', 2000.00, '2024-05-09 05:06:18', '2024-05-09 05:06:18', NULL),
(8, 38, 1000, 23, '33333', 2000.00, NULL, 20, 'credit', 2000.00, '2024-05-09 05:10:58', '2024-05-09 05:10:58', NULL),
(9, 42, 1000, 23, '348111', 2000.00, NULL, 20, 'credit', 2000.00, '2024-02-01 05:56:56', '2024-05-09 05:56:56', NULL),
(10, 42, 1000, 23, '22223', 1000.00, NULL, 10, 'debit', 1000.00, '2024-09-04 05:57:33', '2024-05-09 05:57:33', NULL),
(11, 42, 1000, 23, '55423', 2000.00, NULL, 20, 'credit', 2000.00, '2024-09-06 05:58:12', '2024-05-09 05:58:12', NULL),
(12, 42, 1000, 23, '59028', 1000.00, NULL, 10, 'debit', 1000.00, '2024-05-09 05:58:41', '2024-05-09 05:58:41', NULL),
(13, 42, 1004, 69, '84943', 9000.00, NULL, 30, 'credit', 9000.00, '2024-05-09 15:09:04', '2024-05-21 09:45:58', NULL),
(14, 29, 1000, 23, '55415000', 5000.00, NULL, 50, 'credit', 50005.00, '2024-05-13 17:35:33', '2024-05-21 07:37:40', NULL),
(15, 35, 1000, 23, '55415453', 3000.00, NULL, 15, 'credit', 3000.00, '2024-05-13 17:37:07', '2024-05-13 17:37:07', NULL),
(16, 55, 1008, 53, '9595', 1000.00, NULL, 10, 'credit', 1000.00, '2024-05-15 07:25:46', '2024-05-15 07:27:16', NULL),
(17, 57, 1006, 58, '12321', 6500.00, NULL, 50, 'credit', 6.00, '2024-05-15 08:39:23', '2024-06-03 06:37:24', NULL),
(18, 55, 1000, 23, '345345', 1000.00, NULL, 10, 'credit', 1000.00, '2024-05-15 10:12:08', '2024-05-15 10:12:08', NULL),
(19, 55, 1008, 53, '95958', 8000.00, 4, 10, 'debit', 3000.00, '2024-05-15 12:12:23', '2024-05-15 12:12:23', NULL),
(20, 62, 1000, 52, '1234', 3500.00, NULL, 15, 'credit', 3500.00, '2024-05-16 11:02:54', '2024-05-16 11:02:54', NULL),
(21, 62, 1000, 52, '8585', 8500.00, NULL, 50, 'credit', 8500.00, '2024-05-16 11:06:09', '2024-05-16 11:06:09', NULL),
(22, 55, 1001, 63, '777', 8500.00, NULL, 50, 'credit', 8500.00, '2024-05-17 05:09:04', '2024-05-17 05:09:04', NULL),
(23, 30, 1008, 53, '55343211', 2000.00, NULL, 10, 'credit', 2000.00, '2024-05-17 10:02:40', '2024-05-17 10:02:40', NULL),
(24, 103, 1008, 54, '95952', 8500.00, 4, 10, 'debit', 3500.00, '2024-05-21 06:21:37', '2024-05-21 06:21:37', NULL),
(25, 31, 1008, 53, '55555', 9500.00, 4, 10, 'debit', 4500.00, '2024-05-21 09:06:11', '2024-05-21 09:06:11', NULL),
(26, 104, 1012, 105, '7890', 9200.00, NULL, 50, 'credit', 9200.00, '2024-05-22 07:07:57', '2024-05-22 07:07:57', NULL),
(27, 104, 1012, 105, '5090', 5000.00, NULL, 50, 'credit', 5000.00, '2024-05-22 07:09:14', '2024-05-22 07:09:14', NULL),
(28, 103, 1008, 54, '4589', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-22 10:27:37', '2024-05-22 10:27:37', NULL),
(29, 21, 1008, 54, '3265', 6500.00, NULL, 50, 'credit', 6500.00, '2024-05-22 10:28:04', '2024-05-22 10:28:04', NULL),
(30, 109, 1012, 105, '8520', 4500.00, NULL, 15, 'debit', 4500.00, '2024-05-27 11:31:05', '2024-05-27 12:30:06', NULL),
(31, 109, 1012, 105, '5555', 5500.00, NULL, 50, 'debit', 5500.00, '2024-05-27 12:21:59', '2024-05-28 04:41:53', NULL),
(32, 109, 1012, 105, '4444', 1000.00, NULL, 50, 'debit', 7000.00, '2024-05-28 04:46:22', '2024-05-28 04:47:29', NULL),
(33, 109, 1000, 52, '112233', 3000.00, NULL, 15, 'credit', 3000.00, '2024-05-28 04:58:06', '2024-05-28 04:58:06', NULL),
(34, 109, 1012, 105, '554150098', 3000.00, 1, 56, 'debit', 2850.00, '2024-05-28 05:18:14', '2024-05-28 05:18:14', NULL),
(35, 109, 1012, 105, '554159887', 3000.00, 1, 56, 'debit', 2850.00, '2024-05-28 05:32:16', '2024-05-28 05:32:16', NULL),
(36, 109, 1012, 105, '78999', 3000.00, NULL, 15, 'credit', 3000.00, '2024-05-28 06:33:48', '2024-05-28 06:33:48', NULL),
(37, 109, 1012, 105, '0078999', 8500.00, NULL, 50, 'credit', 8500.00, '2024-05-28 06:46:12', '2024-05-28 06:46:12', NULL),
(38, 111, 1008, 53, '321223', 4000.00, NULL, 15, 'credit', 4000.00, '2024-05-28 08:52:17', '2024-05-28 08:52:17', NULL),
(39, 111, 1008, 53, '44448', 1000.00, 4, 10, 'debit', 100.00, '2024-05-28 08:54:52', '2024-05-28 08:54:52', NULL),
(40, 111, 1008, 53, '846', 6000.00, NULL, 50, 'credit', 6000.00, '2024-05-28 08:55:56', '2024-05-28 08:55:56', NULL),
(41, 111, 1008, 53, '7778', 5000.00, 4, 10, 'debit', 100.00, '2024-05-28 08:56:51', '2024-05-28 08:56:51', NULL),
(42, 111, 1008, 53, '5699', 1000.00, NULL, 10, 'credit', 1000.00, '2024-05-28 08:58:11', '2024-05-28 08:58:11', NULL),
(43, 112, 1006, 58, '78988', 2000.00, NULL, 10, 'credit', 2000.00, '2024-05-29 04:34:04', '2024-05-29 04:34:04', NULL),
(44, 112, 1008, 53, '78415', 2000.00, NULL, 10, 'credit', 2000.00, '2024-05-29 04:41:10', '2024-05-29 04:41:10', NULL),
(45, 112, 1006, 10, '4444455', 2000.00, NULL, 10, 'credit', 2000.00, '2024-05-29 04:44:51', '2024-05-29 04:44:51', NULL),
(46, 25, 1006, 10, '5000', 5000.00, NULL, 50, 'credit', 5000.00, '2024-05-29 07:17:20', '2024-05-29 07:17:20', NULL),
(47, 111, 1000, 52, '77777', 1000.00, NULL, 10, 'credit', 1000.00, '2024-05-29 09:34:17', '2024-05-29 09:34:17', NULL),
(48, 119, 1008, 53, '77784', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-30 06:32:19', '2024-05-30 06:32:19', NULL),
(49, 119, 1012, 105, '58987', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-30 06:33:15', '2024-05-30 06:33:15', NULL),
(50, 119, 1001, 22, '55', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-30 06:34:10', '2024-05-30 06:34:10', NULL),
(51, 119, 1000, 19, '8', 1000.00, 2, 20, 'debit', 400.00, '2024-05-30 06:34:58', '2024-05-30 06:34:58', NULL),
(52, 25, 1006, 50, '542', 1000.00, NULL, 10, 'credit', 1000.00, '2024-05-31 09:46:25', '2024-05-31 09:46:25', NULL),
(53, 76, 1012, 105, '55788', 2000.00, NULL, 10, 'credit', 2000.00, '2024-05-31 11:07:37', '2024-05-31 11:07:37', NULL),
(54, 140, 1012, 105, '456555', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-31 11:09:05', '2024-05-31 11:09:05', NULL),
(55, 140, 1012, 105, '7879895', 5500.00, NULL, 50, 'credit', 5500.00, '2024-05-31 11:11:16', '2024-05-31 11:11:16', NULL),
(56, 22, 1006, 58, '3434', 3434.00, NULL, 15, 'credit', 3434.00, '2024-06-03 10:13:50', '2024-06-03 10:13:50', NULL),
(57, 112, 1006, 58, '8080801', 6000.00, NULL, 50, 'debit', 6000.00, '2024-06-04 04:42:57', '2024-06-04 06:33:49', NULL),
(58, 112, 1015, 174, '68716', 5500.00, NULL, 50, 'credit', 5500.00, '2024-06-04 06:42:34', '2024-06-04 06:42:34', NULL),
(59, 112, 1008, 53, '358777', 5500.00, NULL, 50, 'credit', 5500.00, '2024-06-04 06:44:43', '2024-06-04 06:44:43', NULL),
(60, 112, 1015, 174, '6546848', 1000.00, NULL, 10, 'debit', 1000.00, '2024-06-04 06:46:10', '2024-06-04 06:46:54', NULL),
(61, 112, 1012, 105, '6252', 200.00, NULL, 1, 'credit', 200.00, '2024-06-04 06:51:17', '2024-06-04 06:51:17', NULL),
(62, 112, 1000, 2, '25682', 2000.00, 5, 50, 'debit', 1000.00, '2024-06-04 06:53:32', '2024-06-04 06:53:32', NULL),
(63, 112, 1015, 174, '54268', 2000.00, NULL, 10, 'credit', 2000.00, '2024-06-04 06:58:21', '2024-06-04 06:58:21', NULL),
(64, 112, 1015, 174, '7891642', 2000.00, NULL, 10, 'credit', 2000.00, '2024-06-04 07:17:59', '2024-06-04 07:17:59', NULL),
(65, 112, 1000, 2, '6827', 20000.00, 2, 20, 'debit', 400.00, '2024-06-04 07:33:34', '2024-06-04 07:33:34', NULL),
(66, 139, 1006, 58, '123478', 1234.00, NULL, 10, 'credit', 1234.00, '2024-06-05 12:11:23', '2024-06-05 12:11:23', NULL),
(67, 153, 1006, 58, '1234568', 1000.00, NULL, 10, 'credit', 1000.00, '2024-06-06 04:43:56', '2024-06-06 04:43:56', NULL),
(68, 27, 1000, 52, '1223344', 6000.00, NULL, 9, 'credit', 6000.00, '2024-06-06 09:48:52', '2024-06-06 09:48:52', NULL),
(69, 27, 1000, 51, '123456', 67899.00, NULL, 9, 'credit', 67899.00, '2024-06-06 11:20:10', '2024-06-06 11:20:10', NULL),
(70, 21, 1006, 50, '34324', 101.00, NULL, 1, 'credit', 101.00, '2024-06-06 12:11:23', '2024-06-06 12:11:23', NULL),
(71, 26, 1006, 58, '12546', 5000.00, NULL, 9, 'credit', 5000.00, '2024-06-06 12:41:07', '2024-06-06 12:41:07', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyality_offers`
--
ALTER TABLE `loyality_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `loyalty_rules`
--
ALTER TABLE `loyalty_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_rules1`
--
ALTER TABLE `loyalty_rules1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_rules2`
--
ALTER TABLE `loyalty_rules2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ref_offer_rule`
--
ALTER TABLE `ref_offer_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_offer_tc`
--
ALTER TABLE `ref_offer_tc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_offers`
--
ALTER TABLE `store_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD KEY `user_branch_id` (`branch`);

--
-- Indexes for table `user_transactions`
--
ALTER TABLE `user_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `cashier_id` (`cashier_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loyality_offers`
--
ALTER TABLE `loyality_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `loyalty_rules`
--
ALTER TABLE `loyalty_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `loyalty_rules1`
--
ALTER TABLE `loyalty_rules1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loyalty_rules2`
--
ALTER TABLE `loyalty_rules2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_offer_rule`
--
ALTER TABLE `ref_offer_rule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_offer_tc`
--
ALTER TABLE `ref_offer_tc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT for table `store_offers`
--
ALTER TABLE `store_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `user_transactions`
--
ALTER TABLE `user_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loyality_offers`
--
ALTER TABLE `loyality_offers`
  ADD CONSTRAINT `loyality_branch` FOREIGN KEY (`branch_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `store_offers`
--
ALTER TABLE `store_offers`
  ADD CONSTRAINT `branch_id` FOREIGN KEY (`branch_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_branch_id` FOREIGN KEY (`branch`) REFERENCES `stores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
