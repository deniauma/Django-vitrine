-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: site_reiki
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "vitrine_appointment"
--

DROP TABLE IF EXISTS "vitrine_appointment";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "vitrine_appointment" (
  "id" int(11) NOT NULL,
  "start_date" datetime NOT NULL,
  "end_date" datetime NOT NULL,
  "validated" tinyint(1) NOT NULL,
  "details" longtext NOT NULL,
  "email" varchar(75) NOT NULL,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "phone" varchar(15) NOT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "vitrine_appointment"
--

LOCK TABLES "vitrine_appointment" WRITE;
/*!40000 ALTER TABLE "vitrine_appointment" DISABLE KEYS */;
/*!40000 ALTER TABLE "vitrine_appointment" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "vitrine_closingday"
--

DROP TABLE IF EXISTS "vitrine_closingday";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "vitrine_closingday" (
  "id" int(11) NOT NULL,
  "date" date NOT NULL,
  "title" varchar(20) NOT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "vitrine_closingday"
--

LOCK TABLES "vitrine_closingday" WRITE;
/*!40000 ALTER TABLE "vitrine_closingday" DISABLE KEYS */;
/*!40000 ALTER TABLE "vitrine_closingday" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "vitrine_navigation"
--

DROP TABLE IF EXISTS "vitrine_navigation";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "vitrine_navigation" (
  "id" int(11) NOT NULL,
  "link_label" varchar(200) NOT NULL,
  "link_order" int(11) NOT NULL,
  "link_page_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "vitrine_navigation_5b76e141" ("link_page_id"),
  CONSTRAINT "vitrine_navigation_link_page_id_3a248409_fk_vitrine_page_id" FOREIGN KEY ("link_page_id") REFERENCES "vitrine_page" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "vitrine_navigation"
--

LOCK TABLES "vitrine_navigation" WRITE;
/*!40000 ALTER TABLE "vitrine_navigation" DISABLE KEYS */;
INSERT INTO "vitrine_navigation" VALUES (1,'Accueil',1,1),(2,'Présentation',2,2),(3,'Formation',3,3),(4,'Espace de travail',4,4),(5,'Séances et tarifs',5,5),(6,'Contact',6,6);
/*!40000 ALTER TABLE "vitrine_navigation" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "vitrine_page"
--

DROP TABLE IF EXISTS "vitrine_page";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "vitrine_page" (
  "id" int(11) NOT NULL,
  "creation_date" datetime NOT NULL,
  "last_modified" datetime NOT NULL,
  "is_main_page" tinyint(1) NOT NULL,
  "page_slug" varchar(200) NOT NULL,
  "page_template" varchar(200) NOT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "vitrine_page"
--

LOCK TABLES "vitrine_page" WRITE;
/*!40000 ALTER TABLE "vitrine_page" DISABLE KEYS */;
INSERT INTO "vitrine_page" VALUES (1,'2015-06-15 14:39:41','2015-08-18 08:16:08',1,'accueil','accueil.html'),(2,'2015-06-15 14:40:34','2015-06-15 14:40:34',0,'presentation','index.html'),(3,'2015-06-15 14:43:01','2015-08-17 07:35:46',0,'formation','formation.html'),(4,'2015-06-15 14:44:26','2015-08-17 07:35:58',0,'espace-de-travail','espace.html'),(5,'2015-06-15 14:45:04','2015-06-16 14:45:04',0,'seances-et-tarifs','calendar.html'),(6,'2015-06-15 14:45:55','2015-08-18 09:54:05',0,'contact','contact.html');
/*!40000 ALTER TABLE "vitrine_page" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "vitrine_label"
--

DROP TABLE IF EXISTS "vitrine_label";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "vitrine_label" (
  "id" int(11) NOT NULL,
  "label_place" varchar(20) NOT NULL,
  "label_text" longtext NOT NULL,
  "label_page_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "vitrine_label_53f5d5e6" ("label_page_id"),
  CONSTRAINT "vitrine_label_label_page_id_113e8c87_fk_vitrine_page_id" FOREIGN KEY ("label_page_id") REFERENCES "vitrine_page" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "vitrine_label"
--

LOCK TABLES "vitrine_label" WRITE;
/*!40000 ALTER TABLE "vitrine_label" DISABLE KEYS */;
INSERT INTO "vitrine_label" VALUES (1,'T','<p>Bienvenue!</p>',1),(2,'C1','<p>A l\'heure o&ugrave; l\'&ecirc;tre humain recherche le naturel, le Reiki et le Magn&eacute;tisme r&eacute;pondent &agrave; cette attente l&eacute;gitime.<br /> <br /> Nombreuses sont les personnes qui s\'interrogent sur les causes de leurs souffrances physiques et/ou morales...</p>\r\n<p>Il faut savoir que la tr&egrave;s grande majorit&eacute; des maladies physiques sont engendr&eacute;es par des \"charges &eacute;motionnelles\" que nous avons, &agrave; un moment ou un autre, int&eacute;rioris&eacute;es. La m&eacute;decine moderne nomme cette relation Corps-Esprit: &eacute;tats psychosomatiques. Cela est enseign&eacute; depuis des mill&eacute;naires par la M&eacute;decine Chinoise, entre autres.<br /> <br /> Si ces charges sont peu importantes, nous les &eacute;liminons; lorsque l\'&eacute;motion a &eacute;t&eacute; importante et douloureuse, nous l\'enfouissons au fond de nous-m&ecirc;me; plus pr&eacute;cis&eacute;ment dans le ventre (l\'expression \"avoir des noeuds au ventre\" n\'est pas du tout anodine).<br /> <br /> A force de les y entasser, elles finissent par se manifester sous la formes de souffrances physiques; celles-ci peuvent &ecirc;tre l&eacute;g&egrave;res ou tr&egrave;s graves.<br /> <br /> Il faut, dans ce cas, commencer par tra&icirc;ter l\'Effet, puis s\'occuper de la Cause; en fait, pour retrouver un &eacute;quilibre tant physique que psychologique, il faut absolument se d&eacute;barrasser de ces charges &eacute;motionnelles qui vous p&eacute;nalisent dans votre vie de tous les jours.<br /> <br /> Lib&eacute;rez-Vous !<span>&nbsp;<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&Eacute;ric DENIAUD &nbsp;&nbsp; <br /></span></p>',1),(3,'T','<p><span><span><span><span>Le </span></span></span></span><span><span><span><span>Magn&eacute;tisme</span></span></span></span></p>',2),(4,'C1','<p><span><span><span><span>Quel int&eacute;r&ecirc;t pour Vous ?<br /> <br /> Je Vous le <strong>recommande</strong> pour deux raisons:</span></span></span> </span></p>\r\n<ul>\r\n<li><span><span><span><span><strong>S&eacute;ances pr&eacute;ventives:</strong> faites r&eacute;guli&egrave;rement, elles apportent: d&eacute;tente, &eacute;nergie, s&eacute;r&eacute;nit&eacute;, bien-&ecirc;tre et, surtout, une <strong>am&eacute;lioration</strong> sensible de votre &eacute;tat <strong>mental et physique</strong>;</span></span></span></span></li>\r\n<li><span><span><span><span><strong>S&eacute;ances curatives</strong>: ponctuelles, elles permettent de <strong>Vous soulager</strong> de diverses souffrances: d&eacute;pression, stress, mal-&ecirc;tre, anxi&eacute;t&eacute;, manque de confiance, insomnies, fatigue, douleurs, migraines, sciatiques, zona&hellip;</span></span></span></span></li>\r\n</ul>\r\n<p><span> <span> <span><span>Le magn&eacute;tisme est <strong>compl&eacute;mentaire</strong> &agrave; tous les traitements m&eacute;dicaux, <strong>naturel </strong>et sans contre-indication.<br /> <br /> Pour ce faire, je vous accueille dans un environnement <strong>calme et propice &agrave; la d&eacute;tente.</strong><br /> <br /> Je mets en toute simplicit&eacute;, &agrave; Votre service, ce que la <strong>Nature</strong> m\'a donn&eacute;: le <strong>Magn&eacute;tisme</strong>. Ce don, je le <strong>renforce</strong> gr&acirc;ce &agrave; des <strong>techniques sino-japonaises</strong> utilis&eacute;es depuis des mill&eacute;naires: <strong>Reiki </strong>et Ki-magn&eacute;tisme.</span></span></span></span></p>',2),(5,'T','<p>S&eacute;ances et tarif:&nbsp; </p>',5),(6,'C1','<ul>\r\n<li>\r\n<p><span style=\"text-decoration: underline;\">Reiki (Magn&eacute;tisme &eacute;nerg&eacute;tique):</span>&nbsp;&eacute;limination des charges &eacute;motionnelles, allergies, d&eacute;pression, angoisse, stress, phobie, mal-&ecirc;tre, nervosit&eacute;, insomnie, fatigue...</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<p><span style=\"text-decoration: underline;\">Massomagn&eacute;tisme complet:</span> travail &agrave; l\'huile et magn&eacute;tisation des trois zones les plus sensibles: dos/&eacute;paules, ventre, visage/cou: d&eacute;tente physique et bien-&ecirc;tre...</p>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li><span style=\"text-decoration: underline;\">Massomagn&eacute;tisme local:</span>&nbsp;douleurs, zona, sciatiques, cruralgies, migraines...</li>\r\n</ul>\r\n<p><br /> Prix de la s&eacute;ance d\'une heure: 40 &euro;.<br /> <br /> D&eacute;placement &agrave; domicile: sur demande.<br /> <br /> Travail &agrave; distance sur photo: 40 &euro;.<br /> <br /> R&egrave;glement comptant par ch&egrave;que ou esp&egrave;ces.</p>',5),(7,'T','<p>Mes formations</p>',3),(8,'C1','<ul>\r\n<li>Praticien de Reiki et Ki-magn&eacute;tisme:\r\n<ul>\r\n<li><address>techniques sino-japonaises permettant le r&eacute;&eacute;quilibrage et le renforcement des &eacute;nergies du corps; ceci permettant de dynamiser les capacit&eacute;s de gu&eacute;rison de votre corps, et d\'am&eacute;liorer votre moral.</address></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<div>Praticien des techniques de Tui Fa:</div>\r\n<ul>\r\n<li><address>pressions gliss&eacute;es sur les m&eacute;ridiens profonds, permettant de soulager les douleurs physiques.</address></li>\r\n</ul>\r\n</li>\r\n</ul>',3),(9,'T','<p>Voici ma pi&egrave;ce de travail:</p>',4),(10,'C1','<p>Je vous re&ccedil;ois en musique, dans une pi&egrave;ce calme et chaleureuse, qui vous relaxera; vous ressentirez soulagement, bien-&ecirc;tre et s&eacute;r&eacute;nit&eacute;.</p>',4),(11,'C2','<p><span class=\"text-green\">Voici la liste de mes qualifications acquises durant mes formations dans le domaine du Reiki/Magn&eacute;tisme:</span></p>',3),(12,'C2','<p>Une salle d\'attente, calme et accueillante, vous est propos&eacute;e &agrave; votre arriv&eacute;e.</p>',4),(13,'T','<p>Pour me contacter</p>',6),(14,'C1','<p>Vous pouvez me joindre par t&eacute;l&eacute;phone:</p>\r\n<ul>\r\n<li>T&eacute;l: 02 41 42 12 18</li>\r\n<li>Port: 06 87 49 33 99</li>\r\n</ul>\r\n<p>Localisation:</p>',6),(15,'C2','<p>Vous pouvez &eacute;galement me joindre par e-mail en remplissant le formulaire ci-dessous:</p>',6);
/*!40000 ALTER TABLE "vitrine_label" ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-24 19:53:54
