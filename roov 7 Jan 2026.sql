-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 01:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roov`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `subject_type`, `subject_id`, `description`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 1, 'Input Komisi Masuk Rp 10,000,000 (Ref: 545645)', '127.0.0.1', '2025-12-21 01:29:51', '2025-12-21 01:29:51'),
(2, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 2, 'Input Komisi Masuk Rp 50,000,000 (Ref: 45245245)', '127.0.0.1', '2025-12-21 01:30:25', '2025-12-21 01:30:25'),
(3, 20, 'UPDATE_MEMBER', 'App\\Models\\User', 8, 'Update Data: Status: active -> suspended', '127.0.0.1', '2025-12-21 02:48:41', '2025-12-21 02:48:41'),
(4, 2, 'PAID', NULL, NULL, 'Berhasil! Transaksi #545645 telah dicairkan. Diproses oleh 1. Direktur A1', NULL, '2025-12-21 03:07:27', '2025-12-21 03:07:27'),
(5, 20, 'PAID', NULL, NULL, 'Berhasil! Transaksi #45245245 telah dicairkan. Diproses oleh Founder Empat', NULL, '2025-12-21 03:08:12', '2025-12-21 03:08:12'),
(6, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 3, 'Input Komisi Masuk Rp 30,000,000 (Ref: asdfasdfasdf)', '127.0.0.1', '2025-12-21 07:48:47', '2025-12-21 07:48:47'),
(7, 20, 'PAID', 'App\\Models\\Sale', 3, 'Berhasil! Transaksi #asdfasdfasdf telah dicairkan. Diproses oleh Founder Empat', '127.0.0.1', '2025-12-21 07:52:15', '2025-12-21 07:52:15'),
(8, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 4, 'Input Komisi Masuk Rp 25,000,000 (Ref: adfasdfas)', '127.0.0.1', '2025-12-21 07:52:58', '2025-12-21 07:52:58'),
(9, 20, 'CANCEL', 'App\\Models\\Sale', 4, 'Transaksi #adfasdfas telah dibatalkan. Saldo & Poin Karir agen telah ditarik kembali. Diproses oleh Founder Empat', '127.0.0.1', '2025-12-21 08:02:43', '2025-12-21 08:02:43'),
(10, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 5, 'Input Komisi Masuk Rp 15,000,000 (Ref: asdfasdfasdfasdfas)', '127.0.0.1', '2025-12-21 08:03:18', '2025-12-21 08:03:18'),
(11, 20, 'PAID', 'App\\Models\\Sale', 5, 'Berhasil! Transaksi #asdfasdfasdfasdfas telah dicairkan. Diproses oleh Founder Empat', '127.0.0.1', '2025-12-21 08:03:33', '2025-12-21 08:03:33'),
(12, 20, 'INPUT_COMMISSION', 'App\\Models\\Sale', 6, 'Input Komisi Masuk Rp 25,000,000 (Ref: asdfasdfasdfasdfasd)', '127.0.0.1', '2025-12-21 08:15:42', '2025-12-21 08:15:42'),
(13, 20, 'PAID', 'App\\Models\\Sale', 6, 'Berhasil! Transaksi #asdfasdfasdfasdfasd telah dicairkan. Diproses oleh Founder Empat', '127.0.0.1', '2025-12-21 08:16:27', '2025-12-21 08:16:27'),
(14, 1, 'INPUT_COMMISSION', 'App\\Models\\Sale', 7, 'Input Komisi Masuk Rp 50,000,000 (Ref: asdfasdfasd)', '127.0.0.1', '2026-01-07 05:36:37', '2026-01-07 05:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `level_id_at_transaction` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage_applied` decimal(5,2) NOT NULL DEFAULT 0.00,
  `calculation_base` decimal(20,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) NOT NULL,
  `payment_status` enum('pending','unpaid','processing','paid','cancelled') NOT NULL DEFAULT 'pending',
  `withdrawal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `sales_id`, `user_id`, `type`, `level_id_at_transaction`, `percentage_applied`, `calculation_base`, `amount`, `payment_status`, `withdrawal_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'personal', 4, 70.00, 10000000.00, 7000000.00, 'paid', NULL, 'Komisi Personal (70%)', '2025-12-21 01:29:50', '2025-12-21 03:07:26'),
