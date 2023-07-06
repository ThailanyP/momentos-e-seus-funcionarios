CREATE DATABASE  IF NOT EXISTS `momento` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `momento`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: momento
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `departamento_id` int NOT NULL AUTO_INCREMENT,
  `departamento_name` varchar(30) NOT NULL,
  `posicao_id` int DEFAULT NULL,
  PRIMARY KEY (`departamento_id`),
  KEY `posicao_id` (`posicao_id`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`posicao_id`) REFERENCES `posicao` (`posicao_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Admnistração',1700),(2,'Marketing',1800),(3,'Compras',1700),(4,'Recursos Humanos',2400),(5,'Transporte',1500),(6,'Tecnologia',1400),(7,'Relações Públicas',2700),(8,'Vendas',2500),(9,'Executivo',1700),(10,'Finanças',1700),(11,'Contabilidade',1700),(12,'inovações',5400),(13,'inovações',5400),(14,'Design',5400);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependentes`
--

DROP TABLE IF EXISTS `dependentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependentes` (
  `dependente_id` int NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `parentesco` varchar(25) NOT NULL,
  `funcionario_id` int NOT NULL,
  PRIMARY KEY (`dependente_id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `dependentes_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`funcionario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependentes`
--

LOCK TABLES `dependentes` WRITE;
/*!40000 ALTER TABLE `dependentes` DISABLE KEYS */;
INSERT INTO `dependentes` VALUES (1,'Penelope','Gietz','Filho(a)',206),(2,'Nick','Higgins','Filho(a)',205),(3,'Ed','Whalen','Filho(a)',200),(4,'Alice','King','Filho(a)',100),(5,'Johnny','Kochhar','Filho(a)',101),(6,'Bette','De Haan','Filho(a)',102),(7,'Grace','Faviet','Filho(a)',109),(8,'Matthew','Chen','Filho(a)',110),(9,'Joe','Sciarra','Filho(a)',111),(10,'Christian','Urman','Filho(a)',112),(11,'Zero','Popp','Filho(a)',113),(12,'Karl','Greenberg','Filho(a)',108),(13,'Duas','Mavris','Filho(a)',203),(14,'Vivien','Hunold','Filho(a)',103),(15,'Cuba','Ernst','Filho(a)',104),(16,'Fred','Austin','Filho(a)',105),(17,'Helen','Pataballa','Filho(a)',106),(18,'Dan','Lorentz','Filho(a)',107),(19,'Bob','Hartstein','Filho(a)',201),(20,'Lucie','Ferreira','Filho(a)',202),(21,'Kirsten','Baer','Filho(a)',204),(22,'Elvis','Khoo','Filho(a)',115),(23,'Sandra','Baida','Filho(a)',116),(24,'Cameron','Tobias','Filho(a)',117),(25,'Kevin','Himuro','Filho(a)',118),(26,'Rip','Colmenares','Filho(a)',119),(27,'Julia','Raphaely','Filho(a)',114),(28,'Woody','Russell','Filho(a)',145),(29,'Alec','Partners','Filho(a)',146),(30,'Sandra','Taylor','Filho(a)',176),(31,'Jennifer','King','Cônjuge',100),(32,'Uma','Mavris','Cônjuge',203),(33,'Salvadora','Ernst','Cônjuge',104),(34,'Gabriel','Ferreira','Filho',233),(35,'Inara','Ferreira','Cônjuge',233),(36,'Rodrigo','Lima','Cônjuge',234),(37,'Laura','Raulino','Filha',234),(38,'Maya','Raulino','Filha',234);
/*!40000 ALTER TABLE `dependentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `funcionario_id` int NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `dataContratacao` date NOT NULL,
  `ocupacao_id` int NOT NULL,
  `salario` decimal(8,2) NOT NULL,
  `gerente_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`funcionario_id`),
  KEY `ocupacao_id` (`ocupacao_id`),
  KEY `departamento_id` (`departamento_id`),
  KEY `gerente_id` (`gerente_id`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`ocupacao_id`) REFERENCES `ocupacoes` (`ocupacao_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcionarios_ibfk_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcionarios_ibfk_3` FOREIGN KEY (`gerente_id`) REFERENCES `funcionarios` (`funcionario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (100,'Steven','King','steven.king@momento.org','515.123.4567','1987-06-17',4,24000.00,NULL,9),(101,'Neena','Kochhar','neena.kochhar@momento.org','515.123.4568','1989-09-21',5,17000.00,100,9),(102,'Lex','De Haan','lex.de haan@momento.org','515.123.4569','1993-01-13',5,17000.00,100,9),(103,'Alexander','Hunold','alexander.hunold@momento.org','590.423.4567','1990-01-03',9,9000.00,102,6),(104,'Bruce','Ernst','bruce.ernst@momento.org','590.423.4568','1991-05-21',9,6000.00,103,6),(105,'David','Austin','david.austin@momento.org','590.423.4569','1997-06-25',9,4800.00,103,6),(106,'Valli','Pataballa','valli.pataballa@momento.org','590.423.4560','1998-02-05',9,4800.00,103,6),(107,'Diana','Lorentz','diana.lorentz@momento.org','590.423.5567','1999-02-07',9,4200.00,103,6),(108,'Nancy','Greenberg','nancy.greenberg@momento.org','515.124.4569','1994-08-17',7,12000.00,101,10),(109,'Daniel','Faviet','daniel.faviet@momento.org','515.124.4169','1994-08-16',6,9000.00,108,10),(110,'John','Chen','john.chen@momento.org','515.124.4269','1997-09-28',6,8200.00,108,10),(111,'Ismael','Sciarra','ismael.sciarra@momento.org','515.124.4369','1997-09-30',6,7700.00,108,10),(112,'Jose Manuel','Urman','jose manuel.urman@momento.org','515.124.4469','1998-03-07',6,7800.00,108,10),(113,'Luis','Popp','luis.popp@momento.org','515.124.4567','1999-12-07',6,6900.00,108,10),(114,'Den','Raphaely','den.raphaely@momento.org','515.127.4561','1994-12-07',14,11000.00,100,3),(115,'Alexander','Khoo','alexander.khoo@momento.org','515.127.4562','1995-05-18',13,3100.00,114,3),(116,'Shelli','Baida','shelli.baida@momento.org','515.127.4563','1997-12-24',13,2900.00,114,3),(117,'Sigal','Tobias','sigal.tobias@momento.org','515.127.4564','1997-07-24',13,2800.00,114,3),(118,'Guy','Himuro','guy.himuro@momento.org','515.127.4565','1998-11-15',13,2600.00,114,3),(119,'Karen','Colmenares','karen.colmenares@momento.org','515.127.4566','1999-08-10',13,2500.00,114,3),(120,'Matthew','Weiss','matthew.weiss@momento.org','650.123.1234','1996-07-18',19,8000.00,100,5),(121,'Adam','Fripp','adam.fripp@momento.org','650.123.2234','1997-04-10',19,8200.00,100,5),(122,'Payam','Kaufling','payam.kaufling@momento.org','650.123.3234','1995-05-01',19,7900.00,100,5),(123,'Shanta','Vollman','shanta.vollman@momento.org','650.123.4234','1997-10-10',19,6500.00,100,5),(126,'Irene','Mikkilineni','irene.mikkilineni@momento.org','650.124.1224','1998-09-28',18,2700.00,120,5),(145,'John','Russell','john.russell@momento.org',NULL,'1996-10-01',15,14000.00,100,8),(146,'Karen','Partners','karen.partners@momento.org',NULL,'1997-01-05',15,13500.00,100,8),(176,'Jonathon','Taylor','jonathon.taylor@momento.org',NULL,'1998-03-24',16,8600.00,100,8),(177,'Jack','Livingston','jack.livingston@momento.org',NULL,'1998-04-23',16,8400.00,100,8),(178,'Kimberely','Grant','kimberely.grant@momento.org',NULL,'1999-05-24',16,7000.00,100,8),(179,'Charles','Johnson','charles.johnson@momento.org',NULL,'2000-01-04',16,6200.00,100,8),(192,'Sarah','Bell','sarah.bell@momento.org','650.501.1876','1996-02-04',17,4000.00,123,5),(193,'Britney','Everett','britney.everett@momento.org','650.501.2876','1997-03-03',17,3900.00,123,5),(200,'Jennifer','Whalen','jennifer.whalen@momento.org','515.123.4444','1987-09-17',3,4400.00,101,1),(201,'Michael','Hartstein','michael.hartstein@momento.org','515.123.5555','1996-02-17',10,13000.00,100,2),(202,'Pat','Ferreira','pat.Ferreira@momento.org','603.123.6666','1997-08-17',11,6000.00,201,2),(203,'Susan','Mavris','susan.mavris@momento.org','515.123.7777','1994-06-07',8,6500.00,101,4),(204,'Hermann','Baer','hermann.baer@momento.org','515.123.8888','1994-06-07',12,10000.00,101,7),(205,'Shelley','Higgins','shelley.higgins@momento.org','515.123.8080','1994-06-07',2,12000.00,101,11),(206,'William','Gietz','william.gietz@momento.org','515.123.8181','1994-06-07',1,8300.00,205,11),(207,'Thailany','Pereira','thailanypereira@exemplo.com','11912345678','2023-07-01',9,4000.00,103,6),(208,'Gabriela','Souza','gabrielasouza@exemplo.com','11998745612','2023-07-01',8,4000.00,101,4),(209,'Kevyn','Aciole','kevynaciole@exemplo.com','11915937462','2023-07-01',15,10000.00,201,11),(210,'Vinicius','Costa','viniciuscosta@exemplo.com','11985207416','2023-07-01',9,9500.00,103,6),(211,'Rafael','Viana','rafelviana@exemplo.com','11903692587','2023-07-01',9,5000.00,103,6),(212,'Matheus','Passos','matheuspassos','11946825791','2023-07-01',11,4500.00,201,2),(213,'Matheus','Assis','matheusassis@exemplo.com','11912345678','2023-07-01',10,9000.00,100,2),(214,'Thailany','Pereira','thailanypereira@exemplo.com','11912345678','2023-07-01',9,4000.00,103,6),(215,'Gabriela','Souza','gabrielasouza@exemplo.com','11998745612','2023-07-01',8,4000.00,101,4),(216,'Kevyn','Aciole','kevynaciole@exemplo.com','11915937462','2023-07-01',15,10000.00,201,11),(217,'Vinicius','Costa','viniciuscosta@exemplo.com','11985207416','2023-07-01',9,9500.00,103,6),(218,'Rafael','Viana','rafelviana@exemplo.com','11903692587','2023-07-01',9,5000.00,103,6),(219,'Matheus','Passos','matheuspassos','11946825791','2023-07-01',11,4500.00,201,2),(220,'Matheus','Assis','matheusassis@exemplo.com','11912345678','2023-07-01',10,9000.00,100,2),(224,'Thailany','Pereira','thailanypereira@exemplo.com','11912345678','2023-07-01',9,4000.00,103,14),(225,'Gabriela','Souza','gabrielasouza@exemplo.com','11998745612','2023-07-01',8,4000.00,101,4),(226,'Kevyn','Aciole','kevynaciole@exemplo.com','11915937462','2023-07-01',15,10000.00,201,11),(227,'Vinicius','Costa','viniciuscosta@exemplo.com','11985207416','2023-07-01',9,9500.00,103,6),(228,'Rafael','Viana','rafelviana@exemplo.com','11903692587','2023-07-01',9,5000.00,103,6),(229,'Matheus','Passos','matheuspassos','11946825791','2023-07-01',11,4500.00,201,2),(230,'Matheus','Assis','matheusassis@exemplo.com','11912345678','2023-07-01',10,9000.00,100,2),(233,'William','Ferreira','email@exemplo.com','944446554','2023-07-01',20,9400.00,202,13),(234,'Fernanda','Lima','email@exemplo.com','988447632','2023-07-01',21,4500.00,202,12),(235,'Fabiana','Raulino','email@exemplo.com','telefone','2023-07-01',22,3500.00,202,12);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacoes`
--

DROP TABLE IF EXISTS `ocupacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacoes` (
  `ocupacao_id` int NOT NULL AUTO_INCREMENT,
  `ocupacao_title` varchar(35) NOT NULL,
  `min_salario` decimal(8,2) DEFAULT NULL,
  `max_salario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ocupacao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacoes`
--

LOCK TABLES `ocupacoes` WRITE;
/*!40000 ALTER TABLE `ocupacoes` DISABLE KEYS */;
INSERT INTO `ocupacoes` VALUES (1,'Auxiliar de Almoxarifado Júnior',4200.00,9000.00),(2,'Gerente de contabilidade',8200.00,16000.00),(3,'Assistente Administrativo',3000.00,6000.00),(4,'Presidente',20000.00,40000.00),(5,'Vice-presidente de administração',15000.00,30000.00),(6,'Contador',4200.00,9000.00),(7,'Gerente de Finanças',8200.00,16000.00),(8,'Representante de Recursos Humanos',4000.00,9000.00),(9,'Desenvolvedor Web',4000.00,10000.00),(10,'Gerente de Marketing',9000.00,15000.00),(11,'Representante de Marketing',4000.00,9000.00),(12,'Relações Públicas',4500.00,10500.00),(13,'Escriturário de compras',2500.00,5500.00),(14,'Gerente de Compras',8000.00,15000.00),(15,'Gerente de Vendas',10000.00,20000.00),(16,'Representante de Vendas',6000.00,12000.00),(17,'Vendedor',2500.00,5500.00),(18,'Estoquista',2000.00,5000.00),(19,'Gerente de Estoque',5500.00,8500.00),(20,'Programador',2500.00,9000.00),(21,'Desenvolvedor',2500.00,9000.00),(22,'Gerente',2500.00,9000.00);
/*!40000 ALTER TABLE `ocupacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` char(2) NOT NULL,
  `pais_name` varchar(40) DEFAULT NULL,
  `regiao_id` int NOT NULL,
  PRIMARY KEY (`pais_id`),
  KEY `regiao_id` (`regiao_id`),
  CONSTRAINT `paises_ibfk_1` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`regiao_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('AR','Argentina',2),('AU','Australia',3),('BE','Belgium',1),('BR','Brazil',2),('CA','Canada',2),('CH','Switzerland',1),('CN','China',3),('DE','Germany',1),('DK','Denmark',1),('EG','Egypt',4),('FR','France',1),('HK','HongKong',3),('IL','Israel',4),('IN','India',3),('IT','Italy',1),('JP','Japan',3),('KW','Kuwait',4),('MX','Mexico',2),('NG','Nigeria',4),('NL','Netherlands',1),('SG','Singapore',3),('UK','United Kingdom',1),('US','United States of America',2),('ZM','Zambia',4),('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao`
--

DROP TABLE IF EXISTS `posicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicao` (
  `posicao_id` int NOT NULL AUTO_INCREMENT,
  `endereco` varchar(40) DEFAULT NULL,
  `cep` varchar(12) DEFAULT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais_id` char(2) NOT NULL,
  PRIMARY KEY (`posicao_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `posicao_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao`
--

LOCK TABLES `posicao` WRITE;
/*!40000 ALTER TABLE `posicao` DISABLE KEYS */;
INSERT INTO `posicao` VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(5400,'Rua Tito, 54','05051-000','São Paulo','São Paulo','BR');
/*!40000 ALTER TABLE `posicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiao`
--

DROP TABLE IF EXISTS `regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiao` (
  `regiao_id` int NOT NULL AUTO_INCREMENT,
  `regiao_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`regiao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiao`
--

LOCK TABLES `regiao` WRITE;
/*!40000 ALTER TABLE `regiao` DISABLE KEYS */;
INSERT INTO `regiao` VALUES (1,'Europa'),(2,'Americas'),(3,'Asia'),(4,'Sula da Asia ou Africa');
/*!40000 ALTER TABLE `regiao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 20:06:45
