-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour laravel
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `laravel`;

-- Listage de la structure de la table laravel. comments_users_profiles
CREATE TABLE IF NOT EXISTS `comments_users_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `id_gallery` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_users_profiles_user_id_foreign` (`user_id`),
  KEY `comments_users_profiles_id_gallery_foreign` (`id_gallery`),
  CONSTRAINT `comments_users_profiles_id_gallery_foreign` FOREIGN KEY (`id_gallery`) REFERENCES `gallery_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_users_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.comments_users_profiles : ~3 rows (environ)
/*!40000 ALTER TABLE `comments_users_profiles` DISABLE KEYS */;
INSERT INTO `comments_users_profiles` (`id`, `comment`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
	(17, 'cool', 2, 52, '2024-02-06 22:45:12', '2024-02-06 22:45:12'),
	(18, '@MEDENOU Marcos', 4, 52, '2024-02-07 19:32:16', '2024-02-07 19:32:16'),
	(19, 'ldsfsfd<br />\njlsfsld<br />\nsfsf<br />\ndsf<br />\ndsf<br />\ns<br />\nds<br />\nvsf<br />\nvsvfs<br />\nv<br />\nkjhghjg', 4, 52, '2024-02-07 19:41:17', '2024-02-07 19:42:44');
/*!40000 ALTER TABLE `comments_users_profiles` ENABLE KEYS */;

-- Listage de la structure de la table laravel. countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_country` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Listage des données de la table laravel.countries : ~0 rows (environ)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Listage de la structure de la table laravel. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.failed_jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table laravel. followers
CREATE TABLE IF NOT EXISTS `followers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_connect` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_user_id_connect_foreign` (`user_id_connect`),
  KEY `followers_user_id_foreign` (`user_id`),
  CONSTRAINT `followers_user_id_connect_foreign` FOREIGN KEY (`user_id_connect`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.followers : ~12 rows (environ)
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` (`id`, `user_id_connect`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 4, '2023-12-28 10:49:27', '2023-12-28 10:49:27'),
	(2, 4, 2, '2023-12-28 10:49:39', '2023-12-28 10:49:39'),
	(4, 2, 3, '2023-12-28 12:12:40', '2023-12-28 12:12:40'),
	(8, 3, 5, '2023-12-28 16:46:01', '2023-12-28 16:46:01'),
	(9, 3, 6, '2023-12-28 16:48:08', '2023-12-28 16:48:08'),
	(10, 3, 4, '2023-12-28 17:05:20', '2023-12-28 17:05:20'),
	(12, 4, 3, '2023-12-28 17:06:57', '2023-12-28 17:06:57'),
	(13, 6, 4, '2023-12-29 10:07:59', '2023-12-29 10:07:59'),
	(14, 6, 2, '2023-12-29 10:08:31', '2023-12-29 10:08:31'),
	(15, 3, 1, '2024-01-03 13:49:59', '2024-01-03 13:49:59'),
	(16, 4, 1, '2024-02-06 21:32:42', '2024-02-06 21:32:42'),
	(19, 2, 1, '2024-02-07 19:47:28', '2024-02-07 19:47:28');
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;

-- Listage de la structure de la table laravel. gallery_users
CREATE TABLE IF NOT EXISTS `gallery_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_profile` longtext COLLATE utf8mb4_unicode_ci,
  `cover_img` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_users_user_id_foreign` (`user_id`),
  CONSTRAINT `gallery_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.gallery_users : ~5 rows (environ)
/*!40000 ALTER TABLE `gallery_users` DISABLE KEYS */;
INSERT INTO `gallery_users` (`id`, `file_profile`, `cover_img`, `user_id`, `created_at`, `updated_at`) VALUES
	(51, NULL, 'cover-image-65c28f2cea8b76.27492319.jpg', 4, '2024-02-06 19:57:33', '2024-02-06 19:57:33'),
	(52, 'profil-image-65c28f43b468f7.45592792.jpg', NULL, 4, '2024-02-06 19:58:10', '2024-02-06 19:58:10'),
	(53, NULL, 'cover-image-65c2a3720923b0.48903296.jpg', 2, '2024-02-06 21:24:02', '2024-02-06 21:24:02'),
	(54, 'profil-image-65c2a37b3a5b20.55347985.jpg', NULL, 2, '2024-02-06 21:24:13', '2024-02-06 21:24:13'),
	(55, 'profil-image-65c3dee624d8d4.81189608.jpg', NULL, 4, '2024-02-07 19:50:01', '2024-02-07 19:50:01');
/*!40000 ALTER TABLE `gallery_users` ENABLE KEYS */;

