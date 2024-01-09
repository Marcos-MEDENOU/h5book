-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 09 jan. 2024 à 15:17
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments_users_profiles`
--

CREATE TABLE `comments_users_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_gallery` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments_users_profiles`
--

INSERT INTO `comments_users_profiles` (`id`, `comment`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
(1, 'fvgsxv<br />\nvwxvdfgdf', 3, 46, '2024-01-05 09:30:18', '2024-01-05 09:30:18'),
(2, 'sdfsfsdf<br />\nsdfsd<br />\nf', 3, 46, '2024-01-05 09:38:59', '2024-01-05 09:38:59'),
(3, 'cc', 4, 46, '2024-01-05 09:40:59', '2024-01-05 09:40:59'),
(4, 'tkt', 2, 46, '2024-01-05 10:04:30', '2024-01-05 10:04:30'),
(6, '^jll,<br />\nnhj', 4, 9, '2024-01-05 12:14:51', '2024-01-05 12:14:51'),
(7, 'fgffddf<br />\ndfgdf<br />\ndfgd<br />\ngdfgdfg<br />\nfg<br />\ndg<br />\ndfgfd<br />\ngdf<br />\ngdfg<br />\nfdgfdgdfgdfgdf<br />\ngdf<br />\ngdf<br />\ngfd', 2, 9, '2024-01-05 13:07:35', '2024-01-05 14:24:18'),
(8, 'mon ami<br />\nHello, it\'s me.', 4, 9, '2024-01-05 13:08:12', '2024-01-05 14:41:28'),
(9, 'dsfsd<br />\nsdfsd<br />\ndfgfsd', 2, 9, '2024-01-05 13:31:57', '2024-01-05 13:31:57'),
(12, '@MEDENOU Marcos ok', 4, 9, '2024-01-05 15:21:26', '2024-01-05 15:21:26'),
(13, '@ABOUDOU Koladé Moussè c\'est bon', 2, 9, '2024-01-05 15:24:27', '2024-01-05 15:24:27'),
(14, 'hello test', 3, 9, '2024-01-09 06:54:01', '2024-01-09 06:54:01'),
(15, '@OTEGBEYE Johannes bonjour !<br />\nComment tu vas ?', 4, 9, '2024-01-09 06:54:37', '2024-01-09 06:54:37');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `image_country` longtext NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id_connect` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `followers`
--

INSERT INTO `followers` (`id`, `user_id_connect`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2023-12-28 09:49:27', '2023-12-28 09:49:27'),
(2, 4, 2, '2023-12-28 09:49:39', '2023-12-28 09:49:39'),
(4, 2, 3, '2023-12-28 11:12:40', '2023-12-28 11:12:40'),
(8, 3, 5, '2023-12-28 15:46:01', '2023-12-28 15:46:01'),
(9, 3, 6, '2023-12-28 15:48:08', '2023-12-28 15:48:08'),
(10, 3, 4, '2023-12-28 16:05:20', '2023-12-28 16:05:20'),
(11, 4, 5, '2023-12-28 16:06:26', '2023-12-28 16:06:26'),
(12, 4, 3, '2023-12-28 16:06:57', '2023-12-28 16:06:57'),
(13, 6, 4, '2023-12-29 09:07:59', '2023-12-29 09:07:59'),
(14, 6, 2, '2023-12-29 09:08:31', '2023-12-29 09:08:31'),
(15, 3, 1, '2024-01-03 12:49:59', '2024-01-03 12:49:59');

-- --------------------------------------------------------

--
-- Structure de la table `gallery_users`
--

CREATE TABLE `gallery_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_profile` longtext DEFAULT NULL,
  `cover_img` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gallery_users`
--

INSERT INTO `gallery_users` (`id`, `file_profile`, `cover_img`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'cover-image-658d5dbe824fb4.40787295.jpg', 2, '2023-12-28 10:36:30', '2023-12-28 10:36:30'),
(2, NULL, 'cover-image-658d5dcd281f69.54387241.jpg', 4, '2023-12-28 10:36:45', '2023-12-28 10:36:45'),
(9, 'profil-image-658d9e83086c42.11259319.jpg', NULL, 4, '2023-12-28 15:12:52', '2023-12-28 15:12:52'),
(18, 'profil-image-658eb74f708754.14184881.jpg', NULL, 6, '2023-12-29 11:10:59', '2023-12-29 11:10:59'),
(19, NULL, 'cover-image-658eb75ddfbb02.78722129.jpg', 6, '2023-12-29 11:11:09', '2023-12-29 11:11:09'),
(20, 'profil-image-658ed76aa4a735.18472940.jpg', NULL, 4, '2023-12-29 13:27:56', '2023-12-29 13:27:56'),
(21, NULL, 'cover-image-658f1788ad33a9.23101819.png', 4, '2023-12-29 18:01:28', '2023-12-29 18:01:28'),
(46, 'profil-image-65954008417908.18076087.jpg', NULL, 3, '2024-01-03 10:07:53', '2024-01-03 10:07:53'),
(49, 'profil-image-65956621e9c223.23782604.jpg', NULL, 3, '2024-01-03 12:50:28', '2024-01-03 12:50:28');

-- --------------------------------------------------------

--
-- Structure de la table `likes_users_profiles`
--

CREATE TABLE `likes_users_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_gallery` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `likes_users_profiles`
--

INSERT INTO `likes_users_profiles` (`id`, `user_id`, `id_gallery`, `created_at`, `updated_at`) VALUES
(2, 3, 46, '2024-01-04 08:57:27', '2024-01-04 08:57:27'),
(11, 4, 46, '2024-01-04 12:49:20', '2024-01-04 12:49:20'),
(12, 6, 46, '2024-01-04 16:36:44', '2024-01-04 16:36:44'),
(14, 3, 49, '2024-01-04 17:05:27', '2024-01-04 17:05:27'),
(15, 2, 46, '2024-01-05 10:00:25', '2024-01-05 10:00:25'),
(17, 2, 9, '2024-01-05 12:14:34', '2024-01-05 12:14:34'),
(18, 4, 9, '2024-01-05 14:07:11', '2024-01-05 14:07:11'),
(19, 3, 9, '2024-01-09 06:41:31', '2024-01-09 06:41:31');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

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
(10, '2024_01_05_085102_create_comments_users_profiles_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professions`
--

CREATE TABLE `professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_profession` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `id_country` bigint(20) UNSIGNED DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `id_profession` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `date_of_birth`, `id_country`, `phone_number`, `id_profession`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'DAHOU Nassara Amour', 'nassara@gmail.com', NULL, '$2y$10$urwFUHehTuuEWYu93nW5OOVgDzWNfW1AoiHgfZlVLBgaZAor7D12a', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:14', '2023-12-28 09:45:14'),
(2, 'MEDENOU Marcos', 'marcosmedenou@gmail.com', NULL, '$2y$10$MkBIy0o7/WXuH04Lk.XYa.lWjNq.K0JHF24ikCZVANLvLBE.Amse6', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:38', '2023-12-28 09:45:38'),
(3, 'OTEGBEYE Johannes', 'johannes@gmail.com', NULL, '$2y$10$NnoBI0TqyiicvfBun2IZT.yvSa/cDrQde9Q3sk4ZlfcJqxaV6GdgS', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:59', '2023-12-28 09:45:59'),
(4, 'ABOUDOU Koladé Moussè', 'koladeaboudou@gmail.com', NULL, '$2y$10$rJ.E9MIKLmNxQreOAaNUaeZc0cO1KBqi1vOC.eDBI/RU4ztImNggO', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:46:33', '2023-12-28 09:46:33'),
(5, 'KPADONOU Brunice', 'pbrunice@gmail.com', NULL, '$2y$10$yJ2LaQ92Lk9ORtKysgE7Den/1fOs2V6WwL0UevSGt98HkHvsrCkfa', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:10:08', '2023-12-28 11:10:08'),
(6, 'ADJAHO Serge Aymar', 'sergeaymar@gmail.com', NULL, '$2y$10$gOCK39bVFymb4FogxGfk9.5UzumRl0Wufcx3Rdrs9ylu20YfoWqMa', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:10:47', '2023-12-28 11:10:47'),
(7, 'ADJAYA Exaucée', 'adjaexau@gmail.com', NULL, '$2y$10$ACaAZ6k.KHcSTv1rXmers.OX6oRPv70SbUI1/njaWXWf8K95sTsZ6', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:11:20', '2023-12-28 11:11:20');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments_users_profiles`
--
ALTER TABLE `comments_users_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_users_profiles_user_id_foreign` (`user_id`),
  ADD KEY `comments_users_profiles_id_gallery_foreign` (`id_gallery`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_user_id_connect_foreign` (`user_id_connect`),
  ADD KEY `followers_user_id_foreign` (`user_id`);

--
-- Index pour la table `gallery_users`
--
ALTER TABLE `gallery_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_users_user_id_foreign` (`user_id`);

--
-- Index pour la table `likes_users_profiles`
--
ALTER TABLE `likes_users_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_users_profiles_user_id_foreign` (`user_id`),
  ADD KEY `likes_users_profiles_id_gallery_foreign` (`id_gallery`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_country_foreign` (`id_country`),
  ADD KEY `users_id_profession_foreign` (`id_profession`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments_users_profiles`
--
ALTER TABLE `comments_users_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `gallery_users`
--
ALTER TABLE `gallery_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `likes_users_profiles`
--
ALTER TABLE `likes_users_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments_users_profiles`
--
ALTER TABLE `comments_users_profiles`
  ADD CONSTRAINT `comments_users_profiles_id_gallery_foreign` FOREIGN KEY (`id_gallery`) REFERENCES `gallery_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_users_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_user_id_connect_foreign` FOREIGN KEY (`user_id_connect`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `gallery_users`
--
ALTER TABLE `gallery_users`
  ADD CONSTRAINT `gallery_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes_users_profiles`
--
ALTER TABLE `likes_users_profiles`
  ADD CONSTRAINT `likes_users_profiles_id_gallery_foreign` FOREIGN KEY (`id_gallery`) REFERENCES `gallery_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_users_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_country_foreign` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `users_id_profession_foreign` FOREIGN KEY (`id_profession`) REFERENCES `professions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
