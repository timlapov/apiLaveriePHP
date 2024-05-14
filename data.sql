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


-- Listage de la structure de la base pour buisness_casejose
CREATE DATABASE IF NOT EXISTS `buisness_casejose` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `buisness_casejose`;

-- Listage de la structure de la table buisness_casejose. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_parente_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1E46AEEEE` (`category_parente_id`),
  CONSTRAINT `FK_64C19C1E46AEEEE` FOREIGN KEY (`category_parente_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.category : ~5 rows (environ)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `category_parente_id`, `libelle`, `picture`, `price`) VALUES
	(6, NULL, 'Pantalon', 'image/Pas_dimage.jpg', NULL),
	(7, NULL, 'Robe', 'image/Pas_dimage.jpg', NULL),
	(8, NULL, 'Accessoire', 'image/Pas_dimage.jpg', NULL),
	(9, NULL, 'Pull', 'image/Pas_dimage.jpg', NULL),
	(10, 6, 'jean', 'image/Pas_dimage.jpg', 20);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. category_service
CREATE TABLE IF NOT EXISTS `category_service` (
  `category_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`service_id`),
  KEY `IDX_2645DAAC12469DE2` (`category_id`),
  KEY `IDX_2645DAACED5CA9E6` (`service_id`),
  CONSTRAINT `FK_2645DAAC12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2645DAACED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.category_service : ~1 rows (environ)
/*!40000 ALTER TABLE `category_service` DISABLE KEYS */;
INSERT INTO `category_service` (`category_id`, `service_id`) VALUES
	(10, 3);
/*!40000 ALTER TABLE `category_service` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.messenger_messages : ~0 rows (environ)
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`),
  CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.order : ~1 rows (environ)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id`, `user_id`, `status`, `date_start`) VALUES
	(2, 5, 'En cours', '2024-04-16 12:04:27');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.service : ~2 rows (environ)
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id`, `name`, `price`) VALUES
	(3, 'Lavage', 12),
	(4, 'Repassage', 16);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. services_category_order
CREATE TABLE IF NOT EXISTS `services_category_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_537F590F548C34FE` (`num_order_id`),
  KEY `IDX_537F590FED5CA9E6` (`service_id`),
  KEY `IDX_537F590F12469DE2` (`category_id`),
  CONSTRAINT `FK_537F590F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_537F590F548C34FE` FOREIGN KEY (`num_order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_537F590FED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.services_category_order : ~1 rows (environ)
/*!40000 ALTER TABLE `services_category_order` DISABLE KEYS */;
INSERT INTO `services_category_order` (`id`, `num_order_id`, `service_id`, `category_id`, `quantity`) VALUES
	(1, 2, 3, 10, 50);
/*!40000 ALTER TABLE `services_category_order` ENABLE KEYS */;

-- Listage de la structure de la table buisness_casejose. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table buisness_casejose.user : ~3 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `number_phone`, `address`, `is_verified`) VALUES
	(4, 'admin@admin.fr', '["ROLE_ADMIN"]', '$2y$13$fvdYVCziOoE3oevUdEC1YuOXiN0g//PKzgkzk0c2qUxCcgCLoNSXy', 'le fou', 'Admin', '07000000', '18 rue des pommes de terre', 1),
	(5, 'test@test.fr', '[]', '$2y$13$hwkkDFoou9DVwCGO8dbxTOgScpPdzE4UGmJOSV3tMzPcpgiO5d2rG', 'jose', 'Vale', '07000000', '18 rue des pommes de terre', 1),
	(6, 'josemiguelvalecosta@gmail.com', '["ROLE_EMPLOYEE"]', '$2y$13$qQ1sSwf5hdsQefcKHOnJRu/y6OL581pFVEDNhMhINwUAlP1X87rde', 'jose', 'Vale', '07000000', '18 rue des pommes de terre', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
