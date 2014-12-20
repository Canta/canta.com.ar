
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `canta`
--
drop database if exists canta;
CREATE DATABASE IF NOT EXISTS `canta` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `canta`;


/*
	Finalmente, creo un usuario para que la aplicación acceda a la base.
*/

/* [FIX]: 
	Línea agregada porque en MySQL no tenemos drop user IF NOT EXISTS 
	Esta línea entonces lo crea si no existe, para que luego no falle 
	el drop.
*/
GRANT USAGE ON *.* TO 'admin_canta'@'%'; 
/* [/FIX] */
drop user 'admin_canta'@'%';
CREATE USER 'admin_canta'@'%' IDENTIFIED BY 'PASS_ADMIN_HERE';
-- Asignarle TODOS los permisos posibles (AKA, hacerlo administrador).
GRANT ALL ON canta.* TO 'admin_canta'@'%' WITH GRANT OPTION;
GRANT ALL ON canta TO 'admin_canta'@'%';
GRANT CREATE ON canta TO 'admin_canta'@'%';
FLUSH PRIVILEGES;


/* [FIX]: 
	Línea agregada porque en MySQL no tenemos drop user IF NOT EXISTS 
	Esta línea entonces lo crea si no existe, para que luego no falle 
	el drop.
*/
GRANT USAGE ON *.* TO 'admin_canta'@'localhost'; 
/* [/FIX] */
drop user 'admin_canta'@'localhost';
CREATE USER 'admin_canta'@'localhost' IDENTIFIED BY 'PASS_ADMIN_HERE';
-- Asignarle TODOS los permisos posibles (AKA, hacerlo administrador).
GRANT ALL ON canta.* TO 'admin_canta'@'localhost' WITH GRANT OPTION;
GRANT ALL ON canta TO 'admin_canta'@'localhost';
GRANT CREATE ON canta TO 'admin_canta'@'localhost';
FLUSH PRIVILEGES;
