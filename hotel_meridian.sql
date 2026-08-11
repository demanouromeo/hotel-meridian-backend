-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 11 août 2026 à 01:49
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
-- Base de données : `hotel_meridian`
--

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dining_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_email` varchar(255) NOT NULL,
  `guest_phone` varchar(255) NOT NULL,
  `guest_nationality` varchar(255) DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests_count` tinyint(3) UNSIGNED NOT NULL,
  `payment_method` enum('online','at_hotel') NOT NULL DEFAULT 'at_hotel',
  `status` enum('pending_payment','confirmed','cancelled','checked_in','checked_out') NOT NULL DEFAULT 'pending_payment',
  `total_price` int(10) UNSIGNED NOT NULL,
  `special_requests` text DEFAULT NULL,
  `locale` varchar(2) NOT NULL DEFAULT 'fr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`id`, `reference`, `room_type_id`, `room_id`, `dining_service_id`, `guest_name`, `guest_email`, `guest_phone`, `guest_nationality`, `check_in`, `check_out`, `guests_count`, `payment_method`, `status`, `total_price`, `special_requests`, `locale`, `created_at`, `updated_at`) VALUES
(3, 'MER-20260802-TQC2', 1, NULL, NULL, 'Test Guest', 'test@example.com', '670000000', NULL, '2026-09-01', '2026-09-03', 2, 'at_hotel', 'confirmed', 30000, NULL, 'fr', '2026-08-02 07:10:23', '2026-08-02 07:10:23'),
(4, 'MER-20260802-MO1B', 1, NULL, NULL, 'CSRF Test', 'csrf@test.com', '670000001', NULL, '2026-09-10', '2026-09-12', 2, 'at_hotel', 'confirmed', 30000, NULL, 'fr', '2026-08-02 17:00:53', '2026-08-02 17:00:53'),
(5, 'MER-20230121-AOKX', 5, NULL, NULL, 'Serge Fotso', 'serge.fotso403@gmail.com', '+237 683189681', 'Camerounaise', '2023-01-21', '2023-01-27', 3, 'online', 'checked_out', 660000, NULL, 'en', '2022-12-31 05:00:00', '2022-12-31 05:00:00'),
(6, 'MER-20250819-FOAI', 1, NULL, 1, 'Jean-Paul Mbarga', 'jean.paul.mbarga758@hotmail.com', '+237 652504437', 'Camerounaise', '2025-08-19', '2025-08-25', 2, 'at_hotel', 'cancelled', 90000, NULL, 'en', '2025-07-27 04:00:00', '2025-07-27 04:00:00'),
(7, 'MER-20250727-OLNZ', 4, NULL, NULL, 'Divine Ashu', 'divine.ashu569@outlook.com', '+237 655798595', 'Camerounaise', '2025-07-27', '2025-08-02', 2, 'online', 'checked_out', 390000, NULL, 'fr', '2025-07-14 04:00:00', '2025-07-14 04:00:00'),
(8, 'MER-20240331-TAO6', 5, NULL, NULL, 'Ivan Chamba', 'ivan.chamba498@gmail.com', '+237 696616646', 'Camerounaise', '2024-03-31', '2024-04-02', 1, 'at_hotel', 'cancelled', 220000, NULL, 'en', '2024-02-27 05:00:00', '2024-02-27 05:00:00'),
(9, 'MER-20241017-X1WA', 5, NULL, 1, 'Bertrand Ngoune', 'bertrand.ngoune498@yahoo.fr', '+237 684286482', 'Camerounaise', '2024-10-17', '2024-10-23', 1, 'at_hotel', 'cancelled', 660000, NULL, 'fr', '2024-10-04 04:00:00', '2024-10-04 04:00:00'),
(10, 'MER-20261106-RP81', 2, NULL, 4, 'Comfort Fru', 'comfort.fru446@hotmail.com', '+237 675412581', 'Camerounaise', '2026-11-06', '2026-11-10', 2, 'at_hotel', 'confirmed', 344000, NULL, 'fr', '2026-08-02 22:14:19', '2026-08-02 22:14:19'),
(11, 'MER-20250305-SEJK', 2, NULL, NULL, 'Landry Ateba', 'landry.ateba476@hotmail.com', '+237 698340032', 'Camerounaise', '2025-03-05', '2025-03-06', 3, 'online', 'pending_payment', 50000, NULL, 'en', '2025-02-24 05:00:00', '2025-02-24 05:00:00'),
(12, 'MER-20250518-SJXB', 2, NULL, NULL, 'Serge Fotso', 'serge.fotso128@hotmail.com', '+237 690707453', 'Camerounaise', '2025-05-18', '2025-05-19', 2, 'online', 'checked_out', 50000, NULL, 'fr', '2025-04-15 04:00:00', '2025-04-15 04:00:00'),
(13, 'MER-20261026-IGPY', 4, NULL, 1, 'Nadège Nkemayang', 'nadege.nkemayang220@hotmail.com', '+237 662366869', 'Camerounaise', '2026-10-26', '2026-10-27', 2, 'online', 'cancelled', 65000, NULL, 'fr', '2026-08-02 22:14:19', '2026-08-02 22:14:19'),
(14, 'MER-20240417-HJPB', 4, NULL, 4, 'Armand Chendjou', 'armand.chendjou898@outlook.com', '+237 661149908', 'Camerounaise', '2024-04-17', '2024-04-21', 2, 'online', 'checked_out', 404000, NULL, 'fr', '2024-03-18 04:00:00', '2024-03-18 04:00:00'),
(15, 'MER-20240925-F8MU', 4, NULL, NULL, 'Serge Fotso', 'serge.fotso816@yahoo.fr', '+237 684367692', 'Camerounaise', '2024-09-25', '2024-09-29', 1, 'online', 'checked_out', 260000, NULL, 'fr', '2024-09-07 04:00:00', '2024-09-07 04:00:00'),
(16, 'MER-20250906-XBAG', 1, NULL, 3, 'Jean-Paul Mbarga', 'jean.paul.mbarga517@outlook.com', '+237 676849198', 'Camerounaise', '2025-09-06', '2025-09-07', 1, 'online', 'checked_out', 27000, NULL, 'fr', '2025-08-13 04:00:00', '2025-08-13 04:00:00'),
(17, 'MER-20250115-REEE', 4, NULL, 1, 'Armand Chendjou', 'armand.chendjou322@gmail.com', '+237 698287438', 'Camerounaise', '2025-01-15', '2025-01-17', 1, 'online', 'checked_out', 130000, NULL, 'fr', '2024-12-16 05:00:00', '2024-12-16 05:00:00'),
(18, 'MER-20260222-GDWK', 4, NULL, 1, 'Huguette Abena', 'huguette.abena804@yahoo.fr', '+237 661098583', 'Camerounaise', '2026-02-22', '2026-02-27', 1, 'online', 'cancelled', 325000, NULL, 'fr', '2026-01-24 05:00:00', '2026-01-24 05:00:00'),
(19, 'MER-20241129-OWWA', 1, NULL, 3, 'Christelle Talla', 'christelle.talla228@outlook.com', '+237 678703309', 'Camerounaise', '2024-11-29', '2024-12-04', 1, 'online', 'checked_out', 135000, NULL, 'en', '2024-11-25 05:00:00', '2024-11-25 05:00:00'),
(20, 'MER-20230912-NP4H', 4, NULL, NULL, 'Ivan Chamba', 'ivan.chamba466@outlook.com', '+237 689818167', 'Camerounaise', '2023-09-12', '2023-09-16', 2, 'at_hotel', 'checked_out', 260000, NULL, 'fr', '2023-09-01 04:00:00', '2023-09-01 04:00:00'),
(21, 'MER-20230219-DYIU', 5, NULL, NULL, 'Patrick Kum', 'patrick.kum970@yahoo.fr', '+237 684626215', 'Camerounaise', '2023-02-19', '2023-02-23', 3, 'at_hotel', 'pending_payment', 440000, NULL, 'en', '2023-02-07 05:00:00', '2023-02-07 05:00:00'),
(22, 'MER-20230727-J2WL', 3, NULL, 4, 'Jean-Paul Mbarga', 'jean.paul.mbarga550@yahoo.fr', '+237 686406312', 'Camerounaise', '2023-07-27', '2023-08-01', 1, 'at_hotel', 'cancelled', 240000, NULL, 'fr', '2023-06-18 04:00:00', '2023-06-18 04:00:00'),
(23, 'MER-20240206-QXSI', 3, NULL, 1, 'Rodrigue Wandji', 'rodrigue.wandji669@hotmail.com', '+237 685483136', 'Camerounaise', '2024-02-06', '2024-02-10', 2, 'at_hotel', 'cancelled', 120000, NULL, 'fr', '2024-01-05 05:00:00', '2024-01-05 05:00:00'),
(24, 'MER-20241028-WWKO', 5, NULL, NULL, 'Patrick Kum', 'patrick.kum45@gmail.com', '+237 687718101', 'Camerounaise', '2024-10-28', '2024-11-02', 3, 'at_hotel', 'checked_out', 550000, NULL, 'fr', '2024-10-26 04:00:00', '2024-10-26 04:00:00'),
(25, 'MER-20250131-W3K7', 2, NULL, 3, 'Sandrine Tchoumi', 'sandrine.tchoumi940@yahoo.fr', '+237 683811042', 'Camerounaise', '2025-01-31', '2025-02-04', 2, 'at_hotel', 'cancelled', 296000, NULL, 'en', '2025-01-21 05:00:00', '2025-01-21 05:00:00'),
(26, 'MER-20260224-QXNM', 4, NULL, 3, 'Ivan Chamba', 'ivan.chamba195@hotmail.com', '+237 683813719', 'Camerounaise', '2026-02-24', '2026-02-28', 1, 'online', 'checked_out', 308000, NULL, 'fr', '2026-01-27 05:00:00', '2026-01-27 05:00:00'),
(27, 'MER-20240207-CT3M', 2, NULL, 2, 'Bertrand Ngoune', 'bertrand.ngoune241@hotmail.com', '+237 674559792', 'Camerounaise', '2024-02-07', '2024-02-08', 1, 'at_hotel', 'checked_out', 55000, NULL, 'fr', '2024-01-12 05:00:00', '2024-01-12 05:00:00'),
(28, 'MER-20250928-128W', 3, NULL, 3, 'Divine Ashu', 'divine.ashu654@outlook.com', '+237 699579365', 'Camerounaise', '2025-09-28', '2025-10-02', 2, 'at_hotel', 'checked_out', 216000, NULL, 'en', '2025-09-02 04:00:00', '2025-09-02 04:00:00'),
(29, 'MER-20240215-IZIL', 3, NULL, NULL, 'Landry Ateba', 'landry.ateba181@hotmail.com', '+237 659769685', 'Camerounaise', '2024-02-15', '2024-02-20', 2, 'at_hotel', 'checked_out', 150000, NULL, 'fr', '2024-02-14 05:00:00', '2024-02-14 05:00:00'),
(30, 'MER-20231105-KNFP', 4, NULL, NULL, 'Nadège Nkemayang', 'nadege.nkemayang525@gmail.com', '+237 660438167', 'Camerounaise', '2023-11-05', '2023-11-08', 2, 'online', 'pending_payment', 195000, NULL, 'fr', '2023-10-19 04:00:00', '2023-10-19 04:00:00'),
(31, 'MER-20231107-49AA', 5, NULL, NULL, 'Patrick Kum', 'patrick.kum575@yahoo.fr', '+237 654275515', 'Camerounaise', '2023-11-07', '2023-11-13', 2, 'online', 'pending_payment', 660000, NULL, 'en', '2023-10-06 04:00:00', '2023-10-06 04:00:00'),
(32, 'MER-20251018-APF3', 5, NULL, 4, 'Carine Nguemo', 'carine.nguemo78@yahoo.fr', '+237 664336589', 'Camerounaise', '2025-10-18', '2025-10-23', 2, 'online', 'checked_out', 730000, NULL, 'fr', '2025-10-02 04:00:00', '2025-10-02 04:00:00'),
(33, 'MER-20250919-DWWY', 4, NULL, 4, 'Achille Mballa', 'achille.mballa500@hotmail.com', '+237 667721131', 'Camerounaise', '2025-09-19', '2025-09-20', 1, 'at_hotel', 'checked_out', 83000, NULL, 'fr', '2025-08-15 04:00:00', '2025-08-15 04:00:00'),
(34, 'MER-20260207-GBXQ', 5, NULL, 2, 'Rachel Aboubakar', 'rachel.aboubakar471@gmail.com', '+237 677441254', 'Camerounaise', '2026-02-07', '2026-02-08', 3, 'online', 'checked_out', 125000, NULL, 'fr', '2025-12-26 05:00:00', '2025-12-26 05:00:00'),
(35, 'MER-20230202-WS92', 2, NULL, 1, 'Franck Essomba', 'franck.essomba49@yahoo.fr', '+237 655933571', 'Camerounaise', '2023-02-02', '2023-02-08', 3, 'online', 'pending_payment', 300000, NULL, 'fr', '2022-12-19 05:00:00', '2022-12-19 05:00:00'),
(36, 'MER-20260728-XDXG', 2, NULL, 3, 'Vanessa Onana', 'vanessa.onana755@outlook.com', '+237 671241200', 'Camerounaise', '2026-07-28', '2026-07-29', 1, 'at_hotel', 'cancelled', 62000, NULL, 'en', '2026-06-19 04:00:00', '2026-06-19 04:00:00'),
(37, 'MER-20240830-G8AK', 3, NULL, 2, 'Yvette Foka', 'yvette.foka873@yahoo.fr', '+237 687487743', 'Camerounaise', '2024-08-30', '2024-09-02', 2, 'at_hotel', 'checked_out', 120000, NULL, 'fr', '2024-08-14 04:00:00', '2024-08-14 04:00:00'),
(38, 'MER-20260312-UILB', 4, NULL, 2, 'Yvette Foka', 'yvette.foka408@hotmail.com', '+237 663129451', 'Camerounaise', '2026-03-12', '2026-03-17', 2, 'online', 'checked_out', 375000, NULL, 'fr', '2026-01-27 05:00:00', '2026-01-27 05:00:00'),
(39, 'MER-20230603-FT28', 1, NULL, NULL, 'Ghislain Ndoumbe', 'ghislain.ndoumbe101@outlook.com', '+237 662103315', 'Camerounaise', '2023-06-03', '2023-06-07', 1, 'online', 'checked_out', 60000, NULL, 'en', '2023-05-22 04:00:00', '2023-05-22 04:00:00'),
(40, 'MER-20261214-MMC6', 5, NULL, NULL, 'Marie-Claire Ngo Bakolle', 'marie.claire.ngo.bakolle323@hotmail.com', '+237 676366190', 'Camerounaise', '2026-12-14', '2026-12-20', 3, 'at_hotel', 'confirmed', 660000, NULL, 'fr', '2026-07-25 22:14:19', '2026-07-25 22:14:19'),
(41, 'MER-20230616-XNGQ', 1, NULL, 1, 'Arsène Ebogo', 'arsene.ebogo768@gmail.com', '+237 665511611', 'Camerounaise', '2023-06-16', '2023-06-21', 1, 'at_hotel', 'checked_out', 75000, NULL, 'fr', '2023-06-01 04:00:00', '2023-06-01 04:00:00'),
(42, 'MER-20260326-3VOJ', 2, NULL, 3, 'Comfort Fru', 'comfort.fru652@yahoo.fr', '+237 670392454', 'Camerounaise', '2026-03-26', '2026-04-01', 2, 'online', 'cancelled', 444000, NULL, 'fr', '2026-03-21 04:00:00', '2026-03-21 04:00:00'),
(43, 'MER-20240913-B2EU', 5, NULL, NULL, 'Delphine Sanda', 'delphine.sanda358@yahoo.fr', '+237 664686964', 'Camerounaise', '2024-09-13', '2024-09-15', 3, 'online', 'checked_out', 220000, NULL, 'fr', '2024-09-11 04:00:00', '2024-09-11 04:00:00'),
(44, 'MER-20250919-ZJFG', 1, NULL, 4, 'Rachel Aboubakar', 'rachel.aboubakar336@yahoo.fr', '+237 677165507', 'Camerounaise', '2025-09-19', '2025-09-20', 2, 'at_hotel', 'checked_out', 51000, NULL, 'en', '2025-09-16 04:00:00', '2025-09-16 04:00:00'),
(45, 'MER-20260822-OKIF', 1, NULL, NULL, 'Rodrigue Wandji', 'rodrigue.wandji288@yahoo.fr', '+237 677962315', 'Camerounaise', '2026-08-22', '2026-08-26', 1, 'online', 'confirmed', 60000, NULL, 'en', '2026-07-28 04:00:00', '2026-07-28 04:00:00'),
(46, 'MER-20260528-A0EG', 4, NULL, 2, 'Aurélie Fomekong', 'aurelie.fomekong857@gmail.com', '+237 696201233', 'Camerounaise', '2026-05-28', '2026-05-29', 1, 'online', 'checked_out', 70000, NULL, 'fr', '2026-05-18 04:00:00', '2026-05-18 04:00:00'),
(47, 'MER-20251102-KG8C', 1, NULL, 3, 'Delphine Sanda', 'delphine.sanda862@yahoo.fr', '+237 657275861', 'Camerounaise', '2025-11-02', '2025-11-07', 1, 'at_hotel', 'checked_out', 135000, NULL, 'fr', '2025-10-17 04:00:00', '2025-10-17 04:00:00'),
(48, 'MER-20250113-UZ5X', 3, NULL, 2, 'Vanessa Onana', 'vanessa.onana230@hotmail.com', '+237 686539947', 'Camerounaise', '2025-01-13', '2025-01-15', 1, 'online', 'checked_out', 70000, NULL, 'en', '2025-01-09 05:00:00', '2025-01-09 05:00:00'),
(49, 'MER-20230207-ENLD', 4, NULL, 4, 'Grace Ngwa', 'grace.ngwa765@outlook.com', '+237 697302867', 'Camerounaise', '2023-02-07', '2023-02-08', 1, 'at_hotel', 'checked_out', 83000, NULL, 'fr', '2023-01-19 05:00:00', '2023-01-19 05:00:00'),
(50, 'MER-20230606-UKJU', 1, NULL, 4, 'Delphine Sanda', 'delphine.sanda107@hotmail.com', '+237 667497487', 'Camerounaise', '2023-06-06', '2023-06-10', 2, 'at_hotel', 'checked_out', 204000, NULL, 'fr', '2023-05-09 04:00:00', '2023-05-09 04:00:00'),
(51, 'MER-20230529-0XMI', 4, NULL, 2, 'Sandrine Tchoumi', 'sandrine.tchoumi977@yahoo.fr', '+237 683287355', 'Camerounaise', '2023-05-29', '2023-06-02', 2, 'at_hotel', 'cancelled', 300000, NULL, 'en', '2023-05-22 04:00:00', '2023-05-22 04:00:00'),
(52, 'MER-20250128-41KQ', 4, NULL, NULL, 'Vanessa Onana', 'vanessa.onana885@outlook.com', '+237 669701571', 'Camerounaise', '2025-01-28', '2025-01-31', 2, 'at_hotel', 'checked_out', 195000, NULL, 'fr', '2025-01-12 05:00:00', '2025-01-12 05:00:00'),
(53, 'MER-20250721-I6HD', 3, NULL, NULL, 'Achille Mballa', 'achille.mballa979@yahoo.fr', '+237 668006153', 'Camerounaise', '2025-07-21', '2025-07-24', 2, 'at_hotel', 'pending_payment', 90000, NULL, 'fr', '2025-07-10 04:00:00', '2025-07-10 04:00:00'),
(54, 'MER-20250213-5Z6F', 5, NULL, 4, 'Bertrand Ngoune', 'bertrand.ngoune577@gmail.com', '+237 693771897', 'Camerounaise', '2025-02-13', '2025-02-15', 3, 'at_hotel', 'cancelled', 328000, NULL, 'en', '2025-01-07 05:00:00', '2025-01-07 05:00:00'),
(55, 'MER-20240105-YXC6', 5, NULL, NULL, 'Divine Ashu', 'divine.ashu442@yahoo.fr', '+237 653906112', 'Camerounaise', '2024-01-05', '2024-01-06', 4, 'at_hotel', 'checked_out', 110000, NULL, 'fr', '2023-12-10 05:00:00', '2023-12-10 05:00:00'),
(56, 'MER-20260615-JGRU', 4, NULL, 4, 'Grace Ngwa', 'grace.ngwa164@gmail.com', '+237 661951990', 'Camerounaise', '2026-06-15', '2026-06-18', 1, 'online', 'cancelled', 249000, NULL, 'fr', '2026-06-14 04:00:00', '2026-06-14 04:00:00'),
(57, 'MER-20240726-XEJW', 3, NULL, 4, 'Pélagie Etoundi', 'pelagie.etoundi931@gmail.com', '+237 690475965', 'Camerounaise', '2024-07-26', '2024-08-01', 2, 'at_hotel', 'checked_out', 396000, NULL, 'fr', '2024-06-22 04:00:00', '2024-06-22 04:00:00'),
(58, 'MER-20230404-CESS', 3, NULL, 1, 'Christelle Talla', 'christelle.talla239@hotmail.com', '+237 688721376', 'Camerounaise', '2023-04-04', '2023-04-07', 2, 'at_hotel', 'checked_out', 90000, NULL, 'fr', '2023-03-07 05:00:00', '2023-03-07 05:00:00'),
(59, 'MER-20250608-YEMF', 2, NULL, NULL, 'Precious Bih', 'precious.bih76@yahoo.fr', '+237 686460372', 'Camerounaise', '2025-06-08', '2025-06-11', 3, 'at_hotel', 'checked_out', 150000, NULL, 'fr', '2025-05-10 04:00:00', '2025-05-10 04:00:00'),
(60, 'MER-20251001-IE3M', 2, NULL, 1, 'Vanessa Onana', 'vanessa.onana456@yahoo.fr', '+237 666823509', 'Camerounaise', '2025-10-01', '2025-10-05', 3, 'at_hotel', 'cancelled', 200000, NULL, 'fr', '2025-09-18 04:00:00', '2025-09-18 04:00:00'),
(61, 'MER-20240704-UUAU', 5, NULL, NULL, 'Christelle Talla', 'christelle.talla836@outlook.com', '+237 650215742', 'Camerounaise', '2024-07-04', '2024-07-06', 3, 'at_hotel', 'cancelled', 220000, NULL, 'fr', '2024-06-26 04:00:00', '2024-06-26 04:00:00'),
(62, 'MER-20260716-ED8V', 3, NULL, 1, 'Emmanuel Tabi', 'emmanuel.tabi306@outlook.com', '+237 698047555', 'Camerounaise', '2026-07-16', '2026-07-18', 1, 'at_hotel', 'checked_out', 60000, NULL, 'fr', '2026-07-01 04:00:00', '2026-07-01 04:00:00'),
(63, 'MER-20250515-OE4I', 3, NULL, NULL, 'Delphine Sanda', 'delphine.sanda979@hotmail.com', '+237 661674908', 'Camerounaise', '2025-05-15', '2025-05-17', 1, 'at_hotel', 'checked_out', 60000, NULL, 'fr', '2025-04-04 04:00:00', '2025-04-04 04:00:00'),
(64, 'MER-20250425-JFG7', 2, NULL, 2, 'Sandrine Tchoumi', 'sandrine.tchoumi480@yahoo.fr', '+237 668272140', 'Camerounaise', '2025-04-25', '2025-04-30', 2, 'online', 'checked_out', 300000, NULL, 'fr', '2025-03-14 04:00:00', '2025-03-14 04:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('hotel-meridian-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:3;', 1786404995),
('hotel-meridian-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1786404995;', 1786404995),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1785638854),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1785638854;', 1785638854);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `locale` varchar(2) NOT NULL DEFAULT 'fr',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `locale`, `is_read`, `created_at`, `updated_at`) VALUES
(2, 'Test', 'test@example.com', NULL, NULL, 'Hello, testing the contact form end to end.', 'fr', 0, '2026-08-02 07:10:24', '2026-08-02 07:10:24'),
(3, 'Peter', 'dhh@gmail.com', '+237 678 43 84', NULL, 'uu3yruui23r', 'fr', 0, '2026-08-02 17:00:41', '2026-08-02 17:00:41'),
(4, 'BAKAR HAMADOU', 'bahdou@gmail.com', '+237 674 34 55', NULL, 'Hello Biggy. How are you doing?', 'fr', 0, '2026-08-02 17:04:54', '2026-08-02 17:04:54');

