-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 05 月 26 日 06:41
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `animal`
--

-- --------------------------------------------------------

--
-- 資料表結構 `animals`
--

CREATE TABLE `animals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '動物分類',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '動物的暱稱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在地區',
  `fix` tinyint(1) NOT NULL DEFAULT 0 COMMENT '結紮情形',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '簡單敘述',
  `personality` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '動物個性',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '使用者ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `animals`
--

INSERT INTO `animals` (`id`, `type_id`, `name`, `birthday`, `area`, `fix`, `description`, `personality`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 1, '大黑', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-04 16:35:41', '2020-05-04 16:35:41', 1),
(2, 1, '養樂多多多', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-04 16:39:14', '2020-05-12 17:02:00', 1),
(3, 1, '大黑3', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-04 16:39:21', '2020-05-04 16:39:21', 1),
(4, 1, '嘟嘟', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-24 20:41:54', '2020-05-24 20:41:54', 1),
(5, 1, '嘟嘟2', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-24 20:42:42', '2020-05-24 20:42:42', 1),
(6, 1, '嘟嘟3', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-24 20:44:12', '2020-05-24 20:44:12', 1),
(7, 1, 'refresh token', '2020-01-01', '高雄', 1, '非常可愛，非常溫和的一隻狗', '認養她陪伴一輩子', '2020-05-24 21:14:49', '2020-05-24 21:14:49', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_04_14_083627_create_animals_table', 1),
(4, '2020_05_14_072736_create_types_table', 2),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(8, '2016_06_01_000004_create_oauth_clients_table', 3),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(12, '2020_05_26_031059_add_user_id_to_animals', 4),
(13, '2020_05_26_041021_add_permission_to_users', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5050d5655a8830b64b19c55a5003a3288dd15bb20016a983e6f131fe2da415f9d7139c3340f8417e', 1, 2, NULL, '[]', 1, '2020-05-24 20:39:26', '2020-05-24 20:39:26', '2021-05-25 04:39:26'),
('d1a5ac3aefef2e80b3695fa80ab10e09476caabd038ad6737d1e4e3e34d7bf4b664ff26885da77fd', 1, 2, NULL, '[]', 0, '2020-05-24 20:20:22', '2020-05-24 20:20:22', '2021-05-25 04:20:22'),
('ff9d7f44845ac5ad3563939a1d1324a0748093ea942230c8211581f1083071be72abdc43bc0c1718', 1, 2, NULL, '[]', 0, '2020-05-24 21:12:01', '2020-05-24 21:12:01', '2021-05-25 05:12:01');

-- --------------------------------------------------------

--
-- 資料表結構 `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'jHGgR4y3zx6SpzywZnCrFwoZ4OMVQPTsjh45Lg5T', 'http://localhost', 1, 0, 0, '2020-05-22 01:24:00', '2020-05-22 01:24:00'),
(2, NULL, 'Laravel Password Grant Client', 'XJ9Y9vK6wEo7NDqe4wkJHF7XZpQhJTH88LFsBMn2', 'http://localhost', 0, 1, 0, '2020-05-22 01:24:00', '2020-05-22 01:24:00');

-- --------------------------------------------------------

--
-- 資料表結構 `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-22 01:24:00', '2020-05-22 01:24:00');

-- --------------------------------------------------------

--
-- 資料表結構 `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('3d02e078cc7c191cbc5d2ce2ff75bb68acdc302d501eef18ee9c3678cc7fac4b4541ac4cdf6c7fa8', 'd1a5ac3aefef2e80b3695fa80ab10e09476caabd038ad6737d1e4e3e34d7bf4b664ff26885da77fd', 0, '2021-05-25 04:20:22'),
('c5995c197dba9c95f903a6641e27f19b306a6534fddcc19d458b0ac4cd99790566e0fb2d0a2f929e', '5050d5655a8830b64b19c55a5003a3288dd15bb20016a983e6f131fe2da415f9d7139c3340f8417e', 1, '2021-05-25 04:39:26'),
('e99f87a4c64ce27c85dd8d4312deedfdf8162c84edae47d895544d6202a652d3509d7c51383f42a4', 'ff9d7f44845ac5ad3563939a1d1324a0748093ea942230c8211581f1083071be72abdc43bc0c1718', 0, '2021-05-25 05:12:01');

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `types`
--

INSERT INTO `types` (`id`, `name`, `sort`, `created_at`, `updated_at`) VALUES
(1, '狗', 1, '2020-05-13 17:45:36', '2020-05-13 17:45:36'),
(2, '貓', 2, '2020-05-13 17:45:42', '2020-05-13 17:45:42');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號權限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `permission`) VALUES
(1, 'Jenny', 'jenny111788@gmail.com', NULL, '$2y$10$Pnf6Wj5PGbqIF10lCvlBp.fzH26ryhm4oNIML0rC87tn.WMWa7LBW', NULL, '2020-05-21 23:46:22', '2020-05-21 23:46:22', '');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animals_user_id_foreign` (`user_id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- 資料表索引 `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- 資料表索引 `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- 資料表索引 `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_name_unique` (`name`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `animals`
--
ALTER TABLE `animals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
