-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySql-8.0
-- Время создания: Фев 07 2025 г., 01:14
-- Версия сервера: 8.0.35
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `final`
--

-- --------------------------------------------------------

--
-- Структура таблицы `booking_flights`
--

CREATE TABLE `booking_flights` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `flight_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cosmonauts`
--

CREATE TABLE `cosmonauts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `flights`
--

CREATE TABLE `flights` (
  `id` bigint UNSIGNED NOT NULL,
  `flight_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `launch_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats_available` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '0001_01_01_000000_create_users_table', 1),
(26, '0001_01_01_000001_create_cache_table', 1),
(27, '0001_01_01_000002_create_jobs_table', 1),
(28, '2025_01_27_074124_create_personal_access_tokens_table', 1),
(29, '2025_01_27_084715_create_missions_table', 1),
(30, '2025_01_27_185347_create_flights_table', 1),
(31, '2025_01_27_185819_create_booking_flights_table', 1),
(32, '2025_01_27_190015_create_cosmonauts_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `missions`
--

CREATE TABLE `missions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Миссия',
  `launch_details` json NOT NULL,
  `landing_details` json NOT NULL,
  `spacecraft` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `missions`
--

INSERT INTO `missions` (`id`, `name`, `type`, `launch_details`, `landing_details`, `spacecraft`, `created_at`, `updated_at`) VALUES
(1, 'Восток 1', 'Полет Гагарина', '{\"launch_date\": \"1961-04-12\", \"launch_site\": {\"name\": \"Космодром Байконур\", \"location\": {\"latitude\": \"45.9650000\", \"longitude\": \"63.3050000\"}}}', '{\"date\": \"1961-04-12\", \"site\": {\"name\": \"Смеловка\", \"country\": \"СССР\", \"coordinates\": {\"latitude\": \"51.2700000\", \"longitude\": \"45.9970000\"}}, \"details\": {\"parachute_landing\": true, \"impact_velocity_mps\": 7}, \"flight_duration\": {\"hours\": 1, \"minutes\": 48}}', '{\"name\": \"Восток 3KA\", \"cosmonaut\": [{\"bio\": {\"career\": \"Отобран в отряд космонавтов в 1960 году...\", \"early_life\": \"Родился в Клушино, Россия.\", \"post_flight\": \"Стал международным героем.\"}, \"name\": \"Юрий Гагарин\", \"rank\": \"Старший лейтенант\", \"birthdate\": \"1934-03-09\"}], \"manufacturer\": \"OKB-1\"}', '2025-01-28 10:33:42', '2025-01-28 10:33:42'),
(2, 'Аполлон-11', 'Полет', '{\"launch_date\": \"1969-07-16\", \"launch_site\": {\"name\": \"Космический центр имени Кеннеди\", \"location\": {\"latitude\": \"28.5721000\", \"longitude\": \"-80.6480000\"}}}', '{\"landing_date\": \"1969-07-20\", \"landing_site\": {\"name\": \"Море спокойствия\", \"coordinates\": {\"latitude\": \"0.6740000\", \"longitude\": \"23.4720000\"}}}', '{\"crew\": [{\"name\": \"Нил Армстронг\", \"role\": \"Командир\"}, {\"name\": \"Базз Олдрин\", \"role\": \"Пилот лунного модуля\"}, {\"name\": \"Майкл Коллинз\", \"role\": \"Пилот командного модуля\"}], \"lunar_module\": \"Орел\", \"command_module\": \"Колумбия\"}', '2025-01-29 03:39:25', '2025-01-29 03:39:25');

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'reg token', 'd3a8b8d6acea00a4b659b6f423ddd067ec5ab5590792dcba1c040a3fcca55331', '[\"*\"]', '2025-02-06 05:17:03', NULL, '2025-01-28 10:33:05', '2025-02-06 05:17:03'),
(2, 'App\\Models\\User', 1, 'reg token', 'eef244278d883b2a2142d395f6a2ea1264c56649d55e5861ab0ae2e1713791a5', '[\"*\"]', NULL, NULL, '2025-01-29 05:00:39', '2025-01-29 05:00:39'),
(3, 'App\\Models\\User', 2, 'reg token', 'c45445790fab2ac15b74f68b005275e613d3de0cd26430759e79536b1833f569', '[\"*\"]', NULL, NULL, '2025-02-03 02:55:24', '2025-02-03 02:55:24'),
(4, 'App\\Models\\User', 4, 'reg token', 'a62d2a7872c4c00760794520db9af8907030e391f1673e0b4ed135f9c8803404', '[\"*\"]', NULL, NULL, '2025-02-03 04:20:48', '2025-02-03 04:20:48'),
(5, 'App\\Models\\User', 4, 'reg token', '9c1a721f123e13115145dfcf1d3054fd53ebe558718d65385a60e349494ce7a4', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:27', '2025-02-03 04:24:27'),
(6, 'App\\Models\\User', 4, 'reg token', '25e2ec81867d15c7d13f68b86cdc0d67a362ccea4cd449a86ccac646ca26a23c', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:29', '2025-02-03 04:24:29'),
(7, 'App\\Models\\User', 4, 'reg token', '9f99c5b15b0286b5fe40bd3e24b4bc91dfe1bd47e740358866f4cf8fd6424ee1', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:31', '2025-02-03 04:24:31'),
(8, 'App\\Models\\User', 4, 'reg token', '78255af354f89ace3a024c030e7b53c8b1c44ff14e6c75c833d733d5b182010b', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:34', '2025-02-03 04:24:34'),
(9, 'App\\Models\\User', 4, 'reg token', 'dc647774cb8fcfcd4327edc3f67b9937f2b449f483b084033dd0fcd63dbbc07f', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:36', '2025-02-03 04:24:36'),
(10, 'App\\Models\\User', 4, 'reg token', 'f084f177fa1e349777f54b348e539a70631a2bfc65b911d5880797d5e34caf56', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:38', '2025-02-03 04:24:38'),
(11, 'App\\Models\\User', 4, 'reg token', '0ad5103ebf64b42d0f6216d661377ca488fd53cb28c242c0b3f05bf655fa9093', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:39', '2025-02-03 04:24:39'),
(12, 'App\\Models\\User', 4, 'reg token', 'dbc9877d40686a11c6d1b1ac83758a2935f52f01b37d6fcd47be3f3fe822701d', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:40', '2025-02-03 04:24:40'),
(13, 'App\\Models\\User', 4, 'reg token', 'a7b73b369ea66c022aeb5973abdc9425e2c109cca715d2e95a43a33e86cc3a56', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:42', '2025-02-03 04:24:42'),
(14, 'App\\Models\\User', 4, 'reg token', '3642b99ece1714667ba77845eed3196c4512e07a0a2378f6e7a1c3899f0b76b2', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:46', '2025-02-03 04:24:46'),
(15, 'App\\Models\\User', 4, 'reg token', 'ef61c2fae9323c49c47acdd1fd19b92938f88f80fcb37df604817b196f5289e7', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:47', '2025-02-03 04:24:47'),
(16, 'App\\Models\\User', 4, 'reg token', '2d9da155103bdfb2f2e07518eebdcc5f9a53754cab66d363b3c4925affb6c85b', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:49', '2025-02-03 04:24:49'),
(17, 'App\\Models\\User', 4, 'reg token', '9de2213baf67f12c54177fd0ea4e0aba8d63e35cd231129c69c785f8f19f431f', '[\"*\"]', NULL, NULL, '2025-02-03 04:24:50', '2025-02-03 04:24:50'),
(18, 'App\\Models\\User', 4, 'reg token', 'f295141967810b2a33707ad69bf3d367eeb761427d29608146e874dc2771b015', '[\"*\"]', NULL, NULL, '2025-02-03 04:25:02', '2025-02-03 04:25:02'),
(19, 'App\\Models\\User', 4, 'reg token', 'e4e4f635fbcad0c9eb407195a55d6d57292c160c74f8984e8d1165061fbee449', '[\"*\"]', NULL, NULL, '2025-02-03 04:25:14', '2025-02-03 04:25:14'),
(20, 'App\\Models\\User', 4, 'reg token', '6e9caa34e0f1d7534b8b2107c0de449cab5f355e4315044e3e166724ef8f92c4', '[\"*\"]', NULL, NULL, '2025-02-03 04:25:39', '2025-02-03 04:25:39'),
(21, 'App\\Models\\User', 4, 'reg token', 'e306c2c9c82fc9352c8d144ee468e30aa821399d421ae8f1e0625387aa7a0a4e', '[\"*\"]', NULL, NULL, '2025-02-03 04:26:34', '2025-02-03 04:26:34'),
(22, 'App\\Models\\User', 4, 'reg token', '3143f05beb9a0a95fd65196208c8ca1102aaac3da163ea294cb275225bf9a8c6', '[\"*\"]', NULL, NULL, '2025-02-03 04:28:06', '2025-02-03 04:28:06'),
(23, 'App\\Models\\User', 2, 'reg token', '4ebfcf8fb96704900d68de2d8a4b7080cb073dac55b6a9923c0bfd3950ca3fef', '[\"*\"]', NULL, NULL, '2025-02-04 15:14:53', '2025-02-04 15:14:53'),
(24, 'App\\Models\\User', 2, 'reg token', '63d756390b8297172a195636b7958460a9edd7457bcaf37899ebf47d5a9f1ed4', '[\"*\"]', NULL, NULL, '2025-02-04 15:15:31', '2025-02-04 15:15:31'),
(25, 'App\\Models\\User', 2, 'reg token', '76a30e4084a3a2dcfaa272591b383bdb8c91df3fa5c0714b92057131ce45e26b', '[\"*\"]', NULL, NULL, '2025-02-04 15:15:44', '2025-02-04 15:15:44'),
(26, 'App\\Models\\User', 2, 'reg token', 'b2f2ba90b7c3d771f793406cc67bca9698f90af598f0412eb7a46ccafa0f5565', '[\"*\"]', NULL, NULL, '2025-02-04 15:16:12', '2025-02-04 15:16:12'),
(27, 'App\\Models\\User', 2, 'reg token', 'd90ac1676166670f79011e191e079ec5336273ec273361c834e34c8d78366752', '[\"*\"]', NULL, NULL, '2025-02-04 15:16:57', '2025-02-04 15:16:57'),
(28, 'App\\Models\\User', 2, 'reg token', '61357a191ae70bef45dcc22f820f0b43c0e7e22ea0d6ff58a169ca5acdc84cbc', '[\"*\"]', NULL, NULL, '2025-02-04 15:17:24', '2025-02-04 15:17:24'),
(29, 'App\\Models\\User', 2, 'reg token', '43cf0f8c77281ae03cc4e310263488bb3b5f1b98b0751c75ebd62d36f34c5916', '[\"*\"]', NULL, NULL, '2025-02-04 15:17:34', '2025-02-04 15:17:34'),
(30, 'App\\Models\\User', 2, 'reg token', '5461e6e2dbbe3a02b19fa2785bdd5c7cf8883a9d7d4673ca46ed53825001d09c', '[\"*\"]', NULL, NULL, '2025-02-04 15:17:58', '2025-02-04 15:17:58'),
(31, 'App\\Models\\User', 2, 'reg token', '9e0b9a50dbfd144f31cf848254f74c441e168f7e84fd4ed75a26b57474bb827b', '[\"*\"]', NULL, NULL, '2025-02-04 15:19:49', '2025-02-04 15:19:49'),
(32, 'App\\Models\\User', 2, 'reg token', '23d47205a8edc9863207a17bc8096ae29fc0159f7d4da369f379917d8cbc1a14', '[\"*\"]', NULL, NULL, '2025-02-04 15:20:18', '2025-02-04 15:20:18'),
(33, 'App\\Models\\User', 2, 'reg token', 'aaffd328ac565041c04f174c703a400d2e804a20386b7bc9f21aed7cd4685c9d', '[\"*\"]', NULL, NULL, '2025-02-04 15:20:36', '2025-02-04 15:20:36'),
(34, 'App\\Models\\User', 2, 'reg token', '4c7da1e7cce6fa27430dc3d1db4369aef626641a888fe67538e6c98f8da5c362', '[\"*\"]', NULL, NULL, '2025-02-04 15:20:53', '2025-02-04 15:20:53'),
(35, 'App\\Models\\User', 2, 'reg token', '07f906bd6f2915a3568ede92f45a46ae3e1cdb2ac381e89eaef5f5892a06fcd9', '[\"*\"]', NULL, NULL, '2025-02-04 15:22:41', '2025-02-04 15:22:41'),
(36, 'App\\Models\\User', 2, 'reg token', 'bfc8b78322490ac78d058aee8ec4c48f7622df7b70de2b74c2eadeafcfd0efe8', '[\"*\"]', NULL, NULL, '2025-02-04 15:24:03', '2025-02-04 15:24:03'),
(37, 'App\\Models\\User', 2, 'reg token', 'e7b1e43ad3fb481fe19d7a62bee234dae7e74700f92100bf1a1a89ac6e8ee2bb', '[\"*\"]', NULL, NULL, '2025-02-04 15:30:44', '2025-02-04 15:30:44'),
(38, 'App\\Models\\User', 2, 'reg token', '550d890ed04b0b77e0913484db4ef59e82c0c646980cf7fcd5ee591c505023a7', '[\"*\"]', NULL, NULL, '2025-02-04 15:57:11', '2025-02-04 15:57:11'),
(39, 'App\\Models\\User', 2, 'reg token', '00991ae20f5123f0933941ae7fc1c003e7f73e88ec8808edbe5194fb6a7aab97', '[\"*\"]', NULL, NULL, '2025-02-05 01:45:16', '2025-02-05 01:45:16'),
(40, 'App\\Models\\User', 2, 'reg token', 'ec49f95482dad1bd0802cb8443e6bc32cb28e8bb7e7441accfcbf0b713e0cadf', '[\"*\"]', NULL, NULL, '2025-02-05 01:48:28', '2025-02-05 01:48:28'),
(41, 'App\\Models\\User', 2, 'reg token', 'd7aecebb77fa3e9d759687555e85a4da56c95b9ce006d50b1ea6a28a2c9388b3', '[\"*\"]', NULL, NULL, '2025-02-05 02:03:11', '2025-02-05 02:03:11'),
(42, 'App\\Models\\User', 2, 'reg token', '7409dff30f69f6b74c48d6d5c076ba170f023ea9fe3f673c284b686187a3e8b4', '[\"*\"]', NULL, NULL, '2025-02-05 02:03:28', '2025-02-05 02:03:28'),
(43, 'App\\Models\\User', 5, 'reg token', '2bfa7562aa41b1004645e1f9456e5f4e8d4479bbe8b0ab71ad8e5ca156119d4e', '[\"*\"]', NULL, NULL, '2025-02-05 03:58:17', '2025-02-05 03:58:17'),
(44, 'App\\Models\\User', 5, 'reg token', '912ae1edc63163e5e16b03df6d427781738fa632211b712cb87c84b8066a19cc', '[\"*\"]', NULL, NULL, '2025-02-05 04:14:11', '2025-02-05 04:14:11'),
(45, 'App\\Models\\User', 2, 'reg token', 'befddba6a622bee7f4885d7fac00b88083aef2c9b79ef7f4aaff175bf72acf36', '[\"*\"]', NULL, NULL, '2025-02-05 04:14:33', '2025-02-05 04:14:33'),
(51, 'App\\Models\\User', 2, 'reg token', '5cb3e13871bba8cebe6097751712d4335175c5e9f38cf6aad98e4da80ba6d2bb', '[\"*\"]', NULL, NULL, '2025-02-05 08:36:05', '2025-02-05 08:36:05'),
(52, 'App\\Models\\User', 8, 'reg token', 'c6d701f271888eb88d96c6bea707cf1d92e07cd08b38fa45a2fc88db9f7daf03', '[\"*\"]', NULL, NULL, '2025-02-05 08:56:43', '2025-02-05 08:56:43'),
(53, 'App\\Models\\User', 2, 'reg token', 'f77cb838f861ea59edb04c9b3459a6283a2a087291a390bb28b6322e40cc2fbf', '[\"*\"]', NULL, NULL, '2025-02-05 09:00:58', '2025-02-05 09:00:58'),
(54, 'App\\Models\\User', 2, 'reg token', 'fdbb7ef2b711b57b7d98c00f2336e9378119530b4903c10fa2587b716b44d5e9', '[\"*\"]', NULL, NULL, '2025-02-05 09:01:08', '2025-02-05 09:01:08'),
(66, 'App\\Models\\User', 2, 'reg token', '7cf0bb0b243b89e4848d5c2dd9e8c3d1d54d0c40e77b928f3c4a62c25fb15b10', '[\"*\"]', '2025-02-06 05:09:35', NULL, '2025-02-06 05:09:32', '2025-02-06 05:09:35');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HSjL6k89xNWtbXPUuf2KHy0MTX73zs5UCFFFlJ8q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 YaBrowser/24.12.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlJMSlV1WGZ4N2ZFRm8wVXpxVHI2SEpJZFM0WmtaNHg2enpJMERmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHBzOi8vc3BhY2VhcGkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738144806),
('iIR1SlS6aZDIPCyessedyBOjja1Z75UUhVxyHFP2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 YaBrowser/24.12.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUlFbUc3R3FGWmRsSExlQWxCTnIxQXh6Y2o2WDhmQVI0R0JmcExHUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHBzOi8vc3BhY2VhcGkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738567506),
('WdJrxKdbCU1sdmK2qu3kZQUn3tUFCaJULJaVKC14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 YaBrowser/24.12.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnRFRUVTZDhVdTJIUEVHZVZESzJxeXlUUzhvVnlONlBlZVFMR0o2TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHBzOi8vc3BhY2VhcGkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738534044);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `patronymic`, `birth_date`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Daniil', 'Arzamastsev', 'Michailovich', '2006-08-11', 'test@gmail.com', NULL, '$2y$12$mmdZSFw4Yl8kk6gCvo6NreQ5zbC4huG/0WokBUZMEmuNwwHq8kLq.', NULL, '2025-01-28 10:32:59', '2025-01-28 10:32:59'),
(2, 'Даниил', 'Арзамасцев', 'Михайлович', '2006-08-11', 'arzamastsevdaniil@gmail.com', NULL, '$2y$12$qFvnN4hMG8cocyanayGBBegKtp9Ijk4UtCXFJAhdz.55MROOuCKwG', NULL, '2025-02-03 02:38:39', '2025-02-03 02:38:39'),
(8, 'Даниил', 'Арзамасцев', 'Михайлович', '2006-08-11', 'arzamastsevdaniil1@gmail.com', NULL, '$2y$12$doKh5HvowkvojMmFkDpki.6i4b/RpXcpHqTw86w4F5P23XbdZOhoa', NULL, '2025-02-05 08:52:08', '2025-02-05 08:52:08');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `booking_flights`
--
ALTER TABLE `booking_flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_flights_user_id_foreign` (`user_id`),
  ADD KEY `booking_flights_flight_id_foreign` (`flight_id`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cosmonauts`
--
ALTER TABLE `cosmonauts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `booking_flights`
--
ALTER TABLE `booking_flights`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cosmonauts`
--
ALTER TABLE `cosmonauts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `flights`
--
ALTER TABLE `flights`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `booking_flights`
--
ALTER TABLE `booking_flights`
  ADD CONSTRAINT `booking_flights_flight_id_foreign` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_flights_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