-- Listage de la structure de la table laravel. likes_users_profiles
CREATE TABLE IF NOT EXISTS `likes_users_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `id_gallery` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_users_profiles_user_id_foreign` (`user_id`),
  KEY `likes_users_profiles_id_gallery_foreign` (`id_gallery`),
  CONSTRAINT `likes_users_profiles_id_gallery_foreign` FOREIGN KEY (`id_gallery`) REFERENCES `gallery_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_users_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.likes_users_profiles : ~6 rows (environ)
/*!40000 ALTER TABLE `likes_users_profiles` DISABLE KEYS */;
INSERT INTO `likes_users_profiles` (`id`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
	(21, 2, 52, '2024-02-06 22:44:40', '2024-02-06 22:44:40'),
	(22, 4, 52, '2024-02-06 23:02:32', '2024-02-06 23:02:32'),
	(23, 4, 54, '2024-02-07 20:02:42', '2024-02-07 20:02:42'),
	(24, 2, 54, '2024-02-07 20:04:34', '2024-02-07 20:04:34'),
	(25, 2, 55, '2024-02-11 12:17:13', '2024-02-11 12:17:13'),
	(26, 4, 55, '2024-02-11 12:57:55', '2024-02-11 12:57:55');
/*!40000 ALTER TABLE `likes_users_profiles` ENABLE KEYS */;

-- Listage de la structure de la table laravel. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.migrations : ~13 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(4, '2023_12_27_164316_create_countries_table', 1),
	(5, '2023_12_27_164351_create_professions_table', 1),
	(6, '2023_12_27_164878_create_users_table', 1),
	(7, '2023_12_28_164400_create_gallery_users_table', 1),
	(8, '2023_12_28_164717_create_followers_table', 1),
	(9, '2024_01_04_075658_create_likes_users_profiles_table', 2),
	(10, '2024_01_05_085102_create_comments_users_profiles_table', 3),
	(11, '2024_02_07_214154_create_posts_table', 4),
	(12, '2024_02_10_183050_create_tags_posts_table', 5),
	(13, '2024_02_10_204919_create_tags_users_table', 6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table laravel. password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.password_reset_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Listage de la structure de la table laravel. personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.personal_access_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Listage de la structure de la table laravel. posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `video` longtext COLLATE utf8mb4_unicode_ci,
  `bgc` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.posts : ~9 rows (environ)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `uuid`, `user_id`, `body`, `image`, `video`, `bgc`, `created_at`, `updated_at`) VALUES
	(1, 'post-uuid-65c7e578e01aa1.79715414', 4, 'kola', NULL, NULL, 'bg-gradient-to-r from-gray-700 to-lime-700', '2024-02-10 21:07:04', '2024-02-10 21:07:04'),
	(2, 'post-uuid-65c7e58c17fb62.72976159', 2, ' Lorem, ipsum dolor sit amet consectetur adipisicing elit. Explicabo perferendis et, voluptates velit iusto a consequuntur reiciendis dignissimos rerum illo corporis quidem sint quis, repudiandae voluptatem ducimus odio, voluptatibus doloribus itaque sit aperiam. Consectetur, eveniet deleniti reiciendis exercitationem odit placeat cum sequi. Omnis fugiat quaerat fugit ea autem odit quae maxime libero soluta? Nostrum nam maxime sapiente dolorum quam sunt assumenda labore sequi velit, illum aliquid veniam reiciendis dignissimos consequuntur sed culpa! Ad voluptatibus in numquam laborum ea temporibus aliquam possimus laudantium. Mollitia, voluptatum illum! Impedit qui ipsam numquam labore veniam esse perspiciatis aperiam neque? Iure voluptatem consequuntur libero facilis.', NULL, NULL, 'bg-gradient-to-t from-gray-700 to-rose-700', '2024-02-10 21:07:24', '2024-02-10 21:07:24'),
	(3, 'post-uuid-65c7ee2573c009.26034349', 3, 'hjhlhlj;', NULL, NULL, NULL, '2024-02-10 21:44:05', '2024-02-10 21:44:05'),
	(4, 'post-uuid-65c8be94395211.83177432', 3, 'Asdepic', 'post_image_video_65c8be85a033b4.46027716.jpg', NULL, NULL, '2024-02-11 12:33:24', '2024-02-11 12:33:24'),
	(5, 'post-uuid-65c8bf7229bcb2.72779131', 4, NULL, 'post_image_video_65c8bf6f897a16.46303010.jpg', NULL, NULL, '2024-02-11 12:37:06', '2024-02-11 12:37:06'),
	(6, 'post-uuid-65c8bfef22f336.16419475', 3, 'Hate me', NULL, 'post_image_video_65c8bfe652d933.25290716.webm', NULL, '2024-02-11 12:39:11', '2024-02-11 12:39:11'),
	(7, 'post-uuid-65c8e1a05b47f4.30764169', 2, 'test', NULL, NULL, 'bg-gradient-to-r from-gray-700 to-lime-700', '2024-02-11 15:02:56', '2024-02-11 15:02:56'),
	(8, 'post-uuid-65c8e20d2e8428.51586060', 2, 'lhdslfdsl', NULL, 'post_image_video_65c8e20854e146.10243617.webm', NULL, '2024-02-11 15:04:45', '2024-02-11 15:04:45'),
	(9, 'post-uuid-65c8e236136782.96889378', 4, 'post', NULL, NULL, 'bg-gradient-to-br from-gray-700 to-pink-400', '2024-02-11 15:05:26', '2024-02-11 15:05:26');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Listage de la structure de la table laravel. professions
CREATE TABLE IF NOT EXISTS `professions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_profession` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.professions : ~0 rows (environ)
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;

-- Listage de la structure de la table laravel. tags_posts
CREATE TABLE IF NOT EXISTS `tags_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.tags_posts : ~3 rows (environ)
/*!40000 ALTER TABLE `tags_posts` DISABLE KEYS */;
INSERT INTO `tags_posts` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
	(1, 'post-uuid-65c7e578e01aa1.79715414', '2024-02-10 21:07:05', '2024-02-10 21:07:05'),
	(2, 'post-uuid-65c8be94395211.83177432', '2024-02-11 12:33:24', '2024-02-11 12:33:24'),
	(3, 'post-uuid-65c8e236136782.96889378', '2024-02-11 15:05:26', '2024-02-11 15:05:26');