(2, 1, 2, 'overriding', 4, 9.00, 3000000.00, 270000.00, 'paid', NULL, 'Overriding dari 2. Senior Mgr B1-1 (9%)', '2025-12-21 01:29:51', '2025-12-21 03:07:26'),
(3, 1, NULL, 'company_share', NULL, 0.00, 0.00, 2730000.00, 'paid', NULL, 'Netto Perusahaan', '2025-12-21 01:29:51', '2025-12-21 03:07:26'),
(4, 2, 9, 'personal', 1, 50.00, 50000000.00, 25000000.00, 'paid', NULL, 'Komisi Personal (50%)', '2025-12-21 01:30:25', '2025-12-21 03:08:12'),
(5, 2, 4, 'overriding', 1, 5.00, 25000000.00, 1250000.00, 'paid', NULL, 'Overriding dari 3. Digital Agent D1 (5%)', '2025-12-21 01:30:25', '2025-12-21 03:08:12'),
(6, 2, NULL, 'company_share', NULL, 0.00, 0.00, 23750000.00, 'paid', NULL, 'Netto Perusahaan', '2025-12-21 01:30:25', '2025-12-21 03:08:12'),
(7, 3, 5, 'personal', 3, 60.00, 30000000.00, 18000000.00, 'paid', NULL, 'Komisi Personal (60%)', '2025-12-21 07:48:47', '2025-12-21 07:52:15'),
(8, 3, 2, 'overriding', 3, 12.00, 12000000.00, 1440000.00, 'paid', NULL, 'Overriding dari 2. Manager B1-2 (12%)', '2025-12-21 07:48:47', '2025-12-21 07:52:15'),
(9, 3, NULL, 'company_share', NULL, 0.00, 0.00, 10560000.00, 'paid', NULL, 'Netto Perusahaan', '2025-12-21 07:48:47', '2025-12-21 07:52:15'),
(13, 5, 4, 'personal', 4, 70.00, 15000000.00, 10500000.00, 'paid', NULL, 'Komisi Personal (70%)', '2025-12-21 08:03:18', '2025-12-21 08:03:33'),
(14, 5, 2, 'overriding', 4, 9.00, 4500000.00, 405000.00, 'paid', NULL, 'Overriding dari 2. Senior Mgr B1-1 (9%)', '2025-12-21 08:03:18', '2025-12-21 08:03:33'),
(15, 5, NULL, 'company_share', NULL, 0.00, 0.00, 4095000.00, 'paid', NULL, 'Netto Perusahaan', '2025-12-21 08:03:18', '2025-12-21 08:03:33'),
(16, 6, 11, 'personal', 1, 50.00, 25000000.00, 12500000.00, 'paid', NULL, 'Komisi Personal (50%)', '2025-12-21 08:15:42', '2025-12-21 08:16:27'),
(17, 6, 5, 'overriding', 1, 5.00, 12500000.00, 625000.00, 'paid', NULL, 'Overriding dari 3. Digital Agent D2 (5%)', '2025-12-21 08:15:42', '2025-12-21 08:16:27'),
(18, 6, NULL, 'company_share', NULL, 0.00, 0.00, 11875000.00, 'paid', NULL, 'Netto Perusahaan', '2025-12-21 08:15:42', '2025-12-21 08:16:27'),
(19, 7, 2, 'personal', 5, 70.00, 50000000.00, 35000000.00, 'unpaid', NULL, 'Komisi Personal (70%)', '2026-01-07 05:36:37', '2026-01-07 05:36:37'),
(20, 7, 1, 'overriding', 5, 6.00, 15000000.00, 900000.00, 'unpaid', NULL, 'Overriding dari 1. Direktur A1 (6%)', '2026-01-07 05:36:37', '2026-01-07 05:36:37'),
(21, 7, NULL, 'company_share', NULL, 0.00, 0.00, 14100000.00, 'unpaid', NULL, 'Netto Perusahaan', '2026-01-07 05:36:37', '2026-01-07 05:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE `developers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `default_commission_percent` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`id`, `name`, `code`, `address`, `default_commission_percent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ciputra Group', NULL, 'Surabaya Barat', 3.00, '2025-12-14 08:32:38', '2025-12-14 08:32:38', NULL),
(2, 'Pakuwon Jati', NULL, 'Surabaya Pusat', 2.50, '2025-12-14 08:32:38', '2025-12-14 08:32:38', NULL),
(3, 'Intiland', NULL, 'Surabaya Timur', 3.50, '2025-12-14 08:32:38', '2025-12-14 08:32:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_accumulated` decimal(20,2) NOT NULL DEFAULT 0.00,
  `max_accumulated` decimal(20,2) DEFAULT NULL,
  `commission_percent_sales` int(11) NOT NULL,
  `commission_percent_company` int(11) NOT NULL,
  `overriding_percent_from_company` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `code`, `name`, `min_accumulated`, `max_accumulated`, `commission_percent_sales`, `commission_percent_company`, `overriding_percent_from_company`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'digital', 'Digital Agent', 0.00, 0.00, 50, 50, 5, NULL, NULL, NULL),
