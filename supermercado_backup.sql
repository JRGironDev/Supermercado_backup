-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Codigo_categoria` int NOT NULL,
  `Nombre_categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Frutas y verduras'),(2,'Carnes y pescados'),(3,'Lácteos'),(4,'Panadería'),(5,'Bebidas'),(6,'Snacks'),(7,'Limpieza'),(8,'Aceites'),(9,'Mascotas'),(10,'Granos'),(11,'Cocina'),(12,'Cereales'),(13,'Galletas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `NIT_cliente` int NOT NULL,
  `Nombre_cliente` varchar(45) DEFAULT NULL,
  `Apellido_cliente` varchar(45) DEFAULT NULL,
  `Direccion_cliente` varchar(45) DEFAULT NULL,
  `Telefono_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NIT_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (12345678,'Juan','Pérez','Calle 1, Ciudad','2222-2222'),(12345679,'Miguel','Álvarez','Calle 10, Ciudad','2222-2222'),(23456789,'María','González','Calle 2, Ciudad','3333-3333'),(34567890,'Pedro','Martínez','Calle 3, Ciudad','4444-4444'),(45678901,'Ana','López','Calle 4, Ciudad','5555-5555'),(56789012,'Carlos','García','Calle 5, Ciudad','6666-6666'),(67890123,'Lucía','Hernández','Calle 6, Ciudad','7777-7777'),(78901234,'Sergio','Sánchez','Calle 7, Ciudad','8888-8888'),(89012345,'Laura','Ramírez','Calle 8, Ciudad','9999-9999'),(90123456,'Jorge','Díaz','Calle 9, Ciudad','1111-1111');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `Numero_factura` int NOT NULL,
  `Codigo_producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  KEY `Numero_factura` (`Numero_factura`),
  KEY `Codigo_producto` (`Codigo_producto`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`Numero_factura`) REFERENCES `factura` (`Numero_factura`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`Codigo_producto`) REFERENCES `producto` (`Codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (1001,17011,100),(1001,16010,50),(1002,15009,100),(1002,14008,100),(1003,17011,200),(1003,15009,100),(1004,14008,200),(1004,13007,200),(1005,16010,300),(1005,12006,200),(1006,14008,400),(1006,12006,200),(1007,10019,350),(1007,10019,350),(1008,10016,300),(1008,10017,500),(1009,14008,200),(1009,10016,400),(1009,17011,300),(1010,10015,300),(1010,10014,400),(1010,15009,300),(1011,10013,200),(1011,10012,300),(1011,10015,300),(1011,13007,300),(1012,10012,200),(1012,10011,300),(1012,10015,300),(1013,10010,100),(1013,10011,50),(1013,10014,150),(1014,10010,100),(1014,10011,50),(1014,10014,150),(1015,10009,200),(1015,10010,150),(1015,10013,150),(1016,10008,200),(1016,10012,200),(1016,12006,200),(1017,10007,100),(1017,10008,100),(1017,10014,200),(1018,10006,200),(1018,10005,100),(1018,10009,200),(1019,10004,100),(1019,10003,200),(1019,10006,100),(1020,10002,200),(1020,10001,200),(1020,10011,100);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `Numero_factura` int NOT NULL,
  `Fecha_factura` datetime DEFAULT NULL,
  `Total_factura` int DEFAULT NULL,
  `NIT_cliente` int NOT NULL,
  PRIMARY KEY (`Numero_factura`),
  KEY `NIT_cliente` (`NIT_cliente`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`NIT_cliente`) REFERENCES `cliente` (`NIT_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1001,'2023-03-27 00:00:00',150,12345678),(1002,'2023-03-28 00:00:00',200,23456789),(1003,'2023-03-29 00:00:00',300,34567890),(1004,'2023-03-30 00:00:00',400,45678901),(1005,'2023-03-31 00:00:00',500,56789012),(1006,'2022-01-06 00:00:00',600,67890123),(1007,'2022-01-07 00:00:00',700,78901234),(1008,'2022-01-08 00:00:00',800,89012345),(1009,'2022-01-09 00:00:00',900,90123456),(1010,'2022-01-10 00:00:00',1000,12345679),(1011,'2022-01-11 00:00:00',1100,23456789),(1012,'2022-01-12 00:00:00',800,34567890),(1013,'2022-01-13 00:00:00',300,45678901),(1014,'2022-01-14 00:00:00',400,56789012),(1015,'2022-01-15 00:00:00',500,67890123),(1016,'2022-01-16 00:00:00',600,78901234),(1017,'2022-01-17 00:00:00',400,89012345),(1018,'2022-01-18 00:00:00',500,90123456),(1019,'2022-01-19 00:00:00',400,12345678),(1020,'2022-01-20 00:00:00',500,23456789);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganancias`
--

DROP TABLE IF EXISTS `ganancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganancias` (
  `id_ganancias` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ganancia` int DEFAULT NULL,
  PRIMARY KEY (`id_ganancias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganancias`
--

LOCK TABLES `ganancias` WRITE;
/*!40000 ALTER TABLE `ganancias` DISABLE KEYS */;
INSERT INTO `ganancias` VALUES (1,'2023-03-27',150);
/*!40000 ALTER TABLE `ganancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Codigo_producto` int NOT NULL,
  `Nombre_producto` varchar(45) DEFAULT NULL,
  `Descripcion_producto` varchar(255) DEFAULT NULL,
  `Precio_unitario` decimal(6,2) DEFAULT NULL,
  `Cantidad_stock` int DEFAULT NULL,
  `Costo_unitario` decimal(6,2) DEFAULT NULL,
  `Codigo_categoria` int NOT NULL,
  `NIT_proveedor` int NOT NULL,
  PRIMARY KEY (`Codigo_producto`),
  KEY `Codigo_categoria` (`Codigo_categoria`),
  KEY `NIT_proveedor` (`NIT_proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Codigo_categoria`) REFERENCES `categoria` (`Codigo_categoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`NIT_proveedor`) REFERENCES `proveedor` (`NIT_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (10001,'Arroz','Arroz blanco de grano largo',12.50,100,10.50,10,11112222),(10002,'Frijol','Frijol negro',20.00,50,17.00,10,11112222),(10003,'Aceite','Aceite de girasol',44.50,30,33.50,8,11112222),(10004,'Sal','Sal de mesa',10.50,200,6.20,11,22223333),(10005,'Azucar','Azucar blanca refinada',20.00,80,17.00,11,22223333),(10006,'Jabón','Jabón en barra',51.50,70,40.80,7,33334444),(10007,'Leche','Leche entera',12.00,50,10.50,3,44445555),(10008,'Yogurt','Yogurt natural',10.00,40,7.70,3,44445555),(10009,'Pan','Pan integral',1.50,100,0.80,4,55556666),(10010,'Huevos','Huevos frescos',36.00,60,30.50,11,55556666),(10011,'Refresco','Refresco de cola',7.50,50,4.90,5,55556666),(10012,'Papitas','Papitas de paquete',15.00,80,12.60,6,66667777),(10013,'Chicles','Chicles sabor menta',0.50,150,0.20,6,66667777),(10014,'Carne','Carne de res',20.50,30,16.50,2,77778888),(10015,'Pollo','Pollo entero',16.00,40,14.50,2,88889999),(10016,'Pescado','Pescado fresco',50.00,20,39.50,2,88889999),(10017,'Manzanas','Manzanas rojas',12.50,50,10.50,1,99990000),(10018,'Plátanos','Plátanos verdes',6.50,70,3.80,1,99990000),(10019,'Cebollas','Cebollas blancas',5.00,100,3.50,1,99990000),(12006,'Leche deslactosada','Leche deslactosada',15.50,150,11.50,3,99990000),(13007,'Galletas de avena','Galletas integrales de avena',13.25,75,8.00,6,99990000),(14008,'Jabón líquido','Jabón líquido con aloe vera',13.99,100,9.00,7,99990000),(15009,'Aceite de oliva','Aceite de oliva extra virgen',40.99,50,30.00,8,11113333),(16010,'Arroz integral','Arroz integral 1kg',15.49,200,13.00,11,11113333),(17011,'Cerveza artesanal','Cerveza artesanal de trigo',17.99,25,13.50,5,11113333),(18011,'Galleta de animalitos','Galletas con forma de animales',18.50,100,16.50,13,11111111);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `NIT_proveedor` int NOT NULL,
  `Razon_social` varchar(45) DEFAULT NULL,
  `Direccion_proveedor` varchar(45) DEFAULT NULL,
  `Telefono_proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NIT_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (11111111,'Proveedor K','Calle 10 #001 ','0012-1234'),(11112222,'Proveedor A','Calle 1 #123','1234-5678'),(11113333,'Proveedor J','Calle 10 #1234','1234-5678'),(22223333,'Proveedor B','Calle 2 #234','2345-6789'),(33334444,'Proveedor C','Calle 3 #345','3456-7890'),(44445555,'Proveedor D','Calle 4 #456','4567-8901'),(55556666,'Proveedor E','Calle 5 #567','5678-9012'),(66667777,'Proveedor F','Calle 6 #678','6789-0123'),(77778888,'Proveedor G','Calle 7 #789','7890-1234'),(88889999,'Proveedor H','Calle 8 #890','8901-2345'),(99990000,'Proveedor I','Calle 9 #901','9012-3456');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_categorias`
--

DROP TABLE IF EXISTS `vista_categorias`;
/*!50001 DROP VIEW IF EXISTS `vista_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_categorias` AS SELECT 
 1 AS `Codigo_categoria`,
 1 AS `Nombre_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes`
--

DROP TABLE IF EXISTS `vista_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes` AS SELECT 
 1 AS `NIT_cliente`,
 1 AS `Nombre_cliente`,
 1 AS `Apellido_cliente`,
 1 AS `Direccion_cliente`,
 1 AS `Telefono_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_facturas`
--

DROP TABLE IF EXISTS `vista_detalle_facturas`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_facturas` AS SELECT 
 1 AS `Numero_factura`,
 1 AS `Codigo_producto`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturas`
--

DROP TABLE IF EXISTS `vista_facturas`;
/*!50001 DROP VIEW IF EXISTS `vista_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturas` AS SELECT 
 1 AS `Numero_factura`,
 1 AS `Fecha_factura`,
 1 AS `Total_factura`,
 1 AS `NIT_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos`
--

DROP TABLE IF EXISTS `vista_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos` AS SELECT 
 1 AS `Codigo_producto`,
 1 AS `Nombre_producto`,
 1 AS `Descripcion_producto`,
 1 AS `Precio_unitario`,
 1 AS `Cantidad_stock`,
 1 AS `Costo_unitario`,
 1 AS `Codigo_categoria`,
 1 AS `NIT_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_proveedores`
--

DROP TABLE IF EXISTS `vista_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedores` AS SELECT 
 1 AS `NIT_proveedor`,
 1 AS `Razon_social`,
 1 AS `Direccion_proveedor`,
 1 AS `Telefono_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_categorias`
--

/*!50001 DROP VIEW IF EXISTS `vista_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_categorias` AS select `categoria`.`Codigo_categoria` AS `Codigo_categoria`,`categoria`.`Nombre_categoria` AS `Nombre_categoria` from `categoria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes` AS select `cliente`.`NIT_cliente` AS `NIT_cliente`,`cliente`.`Nombre_cliente` AS `Nombre_cliente`,`cliente`.`Apellido_cliente` AS `Apellido_cliente`,`cliente`.`Direccion_cliente` AS `Direccion_cliente`,`cliente`.`Telefono_cliente` AS `Telefono_cliente` from `cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_facturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_facturas` AS select `detalle_factura`.`Numero_factura` AS `Numero_factura`,`detalle_factura`.`Codigo_producto` AS `Codigo_producto`,`detalle_factura`.`Cantidad` AS `Cantidad` from `detalle_factura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturas` AS select `factura`.`Numero_factura` AS `Numero_factura`,`factura`.`Fecha_factura` AS `Fecha_factura`,`factura`.`Total_factura` AS `Total_factura`,`factura`.`NIT_cliente` AS `NIT_cliente` from `factura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos` AS select `producto`.`Codigo_producto` AS `Codigo_producto`,`producto`.`Nombre_producto` AS `Nombre_producto`,`producto`.`Descripcion_producto` AS `Descripcion_producto`,`producto`.`Precio_unitario` AS `Precio_unitario`,`producto`.`Cantidad_stock` AS `Cantidad_stock`,`producto`.`Costo_unitario` AS `Costo_unitario`,`producto`.`Codigo_categoria` AS `Codigo_categoria`,`producto`.`NIT_proveedor` AS `NIT_proveedor` from `producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedores` AS select `proveedor`.`NIT_proveedor` AS `NIT_proveedor`,`proveedor`.`Razon_social` AS `Razon_social`,`proveedor`.`Direccion_proveedor` AS `Direccion_proveedor`,`proveedor`.`Telefono_proveedor` AS `Telefono_proveedor` from `proveedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 10:11:06