/*!40000 ALTER TABLE `tags_posts` ENABLE KEYS */;

-- Listage de la structure de la table laravel. tags_users
CREATE TABLE IF NOT EXISTS `tags_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_users_user_id_foreign` (`user_id`),
  CONSTRAINT `tags_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.tags_users : ~3 rows (environ)
/*!40000 ALTER TABLE `tags_users` DISABLE KEYS */;
INSERT INTO `tags_users` (`id`, `uuid`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'post-uuid-65c7e578e01aa1.79715414', 2, '2024-02-10 21:07:05', '2024-02-10 21:07:05'),
	(2, 'post-uuid-65c8be94395211.83177432', 4, '2024-02-11 12:33:24', '2024-02-11 12:33:24'),
	(3, 'post-uuid-65c8e236136782.96889378', 2, '2024-02-11 15:05:26', '2024-02-11 15:05:26');
/*!40000 ALTER TABLE `tags_users` ENABLE KEYS */;

-- Listage de la structure de la table laravel. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `id_country` bigint(20) unsigned DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_profession` bigint(20) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_country_foreign` (`id_country`),
  KEY `users_id_profession_foreign` (`id_profession`),
  CONSTRAINT `users_id_country_foreign` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`),
  CONSTRAINT `users_id_profession_foreign` FOREIGN KEY (`id_profession`) REFERENCES `professions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.users : ~7 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `date_of_birth`, `id_country`, `phone_number`, `id_profession`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'DAHOU Nassara Amour', 'nassara@gmail.com', NULL, '$2y$10$urwFUHehTuuEWYu93nW5OOVgDzWNfW1AoiHgfZlVLBgaZAor7D12a', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:14', '2023-12-28 10:45:14'),
	(2, 'MEDENOU Marcos', 'marcosmedenou@gmail.com', NULL, '$2y$10$MkBIy0o7/WXuH04Lk.XYa.lWjNq.K0JHF24ikCZVANLvLBE.Amse6', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:38', '2023-12-28 10:45:38'),
	(3, 'OTEGBEYE Johannes', 'johannes@gmail.com', NULL, '$2y$10$NnoBI0TqyiicvfBun2IZT.yvSa/cDrQde9Q3sk4ZlfcJqxaV6GdgS', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:59', '2023-12-28 10:45:59'),
	(4, 'ABOUDOU Koladé Moussè', 'koladeaboudou@gmail.com', NULL, '$2y$10$rJ.E9MIKLmNxQreOAaNUaeZc0cO1KBqi1vOC.eDBI/RU4ztImNggO', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:46:33', '2023-12-28 10:46:33'),
	(5, 'KPADONOU Brunice', 'pbrunice@gmail.com', NULL, '$2y$10$yJ2LaQ92Lk9ORtKysgE7Den/1fOs2V6WwL0UevSGt98HkHvsrCkfa', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:10:08', '2023-12-28 12:10:08'),
	(6, 'ADJAHO Serge Aymar', 'sergeaymar@gmail.com', NULL, '$2y$10$gOCK39bVFymb4FogxGfk9.5UzumRl0Wufcx3Rdrs9ylu20YfoWqMa', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:10:47', '2023-12-28 12:10:47'),
	(7, 'ADJAYA Exaucée', 'adjaexau@gmail.com', NULL, '$2y$10$ACaAZ6k.KHcSTv1rXmers.OX6oRPv70SbUI1/njaWXWf8K95sTsZ6', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:11:20', '2023-12-28 12:11:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
