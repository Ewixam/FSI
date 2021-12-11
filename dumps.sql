CREATE DATABASE  IF NOT EXISTS `Cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Cinema`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 51.210.151.13    Database: Cinema
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
-- Table structure for table `Artiste`
--

DROP TABLE IF EXISTS `Artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artiste` (
  `idArtiste` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `dateNaiss` date DEFAULT NULL,
  `data5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArtiste`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artiste`
--

LOCK TABLES `Artiste` WRITE;
/*!40000 ALTER TABLE `Artiste` DISABLE KEYS */;
INSERT INTO `Artiste` VALUES (1,'scott','ridley','1943-01-26',NULL),(2,'Hitchcock','Alfred','1899-02-27',NULL),(3,'Kurosawa','Akira','1910-03-28',NULL),(4,'Woo','John','1946-04-29',NULL),(5,'Tarantino','Quentin','1963-05-30',NULL),(6,'Cameron','James','1954-06-30',NULL),(7,'Tarkovski','Andrei','1932-11-23',NULL),(13,'Henry','Thomas','1971-09-09',NULL),(14,'james','stewart','1908-05-20',NULL),(15,'timera','youssouf','1999-06-11',NULL),(16,'toto','titi','1999-07-01',NULL);
/*!40000 ALTER TABLE `Artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film`
--

DROP TABLE IF EXISTS `Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Film` (
  `idFilm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  `annee` varchar(4) DEFAULT NULL,
  `resume` varchar(45) DEFAULT NULL,
  `Artiste_idRealisateur` int(10) unsigned NOT NULL,
  `Genre_idGenre` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `fk_Film_Artiste_idx` (`Artiste_idRealisateur`),
  KEY `fk_Film_Genre1_idx` (`Genre_idGenre`),
  CONSTRAINT `fk_Film_Artiste` FOREIGN KEY (`Artiste_idRealisateur`) REFERENCES `Artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Genre1` FOREIGN KEY (`Genre_idGenre`) REFERENCES `Genre` (`idGenre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film`
--

LOCK TABLES `Film` WRITE;
/*!40000 ALTER TABLE `Film` DISABLE KEYS */;
INSERT INTO `Film` VALUES (1,'alien','1979',NULL,1,6),(2,'Vertigo','1958',NULL,2,8),(3,'Psychose','1960',NULL,2,3),(4,'Kagemusha','1980',NULL,3,9),(9,'lesBTS','2019',NULL,15,1);
/*!40000 ALTER TABLE `Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `idGenre` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'action'),(2,'comique'),(3,'horreur'),(4,'comedie'),(5,'dramatique'),(6,'fiction'),(7,'peplum'),(8,'thriller'),(9,'guerre');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Internaute`
--

DROP TABLE IF EXISTS `Internaute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Internaute` (
  `idInternaute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInternaute`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Internaute`
--

LOCK TABLES `Internaute` WRITE;
/*!40000 ALTER TABLE `Internaute` DISABLE KEYS */;
INSERT INTO `Internaute` VALUES (1,'tobji'),(2,'madani');
/*!40000 ALTER TABLE `Internaute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jouer`
--

DROP TABLE IF EXISTS `Jouer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jouer` (
  `Artiste_idArtiste` int(10) unsigned NOT NULL,
  `Film_idFilm` int(10) unsigned NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Artiste_idArtiste`,`Film_idFilm`),
  KEY `fk_Jouer_idFilm_idx` (`Film_idFilm`),
  KEY `fk_Jouer_idArtiste_idx` (`Artiste_idArtiste`),
  CONSTRAINT `fk_Jouer_idArtiste` FOREIGN KEY (`Artiste_idArtiste`) REFERENCES `Artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jouer_idFilm` FOREIGN KEY (`Film_idFilm`) REFERENCES `Film` (`idFilm`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jouer`
--

LOCK TABLES `Jouer` WRITE;
/*!40000 ALTER TABLE `Jouer` DISABLE KEYS */;
INSERT INTO `Jouer` VALUES (13,1,'eliott'),(14,2,'Scottie');
/*!40000 ALTER TABLE `Jouer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noter`
--

DROP TABLE IF EXISTS `Noter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Noter` (
  `Internaute_idInternaute` int(10) unsigned NOT NULL,
  `Film_idFilm` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Internaute_idInternaute`,`Film_idFilm`),
  KEY `fk_Noter_idFilm_idx` (`Film_idFilm`),
  KEY `fk_Noter_idInternaute_idx` (`Internaute_idInternaute`),
  CONSTRAINT `fk_Noter_idFilm` FOREIGN KEY (`Film_idFilm`) REFERENCES `Film` (`idFilm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Noter_idInternaute` FOREIGN KEY (`Internaute_idInternaute`) REFERENCES `Internaute` (`idInternaute`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noter`
--

LOCK TABLES `Noter` WRITE;
/*!40000 ALTER TABLE `Noter` DISABLE KEYS */;
INSERT INTO `Noter` VALUES (2,1);
/*!40000 ALTER TABLE `Noter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 19:16:28
