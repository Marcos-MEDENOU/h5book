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
CREATE DATABASE IF NOT EXISTS `h5book` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `h5book`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.comments_users_profiles : ~0 rows (environ)
/*!40000 ALTER TABLE `comments_users_profiles` DISABLE KEYS */;
INSERT INTO `comments_users_profiles` (`id`, `comment`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
	(1, 'sdfsdf', 4, 3, '2024-02-14 10:50:23', '2024-02-14 10:50:23');
/*!40000 ALTER TABLE `comments_users_profiles` ENABLE KEYS */;

-- Listage de la structure de la table laravel. comment_user_posts
CREATE TABLE IF NOT EXISTS `comment_user_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `id_post` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_user_posts_user_id_foreign` (`user_id`),
  KEY `comment_user_posts_id_post_foreign` (`id_post`),
  CONSTRAINT `comment_user_posts_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.comment_user_posts : ~2 rows (environ)
/*!40000 ALTER TABLE `comment_user_posts` DISABLE KEYS */;
INSERT INTO `comment_user_posts` (`id`, `comment`, `user_id`, `id_post`, `created_at`, `updated_at`) VALUES
	(1, 'sfdf', 4, 18, '2024-02-14 11:20:56', '2024-02-14 11:20:56'),
	(2, 'wwvw', 2, 18, '2024-02-14 11:27:12', '2024-02-14 11:27:12');
/*!40000 ALTER TABLE `comment_user_posts` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.followers : ~6 rows (environ)
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` (`id`, `user_id_connect`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 6, '2024-02-12 14:18:53', '2024-02-12 14:18:53'),
	(2, 4, 7, '2024-02-12 14:18:57', '2024-02-12 14:18:57'),
	(3, 2, 4, '2024-02-12 15:26:16', '2024-02-12 15:26:16'),
	(4, 1, 4, '2024-02-12 17:14:37', '2024-02-12 17:14:37'),
	(5, 4, 2, '2024-02-13 10:33:46', '2024-02-13 10:33:46'),
	(6, 2, 1, '2024-02-13 10:47:12', '2024-02-13 10:47:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.gallery_users : ~3 rows (environ)
/*!40000 ALTER TABLE `gallery_users` DISABLE KEYS */;
INSERT INTO `gallery_users` (`id`, `file_profile`, `cover_img`, `user_id`, `created_at`, `updated_at`) VALUES
	(2, 'profil-image-65ca4331d4aef3.52251851.jpg', NULL, 4, '2024-02-12 16:11:32', '2024-02-12 16:11:32'),
	(3, 'profil-image-65cb440587de00.19085149.png', NULL, 4, '2024-02-13 10:27:23', '2024-02-13 10:27:23'),
	(4, 'profil-image-65cb485bc99bc9.44848681.png', NULL, 2, '2024-02-13 10:45:50', '2024-02-13 10:45:50'),
	(5, NULL, 'cover-image-65ccf16f429c99.06454493.jpg', 4, '2024-02-14 16:59:27', '2024-02-14 16:59:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.likes_users_profiles : ~3 rows (environ)
/*!40000 ALTER TABLE `likes_users_profiles` DISABLE KEYS */;
INSERT INTO `likes_users_profiles` (`id`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
	(12, 2, 2, '2024-02-13 10:28:12', '2024-02-13 10:28:12'),
	(13, 1, 3, '2024-02-13 10:31:23', '2024-02-13 10:31:23'),
	(19, 4, 2, '2024-02-14 08:52:19', '2024-02-14 08:52:19'),
	(20, 4, 3, '2024-02-14 08:52:24', '2024-02-14 08:52:24');
/*!40000 ALTER TABLE `likes_users_profiles` ENABLE KEYS */;

-- Listage de la structure de la table laravel. like_user_posts
CREATE TABLE IF NOT EXISTS `like_user_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `id_post` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `like_user_posts_user_id_foreign` (`user_id`),
  KEY `like_user_posts_id_post_foreign` (`id_post`),
  CONSTRAINT `like_user_posts_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `like_user_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.like_user_posts : ~2 rows (environ)
/*!40000 ALTER TABLE `like_user_posts` DISABLE KEYS */;
INSERT INTO `like_user_posts` (`id`, `user_id`, `id_post`, `created_at`, `updated_at`) VALUES
	(1, 4, 18, '2024-02-13 11:55:33', '2024-02-13 11:55:33'),
	(6, 3, 18, '2024-02-13 14:10:02', '2024-02-13 14:10:02'),
	(7, 2, 18, '2024-02-13 14:24:20', '2024-02-13 14:24:20');
/*!40000 ALTER TABLE `like_user_posts` ENABLE KEYS */;

-- Listage de la structure de la table laravel. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
	(13, '2024_02_10_204919_create_tags_users_table', 6),
	(14, '2024_02_13_114155_create_like_user_posts_table', 7),
	(15, '2024_02_13_144508_create_comment_user_posts_table', 8);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.posts : ~7 rows (environ)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `uuid`, `user_id`, `body`, `image`, `video`, `bgc`, `created_at`, `updated_at`) VALUES
	(1, 'post-uuid-65ca3328a97131.00043358', 4, 'Hello', NULL, NULL, 'bg-gradient-to-br from-gray-700 to-sky-800', '2024-02-12 15:03:04', '2024-02-12 15:03:04'),
	(4, 'post-uuid-65ca52295f7995.03302975', 1, 'test', 'post_image_video_65ca52267c1ee1.20134518.jpg', NULL, NULL, '2024-02-12 17:15:21', '2024-02-12 17:15:21'),
	(5, 'post-uuid-65cb304fc874e2.83430101', 2, 'Quand tu as ce genre d\'erreurs....', 'post_image_video_65cb30334f8691.95847819.png', NULL, NULL, '2024-02-13 09:03:11', '2024-02-13 09:03:11'),
	(14, 'post-uuid-65cb348f7e3872.63446470', 4, 'Hello world', NULL, NULL, 'bg-gradient-to-t from-gray-700 to-rose-700', '2024-02-13 09:21:19', '2024-02-13 09:21:19'),
	(16, 'post-uuid-65cb39d58116a5.54164755', 1, 'Relation discrète, relation parfaite, vivons cachée on aura moins de problème. Te prends pas la tête j\'ai mené l\'enquête on y ira à paname pour voir les chutes d\'eau.', NULL, NULL, 'bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500', '2024-02-13 09:43:49', '2024-02-13 09:43:49'),
	(17, 'post-uuid-65cb39f285d568.86611886', 2, 'Relation discrète, relation parfaite, vivons cachée on aura moins de problème. Te prends pas la tête j\'ai mené l\'enquête on y ira à paname pour voir les chutes d\'eau. Ce qu\'il faut là où il faut', NULL, NULL, NULL, '2024-02-13 09:44:18', '2024-02-13 09:44:18'),
	(18, 'post-uuid-65cb44ed3a5c23.35581916', 1, 'Burnay Boy', 'post_image_video_65cb44e8906001.27770617.jpg', NULL, NULL, '2024-02-13 10:31:09', '2024-02-13 10:31:09'),
	(21, 'post-uuid-65cb4845281af3.59058929', 2, NULL, 'post_image_video_65cb48424e7b04.92047222.png', NULL, NULL, '2024-02-13 10:45:25', '2024-02-13 10:45:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.tags_posts : ~5 rows (environ)
/*!40000 ALTER TABLE `tags_posts` DISABLE KEYS */;
INSERT INTO `tags_posts` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
	(3, 'post-uuid-65ca52295f7995.03302975', '2024-02-12 17:15:21', '2024-02-12 17:15:21'),
	(4, 'post-uuid-65cb304fc874e2.83430101', '2024-02-13 09:03:11', '2024-02-13 09:03:11'),
	(6, 'post-uuid-65cb39d58116a5.54164755', '2024-02-13 09:43:49', '2024-02-13 09:43:49'),
	(7, 'post-uuid-65cb39f285d568.86611886', '2024-02-13 09:44:18', '2024-02-13 09:44:18'),
	(8, 'post-uuid-65cb44ed3a5c23.35581916', '2024-02-13 10:31:09', '2024-02-13 10:31:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.tags_users : ~5 rows (environ)
/*!40000 ALTER TABLE `tags_users` DISABLE KEYS */;
INSERT INTO `tags_users` (`id`, `uuid`, `user_id`, `created_at`, `updated_at`) VALUES
	(3, 'post-uuid-65ca52295f7995.03302975', 4, '2024-02-12 17:15:21', '2024-02-12 17:15:21'),
	(4, 'post-uuid-65cb304fc874e2.83430101', 4, '2024-02-13 09:03:11', '2024-02-13 09:03:11'),
	(6, 'post-uuid-65cb39d58116a5.54164755', 4, '2024-02-13 09:43:49', '2024-02-13 09:43:49'),
	(7, 'post-uuid-65cb39f285d568.86611886', 4, '2024-02-13 09:44:18', '2024-02-13 09:44:18'),
	(8, 'post-uuid-65cb44ed3a5c23.35581916', 4, '2024-02-13 10:31:09', '2024-02-13 10:31:09');
/*!40000 ALTER TABLE `tags_users` ENABLE KEYS */;

-- Listage de la structure de la table laravel. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  UNIQUE KEY `uuid` (`uuid`),
  KEY `users_id_country_foreign` (`id_country`),
  KEY `users_id_profession_foreign` (`id_profession`),
  CONSTRAINT `users_id_country_foreign` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`),
  CONSTRAINT `users_id_profession_foreign` FOREIGN KEY (`id_profession`) REFERENCES `professions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table laravel.users : ~7 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `email_verified_at`, `password`, `gender`, `date_of_birth`, `id_country`, `phone_number`, `id_profession`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'sdfgsfg', 'DAHOU Nassara Amour', 'nassara@gmail.com', NULL, '$2y$10$urwFUHehTuuEWYu93nW5OOVgDzWNfW1AoiHgfZlVLBgaZAor7D12a', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:14', '2023-12-28 10:45:14'),
	(2, 'xbvfrhyjbgj', 'MEDENOU Marcos', 'marcosmedenou@gmail.com', NULL, '$2y$10$MkBIy0o7/WXuH04Lk.XYa.lWjNq.K0JHF24ikCZVANLvLBE.Amse6', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:38', '2023-12-28 10:45:38'),
	(3, 'sb45sd', 'OTEGBEYE Johannes', 'johannes@gmail.com', NULL, '$2y$10$NnoBI0TqyiicvfBun2IZT.yvSa/cDrQde9Q3sk4ZlfcJqxaV6GdgS', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:45:59', '2023-12-28 10:45:59'),
	(4, 'sdfqdv', 'ABOUDOU Koladé Moussè', 'koladeaboudou@gmail.com', NULL, '$2y$10$rJ.E9MIKLmNxQreOAaNUaeZc0cO1KBqi1vOC.eDBI/RU4ztImNggO', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 10:46:33', '2023-12-28 10:46:33'),
	(5, 'edfqfx', 'KPADONOU Brunice', 'pbrunice@gmail.com', NULL, '$2y$10$yJ2LaQ92Lk9ORtKysgE7Den/1fOs2V6WwL0UevSGt98HkHvsrCkfa', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:10:08', '2023-12-28 12:10:08'),
	(6, 'dfgbfh', 'ADJAHO Serge Aymar', 'sergeaymar@gmail.com', NULL, '$2y$10$gOCK39bVFymb4FogxGfk9.5UzumRl0Wufcx3Rdrs9ylu20YfoWqMa', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:10:47', '2023-12-28 12:10:47'),
	(7, 'vtdf', 'ADJAYA Exaucée', 'adjaexau@gmail.com', NULL, '$2y$10$ACaAZ6k.KHcSTv1rXmers.OX6oRPv70SbUI1/njaWXWf8K95sTsZ6', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 12:11:20', '2023-12-28 12:11:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
