-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para votation
CREATE DATABASE IF NOT EXISTS `votation` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `votation`;

-- Volcando estructura para tabla votation.candidate
CREATE TABLE IF NOT EXISTS `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `party_id_order` (`party_id`,`order`),
  CONSTRAINT `FK_candidate_party` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votation.candidate: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` (`id`, `party_id`, `order`, `name`) VALUES
	(1, 1, 1, 'Carmen Navarro Lacoba'),
	(2, 2, 1, 'Manuel Gabriel González Ramos'),
	(8, 1, 2, 'Manuel Serrano López'),
	(9, 1, 3, 'Manuel Serena  Fernández'),
	(10, 1, 4, 'Cristina García Martínez'),
	(11, 2, 2, 'María Luisa Vilches Ruiz'),
	(12, 2, 3, 'José Carlos Díaz Rodríguez'),
	(13, 2, 4, 'Estefanía Escribano Villena'),
	(14, 3, 1, 'María Dolores Arteaga Espinosa de los Monteros'),
	(15, 3, 2, 'Hugo Gabriel Guillen Malagón'),
	(16, 3, 3, 'Ana Isabel Martínez Molina'),
	(17, 3, 4, 'Cristian Cuerda González'),
	(18, 4, 1, 'María Pérez Segovia'),
	(19, 4, 2, 'Emilio Zamora Martínez'),
	(20, 4, 3, 'Darcy Gioconda Cárdenas Barrera'),
	(21, 4, 4, 'Sergio León Bullón'),
	(22, 5, 1, 'Rafael Fernández-Lomana Gutiérrez'),
	(23, 5, 2, 'Juan Francisco Robles Descalzo'),
	(24, 5, 3, 'María Remedios Gil Martínez'),
	(25, 5, 4, 'María Teresa Fernández Lara');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;

-- Volcando estructura para tabla votation.parameter
CREATE TABLE IF NOT EXISTS `parameter` (
  `circumscription` varchar(50) DEFAULT NULL,
  `type_query` varchar(50) DEFAULT NULL,
  `num_candidates` int(5) DEFAULT NULL,
  `date_query` date DEFAULT NULL,
  `status_scrutiny` enum('Closed','Opened','Finished') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votation.parameter: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` (`circumscription`, `type_query`, `num_candidates`, `date_query`, `status_scrutiny`) VALUES
	('Albacete', 'ELECCIONES GENERALES', 20, '2019-12-10', 'Finished');
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;

-- Volcando estructura para tabla votation.party
CREATE TABLE IF NOT EXISTS `party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `acronym` varchar(10) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votation.party: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` (`id`, `name`, `acronym`, `logo`, `votes`) VALUES
	(1, 'Partido Popular', 'PP', 'PP.png', 26589),
	(2, 'Partido Socialista Obrero Español', 'PSOE', 'PSOE.png', 27075),
	(3, 'Ciudadanos-Partido de la Ciudadanía', 'CS', 'CS.png', 10220),
	(4, 'Unidas Podemos', 'UP', 'UP.png', 8711),
	(5, 'Vox', 'VOX', 'VOX.png', 20478);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;

-- Volcando estructura para tabla votation.voter
CREATE TABLE IF NOT EXISTS `voter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `residence` varchar(50) DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `voted` enum('Y','N') NOT NULL DEFAULT 'N',
  `role` enum('Administrator','Voter') NOT NULL DEFAULT 'Voter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votation.voter: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `voter` DISABLE KEYS */;
INSERT INTO `voter` (`id`, `nif`, `first_name`, `last_name`, `residence`, `born_date`, `password`, `voted`, `role`) VALUES
	(2, '987654321A', 'Ben', 'Robinson', 'Chicago', '2018-12-31', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 'Y', 'Voter'),
	(3, '111111111B', 'Charles', 'Thomson', 'Los Angeles', '1991-11-27', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 'Y', 'Administrator'),
	(5, '123456789W', 'John', 'Wick', 'Califronia', '1967-10-30', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 'Y', 'Voter');
/*!40000 ALTER TABLE `voter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