-- --------------------------------------------------------

--
-- Structure de la table `dining_services`
--

CREATE TABLE `dining_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `description_en` text DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `price_per_guest_per_night` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dining_services`
--

INSERT INTO `dining_services` (`id`, `name_en`, `name_fr`, `description_en`, `description_fr`, `price_per_guest_per_night`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Room Only', 'Chambre seule', 'No dining plan included.', 'Aucune formule de restauration incluse.', 0, 1, '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(2, 'Breakfast Only', 'Petit-déjeuner seul', 'Continental breakfast served each morning.', 'Petit-déjeuner continental servi chaque matin.', 5000, 1, '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(3, 'Half Board', 'Demi-pension', 'Breakfast and dinner included.', 'Petit-déjeuner et dîner inclus.', 12000, 1, '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(4, 'Full Board', 'Pension complète', 'Breakfast, lunch and dinner included.', 'Petit-déjeuner, déjeuner et dîner inclus.', 18000, 1, '2026-08-02 06:20:42', '2026-08-02 06:20:42');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_02_021058_create_personal_access_tokens_table', 2),
(5, '2026_08_02_021359_create_room_types_table', 3),
(6, '2026_08_02_021400_create_rooms_table', 3),
(7, '2026_08_02_021401_create_dining_services_table', 3),
(8, '2026_08_02_021402_create_bookings_table', 3),
(9, '2026_08_02_021403_create_payments_table', 3),
(10, '2026_08_02_021404_create_contact_messages_table', 3),
(11, '2026_08_02_021405_create_settings_table', 3),
(12, '2026_08_02_021406_add_role_to_users_table', 3),
(13, '2026_08_02_175514_create_services_table', 4),
(14, '2026_08_02_175515_create_service_reservations_table', 4),
(15, '2026_08_10_231036_add_image_path_to_room_types_table', 5),
(16, '2026_08_10_231040_add_image_path_to_services_table', 5);

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
('gabinprof1@gmail.com', '$2y$12$LbSLQIVEBJoAwP2llFtQgezKO3kJHGGoYkiLhAkmoCcoOaNybzXSK', '2026-08-11 03:11:23');

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `aggregator` varchar(255) NOT NULL DEFAULT 'campay',
  `operator` varchar(255) DEFAULT NULL,
  `campay_reference` varchar(255) DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'XAF',
  `phone_number` varchar(255) NOT NULL,
  `status` enum('initiated','pending','successful','failed') NOT NULL DEFAULT 'initiated',
  `raw_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_payload`)),
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `floor` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` enum('available','maintenance','out_of_service') NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `room_type_id`, `room_number`, `floor`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '101', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(2, 1, '102', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(3, 1, '103', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(4, 1, '104', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(5, 1, '105', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(6, 1, '106', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(7, 1, '107', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(8, 1, '108', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(9, 1, '109', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(10, 1, '110', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(11, 1, '111', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(12, 1, '112', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(13, 1, '113', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(14, 1, '114', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(15, 1, '115', 1, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(16, 2, '201', 2, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(17, 2, '202', 2, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(18, 2, '203', 2, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(19, 2, '204', 2, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(20, 3, '301', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(21, 3, '302', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(22, 3, '303', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(23, 3, '304', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(24, 3, '305', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(25, 3, '306', 3, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(26, 4, '401', 4, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(27, 4, '402', 4, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(28, 5, '501', 5, 'available', '2026-08-02 06:20:41', '2026-08-02 06:20:41');

-- --------------------------------------------------------

--
-- Structure de la table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `description_en` text DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `beds` tinyint(3) UNSIGNED NOT NULL,
  `baths` tinyint(3) UNSIGNED NOT NULL,
  `capacity` tinyint(3) UNSIGNED NOT NULL,
  `price_per_night` int(10) UNSIGNED NOT NULL,
  `total_units` int(10) UNSIGNED NOT NULL,
  `amenities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`amenities`)),
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `room_types`
--

