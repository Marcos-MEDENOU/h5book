-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 15 fév. 2024 à 09:32
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
-- Base de données : `h5book`
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

-- --------------------------------------------------------

--
-- Structure de la table `comment_user_posts`
--

CREATE TABLE `comment_user_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 4, 6, '2024-02-12 13:18:53', '2024-02-12 13:18:53'),
(2, 4, 7, '2024-02-12 13:18:57', '2024-02-12 13:18:57'),
(3, 2, 4, '2024-02-12 14:26:16', '2024-02-12 14:26:16'),
(4, 1, 4, '2024-02-12 16:14:37', '2024-02-12 16:14:37'),
(5, 4, 2, '2024-02-13 09:33:46', '2024-02-13 09:33:46'),
(6, 2, 1, '2024-02-13 09:47:12', '2024-02-13 09:47:12'),
(7, 3, 1, '2024-02-15 07:28:20', '2024-02-15 07:28:20');

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

-- --------------------------------------------------------

--
-- Structure de la table `like_user_posts`
--

CREATE TABLE `like_user_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, '2024_01_05_085102_create_comments_users_profiles_table', 3),
(11, '2024_02_07_214154_create_posts_table', 4),
(12, '2024_02_10_183050_create_tags_posts_table', 5),
(13, '2024_02_10_204919_create_tags_users_table', 6),
(14, '2024_02_13_114155_create_like_user_posts_table', 7),
(15, '2024_02_13_144508_create_comment_user_posts_table', 8);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('johannes@gmail.com', '$2y$10$ieuoy8b/IyK/AimCfWf.jODGdTqUDFjcSYJJOB5omURg5J6B5ESpK', '2024-02-15 07:26:35');

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
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `bgc` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `uuid`, `user_id`, `body`, `image`, `video`, `bgc`, `created_at`, `updated_at`) VALUES
(1, 'post-uuid-65ca3328a97131.00043358', 4, 'Hello', NULL, NULL, 'bg-gradient-to-br from-gray-700 to-sky-800', '2024-02-12 14:03:04', '2024-02-12 14:03:04'),
(14, 'post-uuid-65cb348f7e3872.63446470', 4, 'Hello world', NULL, NULL, 'bg-gradient-to-t from-gray-700 to-rose-700', '2024-02-13 08:21:19', '2024-02-13 08:21:19'),
(16, 'post-uuid-65cb39d58116a5.54164755', 1, 'Relation discrète, relation parfaite, vivons cachée on aura moins de problème. Te prends pas la tête j\'ai mené l\'enquête on y ira à paname pour voir les chutes d\'eau.', NULL, NULL, 'bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500', '2024-02-13 08:43:49', '2024-02-13 08:43:49'),
(17, 'post-uuid-65cb39f285d568.86611886', 2, 'Relation discrète, relation parfaite, vivons cachée on aura moins de problème. Te prends pas la tête j\'ai mené l\'enquête on y ira à paname pour voir les chutes d\'eau. Ce qu\'il faut là où il faut', NULL, NULL, NULL, '2024-02-13 08:44:18', '2024-02-13 08:44:18');

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
-- Structure de la table `tags_posts`
--

CREATE TABLE `tags_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags_users`
--

CREATE TABLE `tags_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` longtext NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `email_verified_at`, `password`, `gender`, `date_of_birth`, `id_country`, `phone_number`, `id_profession`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sdfgsfg', 'DAHOU Nassara Amour', 'nassara@gmail.com', NULL, '$2y$10$urwFUHehTuuEWYu93nW5OOVgDzWNfW1AoiHgfZlVLBgaZAor7D12a', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:14', '2023-12-28 09:45:14'),
(2, 'xbvfrhyjbgj', 'MEDENOU Marcos', 'marcosmedenou@gmail.com', NULL, '$2y$10$MkBIy0o7/WXuH04Lk.XYa.lWjNq.K0JHF24ikCZVANLvLBE.Amse6', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:38', '2023-12-28 09:45:38'),
(3, 'sb45sd', 'OTEGBEYE Johannes', 'johannes@gmail.com', NULL, '$2y$10$NnoBI0TqyiicvfBun2IZT.yvSa/cDrQde9Q3sk4ZlfcJqxaV6GdgS', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:45:59', '2023-12-28 09:45:59'),
(4, 'sdfqdv', 'ABOUDOU Koladé Moussè', 'koladeaboudou@gmail.com', NULL, '$2y$10$rJ.E9MIKLmNxQreOAaNUaeZc0cO1KBqi1vOC.eDBI/RU4ztImNggO', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 09:46:33', '2023-12-28 09:46:33'),
(5, 'edfqfx', 'KPADONOU Brunice', 'pbrunice@gmail.com', NULL, '$2y$10$yJ2LaQ92Lk9ORtKysgE7Den/1fOs2V6WwL0UevSGt98HkHvsrCkfa', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:10:08', '2023-12-28 11:10:08'),
(6, 'dfgbfh', 'ADJAHO Serge Aymar', 'sergeaymar@gmail.com', NULL, '$2y$10$gOCK39bVFymb4FogxGfk9.5UzumRl0Wufcx3Rdrs9ylu20YfoWqMa', 'M', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:10:47', '2023-12-28 11:10:47'),
(7, 'vtdf', 'ADJAYA Exaucée', 'adjaexau@gmail.com', NULL, '$2y$10$ACaAZ6k.KHcSTv1rXmers.OX6oRPv70SbUI1/njaWXWf8K95sTsZ6', 'F', NULL, NULL, NULL, NULL, NULL, '2023-12-28 11:11:20', '2023-12-28 11:11:20');

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
-- Index pour la table `comment_user_posts`
--
ALTER TABLE `comment_user_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_posts_user_id_foreign` (`user_id`),
  ADD KEY `comment_user_posts_id_post_foreign` (`id_post`);

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
-- Index pour la table `like_user_posts`
--
ALTER TABLE `like_user_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `like_user_posts_user_id_foreign` (`user_id`),
  ADD KEY `like_user_posts_id_post_foreign` (`id_post`);

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
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Index pour la table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags_posts`
--
ALTER TABLE `tags_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags_users`
--
ALTER TABLE `tags_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_users_user_id_foreign` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `users_id_country_foreign` (`id_country`),
  ADD KEY `users_id_profession_foreign` (`id_profession`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments_users_profiles`
--
ALTER TABLE `comments_users_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comment_user_posts`
--
ALTER TABLE `comment_user_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `gallery_users`
--
ALTER TABLE `gallery_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `likes_users_profiles`
--
ALTER TABLE `likes_users_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `like_user_posts`
--
ALTER TABLE `like_user_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tags_posts`
--
ALTER TABLE `tags_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `tags_users`
--
ALTER TABLE `tags_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Contraintes pour la table `comment_user_posts`
--
ALTER TABLE `comment_user_posts`
  ADD CONSTRAINT `comment_user_posts_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_user_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Contraintes pour la table `like_user_posts`
--
ALTER TABLE `like_user_posts`
  ADD CONSTRAINT `like_user_posts_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_user_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tags_users`
--
ALTER TABLE `tags_users`
  ADD CONSTRAINT `tags_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
