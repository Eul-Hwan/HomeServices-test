-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.6-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6318
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- hs 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `hs` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `hs`;

-- 테이블 hs.failed_jobs 구조 내보내기
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.failed_jobs:~0 rows (대략적) 내보내기
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- 테이블 hs.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.migrations:~8 rows (대략적) 내보내기
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2021_10_12_084808_create_sessions_table', 1),
	(7, '2021_10_13_070905_add_phone_to_users_table', 2),
	(8, '2021_10_13_102043_create_service_categories_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 hs.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.password_resets:~0 rows (대략적) 내보내기
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- 테이블 hs.personal_access_tokens 구조 내보내기
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.personal_access_tokens:~0 rows (대략적) 내보내기
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- 테이블 hs.service_categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `service_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_categories_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.service_categories:~20 rows (대략적) 내보내기
DELETE FROM `service_categories`;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
INSERT INTO `service_categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'AC', 'ac', '1521969345.png', NULL, NULL),
	(2, 'Beauty', 'beauty', '1521969358.png', NULL, NULL),
	(3, 'Plumbing', 'plumbing', '1521969409.png', NULL, NULL),
	(4, 'Electrical', 'electrical', '1521969419.png', NULL, NULL),
	(5, 'Shower Filter', 'shower-filter', '1521969430.png', NULL, NULL),
	(6, 'Home Cleaning', 'home-cleaning', '1521969446.png', NULL, NULL),
	(7, 'Carpentry', 'carpentry', '1521969454.png', NULL, NULL),
	(8, 'Pest Control', 'pest-control', '1521969464.png', NULL, NULL),
	(9, 'Chimney Hob', 'chimney-hob', '1521969490.png', NULL, NULL),
	(10, 'Water Purifier', 'water-purifier', '1521972593.png', NULL, NULL),
	(11, 'Computer Repair', 'computer-repair', '1521969512.png', NULL, NULL),
	(12, 'TV', 'tv', '1521969522.png', NULL, NULL),
	(13, 'Refrigerator', 'refrigerator', '1521969536.png', NULL, NULL),
	(14, 'Geyser', 'geyser', '1521969558.png', NULL, NULL),
	(15, 'Car', 'car', '1521969576.png', NULL, NULL),
	(16, 'Document', 'document', '1521974355.png', NULL, NULL),
	(17, 'Movers & Packers', 'movers-packers', '1521969599.png', NULL, NULL),
	(18, 'Home Automation', 'home-automation', '1521969622.png', NULL, NULL),
	(19, 'Laundry', 'laundry', '1521972624.png', NULL, NULL),
	(20, 'Painting', 'painting', '1521972643.png', NULL, NULL);
/*!40000 ALTER TABLE `service_categories` ENABLE KEYS */;