INSERT INTO `room_types` (`id`, `code`, `name_en`, `name_fr`, `description_en`, `description_fr`, `beds`, `baths`, `capacity`, `price_per_night`, `total_units`, `amenities`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'standard', 'Standard Room', 'Chambre Standard', 'A comfortable room with one bed, ideal for two guests.', 'Une chambre confortable avec un lit, idéale pour deux personnes.', 1, 1, 2, 15000, 15, '{\"wifi\":true,\"tv\":true,\"phone\":false,\"kitchen\":false,\"parking\":true}', NULL, '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(2, 'executive', 'Executive Room', 'Chambre Executive', 'A spacious room with two beds, perfect for families or small groups of up to four guests.', 'Une chambre spacieuse avec deux lits, parfaite pour les familles ou petits groupes jusqu’à quatre personnes.', 2, 1, 4, 50000, 4, '{\"wifi\":true,\"tv\":true,\"phone\":false,\"kitchen\":false,\"parking\":true}', NULL, '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(3, 'junior_executive', 'Junior Executive Room', 'Chambre Executive Junior', 'A cozy room with one bed, well suited for two guests.', 'Une chambre chaleureuse avec un lit, bien adaptée pour deux personnes.', 1, 1, 2, 30000, 6, '{\"wifi\":true,\"tv\":true,\"phone\":false,\"kitchen\":false,\"parking\":true}', NULL, '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(4, 'junior_suite', 'Junior Suite', 'Suite Junior', 'An elegant suite with one bed and a kitchenette, for two guests.', 'Une suite élégante avec un lit et une kitchenette, pour deux personnes.', 1, 1, 2, 65000, 2, '{\"wifi\":true,\"tv\":true,\"phone\":true,\"kitchen\":true,\"parking\":true}', NULL, '2026-08-02 06:20:41', '2026-08-02 06:20:41'),
(5, 'senior_suite', 'Senior Suite', 'Suite Senior', 'Our most luxurious suite, with two beds, two bathrooms and a full kitchen, for up to four guests.', 'Notre suite la plus luxueuse, avec deux lits, deux salles de bain et une cuisine complète, jusqu’à quatre personnes.', 2, 2, 4, 110000, 1, '{\"wifi\":true,\"tv\":true,\"phone\":true,\"kitchen\":true,\"parking\":true}', NULL, '2026-08-02 06:20:41', '2026-08-02 06:20:41');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `description_en` text DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `starting_price` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `code`, `name_en`, `name_fr`, `description_en`, `description_fr`, `starting_price`, `image_path`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'conference_room', 'Conference / Meeting Room', 'Salle de conférence / réunion', 'A well-equipped room for meetings, seminars and conferences.', 'Une salle bien équipée pour vos réunions, séminaires et conférences.', 350000, NULL, 1, '2026-08-02 21:58:26', '2026-08-02 22:01:34'),
(2, 'party_hall', 'Party Hall', 'Salle de fête', 'A spacious hall for weddings, birthdays and celebrations.', 'Une salle spacieuse pour vos mariages, anniversaires et célébrations.', 600000, NULL, 1, '2026-08-02 21:58:26', '2026-08-02 21:58:26'),
(3, 'sound_decoration', 'Sound System / Decoration', 'Sonorisation / Décoration', 'Professional sound system and decoration for your events.', 'Sonorisation professionnelle et décoration pour vos événements.', 200000, NULL, 1, '2026-08-02 21:58:26', '2026-08-02 21:58:26'),
(4, 'catering', 'Catering Service', 'Service traiteur', 'Catering service for your events, from cocktails to full menus.', 'Service traiteur pour vos événements, du cocktail au menu complet.', 1200000, NULL, 1, '2026-08-02 21:58:26', '2026-08-02 21:58:26'),
(5, 'fitness_subscription', 'Monthly Fitness Room Subscription', 'Abonnement mensuel salle de fitness', 'Monthly access to our fitness room.', 'Accès mensuel à notre salle de fitness.', 60000, NULL, 1, '2026-08-02 21:58:26', '2026-08-02 21:58:26');

-- --------------------------------------------------------

--
-- Structure de la table `service_reservations`
--

CREATE TABLE `service_reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `reservation_date` date NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_email` varchar(255) NOT NULL,
  `guest_phone` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('confirmed','cancelled') NOT NULL DEFAULT 'confirmed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service_reservations`
--

INSERT INTO `service_reservations` (`id`, `reference`, `service_id`, `reservation_date`, `guest_name`, `guest_email`, `guest_phone`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(3, 'SVC-20241227-JQAG', 2, '2024-12-27', 'Vanessa Onana', 'vanessa.onana970@hotmail.com', '+237 675804806', 'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.', 'confirmed', '2024-12-12 05:00:00', '2024-12-12 05:00:00'),
(4, 'SVC-20230416-R3A7', 2, '2023-04-16', 'Ornella Njoya', 'ornella.njoya715@outlook.com', '+237 691435649', 'Merci de prévoir une sonorisation pour extérieur.', 'confirmed', '2023-03-29 04:00:00', '2023-03-29 04:00:00'),
(5, 'SVC-20230321-VUMU', 3, '2023-03-21', 'Emmanuel Tabi', 'emmanuel.tabi631@hotmail.com', '+237 669584617', 'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.', 'confirmed', '2023-02-22 05:00:00', '2023-02-22 05:00:00'),
(6, 'SVC-20230911-MVH4', 5, '2023-09-11', 'Huguette Abena', 'huguette.abena632@outlook.com', '+237 668855284', 'Anniversaire, 50 invités environ.', 'confirmed', '2023-09-04 04:00:00', '2023-09-04 04:00:00'),
(7, 'SVC-20240801-RUUV', 3, '2024-08-01', 'Aurélie Fomekong', 'aurelie.fomekong584@yahoo.fr', '+237 690475376', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'confirmed', '2024-07-06 04:00:00', '2024-07-06 04:00:00'),
(8, 'SVC-20241122-IXYT', 2, '2024-11-22', 'Sandrine Tchoumi', 'sandrine.tchoumi512@yahoo.fr', '+237 662281167', 'Séminaire de formation sur deux jours.', 'cancelled', '2024-11-02 04:00:00', '2024-11-02 04:00:00'),
(9, 'SVC-20250822-3O1E', 2, '2025-08-22', 'Grace Ngwa', 'grace.ngwa628@outlook.com', '+237 699123983', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'confirmed', '2025-08-11 04:00:00', '2025-08-11 04:00:00'),
(10, 'SVC-20241209-MLJJ', 2, '2024-12-09', 'Divine Ashu', 'divine.ashu752@hotmail.com', '+237 666278497', 'Séminaire de formation sur deux jours.', 'confirmed', '2024-11-13 05:00:00', '2024-11-13 05:00:00'),
(11, 'SVC-20261111-AWRK', 3, '2026-11-11', 'Arsène Ebogo', 'arsene.ebogo194@gmail.com', '+237 673317524', 'Anniversaire, 50 invités environ.', 'confirmed', '2026-08-01 22:14:20', '2026-08-01 22:14:20'),
(12, 'SVC-20260503-DYMK', 1, '2026-05-03', 'Rachel Aboubakar', 'rachel.aboubakar359@hotmail.com', '+237 671310855', 'Séminaire de formation sur deux jours.', 'confirmed', '2026-04-22 04:00:00', '2026-04-22 04:00:00'),
(13, 'SVC-20251124-BTI1', 3, '2025-11-24', 'Vanessa Onana', 'vanessa.onana331@outlook.com', '+237 665682789', 'Merci de prévoir une sonorisation pour extérieur.', 'confirmed', '2025-11-22 05:00:00', '2025-11-22 05:00:00'),
(14, 'SVC-20240619-PKKF', 4, '2024-06-19', 'Christelle Talla', 'christelle.talla409@gmail.com', '+237 658106164', 'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.', 'cancelled', '2024-06-02 04:00:00', '2024-06-02 04:00:00'),
(15, 'SVC-20250930-1CZF', 4, '2025-09-30', 'Delphine Sanda', 'delphine.sanda954@outlook.com', '+237 696600165', 'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.', 'cancelled', '2025-09-03 04:00:00', '2025-09-03 04:00:00'),
(16, 'SVC-20241119-ILZI', 3, '2024-11-19', 'Brice Kamga', 'brice.kamga669@hotmail.com', '+237 681988103', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'cancelled', '2024-11-07 05:00:00', '2024-11-07 05:00:00'),
(17, 'SVC-20260613-PWSL', 4, '2026-06-13', 'Ndifor Nfor', 'ndifor.nfor328@gmail.com', '+237 685956151', 'Séminaire de formation sur deux jours.', 'confirmed', '2026-05-26 04:00:00', '2026-05-26 04:00:00'),
(18, 'SVC-20250603-ESLE', 5, '2025-06-03', 'Fabrice Djoumessi', 'fabrice.djoumessi34@hotmail.com', '+237 668999564', 'Anniversaire, 50 invités environ.', 'confirmed', '2025-05-11 04:00:00', '2025-05-11 04:00:00'),
(19, 'SVC-20260627-IEDW', 2, '2026-06-27', 'Nadège Nkemayang', 'nadege.nkemayang956@yahoo.fr', '+237 654809608', 'Séminaire de formation sur deux jours.', 'confirmed', '2026-06-01 04:00:00', '2026-06-01 04:00:00'),
(20, 'SVC-20251115-EMFQ', 5, '2025-11-15', 'Emmanuel Tabi', 'emmanuel.tabi118@yahoo.fr', '+237 689319584', 'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.', 'confirmed', '2025-10-29 04:00:00', '2025-10-29 04:00:00'),
(21, 'SVC-20231218-TQLC', 1, '2023-12-18', 'Cédric Beyala', 'cedric.beyala599@outlook.com', '+237 688741333', 'Anniversaire, 50 invités environ.', 'confirmed', '2023-12-04 05:00:00', '2023-12-04 05:00:00'),
(22, 'SVC-20251022-8KNM', 1, '2025-10-22', 'Franck Essomba', 'franck.essomba500@hotmail.com', '+237 699038873', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'confirmed', '2025-10-21 04:00:00', '2025-10-21 04:00:00'),
(23, 'SVC-20240529-3QYQ', 1, '2024-05-29', 'Landry Ateba', 'landry.ateba994@hotmail.com', '+237 693405742', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'confirmed', '2024-05-19 04:00:00', '2024-05-19 04:00:00'),
(24, 'SVC-20241203-S4T9', 4, '2024-12-03', 'Rachel Aboubakar', 'rachel.aboubakar74@outlook.com', '+237 667847074', 'Anniversaire, 50 invités environ.', 'confirmed', '2024-11-11 05:00:00', '2024-11-11 05:00:00'),
(25, 'SVC-20260623-AB9Q', 4, '2026-06-23', 'Comfort Fru', 'comfort.fru468@hotmail.com', '+237 657547520', NULL, 'confirmed', '2026-05-29 04:00:00', '2026-05-29 04:00:00'),
(26, 'SVC-20240227-KQ0H', 1, '2024-02-27', 'Ghislain Ndoumbe', 'ghislain.ndoumbe258@gmail.com', '+237 682974589', NULL, 'confirmed', '2024-02-09 05:00:00', '2024-02-09 05:00:00'),
(27, 'SVC-20240404-5VKD', 4, '2024-04-04', 'Delphine Sanda', 'delphine.sanda351@gmail.com', '+237 686618584', 'Anniversaire, 50 invités environ.', 'confirmed', '2024-03-17 04:00:00', '2024-03-17 04:00:00'),
(28, 'SVC-20250512-YGIC', 2, '2025-05-12', 'Delphine Sanda', 'delphine.sanda121@outlook.com', '+237 688990466', 'Séminaire de formation sur deux jours.', 'confirmed', '2025-04-15 04:00:00', '2025-04-15 04:00:00'),
(29, 'SVC-20251112-VTIQ', 2, '2025-11-12', 'Huguette Abena', 'huguette.abena422@hotmail.com', '+237 684482785', 'Merci de prévoir une sonorisation pour extérieur.', 'confirmed', '2025-10-13 04:00:00', '2025-10-13 04:00:00'),
(30, 'SVC-20250720-CNO0', 1, '2025-07-20', 'Divine Ashu', 'divine.ashu759@yahoo.fr', '+237 660492986', 'Anniversaire, 50 invités environ.', 'confirmed', '2025-06-20 04:00:00', '2025-06-20 04:00:00'),
(31, 'SVC-20251010-T7FF', 4, '2025-10-10', 'Hervé Zang', 'herve.zang301@gmail.com', '+237 652323341', 'Mariage traditionnel, prévoir décoration en blanc et or.', 'confirmed', '2025-09-15 04:00:00', '2025-09-15 04:00:00'),
(32, 'SVC-20240323-RIAI', 1, '2024-03-23', 'Larissa Menye', 'larissa.menye786@gmail.com', '+237 687878091', 'Merci de prévoir une sonorisation pour extérieur.', 'confirmed', '2024-03-16 04:00:00', '2024-03-16 04:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
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
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0VTsNVxAsMZkNEybx5x4jgXAFU4U5jCi4LAkpMnn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJ2TTN6Q3RNZnFXRFRBbkJuSm9WUjUyOUJ6WU5TSnl0SUVGVTg0WkxWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404228),
('18rFm5YD84XSZCwblFOEQS1VvyNQdCcnGoLmAByM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJqVGY1YzU5cHRDbG0xdWptbjBkSG9SWUVNMzFaMFA1aTNXZTBPdHBYIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402624),
('7qHq3sTKZDUWFbaJSmn5VMpH8JmsYT2FWQS3Pd4Y', NULL, '127.0.0.1', 'curl/8.18.0', 'eyJfdG9rZW4iOiJVdktNVUtLSjVXb0lRdUxoYnJ4RkdGS2pQWkZ3MkR4cmVxNVVLb0d3IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1786404340),
('8jFl0rZDwwcNcVeyNmKC8AdxsyoTOLcLlWETIRl4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJUNGkxT1dzakVzZnUwQXJDcjRDZk9zVDJYZktESTRkelo4bEZGcDdBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1786404947),
('9lvW4M6Efjvp3ydBgCi0BPlefO1SSEWlSMIaM3cx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJRU0FZbm1iclB5cFFCN2lrclk2bjFBNXkzeDVPc2M3QzFpMEU1TWZVIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403519),
('BC6NeyEDJ36h3kEi7yG2SNQVTsZ3aQpVi5xZpGr7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJCT095SGxibkp1YW5rNm1zcTFGRnh6REhFM1FKMFBFa2VkS1VkcWl1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1786404290),
('cyUqUTrTjX7W97ynU7EegUnpsaERchwRJdvCjwuG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiI3YnZPMVV0d3VyTVdOZlJhVG1aNlN5RHJPRG14cHB6dDZRODFCRWd6IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402949),
('dRL1lS4L69MxtayCpS46KJAX2DUZ3PY0I5pdPk7x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJLUld3ckpMQlZqTlF2VlBabmdoZjBsNVp5MDNxMExWM1MwUkRVM2d5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402623),
('e2e23osfR7T24vKb8cN9WQ9g2K99qFYBvRZHiRLA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiI3ZUNTdFlIc0NLbVBvMUFXazJ5RzJQWHJpT0tsaU1iclBqa3E2YTBOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9kYXNoYm9hcmQtc3RhdHMiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiYjc1NDlmNWQxZmJhNWRiYTI1ZjQ0NDBkYWE1Y2JhY2FmOTQ5ODk3NmNmODg0ZThkZDFkMjc3OWY5N2M0MTc4NiJ9', 1786404938),
('fweZojV5bfSl245fuRETXVO6NOU7ZrnAm2UBRcvF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJ5YjFaV0xUUXhOV0NrT0haaUdBTEdUejZ4MGFwSVc1NGFLYXFDbGR2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403410),
('fXrqENy5EHtzWkSDqzDtUnY2eUIBPxB4CG20JftO', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJBTG1Rd0pVWkVPWW0yckk1WFAwRHkzQzhhS0NOM3RYOTNUa3czWktVIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMjBcL2FwaVwvYWRtaW5cL3NlcnZpY2VzIiwicm91dGUiOm51bGx9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwicGFzc3dvcmRfaGFzaF93ZWIiOiJiNzU0OWY1ZDFmYmE1ZGJhMjVmNDQ0MGRhYTVjYmFjYWY5NDk4OTc2Y2Y4ODRlOGRkMWQyNzc5Zjk3YzQxNzg2In0=', 1786404267),
('gw1mjshcOfbI7QVT7HQvkSeldsNX4DFnbnyRZFGG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJPSDBNUVFFSkg5YlBFNlVnS0t0SXdJbjFiTlBBSTN4VGhrZUhZeWVyIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403520),
('gYF6aalGBIvZyIE8L3cFEPWs1Vc8NO5AGXAUDruv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJyczVuTHJKUjV0d05mMVZ2QXpuWTBUdEFkaXhJQ0luQVc0WWZEMUxMIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404983),
('HG6Bq2VjaHg5MwE91KjhJmkZkCJNL4ceVK8pn5XQ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJ2SDF3OXJaQTRKcEh0cVphUkhVbndNNXNkYVBRRkJ2U21ZMUVwTWtzIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9yb29tLXR5cGVzIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6IjZkM2YwMjQ2ZGVhNWU4NDc0MWVjNWFjM2I4NWRmMjA3ZGExNjZhZDViYzcyMjEyOGIxMzE4MGZjNzNkOWViNWIifQ==', 1786402957),
('i5E7mGeGLO5pPX2KZko48ad9ZgF2j1FzGnEXX9Pb', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJNbDdJdHp2cjAzUkoxTkc1aGN2U05pR09PeVc3dDVlOGNtdlJmb0ZqIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1786404392),
('Iqg8xy0AAIzK9nCqAKj6UB1hmzxt2O0uX0PVPTJK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJMajJlZ0dhUUZVVHY5SUtQZkxrSGJRcVdWVGRnT3UwRlZWcnBLeW82IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1786402835),
('kMf3nt1WiX7PX7Qv2rXGyY6YjHZSLbJXKfATys58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiI0QTdJemRLNGhrOUw5cWVLTE1yczFqTXJQeTFBMHdtYzUzeDF6RXJoIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403333),
('M3VXNcogjXfjbw5OsgDDiE19qgpYLFK2RnPA7Bn1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJZTzE3ZU5IZHBrVTZkWlVvcEJXZnNUcGw3SEYxbXlsSzB1N21qVmhTIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404286),
('MavJpJm8nCtTXYTjonfwAD1Hafo7SM2SvvXzQklJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJDNTFzaXlaa1Z0M2pPMWxualZFeTJhMkpqczlEaWpIVjdoRVlERGhCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404975),
('OgBcM0Wt7pcct4RNIsMTu44TOCcymWw7OaHj8cUw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJWdVY1aWlwVm5QS1NhdGxGdUxxeTdhdnU4c1pvTXdzTlQxTTRybGl5IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMjBcL3NhbmN0dW1cL2NzcmYtY29va2llIiwicm91dGUiOiJzYW5jdHVtLmNzcmYtY29va2llIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1786403387),
('pemawKK1ES91ZywxbXfOsZVDtkYOwqkSySDvZmvP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJtZkZXdUwya0sxcVM3a3FvY1BMRk1JV3R1anAxUnl5WHoxMFlPT2xwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404940),
('pI9eV0XzzEJ5C7XB9DMhoYMnWaE5RQaEJ3qV1trB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiI4ZXdkZjJGZWVlQ24xZjZZSnhMOHhRWTZvTmhNdlFnNGtxQ1c0QUpWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404389),
('rKlwuqsf0ljetB6AnA2qh5FF4zAkz6sRDg0bI73A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJMTEFCY1hrT2QwcU5RWGt3Y1B5bE1GeVhoZmlDV2V1aHFIS2tscG5xIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402860),
('rO86B933iR7sauuQWqJc1q9OyLExJy7GBAN7AjC9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJON2pCT0VNaGY4T1VZVVFCc0RJQ2c0Z3ZjTXdQTTllMk5HcG9YQmthIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9zZXJ2aWNlcyIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwicGFzc3dvcmRfaGFzaF93ZWIiOiI2ZDNmMDI0NmRlYTVlODQ3NDFlYzVhYzNiODVkZjIwN2RhMTY2YWQ1YmM3MjIxMjhiMTMxODBmYzczZDllYjViIn0=', 1786402899),
('sqv7eWZTgjPxLlzwB6JrcvHiAMeUBJWtSqQMBv56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJubnd5M3ZVNDY4YmwxcERqSzNqNlMyUWhXS3pPeDNrQ3o2U3BjUER3IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1786402863),
('sR0sYv1UNfizwzzxYI0tuwxTPNMCUmObrsjMTB54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJDbU15VVlIbDZpMkpRQkFJeUY1Z2dGQXRWVHhYYnRBUWFHaFZTNUJYIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402891),
('U2ksK9aGKBne8zEWd75M3Gh2yYYvsg89qW87tQpf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIzVjdnQkVWU0RGNGpPOTdUTWZIZVJIbGwySUV5a1hlU09SRjlOUU5zIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402578),
('uX10uC4eRIFqELcHoLSk3G3Zkl98g53e93Ko8vsN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJETXI4TER3bG8xdmN4cFZCbzhSQkhhaUZNdEpndE9yaFBpbTZoRDBoIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404932),
('W3xsdWnbN6pSsPePLATvW5Eid6PNGUWlMEvs09R0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiI5c1JlYm9iMkJxbG5XV050SjNzQ1FVUFloUWc5MTFyc2x4WEdjYldzIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786404365),
('WdsTtt9XHETyYmzlbcer9pZz6cGRxgTxq17K4Xo3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiIyWWVCOTh1UXpYZUtERmZYQXJQS1NRcjlSbml5VEplblFzTXppR1RjIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403410),
('Xo8gQ2jCf9JnyeQ3GU3wtTxlzlKUaehMihOWPcvd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJoT1lHWEJMRTl4bThGRGFWQmFCNDd0Qmh4cnU5d2w1NzJpQURYbTRmIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403437),
('XsBGsfO80ArJyNXHzRN1jXWD7zl9xtBnA1OCWAlG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJvV0hlZ3Z3ZjRsV2RkZDBJN3poaE5XbmFqS1dxWmlRWVZNdjNPdnBpIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786403434),
('zc8AAAQSDHe42DZuK2ZXV4AfsnPnl38PHUxEkDGA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJHQkk1dU9IZ1RjSGJuZ0VsVkF3TlV0UFBhcTQyaEd3MFNhcUZKMHRoIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9zYW5jdHVtXC9jc3JmLWNvb2tpZSIsInJvdXRlIjoic2FuY3R1bS5jc3JmLWNvb2tpZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1786404369),
('ziiJnh0jNJfi7an596iunjsqYY98lHRUROmT8XH1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/151.0.7922.34 Safari/537.36', 'eyJfdG9rZW4iOiJFSXRpTXR6NHVaM1dMRlNkU2hGY1NCSUpEZEJ3T3hFT0R2UWJzWDNhIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDIwXC9hcGlcL2FkbWluXC9tZSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786402831),
('Zj1jbQCm2PBpzgzjYRCUmJZCNJaMOPiyctRmf1B4', 1, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', 'eyJfdG9rZW4iOiI0SFhGWUxZTGJUTHRXdjVuM0dzU2NPVnpyckhJZEk2ZXlZSGt2OEltIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1786405094);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'hotel_name', 'Hotel Meridian', '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(2, 'contact_email', 'booking@meridian.com', '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(3, 'contact_phone', '+237 695 52 71', '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(4, 'address', 'Bamenda, Cameroun', '2026-08-02 06:20:42', '2026-08-02 06:20:42'),
(5, 'languages', 'fr,en', '2026-08-02 06:20:42', '2026-08-02 06:20:42');

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
  `role` enum('admin','staff') NOT NULL DEFAULT 'staff',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hotel Meridian Admin', 'gabinprof1@gmail.com', '2026-08-02 06:20:42', '$2y$12$OpF3QELPyB290bqTjpcqIuKtX/zDHNGHzr.glb5MnzVQ5WW5NDvDW', 'admin', NULL, '2026-08-02 06:20:42', '2026-08-11 03:24:27');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_reference_unique` (`reference`),
  ADD KEY `bookings_room_id_foreign` (`room_id`),
  ADD KEY `bookings_dining_service_id_foreign` (`dining_service_id`),
  ADD KEY `bookings_room_type_id_check_in_check_out_index` (`room_type_id`,`check_in`,`check_out`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Index pour la table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dining_services`
--
ALTER TABLE `dining_services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`),
  ADD KEY `payments_campay_reference_index` (`campay_reference`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rooms_room_number_unique` (`room_number`),
  ADD KEY `rooms_room_type_id_foreign` (`room_type_id`);

--
-- Index pour la table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_types_code_unique` (`code`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_code_unique` (`code`);

--
-- Index pour la table `service_reservations`
--
ALTER TABLE `service_reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_reservations_reference_unique` (`reference`),
  ADD KEY `service_reservations_service_id_reservation_date_index` (`service_id`,`reservation_date`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `dining_services`
--
ALTER TABLE `dining_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `service_reservations`
--
ALTER TABLE `service_reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_dining_service_id_foreign` FOREIGN KEY (`dining_service_id`) REFERENCES `dining_services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`);

--
-- Contraintes pour la table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `service_reservations`
--
ALTER TABLE `service_reservations`
  ADD CONSTRAINT `service_reservations_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
