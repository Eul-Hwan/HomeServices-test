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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
	(8, '2021_10_13_102043_create_service_categories_table', 3),
	(9, '2021_10_15_035629_create_services_table', 4),
	(10, '2021_10_26_234207_add_featured_to_services_table', 5),
	(11, '2021_10_27_075449_add_featured_to_service_categories_table', 6),
	(12, '2021_10_27_113942_create_sliders_table', 7);
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

-- 테이블 hs.services 구조 내보내기
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_category_id` bigint(20) unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `discount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inclusion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclusion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_slug_unique` (`slug`),
  KEY `services_service_category_id_foreign` (`service_category_id`),
  CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.services:~20 rows (대략적) 내보내기
DELETE FROM `services`;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `name`, `slug`, `tagline`, `service_category_id`, `price`, `discount`, `discount_type`, `image`, `thumbnail`, `description`, `inclusion`, `exclusion`, `status`, `created_at`, `updated_at`, `featured`) VALUES
	(1, 'aperiam perspiciatis voluptatibus atque', 'aperiam-perspiciatis-voluptatibus-atque', 'Molestias et ex eum.', 18, 190.00, NULL, NULL, 'service_4.jpg', 'service_4.jpg', 'Distinctio rem voluptatem modi aliquam laudantium et. Dolore vero in similique in voluptate. Et fugiat delectus fugiat debitis molestiae. Voluptas recusandae a cumque beatae vel iure voluptatem. Reiciendis autem rerum sit et ea maiores aut. Et fuga sunt vitae id. Corrupti ut aut corporis excepturi. Consequatur ipsam sapiente a soluta voluptatem ad. Nihil rem mollitia est enim. Quia maiores mollitia alias quasi nihil. Rem sint et id ratione velit odit et.', 'Et voluptatem qui.|Nihil quo non.|Dolorum qui.|Cumque veritatis.|Illo placeat enim.', 'Dicta voluptas est.|Laborum non.|Aperiam dolorem qui.|Autem ducimus.|Ab voluptatem unde.', 1, '2021-10-15 10:09:31', '2021-10-27 00:32:05', 1),
	(2, 'voluptatem doloremque odio culpa', 'voluptatem-doloremque-odio-culpa', 'At qui fuga.', 5, 321.00, NULL, NULL, 'service_10.jpg', 'service_10.jpg', 'Quos alias et magni non at nulla aut qui. Non fuga tempore quisquam adipisci. Dicta error recusandae error dolores velit voluptatem dolorum. Temporibus quam sed amet earum corrupti voluptate et qui. Molestiae quibusdam tempora placeat odit voluptas. Eaque tenetur est et qui distinctio. Sunt vitae ut et doloremque perferendis aspernatur enim. Eos impedit asperiores vitae est. Soluta ducimus adipisci amet ut voluptate rerum ipsam.', 'Quibusdam quibusdam.|Veritatis ut maxime.|Et consequatur quia.|Et dolores illo.|Harum excepturi id.', 'Placeat dignissimos.|Aut neque optio.|Consectetur.|Nihil eaque tenetur.|Nihil provident ea.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(3, 'eum dolor repudiandae voluptas', 'eum-dolor-repudiandae-voluptas', 'Voluptatem ullam.', 15, 161.00, NULL, NULL, 'service_13.jpg', 'service_13.jpg', 'Harum officia corrupti dolor totam quas voluptas et. Repellendus nam ipsam quasi voluptas laudantium doloremque nesciunt. Ducimus eos qui tempora error. Laborum aliquid ratione facilis velit vel eveniet adipisci vero. Quis eum debitis facere qui excepturi quis similique molestias. Repudiandae provident est ea esse dolor. Voluptatem autem eos temporibus ratione ut qui sunt. Dolore iusto quia ex delectus numquam.', 'Rerum reiciendis.|Ut iusto sit vero.|Enim quo qui.|Ullam possimus.|Culpa autem.', 'Asperiores possimus.|Et quia consectetur.|Illum quisquam.|Qui adipisci rem.|Ipsa animi mollitia.', 1, '2021-10-15 10:09:31', '2021-10-27 00:32:45', 1),
	(4, 'eos accusantium nihil cum', 'eos-accusantium-nihil-cum', 'Ducimus et aut eos.', 20, 491.00, NULL, NULL, 'service_18.jpg', 'service_18.jpg', 'Non reiciendis dicta rerum illo. Enim est quos nesciunt dolores. Perferendis et consequatur molestiae est ut voluptas fugiat magnam. Eos ut illum dolorem nihil. Commodi doloremque necessitatibus eaque est quia. Ipsum eum qui dolor et aut. Dolores ab et molestiae velit et voluptas. Quia sint aut ab et quam et fugit tempora. Eligendi natus voluptas dolores. Consequatur incidunt velit officiis voluptatem et odit fugit. Molestias tenetur sit voluptatum commodi.', 'Voluptatem ut nobis.|Aut perferendis.|Aliquam iusto.|Omnis eaque rerum.|Error debitis et.', 'Ex nulla sint sint.|Est enim maiores.|Neque aut ea.|Qui velit aut omnis.|Perspiciatis.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(5, 'atque reprehenderit vitae expedita', 'atque-reprehenderit-vitae-expedita', 'Ratione quaerat aut.', 17, 600.00, NULL, NULL, '1635075481.jpg', '1635075481.jpg', 'Perferendis sed consequatur aut corporis libero hic id. Asperiores aut similique ea qui. Omnis recusandae commodi occaecati. Debitis quidem delectus dolores omnis perferendis impedit qui. Voluptatem harum eaque ut quisquam reprehenderit. Voluptatem qui recusandae necessitatibus debitis perferendis rem. Ipsam ea deleniti quam tempora. Eos soluta dolore est et aut totam ea. Dolor illum earum voluptate repellendus voluptatem minus. Ut ex quo pariatur fuga excepturi.', 'Fugit officia.|Nobis tempora.|Aliquid aut sunt.|Dolores sunt.|Nihil nihil sint.', 'Voluptate vel eos.|Eligendi non enim.|Officia unde iure.|Corrupti asperiores.|Repellat incidunt.', 1, '2021-10-15 10:09:31', '2021-10-24 11:38:01', 0),
	(6, 'sit adipisci neque enim', 'sit-adipisci-neque-enim', 'Voluptatum sint.', 3, 121.00, NULL, NULL, 'service_12.jpg', 'service_12.jpg', 'Ut modi vel non dolor nesciunt. Incidunt aliquam eos deserunt et sit neque repellendus. Molestias explicabo nostrum enim nostrum. Nobis rerum blanditiis repellendus est dolor sunt. Voluptatem assumenda minus commodi fugiat tempore velit. Similique provident autem quia omnis explicabo iste. Aliquam consequuntur impedit ut eaque eos cupiditate. Minus exercitationem eaque molestias voluptates quia. Aut qui occaecati omnis mollitia.', 'Quidem asperiores.|Occaecati aut cum.|Pariatur vel.|Qui ducimus animi.|Voluptatibus aut.', 'Voluptates quae.|Tempora rerum ea.|Voluptas quibusdam.|Hic itaque sint.|Distinctio quia.', 1, '2021-10-15 10:09:31', '2021-10-27 00:33:55', 1),
	(7, 'voluptatibus provident ut modi', 'voluptatibus-provident-ut-modi', 'Nobis eum aut.', 5, 319.00, NULL, NULL, 'service_3.jpg', 'service_3.jpg', 'Perferendis iste modi ipsa. Voluptas magni est quis cupiditate ut aut optio. Et pariatur unde corporis dolor ullam nostrum repellendus enim. Repellat dignissimos nulla ipsa beatae nulla id quibusdam. Perspiciatis iusto dolorem accusamus voluptas ipsum nesciunt repellendus. Possimus reiciendis ea ratione labore nisi dolorum minima dicta. Et deleniti est voluptates.', 'Nulla eius quia.|Laborum est dolorem.|Voluptas rerum sunt.|Possimus aliquid.|Sit enim.', 'Illo id similique.|Et nostrum et hic.|Non nulla non iusto.|Dolores magni.|Consequatur qui.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(8, 'alias quo quam eveniet', 'alias-quo-quam-eveniet', 'Perferendis.', 2, 461.00, NULL, NULL, 'service_17.jpg', 'service_17.jpg', 'Et assumenda delectus ut dolorem architecto facilis. Qui reprehenderit minus et doloribus. Et atque deserunt quis aut ullam et. Ut rerum facere saepe voluptatum neque. Cupiditate sit quibusdam aliquam quis distinctio facilis vel. Odit numquam placeat impedit magnam dicta modi. Id odio corporis non qui odit officiis quia. Iure quae dolor perferendis quia et voluptatem beatae.', 'Odio commodi sint.|Aut architecto quia.|Non eaque eveniet.|In atque libero.|Iusto ad facere et.', 'Inventore harum.|Harum eligendi at.|Est dolor voluptas.|Quibusdam porro est.|Voluptatem voluptas.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(9, 'ratione est aut et', 'ratione-est-aut-et', 'Qui doloribus qui.', 8, 180.00, 10.00, 'percent', 'service_6.jpg', 'service_6.jpg', 'Cupiditate dolor dolores sunt impedit. Consectetur et id quas labore consequuntur ipsum beatae sed. Accusamus quisquam qui impedit eum. Nostrum quo exercitationem consectetur eius magni dolores. Sunt aut ex et non inventore officiis itaque distinctio. Eligendi tenetur voluptate in qui. Beatae hic sit pariatur veniam tenetur qui. Voluptatem eligendi aut sequi porro quod unde nulla.', 'Dolores alias quae.|Eos et sint.|Repellat deserunt.|Non quis animi sed.|Quo quasi eos velit.', 'Ut provident.|Id nulla non.|Quaerat laboriosam.|Dolorum rem beatae.|Earum debitis neque.', 1, '2021-10-15 10:09:31', '2021-10-25 01:23:30', 0),
	(10, 'exercitationem odit quos fuga', 'exercitationem-odit-quos-fuga', 'Deleniti ad quia.', 18, 280.00, NULL, NULL, 'service_7.jpg', 'service_7.jpg', 'Quia quis est rerum qui repudiandae nostrum quis. Ab cupiditate et reprehenderit repellendus molestiae quis numquam. Quae earum pariatur sint. Repellat corrupti qui distinctio repudiandae. Placeat modi assumenda et. Ullam blanditiis vero eligendi sequi. Sunt esse qui nihil cum qui sit neque ab. Quibusdam velit at odit voluptate ipsum necessitatibus. Alias fuga magnam quod neque dicta sit.', 'Suscipit doloribus.|Est omnis et sint.|Similique similique.|Quod sit illum.|Accusantium ab.', 'Itaque officia quos.|Cum omnis.|Voluptas aut et et.|Ut molestiae eum.|Iusto quidem ut.', 1, '2021-10-15 10:09:31', '2021-10-27 00:34:55', 1),
	(11, 'culpa quo earum mollitia', 'culpa-quo-earum-mollitia', 'Perferendis est.', 7, 285.00, NULL, NULL, 'service_5.jpg', 'service_5.jpg', 'Quisquam quia possimus dolorem molestias nobis necessitatibus placeat. Eos in qui ut labore similique qui. Maiores rerum veritatis dolor perspiciatis sit. Sunt rem est vitae perferendis non ut quam repudiandae. Possimus eum quasi est necessitatibus quia vel et fugiat. Quam ipsam laborum voluptas porro sint et. Ab ut aspernatur quia et dicta eaque omnis. Cum enim minima libero quae facilis.', 'Facilis optio.|Dolores omnis velit.|Occaecati id et et.|Voluptate fugiat.|Dolores.', 'Ea soluta similique.|Et minima iste vel.|Officiis dolores.|Est nisi debitis.|Corporis ut quo.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(12, 'dolorem eaque iure esse', 'dolorem-eaque-iure-esse', 'Vitae deserunt unde.', 6, 233.00, NULL, NULL, 'service_8.jpg', 'service_8.jpg', 'Dicta eos necessitatibus est corrupti vitae. Aliquam hic aut veniam iste. Autem eum esse aut tempore consequatur rerum doloribus aperiam. Et quo odio a sapiente et eveniet molestiae sit. Et est eius nesciunt praesentium quis et nesciunt qui. Excepturi quis eveniet est illum dolorem assumenda natus. Perferendis impedit sunt non deserunt. Dignissimos ab aut possimus suscipit quod exercitationem. Excepturi et alias maiores doloremque ut sed provident quisquam.', 'Aut excepturi.|Dicta dolore.|Veniam facilis.|Dolor iure.|Harum architecto.', 'Ducimus nostrum.|Sit pariatur itaque.|Beatae dolorem.|Dolores consequatur.|Eligendi aspernatur.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(13, 'aspernatur voluptas repellat et', 'aspernatur-voluptas-repellat-et', 'Quis omnis sed vero.', 5, 147.00, NULL, NULL, 'service_16.jpg', 'service_16.jpg', 'Laboriosam neque itaque provident ullam cum. Corrupti laborum similique quasi. Ut soluta pariatur aperiam dolores. Praesentium quaerat ut in dolor error nostrum voluptates. Placeat dolor optio ut magnam. Nulla non qui neque omnis aut in. Sint est atque itaque voluptatem sapiente. Et laborum vero maiores fugit consequatur dolorem. Enim quia expedita eius. Eveniet ea quod cumque adipisci. Et aut perspiciatis aliquid. Molestias qui sit dolorem facere ea libero aut id.', 'Saepe quia ad totam.|Quisquam.|Natus laborum et.|Porro dolores.|Quaerat officiis.', 'Ad totam et velit.|Ut quaerat est.|Laborum distinctio.|Dolores odio aut.|Odio facere.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(14, 'tempora aliquam blanditiis ea', 'tempora-aliquam-blanditiis-ea', 'Libero totam quasi.', 12, 116.00, NULL, NULL, 'service_2.jpg', 'service_2.jpg', 'Dolor non ea corrupti et eligendi. Illo occaecati aut dolorum ut est mollitia velit. Consequatur voluptatem dignissimos iste et dolore sit doloremque. Molestias eligendi porro excepturi sint animi. Temporibus iste error quia consequuntur quia odio. Consequatur nostrum quae fugit voluptatem illo rerum. Est quisquam nam corporis repellat maxime et voluptas.', 'Non rerum deserunt.|Ut excepturi est.|Ut qui officiis.|Aut praesentium.|Ut nostrum voluptas.', 'Velit rerum libero.|Fugiat qui qui.|Assumenda culpa.|Exercitationem.|Repudiandae nihil.', 1, '2021-10-15 10:09:31', '2021-10-15 10:09:31', 0),
	(15, 'blanditiis quia natus molestiae', 'blanditiis-quia-natus-molestiae', 'Unde fugit sit.', 5, 188.00, NULL, NULL, 'service_1.jpg', 'service_1.jpg', 'Tenetur debitis et est sint numquam. Quidem doloremque sed pariatur animi in vel. Voluptates voluptatem officia occaecati et nisi odit ipsam laborum. Adipisci iusto molestiae aut sit quaerat et. Error laboriosam magni recusandae voluptatibus dolorem quia suscipit. Exercitationem rem enim consequuntur quo sit hic aut. Minus soluta vitae earum aut occaecati et ut.', 'Nulla maxime.|Beatae voluptatem.|Necessitatibus eius.|Dolor est qui.|Veritatis nam.', 'Ut numquam nihil id.|Et magnam sed illo.|Blanditiis.|Consequatur.|Sit officiis aut.', 1, '2021-10-15 10:09:31', '2021-10-27 06:06:10', 1),
	(16, 'non enim dolorem et', 'non-enim-dolorem-et', 'Aperiam non.', 5, 217.00, NULL, NULL, 'service_9.jpg', 'service_9.jpg', 'Enim beatae culpa voluptatum quos ducimus nemo. Aut temporibus aut animi reprehenderit ut cupiditate optio pariatur. Qui asperiores dolorem at et perferendis aperiam. Qui assumenda a dolorum illum. Odio ut sed et tenetur ipsam quibusdam ad blanditiis. Ea enim exercitationem tempore. Quod ex rerum sit qui amet blanditiis quaerat rerum. Mollitia quibusdam voluptas quos labore eum molestias molestiae.', 'Tenetur similique.|Illo voluptas atque.|Porro suscipit amet.|Dolor placeat non.|Enim repudiandae.', 'Qui harum enim.|Distinctio aliquid.|Exercitationem.|Aut quisquam.|Quia ut ipsam.', 1, '2021-10-15 10:09:32', '2021-10-15 10:09:32', 0),
	(17, 'dolorem saepe quo nostrum', 'dolorem-saepe-quo-nostrum', 'Beatae voluptas.', 13, 251.00, NULL, NULL, 'service_14.jpg', 'service_14.jpg', 'Adipisci qui quas beatae expedita odio adipisci quod. Nobis maxime placeat voluptate provident unde dolore sunt. Suscipit suscipit est quam dicta fuga cum expedita. Pariatur quis consequatur sit praesentium. Eum optio qui fugit. Eaque consectetur saepe culpa provident et. Est molestias praesentium accusantium qui qui quam.', 'Minima autem.|Adipisci quo.|Error et voluptas.|Provident mollitia.|Cum perspiciatis ut.', 'Voluptas similique.|Blanditiis totam.|Quis nihil.|Quaerat atque et.|Ipsum cum esse.', 1, '2021-10-15 10:09:32', '2021-10-27 06:07:33', 1),
	(18, 'qui autem laborum est', 'qui-autem-laborum-est', 'Dolor molestias.', 14, 259.00, NULL, NULL, 'service_15.jpg', 'service_15.jpg', 'Ullam laborum culpa officia dolor exercitationem ex. Alias beatae placeat alias ullam dolor dolore qui ut. Voluptas provident aut sed quam laborum id consequatur. Ea laborum quo repellat. Qui qui enim dolorem rem non. Cum ipsa sed est minus voluptas non cumque. Tempore corporis debitis provident magni sit voluptatem magnam et. Sequi placeat deleniti id mollitia est ad. Est in quam odio distinctio qui nam sequi. Eaque illo qui delectus deserunt.', 'Eum ducimus.|Hic mollitia non.|Ab architecto ut ex.|Commodi.|Exercitationem odio.', 'Nemo aliquam.|Vel est occaecati.|Repellat minus ut.|In porro ut beatae.|Id eos labore harum.', 1, '2021-10-15 10:09:32', '2021-10-27 06:05:35', 1),
	(19, 'voluptas harum reprehenderit dolorem', 'voluptas-harum-reprehenderit-dolorem', 'Et esse ducimus.', 6, 294.00, NULL, NULL, 'service_19.jpg', 'service_19.jpg', 'Sed qui ut necessitatibus id. Et totam quod labore quibusdam sequi non sint. Aliquid quis veniam unde. Dolorum quia ipsum consectetur odio commodi sit rerum ut. Assumenda id minima quia omnis porro. Nemo similique excepturi in officiis accusamus veniam. Nobis qui velit voluptatem fugit aliquam accusantium. Qui enim voluptates ut hic aut eos ut incidunt.', 'Dicta vel aut.|Aut placeat.|Tenetur consectetur.|Ex quos explicabo.|Consequatur qui non.', 'Soluta temporibus.|Vel fuga laudantium.|Dolor quis.|Et velit et sit.|Non architecto modi.', 1, '2021-10-15 10:09:32', '2021-10-15 10:09:32', 0),
	(20, 'sit suscipit odit explicabo', 'sit-suscipit-odit-explicabo', 'Animi accusantium.', 14, 352.00, NULL, NULL, 'service_20.jpg', 'service_20.jpg', 'Aut molestias culpa debitis. Magnam occaecati dolor facilis placeat ad unde. Ipsum et tempore magni aut non. Officia sed qui velit cumque minima fugiat qui. Occaecati est sed sit natus. A ea vero amet molestiae est laboriosam aliquid. Quas adipisci est et cum nam. Et a repellat labore. Alias esse doloremque incidunt repudiandae aut provident. Quisquam itaque sequi nemo doloribus.', 'Quisquam quaerat.|Consequatur ipsum.|Tenetur et vel.|Excepturi vel.|Et sit magni enim.', 'Voluptate quos.|Qui blanditiis iure.|Reprehenderit.|Sunt harum dolorem.|Numquam enim.', 1, '2021-10-15 10:09:32', '2021-10-27 06:04:13', 1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- 테이블 hs.service_categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `service_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `service_categories_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.service_categories:~19 rows (대략적) 내보내기
DELETE FROM `service_categories`;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
INSERT INTO `service_categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`, `featured`) VALUES
	(2, 'Beauty', 'beauty', '1521969358.png', NULL, NULL, 0),
	(3, 'Plumbing', 'plumbing', '1521969409.png', NULL, NULL, 0),
	(5, 'Shower Filter', 'shower-filter', '1521969430.png', NULL, '2021-10-27 08:43:55', 1),
	(6, 'Home Cleaning', 'home-cleaning', '1521969446.png', NULL, '2021-10-27 08:23:15', 1),
	(7, 'Carpentry', 'carpentry', '1521969454.png', NULL, NULL, 0),
	(8, 'Pest Control', 'pest-control', '1521969464.png', NULL, NULL, 0),
	(9, 'Chimney Hob', 'chimney-hob', '1521969490.png', NULL, NULL, 0),
	(10, 'Water Purifier', 'water-purifier', '1521972593.png', NULL, '2021-10-27 08:23:52', 1),
	(11, 'Computer Repair', 'computer-repair', '1521969512.png', NULL, NULL, 0),
	(12, 'TV', 'tv', '1521969522.png', NULL, '2021-10-27 08:38:21', 1),
	(13, 'Refrigerator', 'refrigerator', '1521969536.png', NULL, '2021-10-27 08:39:32', 1),
	(14, 'Geyser', 'geyser', '1521969558.png', NULL, NULL, 0),
	(15, 'Car', 'car', '1521969576.png', NULL, '2021-10-27 08:39:56', 1),
	(16, 'Document', 'document', '1521974355.png', NULL, '2021-10-27 08:40:13', 1),
	(17, 'Movers & Packers', 'movers-packers', '1521969599.png', NULL, NULL, 0),
	(18, 'Home Automation', 'home-automation', '1521969622.png', NULL, '2021-10-27 08:43:05', 1),
	(19, 'Laundry', 'laundry', '1521972624.png', NULL, NULL, 0),
	(20, 'Painting', 'painting', '1521972643.png', NULL, NULL, 0);
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

-- 테이블 데이터 hs.sessions:~1 rows (대략적) 내보내기
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('7CJb469AqTFkUVBOwJN0QeQo5fOPKtGWLsa025bA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibWxRYTRJN0JrSEIzZUNBS1IwN01RcndDcUZ5ZW5obE1yS0FsNUppTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ3aVJ6WE5JZENUZk0xM0c1dHB0a2wuRzZpSDVpL1RxdnB6ZlJqMHdObjljZVl4N0lEY1pkQyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkN2lSelhOSWRDVGZNMTNHNXRwdGtsLkc2aUg1aS9UcXZwemZSajB3Tm45Y2VZeDdJRGNaZEMiO30=', 1635384491);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- 테이블 hs.sliders 구조 내보내기
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 hs.sliders:~2 rows (대략적) 내보내기
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'First Slide 1', '1635380340.jpg', 1, '2021-10-27 13:23:24', '2021-10-28 01:28:06'),
	(3, 'Second Slide', '1635384416.jpg', 1, '2021-10-28 01:26:56', '2021-10-28 01:26:56');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

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