(2, 'new_agent', 'New Agent', 1.00, 500000000.00, 50, 50, 15, NULL, NULL, NULL),
(3, 'manager', 'Manajer', 500000001.00, 1000000000.00, 60, 40, 12, NULL, NULL, NULL),
(4, 'senior_manager', 'Senior Manajer', 1000000001.00, 2000000000.00, 70, 30, 9, NULL, NULL, NULL),
(5, 'director', 'Direktur', 2000000001.00, NULL, 70, 30, 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level_histories`
--

CREATE TABLE `level_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `current_level` varchar(255) NOT NULL,
  `new_level` varchar(255) NOT NULL,
  `accumulated_commission_snapshot` decimal(20,2) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT 'auto_promote',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_leads`
--

CREATE TABLE `member_leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supabase_lead_id` varchar(50) DEFAULT NULL,
  `sales_phone` varchar(20) NOT NULL,
  `lead_name` varchar(150) DEFAULT NULL,
  `lead_phone` varchar(20) DEFAULT NULL,
  `ad_source` varchar(255) DEFAULT NULL,
  `user_message` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'New',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_leads`
--

INSERT INTO `member_leads` (`id`, `supabase_lead_id`, `sales_phone`, `lead_name`, `lead_phone`, `ad_source`, `user_message`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'lead_gen_1', '0844444440', 'Budi Prospek (FB)', '08123456002', 'FB Ads - Cluster A', 'Halo, mau tanya harga cash keras.', 'New', NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40'),
(2, 'lead_gen_2', '0844444440', 'Siti Survey (IG)', '08123456993', 'IG Ads - Promo', 'Saya mau jadwal survey minggu depan.', 'Survey', 'Jadwal belum fix, follow up lagi besok.', '2025-12-12 08:32:40', '2025-12-14 08:32:40'),
(3, 'lead_gen_3', '0844444441', 'Budi Prospek (FB)', '08123456004', 'FB Ads - Cluster A', 'Halo, mau tanya harga cash keras.', 'New', NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40'),
(4, 'lead_gen_4', '0844444441', 'Siti Survey (IG)', '08123456995', 'IG Ads - Promo', 'Saya mau jadwal survey minggu depan.', 'Survey', 'Jadwal belum fix, follow up lagi besok.', '2025-12-12 08:32:40', '2025-12-14 08:32:40'),
(5, 'lead_gen_5', '0844444442', 'Budi Prospek (FB)', '08123456006', 'FB Ads - Cluster A', 'Halo, mau tanya harga cash keras.', 'New', NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40'),
(6, 'lead_gen_6', '0844444442', 'Siti Survey (IG)', '08123456997', 'IG Ads - Promo', 'Saya mau jadwal survey minggu depan.', 'Survey', 'Jadwal belum fix, follow up lagi besok.', '2025-12-12 08:32:40', '2025-12-14 08:32:40'),
(7, 'lead_gen_7', '0844444443', 'Budi Prospek (FB)', '08123456008', 'FB Ads - Cluster A', 'Halo, mau tanya harga cash keras.', 'New', NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40'),
(8, 'lead_gen_8', '0844444443', 'Siti Survey (IG)', '08123456999', 'IG Ads - Promo', 'Saya mau jadwal survey minggu depan.', 'Survey', 'Jadwal belum fix, follow up lagi besok.', '2025-12-12 08:32:40', '2025-12-14 08:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_01_090849_create_developers_table', 1),
(5, '2025_12_01_101502_create_levels_table', 1),
(6, '2025_12_01_101509_create_sales_table', 1),
(7, '2025_12_01_101513_create_commissions_table', 1),
(8, '2025_12_01_103140_create_level_histories_table', 1),
(9, '2025_12_01_104142_create_yearly_stats_table', 1),
(10, '2025_12_01_124945_create_settings_table', 1),
(11, '2025_12_02_025405_setup_withdrawal_tables', 1),
(12, '2025_12_02_032602_add_role_and_create_activity_logs', 1),
(13, '2025_12_02_094734_add_bank_details_to_users_table', 1),
(14, '2025_12_03_104636_add_details_to_commissions_table', 1),
(15, '2025_12_05_000000_add_soft_deletes_to_tables', 1),
(16, '2025_12_09_034155_create_member_leads_table', 1),
(17, '2025_12_10_144928_create_properties_table', 2),
(18, '2025_12_11_135710_add_features_to_properties_table', 2),
(19, '2025_12_11_141006_add_complex_details_to_properties_table', 2),
(20, '2025_12_11_141527_add_photo_to_properties_table', 2),
(21, '2025_12_18_131416_add_is_price_start_from_to_properties_table', 3),
(22, '2025_12_20_163827_add_listing_owner_to_properties_table', 3),
(23, '2025_12_21_054623_add_role_to_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `is_price_start_from` tinyint(1) NOT NULL DEFAULT 0,
  `listing_type` enum('primary','secondary','lelang') NOT NULL,
  `property_type` enum('rumah','tanah','apartemen','ruko','gudang') NOT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `maid_bedrooms` int(11) NOT NULL DEFAULT 0,
  `bathrooms` int(11) DEFAULT NULL,
  `maid_bathrooms` int(11) NOT NULL DEFAULT 0,
  `land_area` int(11) DEFAULT NULL,
  `building_area` int(11) DEFAULT NULL,
  `floor_count` int(11) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `has_pool` tinyint(1) NOT NULL DEFAULT 0,
  `has_carport` tinyint(1) NOT NULL DEFAULT 0,
  `has_garden` tinyint(1) NOT NULL DEFAULT 0,
  `electricity` int(11) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `furnishing` varchar(255) DEFAULT NULL,
  `water_source` varchar(255) DEFAULT NULL,
  `garage_size` int(11) NOT NULL DEFAULT 0,
  `carport_size` int(11) NOT NULL DEFAULT 0,
  `is_hook` tinyint(1) NOT NULL DEFAULT 0,
  `has_canopy` tinyint(1) NOT NULL DEFAULT 0,
  `has_smart_home` tinyint(1) NOT NULL DEFAULT 0,
  `has_fence` tinyint(1) NOT NULL DEFAULT 0,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `google_maps_link` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `listing_officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `photo`, `gallery`, `slug`, `description`, `price`, `is_price_start_from`, `listing_type`, `property_type`, `bedrooms`, `maid_bedrooms`, `bathrooms`, `maid_bathrooms`, `land_area`, `building_area`, `floor_count`, `certificate`, `has_pool`, `has_carport`, `has_garden`, `electricity`, `orientation`, `furnishing`, `water_source`, `garage_size`, `carport_size`, `is_hook`, `has_canopy`, `has_smart_home`, `has_fence`, `city`, `district`, `address`, `google_maps_link`, `meta_title`, `meta_description`, `is_active`, `user_id`, `listing_officer_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Modern Tropical House di Citraland', 'https://images.unsplash.com/photo-1600596542815-e32c2159f828?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1600607687644-c7171b42498f?q=80&w=1200\",\"https:\\/\\/images.unsplash.com\\/photo-1556912173-3db9963f63db?q=80&w=1200\"]', 'modern-tropical-house-di-citraland-2394', 'Hunian modern tropical dengan sirkulasi udara terbaik. Lokasi strategis di main road cluster, dekat Universitas Ciputra.\n\nFasilitas Lengkap:\n- Smart Home System\n- Kanopi Alderon\n- Air PDAM Lancar', 5500000000, 0, 'primary', 'rumah', 4, 1, 3, 1, 200, 280, 2, 'HGB', 0, 1, 1, 5500, 'Selatan', 'Semi Furnished', 'PDAM', 1, 2, 0, 1, 1, 1, 'Surabaya', 'Lakarsantri', 'Northwest Park Blok A No. 12', 'http://maps.google.com', NULL, NULL, 1, 16, NULL, '2025-12-14 08:33:17', '2025-12-14 08:33:17', NULL),
(2, 'Rumah Sultan Classic Hook Pakuwon City', 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1600566753190-17f0baa2a6c3?q=80&w=1200\",\"https:\\/\\/images.unsplash.com\\/photo-1600585154340-be6161a56a0c?q=80&w=1200\"]', 'rumah-sultan-classic-hook-pakuwon-city-8106', 'Rumah mewah gaya klasik mediterania. Posisi Hook dengan taman samping luas dan kolam renang pribadi.', 18500000000, 0, 'secondary', 'rumah', 5, 2, 5, 1, 450, 700, 2, 'SHM', 1, 1, 1, 13000, 'Utara', 'Full Furnished', 'PDAM & Sumur', 2, 2, 1, 0, 0, 1, 'Surabaya', 'Mulyorejo', 'Grand Island Cluster San Diego', 'http://maps.google.com', NULL, NULL, 1, 16, NULL, '2025-12-14 08:33:17', '2025-12-14 08:33:17', NULL),
(3, 'Apartemen Ciputra World 2BR View City', 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1502672260266-1c1ef2d93688?q=80&w=1200\"]', 'apartemen-ciputra-world-2br-view-city-8650', 'Apartemen siap huni di atas Mall Ciputra World Surabaya. Akses langsung ke Mall dan Hotel.', 1800000000, 0, 'secondary', 'apartemen', 2, 0, 1, 0, 0, 64, 30, 'Strata Title', 1, 0, 0, 3500, 'Timur', 'Full Furnished', 'PDAM', 0, 0, 0, 0, 1, 0, 'Surabaya', 'Dukuh Pakis', 'The Via & Vue Towers', 'http://maps.google.com', NULL, NULL, 1, 16, NULL, '2025-12-14 08:33:18', '2025-12-14 08:33:18', NULL),
(4, 'Rumah Minimalis Siap Huni di Rungkut', 'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1584622650111-993a426fbf0a?q=80&w=1200\"]', 'rumah-minimalis-siap-huni-di-rungkut-3500', 'Rumah second terawat, cocok untuk keluarga muda. Dekat UPN dan MERR. Lingkungan aman one gate system.', 950000000, 0, 'secondary', 'rumah', 2, 0, 1, 0, 72, 45, 1, 'SHM', 0, 1, 0, 1300, 'Barat', 'Semi Furnished', 'PDAM', 0, 1, 0, 1, 0, 1, 'Surabaya', 'Rungkut', 'Perumahan Rungkut Asri Timur', 'http://maps.google.com', NULL, NULL, 1, 16, NULL, '2025-12-14 08:33:18', '2025-12-14 08:33:18', NULL),
(5, 'Ruko 3 Lantai Nol Jalan MERR', 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1497366216548-37526070297c?q=80&w=1200\"]', 'ruko-3-lantai-nol-jalan-merr-3455', 'Ruko baru gress, sangat strategis di jalan kembar MERR. Cocok untuk kantor, bank, atau resto.', 3200000000, 0, 'primary', 'ruko', 0, 0, 3, 0, 67, 200, 3, 'HGB', 0, 0, 0, 4400, 'Timur', 'Unfurnished', 'PDAM', 0, 0, 0, 0, 0, 0, 'Surabaya', 'Sukolilo', 'Jl. Dr. Ir. H. Soekarno (MERR)', 'http://maps.google.com', NULL, NULL, 1, 16, NULL, '2025-12-14 08:33:18', '2025-12-14 08:33:18', NULL),
(6, 'Rumah Sultan Classic Hook Pakuwon City', 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1600566753190-17f0baa2a6c3?q=80&w=1200\",\"https:\\/\\/images.unsplash.com\\/photo-1600585154340-be6161a56a0c?q=80&w=1200\"]', 'rumah-sultan-classic-hook-pakuwon-city-4005', 'Rumah mewah gaya klasik mediterania di cluster paling elite. Posisi Hook dengan taman samping luas dan kolam renang pribadi.\n\nFasilitas:\n- Private Pool & Jacuzzi\n- Full Marmer Import Italy\n- Ruang Karaoke Kedap Suara', 18500000000, 0, 'secondary', 'rumah', 5, 2, 5, 1, 450, 700, 2, 'SHM', 1, 1, 1, 13000, 'Utara', 'Full Furnished', 'PDAM', 2, 2, 1, 0, 1, 1, 'Surabaya', 'Mulyorejo', 'Grand Island Cluster San Diego', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(7, 'Modern Tropical House di Graha Famili', 'https://images.unsplash.com/photo-1600596542815-e32c2159f828?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1600607687644-c7171b42498f?q=80&w=1200\"]', 'modern-tropical-house-di-graha-famili-9347', 'Hunian modern tropical dengan view lapangan golf. Desain arsitek ternama, sirkulasi udara sangat baik.', 25000000000, 0, 'secondary', 'rumah', 6, 2, 6, 1, 600, 900, 3, 'SHM', 1, 1, 1, 22000, 'Timur', 'Semi Furnished', 'PDAM', 4, 2, 0, 1, 1, 0, 'Surabaya', 'Wiyung', 'Graha Famili Blok K', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(8, 'Rumah Baru Gress di Wisata Bukit Mas', 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1570129477492-45c003edd2be?q=80&w=1200\"]', 'rumah-baru-gress-di-wisata-bukit-mas-4226', 'Rumah baru gress minimalis modern. Lokasi depan taman, row jalan lebar 3 mobil. Siap huni.', 3200000000, 0, 'primary', 'rumah', 3, 1, 3, 1, 120, 180, 2, 'HGB', 0, 1, 1, 4400, 'Selatan', 'Unfurnished', 'PDAM', 0, 2, 0, 1, 0, 1, 'Surabaya', 'Lakarsantri', 'Wisata Bukit Mas 2', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(9, 'Rumah Minimalis Siap Huni Rungkut', 'https://images.unsplash.com/photo-1583608205776-bfd35f0d9f8e?q=80&w=1200&auto=format&fit=crop', '[]', 'rumah-minimalis-siap-huni-rungkut-2452', 'Rumah terawat di Rungkut Asri. Dekat UPN dan MERR. Cocok untuk keluarga muda.', 1250000000, 0, 'secondary', 'rumah', 3, 0, 2, 0, 100, 90, 1, 'SHM', 0, 1, 0, 2200, 'Barat', 'Semi Furnished', 'PDAM', 0, 1, 0, 1, 0, 1, 'Surabaya', 'Rungkut', 'Rungkut Asri Tengah', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(10, 'Rumah Murah di Gunung Anyar', 'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?q=80&w=1200&auto=format&fit=crop', '[]', 'rumah-murah-di-gunung-anyar-4659', 'Rumah sederhana harga terjangkau di Surabaya Timur. Dekat OERR (Jalan Lingkar Luar Timur). Bebas banjir.', 650000000, 0, 'secondary', 'rumah', 2, 0, 1, 0, 72, 45, 1, 'SHM', 0, 1, 0, 1300, 'Utara', 'Unfurnished', 'PDAM', 0, 1, 0, 0, 0, 1, 'Surabaya', 'Gunung Anyar', 'Gunung Anyar Tambak', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(11, 'Apartemen Ciputra World 2BR View City', 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1502672260266-1c1ef2d93688?q=80&w=1200\"]', 'apartemen-ciputra-world-2br-view-city-2546', 'Apartemen premium di atas Mall Ciputra World. Akses langsung mall. Full Furnished interior mewah.', 1800000000, 0, 'secondary', 'apartemen', 2, 0, 1, 0, 0, 64, 30, 'Strata Title', 1, 0, 0, 3500, 'Timur', 'Full Furnished', 'PDAM', 0, 0, 0, 0, 1, 0, 'Surabaya', 'Dukuh Pakis', 'The Via & Vue Towers', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(12, 'Apartemen Puncak Benson Studio Murah', 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1200&auto=format&fit=crop', '[]', 'apartemen-puncak-benson-studio-murah-3740', 'Jual rugi unit studio di Puncak Benson Pakuwon. View pool. Cocok untuk mahasiswa unesa/pakuwon.', 350000000, 0, 'secondary', 'apartemen', 1, 0, 1, 0, 0, 21, 15, 'Strata Title', 1, 0, 0, 1300, 'Barat', 'Unfurnished', 'PDAM', 0, 0, 0, 0, 0, 0, 'Surabaya', 'Wiyung', 'Puncak Benson Lontar', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(13, 'Ruko 3 Lantai Nol Jalan MERR', 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1200&auto=format&fit=crop', '[\"https:\\/\\/images.unsplash.com\\/photo-1497366216548-37526070297c?q=80&w=1200\"]', 'ruko-3-lantai-nol-jalan-merr-8137', 'Ruko strategis di jalan utama MERR. Area parkir luas. Cocok untuk Bank, Klinik, atau Kantor.', 3500000000, 0, 'primary', 'ruko', 0, 0, 3, 0, 67, 200, 3, 'HGB', 0, 1, 0, 5500, 'Timur', 'Unfurnished', 'PDAM', 0, 4, 0, 0, 0, 0, 'Surabaya', 'Sukolilo', 'Jl. Dr. Ir. H. Soekarno', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(14, 'Ruko HR Muhammad 4 Lantai', 'https://images.unsplash.com/photo-1464938050520-ef2270bb8ce8?q=80&w=1200&auto=format&fit=crop', '[]', 'ruko-hr-muhammad-4-lantai-1972', 'Ruko premium di kawasan bisnis HR Muhammad Surabaya Barat. Lift Ready. Kondisi terawat.', 8000000000, 0, 'secondary', 'ruko', 0, 0, 4, 0, 100, 350, 4, 'SHM', 0, 1, 0, 11000, 'Selatan', 'Semi Furnished', 'PDAM', 0, 2, 0, 1, 1, 1, 'Surabaya', 'Dukuh Pakis', 'Jl. HR Muhammad', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(15, 'Tanah Kavling Siap Bangun Graha Famili', 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1200&auto=format&fit=crop', '[]', 'tanah-kavling-siap-bangun-graha-famili-1726', 'Tanah kavling posisi premium di dalam cluster elite. Bentuk kotak presisi. Hadap Utara.', 15000000000, 0, 'secondary', 'tanah', 0, 0, 0, 0, 600, 0, 0, 'SHM', 0, 0, 0, 0, 'Utara', 'Unfurnished', 'PDAM', 0, 0, 0, 0, 0, 0, 'Surabaya', 'Wiyung', 'Graha Famili Blok Z', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(16, 'Tanah Komersial Jalan Raya Darmo', 'https://images.unsplash.com/photo-1524813686514-a57563d77965?q=80&w=1200&auto=format&fit=crop', '[]', 'tanah-komersial-jalan-raya-darmo-2580', 'Tanah langka di jalan protokol raya darmo. Cocok untuk gedung kantor atau hotel. Ijin komersial.', 50000000000, 0, 'secondary', 'tanah', 0, 0, 0, 0, 1000, 0, 0, 'SHM', 0, 0, 0, 0, 'Barat', 'Unfurnished', 'PDAM', 0, 0, 0, 0, 0, 0, 'Surabaya', 'Tegalsari', 'Jl. Raya Darmo', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(17, 'Gudang Margomulyo Indah Siap Pakai', 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=1200&auto=format&fit=crop', '[]', 'gudang-margomulyo-indah-siap-pakai-4943', 'Gudang siap pakai di kawasan industri Margomulyo. Akses kontainer 40 feet. Bebas banjir.', 8500000000, 0, 'secondary', 'gudang', 0, 0, 2, 0, 500, 400, 1, 'HGB', 0, 1, 0, 23000, 'Selatan', 'Unfurnished', 'PDAM', 0, 5, 0, 1, 0, 1, 'Surabaya', 'Tandes', 'Kawasan Industri Margomulyo', NULL, NULL, NULL, 1, 16, NULL, '2025-12-14 08:42:45', '2025-12-14 08:42:45', NULL),
(18, 'asdfsdfa', 'properties/cover_6946af95ccc6e.webp', '[\"properties\\/gal_6946af968f377.webp\",\"properties\\/gal_6946af982f2d9.webp\",\"properties\\/gal_6946af9914bc8.webp\",\"properties\\/gal_6946af9adcc8d.webp\",\"properties\\/gal_6946af9cb5358.webp\"]', 'asdfsdfa-383', 'asdfasdf', 100000000, 0, 'primary', 'rumah', 1, 0, 1, 0, 100, 20, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 'Surabaya', 'Kendangsari', 'asdfasdf', NULL, 'asdfsdfa', 'asdfasdf', 1, 1, NULL, '2025-12-20 07:15:57', '2025-12-20 07:15:57', NULL),
(19, 'asdfasdf', 'properties/cover_6946b10206a10.webp', '[\"properties\\/gal_6946b102cd71e.webp\",\"properties\\/gal_6946b103976a7.webp\",\"properties\\/gal_6946b1054268c.webp\",\"properties\\/gal_6946b106065f3.webp\"]', 'asdfasdf-197', 'sdfasdf', 41212120, 0, 'primary', 'rumah', 1, 0, 1, 0, 100, 50, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 'Surabaya', 'Kendangsari', 'Kendangsari', NULL, 'asdfasdf', 'sdfasdf', 1, 1, NULL, '2025-12-20 07:21:59', '2025-12-20 07:21:59', NULL),
(20, 'rythjghjmghmg', 'properties/cover_6946b35cdd3c2.webp', '[\"properties\\/gal_6946b35eddff4.webp\",\"properties\\/gal_6946b360982f6.webp\",\"properties\\/gal_6946b3614c639.webp\"]', 'rythjghjmghmg-129', 'sdwertwert', 1000000, 0, 'primary', 'rumah', 1, 0, 1, 0, 100, 50, 1, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, 0, 1, 0, 'Surabaya', 'Wiyung', 'asdfasdf', NULL, 'rythjghjmghmg', 'sdwertwert', 1, 1, NULL, '2025-12-20 07:32:03', '2025-12-20 07:32:03', NULL),
(21, 'TRwserasdf', 'properties/cover_6946d90e81c01.webp', '[]', 'trwserasdf-506', '', 1000000000, 0, 'secondary', 'rumah', 0, 0, 0, 0, 100, 50, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 'Kab. Pasuruan', 'Lumbang', 'asdfasdf', NULL, NULL, NULL, 1, 1, 5, '2025-12-20 10:12:48', '2025-12-20 10:12:48', NULL),
(22, 'asdfasdfasdfasdfsadf', 'properties/cover_6946dcacebf83.webp', '[]', 'asdfasdfasdfasdfsadf-451', 'asdfasdfasdfasdfasdfasdfasdfsadf', 200000000, 0, 'primary', 'rumah', 0, 0, 0, 0, 100, 50, NULL, NULL, 0, 1, 0, 2200, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 'Kota Surabaya', 'Gubeng', 'ertsdfgsdfgsdftsdrtsd', NULL, NULL, NULL, 1, 1, 1, '2025-12-20 10:28:13', '2025-12-20 10:28:13', NULL),
(23, 'Test final', 'properties/cover_6946e36c4006e.webp', '[\"properties\\/gal_6946e37028fc9.webp\",\"properties\\/gal_6946e3711fac4.webp\",\"properties\\/gal_6946e371d0b76.webp\",\"properties\\/gal_6946e3721caf0.webp\"]', 'test-final-460', 'asdfaseraogoakfl;asmkdlfapsf', 4752400000, 0, 'primary', 'tanah', 0, 0, 0, 0, 100, 0, 1, 'SHM - Sertifikat Hak Milik', 1, 0, 0, 2200, 'Utara', 'unfurnished', NULL, 0, 0, 0, 0, 1, 1, 'Kota Surabaya', 'Wiyung', 'adfasdfasdfasdfasdfasdfasdf', NULL, NULL, NULL, 1, 1, 1, '2025-12-20 10:57:07', '2025-12-20 10:57:07', NULL),
(24, 'sdfgsdfgsdfgsdfgs', 'properties/cover_6946e47c4c07a.webp', '[\"properties\\/gal_6946e47d2bb92.webp\",\"properties\\/gal_6946e47de4740.webp\",\"properties\\/gal_6946e47eaac4c.webp\"]', 'sdfgsdfgsdfgsdfgs-449', 'sdfgsdfgsdfgsdfgghjfghjfgh', 4524540523, 0, 'secondary', 'rumah', 0, 0, 0, 0, 100, 100, 1, NULL, 0, 1, 1, NULL, NULL, 'unfurnished', NULL, 0, 0, 0, 0, 0, 0, 'Kab. Mojokerto', 'Gedeg', 'dfghdfghdfghdfgh', NULL, NULL, NULL, 1, 1, 1, '2025-12-20 11:01:35', '2025-12-20 11:01:35', NULL),
(25, 'ertuytyjfghjfghjfg', 'properties/cover_6946e54293927.webp', '[\"properties\\/gal_6946e544b1818.webp\",\"properties\\/gal_6946e545717d3.webp\",\"properties\\/gal_6946e5462bf8f.webp\"]', 'ertuytyjfghjfghjfg-907', 'hjfghjfghjfghjfghjhjkghjk', 452453453, 0, 'secondary', 'rumah', 0, 0, 0, 0, 100, 50, 1, NULL, 0, 1, 0, NULL, NULL, 'unfurnished', NULL, 0, 0, 0, 0, 0, 0, 'Kab. Sidoarjo', 'Prambon', '456456456453jl;jkl;', NULL, NULL, NULL, 1, 1, 1, '2025-12-20 11:04:54', '2025-12-20 11:04:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `developer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_code` varchar(255) NOT NULL,
  `total_commission_amount` decimal(20,2) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `status` enum('process','paid','cancel') NOT NULL DEFAULT 'process',
  `transaction_date` date NOT NULL,
  `disbursed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `developer_id`, `user_id`, `transaction_code`, `total_commission_amount`, `buyer_name`, `buyer_phone`, `buyer_email`, `status`, `transaction_date`, `disbursed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '545645', 10000000.00, '645', '04524534534', 'dfgsdfg@asdfasdf', 'paid', '2025-12-21', NULL, '2025-12-21 01:29:50', '2025-12-21 03:07:26'),
(2, 1, 9, '45245245', 50000000.00, '245245', '24524524524524', '4524254@afasdfas', 'paid', '2025-12-21', NULL, '2025-12-21 01:30:25', '2025-12-21 03:08:12'),
(3, 1, 5, 'asdfasdfasdf', 30000000.00, 'asdfasdfasdf', '4524545450', 'asdfsd@fasdf', 'paid', '2025-12-21', NULL, '2025-12-21 07:48:47', '2025-12-21 07:52:15'),
(4, 1, 4, 'adfasdfas', 25000000.00, 'dfasdfasdfas', '40450245045', 'sdfsd@fasdfad', 'cancel', '2025-12-21', NULL, '2025-12-21 07:52:58', '2025-12-21 08:02:43'),
(5, 2, 4, 'asdfasdfasdfasdfas', 15000000.00, 'asdfasdfsadf', '245245245', '452452@fdasdfa', 'paid', '2025-12-21', NULL, '2025-12-21 08:03:18', '2025-12-21 08:03:33'),
(6, 2, 11, 'asdfasdfasdfasdfasd', 25000000.00, 'asdfasdfasdfasd', '0251312312', 'asdf@adfasdf', 'paid', '2025-12-21', NULL, '2025-12-21 08:15:42', '2025-12-21 08:16:27'),
(7, 1, 2, 'asdfasdfasd', 50000000.00, 'asdfasdfasdf', '452452452452', 'asdfsd@fasdfa', 'process', '2026-01-07', NULL, '2026-01-07 05:36:37', '2026-01-07 05:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1iOb2ieLex5Uv4BPIVE0zAHnsK0D5OnWzDpTOt7n', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOHhpNzBjeXVTdVJtZ05SbkpqSTd2MVYxZ0tzaTV1djlTUnNqN3U2TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767789430);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','finance','member') NOT NULL DEFAULT 'member',
  `is_super_user` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `upline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level_code` varchar(255) NOT NULL DEFAULT 'digital',
  `accumulated_commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `personal_sales_volume` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','suspended','resigned') NOT NULL DEFAULT 'active',
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `ktp_number` varchar(255) DEFAULT NULL,
  `transaction_pin` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `is_super_user`, `password`, `username`, `phone`, `upline_id`, `level_code`, `accumulated_commission`, `personal_sales_volume`, `status`, `bank_name`, `account_number`, `account_name`, `ktp_number`, `transaction_pin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '0. Founder Utama', 'founder@roov.id', 'admin', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'founder', '081234567890', NULL, 'director', 10000900000.00, 10000000000.00, 'active', NULL, NULL, NULL, NULL, '$2y$12$/0X6o5g266G7JjBndVbsTuqoTff13N8zc1HbNY/dZwtdSjBpUT8Xe', NULL, '2025-12-14 08:32:40', '2026-01-07 05:36:37', NULL),
(2, '1. Direktur A1', 'direktur1@roov.id', 'admin', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'direktur1', '0811111111', 1, 'director', 2537115000.00, 2535000000.00, 'active', NULL, NULL, NULL, NULL, '$2y$12$.30mXIwues3PTK8SgBEIF.Q/SKJNcpLED/NP.F.7vKmJKddqTT8x6', NULL, '2025-12-14 08:32:40', '2026-01-07 05:36:37', NULL),
(3, '1. Direktur A2', 'direktur2@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'direktur2', '0811111112', 1, 'director', 2500000000.00, 2500000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(4, '2. Senior Mgr B1-1', 'seniormgr1@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'seniormgr1', '0822222220', 2, 'senior_manager', 1218750000.00, 1217500000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-21 08:03:18', NULL),
(5, '2. Manager B1-2', 'manager1@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'manager1', '0822222230', 2, 'manager', 618625000.00, 618000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-21 08:15:42', NULL),
(6, '2. Senior Mgr B2-1', 'seniormgr2@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'seniormgr2', '0822222221', 3, 'senior_manager', 1200000000.00, 1200000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(7, '2. Manager B2-2', 'manager2@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'manager2', '0822222231', 3, 'manager', 600000000.00, 600000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(8, '3. New Agent C1', 'newagent1@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'newagent1', '0833333330', 4, 'new_agent', 50000000.00, 50000000.00, 'suspended', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-21 02:48:40', NULL),
(9, '3. Digital Agent D1', 'digital1@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'digital1', '0844444440', 4, 'digital', 25000000.00, 25000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-21 01:30:25', NULL),
(10, '3. New Agent C2', 'newagent2@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'newagent2', '0833333331', 5, 'new_agent', 50000000.00, 50000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(11, '3. Digital Agent D2', 'digital2@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'digital2', '0844444441', 5, 'digital', 12500000.00, 12500000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-21 08:15:42', NULL),
(12, '3. New Agent C3', 'newagent3@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'newagent3', '0833333332', 6, 'new_agent', 50000000.00, 50000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(13, '3. Digital Agent D3', 'digital3@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'digital3', '0844444442', 6, 'digital', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(14, '3. New Agent C4', 'newagent4@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'newagent4', '0833333333', 7, 'new_agent', 50000000.00, 50000000.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(15, '3. Digital Agent D4', 'digital4@roov.id', 'member', 0, '$2y$12$K1nvgRlXsJd7NT5ZAFTizuTk2BoKeTMsSLkxbG7vyNDjFvRWIIiIe', 'digital4', '0844444443', 7, 'digital', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:32:40', '2025-12-14 08:32:40', NULL),
(16, 'Admin Roov', 'admin@roov.com', 'member', 0, '$2y$12$0KXSZdinpWN6PEN7bOh0guE07/EorZRVemAH3UEuQDZPwdNdByWkO', NULL, NULL, NULL, 'digital', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 08:33:17', '2025-12-14 08:33:17', NULL),
(17, 'Founder Satu', 'founder1@roov.id', 'admin', 1, '$2y$12$oAohuI5HijF0fjspocbxee/7yclHC6zeJkx7yYDndVJNVwlg7s5lW', 'founder1', NULL, NULL, 'director', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-21 00:30:13', '2025-12-21 00:32:52', NULL),
(18, 'Founder Dua', 'founder2@roov.id', 'admin', 1, '$2y$12$5Wz4ps0RphtUNat1vn88f.ojb1xtiZyxr11QvwXEnQNCFEVK1lKKS', 'founder2', NULL, NULL, 'director', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-21 00:30:13', '2025-12-21 00:32:53', NULL),
(19, 'Founder Tiga', 'founder3@roov.id', 'admin', 1, '$2y$12$uJRi7LDEWZocEeAnMcKR2.YADWH5pMluF8.yK5p5kw.1adLK7QQfa', 'founder3', NULL, NULL, 'director', 0.00, 0.00, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-21 00:30:14', '2025-12-21 00:32:53', NULL),
(20, 'Founder Empat', 'founder4@roov.id', 'admin', 1, '$2y$12$O2lMQCgPUWWOjFcsOuuXb.MkfF35IBBoWcVBFJInWr.21eEz9TGcS', 'founder4', NULL, NULL, 'director', 10000000000.00, 10000000000.00, 'active', NULL, NULL, NULL, NULL, '$2y$12$q1Z/qpEAlk1wHYQJW0uB/O2624YkHgKlKD5cP4BDW5K1iHpBY2wh6', NULL, '2025-12-21 00:30:15', '2025-12-21 01:33:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `proof_image` varchar(255) DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yearly_stats`
--

CREATE TABLE `yearly_stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `tier1_commission_generated` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tier2_commission_generated` decimal(20,2) NOT NULL DEFAULT 0.00,
  `tier1_active_count` int(11) NOT NULL DEFAULT 0,
  `tier2_active_count` int(11) NOT NULL DEFAULT 0,
  `is_qualified_director_bonus` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`),
  ADD KEY `activity_logs_subject_type_subject_id_index` (`subject_type`,`subject_id`);

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
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commissions_sales_id_foreign` (`sales_id`),
  ADD KEY `commissions_user_id_foreign` (`user_id`),
  ADD KEY `commissions_level_id_at_transaction_foreign` (`level_id_at_transaction`);

--
-- Indexes for table `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `developers_code_unique` (`code`);

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
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `levels_code_unique` (`code`);

--
-- Indexes for table `level_histories`
--
ALTER TABLE `level_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `member_leads`
--
ALTER TABLE `member_leads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_leads_supabase_lead_id_unique` (`supabase_lead_id`),
  ADD KEY `member_leads_sales_phone_index` (`sales_phone`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `properties_slug_unique` (`slug`),
  ADD KEY `properties_user_id_foreign` (`user_id`),
  ADD KEY `properties_price_listing_type_property_type_index` (`price`,`listing_type`,`property_type`),
  ADD KEY `properties_listing_type_index` (`listing_type`),
  ADD KEY `properties_property_type_index` (`property_type`),
  ADD KEY `properties_city_index` (`city`),
  ADD KEY `properties_district_index` (`district`),
  ADD KEY `properties_listing_officer_id_foreign` (`listing_officer_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_transaction_code_unique` (`transaction_code`),
  ADD KEY `sales_developer_id_foreign` (`developer_id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_upline_id_index` (`upline_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_user_id_foreign` (`user_id`);

--
-- Indexes for table `yearly_stats`
--
ALTER TABLE `yearly_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `yearly_stats_user_id_year_unique` (`user_id`,`year`),
  ADD KEY `yearly_stats_year_index` (`year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level_histories`
--
ALTER TABLE `level_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_leads`
--
ALTER TABLE `member_leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yearly_stats`
--
ALTER TABLE `yearly_stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_level_id_at_transaction_foreign` FOREIGN KEY (`level_id_at_transaction`) REFERENCES `levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `commissions_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `level_histories`
--
ALTER TABLE `level_histories`
  ADD CONSTRAINT `level_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_listing_officer_id_foreign` FOREIGN KEY (`listing_officer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `properties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_developer_id_foreign` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`),
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_upline_id_foreign` FOREIGN KEY (`upline_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `yearly_stats`
--
ALTER TABLE `yearly_stats`
  ADD CONSTRAINT `yearly_stats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
