-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: django_reiki
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `vitrine_appointment`
--

DROP TABLE IF EXISTS `vitrine_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitrine_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `validated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitrine_appointment`
--

LOCK TABLES `vitrine_appointment` WRITE;
/*!40000 ALTER TABLE `vitrine_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vitrine_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitrine_navigation`
--

DROP TABLE IF EXISTS `vitrine_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitrine_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_label` varchar(200) NOT NULL,
  `link_order` int(11) NOT NULL,
  `link_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vitrine_navigation_5b76e141` (`link_page_id`),
  CONSTRAINT `vitrine_navigation_link_page_id_3a248409_fk_vitrine_page_id` FOREIGN KEY (`link_page_id`) REFERENCES `vitrine_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitrine_navigation`
--

LOCK TABLES `vitrine_navigation` WRITE;
/*!40000 ALTER TABLE `vitrine_navigation` DISABLE KEYS */;
INSERT INTO `vitrine_navigation` VALUES (1,'Accueil',1,1),(2,'Présentation',2,2),(3,'Formation',3,3),(4,'Espace de travail',4,4),(5,'Séances et tarifs',5,5),(6,'Contact',6,6);
/*!40000 ALTER TABLE `vitrine_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitrine_page`
--

DROP TABLE IF EXISTS `vitrine_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitrine_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(200) NOT NULL,
  `page_content` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `is_main_page` tinyint(1) NOT NULL,
  `page_slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitrine_page`
--

LOCK TABLES `vitrine_page` WRITE;
/*!40000 ALTER TABLE `vitrine_page` DISABLE KEYS */;
INSERT INTO `vitrine_page` VALUES (1,'Accueil','A l\'heure où l\'être humain recherche le naturel, le Reiki et le Magnétisme répondent à cette attente légitime.\r\n\r\nNombreuses sont les personnes qui s\'interrogent sur les causes de leurs souffrances physiques et/ou morales...\r\n \r\nIl faut savoir que la très grande majorité des maladies physiques sont engendrées par des \"charges émotionnelles\" que nous avons, à un moment ou un autre, intériorisées. La médecine moderne nomme cette relation Corps-Esprit: états psychosomatiques. Cela est enseigné depuis des millénaires par la Médecine Chinoise, entre autres.\r\n\r\nSi ces charges sont peu importantes, nous les éliminons; lorsque l\'émotion a été importante et douloureuse, nous l\'enfouissons au fond de nous-même; plus précisément dans le ventre (l\'expression \"avoir des noeuds au ventre\" n\'est pas du tout anodine).\r\n\r\nA force de les y entasser, elles finissent par se manifester sous la formes de souffrances physiques; celles-ci peuvent être légères ou très graves.\r\n\r\nIl faut, dans ce cas, commencer par traîter l\'Effet, puis s\'occuper de la Cause; en fait, pour retrouver un équilibre tant physique que psychologique, il faut absolument se débarrasser de ces charges émotionnelles qui vous pénalisent dans votre vie de tous les jours.\r\n\r\nLibérez-Vous ! \r\n                                      Éric DENIAUD    ','2015-06-15 14:39:41','2015-06-15 14:39:49',1,'accueil'),(2,'Présentation','Le Magnétisme\r\n\r\nQuel intérêt pour Vous ?\r\n\r\nJe Vous le recommande pour deux raisons:\r\n\r\n    Séances préventives: faites régulièrement, elles apportent: détente, énergie, sérénité, bien-être et, surtout, une amélioration sensible de votre état mental et physique;\r\n    Séances curatives: ponctuelles, elles permettent de Vous soulager de diverses souffrances: dépression, stress, mal-être, anxiété, manque de confiance, insomnies, fatigue, douleurs, migraines, sciatiques, zona…\r\n\r\nLe magnétisme est complémentaire à tous les traitements médicaux, naturel et sans contre-indication.\r\n\r\nPour ce faire, je vous accueille dans un environnement calme et propice à la détente.\r\n\r\nJe mets en toute simplicité, à Votre service, ce que la Nature m\'a donné: le Magnétisme. Ce don, je le renforce grâce à des techniques sino-japonaises utilisées depuis des millénaires: Reiki et Ki-magnétisme.','2015-06-15 14:40:34','2015-06-15 14:40:34',0,'presentation'),(3,'Formation','Mes formations:\r\n\r\n    Praticien de Reiki et Ki-magnétisme:\r\n        techniques sino-japonaises permettant le rééquilibrage et le renforcement des énergies du corps; ceci permettant de dynamiser les capacités de guérison de votre corps, et d\'améliorer votre moral.\r\n\r\n    Praticien des techniques de Tui Fa:\r\n        pressions glissées sur les méridiens profonds, permettant de soulager les douleurs physiques.\r\n','2015-06-15 14:43:01','2015-06-15 14:43:01',0,'formation'),(4,'Espace de travail','Voici ma pièce de travail:\r\n\r\n   \r\nJe vous reçois en musique, dans une pièce calme et chaleureuse, qui vous relaxera; vous ressentirez soulagement, bien-être et sérénité.','2015-06-15 14:44:26','2015-06-15 14:44:26',0,'espace-de-travail'),(5,'Séances et tarifs','Séances et tarif:  \r\n\r\n    Reiki (Magnétisme énergétique): élimination des charges émotionnelles, allergies, dépression, angoisse, stress, phobie, mal-être, nervosité, insomnie, fatigue...\r\n\r\n    Massomagnétisme complet: travail à l\'huile et magnétisation des trois zones les plus sensibles: dos/épaules, ventre, visage/cou: détente physique et bien-être...\r\n\r\n    Massomagnétisme local: douleurs, zona, sciatiques, cruralgies, migraines...\r\n\r\n    Prix de la séance d\'une heure: 40 €.\r\n\r\n    Déplacement à domicile: sur demande.\r\n\r\n    Travail à distance sur photo: 40 €.\r\n\r\n    Règlement comptant par chèque ou espèces.','2015-06-15 14:45:04','2015-06-15 14:45:04',0,'seances-et-tarifs'),(6,'Contact','Pour me contacter:\r\n \r\nÉric DENIAUD\r\n6, Impasse des Mésanges\r\n49125 TIERCÉ 	\r\n\r\nTéléphone: 02.41.42.12.18\r\nPortable: 06.87.49.33.99\r\n\r\nJe vous reçois sur rendez-vous du lundi au samedi de 8h00 à 20h00.','2015-06-15 14:45:55','2015-06-15 14:45:55',0,'contact');
/*!40000 ALTER TABLE `vitrine_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-15 22:00:40
