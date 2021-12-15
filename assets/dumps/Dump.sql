CREATE DATABASE  IF NOT EXISTS `film` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `film`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: film
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artiste` (
  `idArtiste` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `dateNaiss` date DEFAULT NULL,
  `data5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArtiste`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artiste`
--

LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
INSERT INTO `artiste` VALUES (1,'Cameron','James','1954-08-16',NULL),(2,'Charrue','Pascal','1977-04-08',NULL),(3,'Miyazaki','Hayao ','1941-01-05',NULL),(4,'Hughes','Allen & Albert','1954-08-16',NULL),(5,'Nolan','Christopher ','1970-07-30',NULL),(6,'Cameron','James','1954-06-30',NULL),(7,'Singleton','John ','1968-01-06',NULL),(13,'Henry','Thomas','1971-09-09',NULL),(14,'james','stewart','1908-05-20',NULL),(15,'Snipes','Wesley','1954-08-16',NULL),(16,'toto','titi','1999-07-01',NULL);
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `idFilm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) DEFAULT NULL,
  `annee` varchar(4) DEFAULT NULL,
  `resume` varchar(45) DEFAULT NULL,
  `Artiste_idRealisateur` int(10) unsigned NOT NULL,
  `Genre_idGenre` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `fk_Film_Artiste_idx` (`Artiste_idRealisateur`),
  KEY `fk_Film_Genre1_idx` (`Genre_idGenre`),
  CONSTRAINT `fk_Film_Artiste` FOREIGN KEY (`Artiste_idRealisateur`) REFERENCES `artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Genre1` FOREIGN KEY (`Genre_idGenre`) REFERENCES `genre` (`idGenre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Avatar','2009',NULL,1,6),(2,'Arcane','2021',NULL,2,8),(3,'Interstellar','2014',NULL,2,3),(4,'Le Voyage de Chihiro','2001',NULL,3,9),(5,'Boyz N The Hood','1991',NULL,7,5),(6,'Spider-Man : No Way Home','2021',NULL,6,2),(7,'House of Gucci','2021',NULL,7,8),(9,'Menace to Society','1993',NULL,4,1);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `idGenre` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Crime'),(2,'comique'),(3,'Aventure'),(4,'comedie'),(5,'dramatique'),(6,'fiction'),(7,'peplum'),(8,'thriller'),(9,'fantasy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internaute`
--

DROP TABLE IF EXISTS `internaute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internaute` (
  `idInternaute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInternaute`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internaute`
--

LOCK TABLES `internaute` WRITE;
/*!40000 ALTER TABLE `internaute` DISABLE KEYS */;
INSERT INTO `internaute` VALUES (1,'tobji'),(2,'madani');
/*!40000 ALTER TABLE `internaute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jouer` (
  `Artiste_idArtiste` int(10) unsigned NOT NULL,
  `Film_idFilm` int(10) unsigned NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Artiste_idArtiste`,`Film_idFilm`),
  KEY `fk_Jouer_idFilm_idx` (`Film_idFilm`),
  KEY `fk_Jouer_idArtiste_idx` (`Artiste_idArtiste`),
  CONSTRAINT `fk_Jouer_idArtiste` FOREIGN KEY (`Artiste_idArtiste`) REFERENCES `artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jouer_idFilm` FOREIGN KEY (`Film_idFilm`) REFERENCES `film` (`idFilm`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jouer`
--

LOCK TABLES `jouer` WRITE;
/*!40000 ALTER TABLE `jouer` DISABLE KEYS */;
INSERT INTO `jouer` VALUES (13,1,'eliott'),(14,2,'Scottie');
/*!40000 ALTER TABLE `jouer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noter`
--

DROP TABLE IF EXISTS `noter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noter` (
  `Internaute_idInternaute` int(10) unsigned NOT NULL,
  `Film_idFilm` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Internaute_idInternaute`,`Film_idFilm`),
  KEY `fk_Noter_idFilm_idx` (`Film_idFilm`),
  KEY `fk_Noter_idInternaute_idx` (`Internaute_idInternaute`),
  CONSTRAINT `fk_Noter_idFilm` FOREIGN KEY (`Film_idFilm`) REFERENCES `film` (`idFilm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Noter_idInternaute` FOREIGN KEY (`Internaute_idInternaute`) REFERENCES `internaute` (`idInternaute`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noter`
--

LOCK TABLES `noter` WRITE;
/*!40000 ALTER TABLE `noter` DISABLE KEYS */;
INSERT INTO `noter` VALUES (2,1);
/*!40000 ALTER TABLE `noter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-15 14:15:25
