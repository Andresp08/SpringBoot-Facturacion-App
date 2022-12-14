-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.31 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para facturacion_db
CREATE DATABASE IF NOT EXISTS `facturacion_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `facturacion_db`;

-- Volcando estructura para tabla facturacion_db.authorities
CREATE TABLE IF NOT EXISTS `authorities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_authorities_unique` (`user_id`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.authorities: ~2 rows (aproximadamente)
REPLACE INTO `authorities` (`id`, `user_id`, `authority`) VALUES
	(1, 1, 'ROLE_USER'),
	(3, 2, 'ROLE_ADMIN'),
	(2, 2, 'ROLE_USER');

-- Volcando estructura para tabla facturacion_db.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.clientes: ~25 rows (aproximadamente)
REPLACE INTO `clientes` (`id`, `apellido`, `created_at`, `email`, `foto`, `nombre`) VALUES
	(1, 'Pardo', '2017-08-01', 'andres@software.com', '634a91c1-e9db-410b-8334-a36879938eda_fondo.jpg', 'Andres'),
	(2, 'Doe', '2017-08-02', 'john.doe@gmail.com', '', 'John'),
	(3, 'Torvalds', '2017-08-03', 'linus.torvalds@gmail.com', '', 'Linus'),
	(4, 'Doe', '2017-08-04', 'jane.doe@gmail.com', '', 'Jane'),
	(5, 'Lerdorf', '2017-08-05', 'rasmus.lerdorf@gmail.com', '', 'Rasmus'),
	(6, 'Gamma', '2017-08-06', 'erich.gamma@gmail.com', '', 'Erich'),
	(7, 'Helm', '2017-08-07', 'richard.helm@gmail.com', '', 'Richard'),
	(8, 'Johnson', '2017-08-08', 'ralph.johnson@gmail.com', '', 'Ralph'),
	(9, 'Vlissides', '2017-08-09', 'john.vlissides@gmail.com', '', 'John'),
	(10, 'Gosling', '2017-08-10', 'james.gosling@gmail.com', '', 'James'),
	(11, 'Lee', '2017-08-11', 'bruce.lee@gmail.com', '', 'Bruce'),
	(12, 'Doe', '2017-08-12', 'johnny.doe@gmail.com', '', 'Johnny'),
	(13, 'Roe', '2017-08-13', 'john.roe@gmail.com', '', 'John'),
	(14, 'Roe', '2017-08-14', 'jane.roe@gmail.com', '', 'Jane'),
	(15, 'Doe', '2017-08-15', 'richard.doe@gmail.com', '', 'Richard'),
	(16, 'Doe', '2017-08-16', 'janie.doe@gmail.com', '', 'Janie'),
	(17, 'Webb', '2017-08-17', 'phillip.webb@gmail.com', '', 'Phillip'),
	(18, 'Nicoll', '2017-08-18', 'stephane.nicoll@gmail.com', '', 'Stephane'),
	(19, 'Brannen', '2017-08-19', 'sam.brannen@gmail.com', '', 'Sam'),
	(20, 'Hoeller', '2017-08-20', 'juergen.Hoeller@gmail.com', '', 'Juergen'),
	(21, 'Roe', '2017-08-21', 'janie.roe@gmail.com', '', 'Janie'),
	(22, 'Smith', '2017-08-22', 'john.smith@gmail.com', '', 'John'),
	(23, 'Bloggs', '2017-08-23', 'joe.bloggs@gmail.com', '', 'Joe'),
	(24, 'Stiles', '2017-08-24', 'john.stiles@gmail.com', '', 'John'),
	(25, 'Roe', '2017-08-25', 'stiles.roe@gmail.com', '', 'Richard');

-- Volcando estructura para tabla facturacion_db.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1qiuk10rfkovhlfpsk7oic0v8` (`cliente_id`),
  CONSTRAINT `FK1qiuk10rfkovhlfpsk7oic0v8` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.facturas: ~3 rows (aproximadamente)
REPLACE INTO `facturas` (`id`, `created_at`, `descripcion`, `observacion`, `cliente_id`) VALUES
	(1, '2022-11-13', 'Factura equipos de oficina', NULL, 1),
	(2, '2022-11-13', 'Factura Bicicleta', 'Alguna nota importante!', 1),
	(3, '2022-11-19', 'Compras oficina', 'Algo importante', 2);

-- Volcando estructura para tabla facturacion_db.facturas_items
CREATE TABLE IF NOT EXISTS `facturas_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `factura_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrtirl0qwq6nor360uend3dbm1` (`producto_id`),
  KEY `FKrcav08w770drc0rja1qcyqyl9` (`factura_id`),
  CONSTRAINT `FKrcav08w770drc0rja1qcyqyl9` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `FKrtirl0qwq6nor360uend3dbm1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.facturas_items: ~8 rows (aproximadamente)
REPLACE INTO `facturas_items` (`id`, `cantidad`, `producto_id`, `factura_id`) VALUES
	(1, 1, 1, 1),
	(2, 2, 4, 1),
	(3, 1, 5, 1),
	(4, 1, 7, 1),
	(5, 3, 6, 2),
	(6, 2, 7, 3),
	(7, 1, 6, 3),
	(8, 1, 5, 3);

-- Volcando estructura para tabla facturacion_db.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.productos: ~7 rows (aproximadamente)
REPLACE INTO `productos` (`id`, `created_at`, `nombre`, `precio`) VALUES
	(1, '2022-11-13', 'Panasonic Pantalla LCD', 259990),
	(2, '2022-11-13', 'Sony Camara digital DSC-W320B', 123490),
	(3, '2022-11-13', 'Apple iPod shuffle', 1499990),
	(4, '2022-11-13', 'Sony Notebook Z110', 37990),
	(5, '2022-11-13', 'Hewlett Packard Multifuncional F2280', 69990),
	(6, '2022-11-13', 'Bianchi Bicicleta Aro 26', 69990),
	(7, '2022-11-13', 'Mica Comoda 5 Cajones', 299990);

-- Volcando estructura para tabla facturacion_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla facturacion_db.users: ~2 rows (aproximadamente)
REPLACE INTO `users` (`id`, `username`, `password`, `enabled`) VALUES
	(1, 'andres', '$2a$10$Ok5BIHXFJpJFoFUPp.SFYun9O0fS1sh.5yuhuOn/t5wW6yvaFh94y', 1),
	(2, 'admin', '$2a$10$52xQraLQm0wG0rMnAz.IPuNm/tFRLsVWtM.675eaUQY9aGym0DyMa', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