-- 테이블 hs.sessions 구조 내보내기
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.sessions:~8 rows (대략적) 내보내기
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('18sehUGylr7CAyIrXjjiKf67goG7MpurY2rNGEtk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHV1cXE2MGpPRnhMQmp4bWlVY3FCYm5WTGlvY1kwdUVMMzdGYVppdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1634049996),
	('9gccKh0KC1y3wfbWnRPnuYpjUL1xnNxMlqy56GyM', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiemUzQkRLaklHR3duTVJTVFRweDhVdWp6WVBlZUVweXphQVdoZXVjRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR6VXZtRFVCSDRRbFBmaFpieGRlL1guMm1DSEEvcHdNRGlDUjdBVjRnV3VZWWRodjRCQ0kxdSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkelV2bURVQkg0UWxQZmhaYnhkZS9YLjJtQ0hBL3B3TURpQ1I3QVY0Z1d1WVlkaHY0QkNJMXUiO30=', 1634038670),
	('9OsAIu1P3XCMiusVpxUeQddjvWScE4laa0lg48sM', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibEpkV0pRNzdxcjVLRklNQUdwNVpFeDRiWlF6NlZibGhvaUhnbFFkdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRKV2FDL1J4TlhNT1JlOWE3T2lIT3cuYXI4VFdDVmVIUXRheUlvWTBsN085b055cFdYaWg0QyI7fQ==', 1634119806),
	('BBOAl98ZNsYegYWtHJDNjWelqS4JSshn7jnxNNFi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZXh0M3JORmZONVlRUWpjQ3JuR2swOGFxMHVSTEgxRU8wUWljdHk4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zZXJ2aWNlLWNhdGVnb3JpZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkN2lSelhOSWRDVGZNMTNHNXRwdGtsLkc2aUg1aS9UcXZwemZSajB3Tm45Y2VZeDdJRGNaZEMiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDdpUnpYTklkQ1RmTTEzRzV0cHRrbC5HNmlINWkvVHF2cHpmUmowd05uOWNlWXg3SURjWmRDIjt9', 1634130541),
	('dTjQhCwcHSiJe7eMbTJXC1Bl6CFpJgmpbnaCiDhU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlIwb0lzMnhPTUxVOWc1dnA1VkhYb2U5d0tBVnNCdG1mNlBsNkRxVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1634087783),
	('h4hyuDKuacUhBFQyI7qYWRkBjhHTIZ6m1SD3f6oi', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidUZFSFU0UDRqNXRBRjJDd3JJNjlwZExVcVBZaFdSeExRcWZuMFA3ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jdXN0b21lci9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkelV2bURVQkg0UWxQZmhaYnhkZS9YLjJtQ0hBL3B3TURpQ1I3QVY0Z1d1WVlkaHY0QkNJMXUiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHpVdm1EVUJINFFsUGZoWmJ4ZGUvWC4ybUNIQS9wd01EaUNSN0FWNGdXdVlZZGh2NEJDSTF1Ijt9', 1634040523),
	('pv9QeCEGQVFSKcztL5VO5kyVLdr9I5IkedLcSfno', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZWlhdnU2RmoxakJyUlRCSVoxR2s5bDNkNHUyY0k2cDd2ZmQ1SGZuZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1634037299),
	('qXaPGwgII2hyPHwLd6vk3jOZpujXwzkojfb8E8BY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWXBXMms5VDFiY0ZRTmFqaG1paDFIa0M4elV4RGhCQlpyaFlGMkRQZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1634033989);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- 테이블 hs.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CST',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.users:~5 rows (대략적) 내보내기
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`, `phone`) VALUES
	(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$7iRzXNIdCTfM13G5tptkl.G6iH5i/TqvpzfRj0wNn9ceYx7IDcZdC', NULL, NULL, NULL, NULL, NULL, 'ADM', '2021-10-12 10:19:44', '2021-10-12 10:19:44', NULL),
	(2, 'S Provider', 'sprovider@sprovider.com', NULL, '$2y$10$f9xz07nZ7q93Yhnz5nunO.OU9gs8wf4mgrXB46ECaSTNCF8GNSmtO', NULL, NULL, NULL, NULL, NULL, 'SVP', '2021-10-12 10:22:38', '2021-10-12 10:22:38', NULL),
	(3, 'Customer', 'customer@customer.com', NULL, '$2y$10$zUvmDUBH4QlPfhZbxde/X.2mCHA/pwMDiCR7AV4gWuYYdhv4BCI1u', NULL, NULL, NULL, NULL, NULL, 'CST', '2021-10-12 10:24:14', '2021-10-12 10:24:14', NULL),
	(4, '아이유', 'IU@IU.com', NULL, '$2y$10$kXg05L/OwOdnyp4EqeUFNOK/oJP2lFaXRRtahBqLn337HN10OccRy', NULL, NULL, NULL, NULL, NULL, 'SVP', '2021-10-13 10:07:29', '2021-10-13 10:07:29', '1234567890'),
	(5, '김고은', 'KimKoEun@Kim.com', NULL, '$2y$10$JWaC/RxNXMORe9a7OiHOw.ar8TWCVeHQtayIoY0l7O9oNypWXih4C', NULL, NULL, NULL, NULL, NULL, 'CST', '2021-10-13 10:10:06', '2021-10-13 10:10:06', '0987654321');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
