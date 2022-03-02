-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla facturas.articulos
CREATE TABLE IF NOT EXISTS `articulos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(1000) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Stock` float DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla facturas.articulos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;

-- Volcando estructura para tabla facturas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `NifOCif` varchar(9) NOT NULL,
  `RazonSocial` varchar(255) DEFAULT NULL,
  `NombreYApellidos` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NifOCif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla facturas.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla facturas.cuerpofactura
CREATE TABLE IF NOT EXISTS `cuerpofactura` (
  `NumeroDeFactura` int(11) NOT NULL,
  `CodigoArticulo` int(11) NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  PRIMARY KEY (`NumeroDeFactura`,`CodigoArticulo`),
  KEY `FK3` (`CodigoArticulo`),
  CONSTRAINT `FK2` FOREIGN KEY (`NumeroDeFactura`) REFERENCES `facturas` (`NumeroDeFacturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3` FOREIGN KEY (`CodigoArticulo`) REFERENCES `articulos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla facturas.cuerpofactura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuerpofactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuerpofactura` ENABLE KEYS */;

-- Volcando estructura para tabla facturas.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `NumeroDeFacturas` int(11) NOT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `FormaDePago` varchar(50) DEFAULT NULL,
  `IGIC` float DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `CIFONifCliente` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`NumeroDeFacturas`),
  KEY `relacion` (`CIFONifCliente`),
  CONSTRAINT `relacion` FOREIGN KEY (`CIFONifCliente`) REFERENCES `clientes` (`NifOCif`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla facturas.facturas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
