-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (x86_64)
--
-- Host: 127.0.0.1    Database: defender_analysis_project
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `defender_positions`
--

DROP TABLE IF EXISTS `defender_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defender_positions` (
  `player` varchar(255) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `minutes_played` int DEFAULT NULL,
  `90s` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defender_positions`
--

LOCK TABLES `defender_positions` WRITE;
/*!40000 ALTER TABLE `defender_positions` DISABLE KEYS */;
INSERT INTO `defender_positions` VALUES ('Cristiano Biraghi','D (L)',32,2360,26.22),('Danilo D\'Ambrosio','D (R)',36,1534,17.04),('Flavius Daniliuc','D (RC)',23,742,8.24),('Tommaso Corazza','D (R)',20,188,2.09),('Tajon Buchanan','D  AM (R)',26,151,1.68),('Libby Cacace','D  DM (L)',24,1906,21.18),('Dodo','D  DM (R)',26,524,5.82),('Davide Biraschi','D (RC)',30,90,1.00),('Bartosz Bereszynski','D (R)',32,1767,19.63),('Danilo','D (LR)',33,2450,27.22),('Dylan Bronn','D (RC)',29,48,0.53),('Patrick Dorgu','D (L)  AM (R)',20,1562,17.36),('Mitchel Bakker','D  M (L)',24,375,4.17),('Luca Caldirola','D (LC)',34,2139,23.77),('Davide Calabria','D (R)',28,2195,24.39),('Mattia De Sciglio','D (RL)',32,46,0.51),('Giovanni Bonfanti','D (L)',22,89,0.99),('Juan David Cabal','D (L)',24,1498,16.64),('Tommaso Augello','D  M (L)',30,2430,27.00),('Victor Bernth Kristiansen','D (L)',22,2311,25.68),('Zeki Celik','D  DM (R)',28,663,7.37),('Andrea Carboni','D (L)',24,1488,16.53),('Bruno Amione','D (LC)',23,580,6.44),('Alessandro Bastoni','D (LC)',25,2282,25.36),('Fabien Centonze','D  DM (R)',29,675,7.50),('Alejandro Jimenez','D (L)',19,65,0.72),('Rick Karsdorp','D  DM (R)',30,1198,13.31),('Koni De Winter','D (RC)',22,2381,26.46),('Sead Kolasinac','D (L)',31,2182,24.24),('Tyronne Ebuehi','D (R)',29,1096,12.18),('Silvan Hefti','D  M (R)',27,110,1.22),('Berat Djimsiti','D (RC)',32,2831,31.46),('Antonino Gallo','D (L)',25,2502,27.80),('Joao Ferreira','D (RC)',23,1812,20.13),('Paulo Dentello','D  M (L)',30,940,10.44),('Koffi Djidji','D (R)',32,758,8.42),('Alessandro Dellavalle','D (R)',20,14,0.16),('Elseid Hysaj','D (LR)',31,1193,13.26),('Giulio Donati','D (R)',35,32,0.36),('Valentin Gendrey','D  DM (R)',24,3051,33.90),('Enzo Ebosse','D (LC)',25,8,0.09),('Alessandro Di Pardo','D  DM (R)',25,348,3.87),('Lorenzo De Silvestri','D  DM (R)',36,673,7.48),('Angelino','D  M (L)',28,1148,12.76),('Thomas Kristensen','D (LR)',23,2096,23.29),('Giovanni Di Lorenzo','D (R)',31,3235,35.94),('Josh Doig','D  M (L)',22,2184,24.27),('Alessandro Florenzi','D (RL)',33,1728,19.20),('Armando Izzo','D (RC)',32,1654,18.38),('Theo Hernandez','D (L)',27,2795,31.06),('Alex Sandro','D (L)',34,715,7.94),('Nahitan Nandez','D  AM (R)',29,2354,26.16),('Adam Obert','D (LC)',22,937,10.41),('Riccardo Marchizza','D  M (L)',26,1149,12.77),('Babis Lykogiannis','D  M (L)',31,899,9.99),('Manuel Lazzari','D (R)',31,1674,18.60),('Adam Marusic','D (RL)',32,3108,34.53),('Fabiano Parisi','D (LR)',24,1452,16.13),('Mathias Olivera','D (LC)',27,1572,17.47),('Michael Kayode','D (R)',20,2062,22.91),('Ricardo Rodriguez','D  DM (L)',32,2783,30.92),('Junior Sambia','D  DM (R)',28,1031,11.46),('Alan Matturro','D (L)',20,102,1.13),('Benjamin Pavard','D (R)',28,1678,18.64),('Anthony Oyono','D (R)  DM (L)',23,1198,13.31),('Luca Pellegrini','D  DM (L)',25,782,8.69),('Marcus Pedersen','D  M (R)',24,1603,17.81),('Niccolo Pierozzi','D  M (R)',23,875,9.72),('Giorgio Scalvini','D (RL)',21,2555,28.39),('Sebastiano Luperto','D (LC)',28,3407,37.86),('Yann Aurel Bisseck','D (RL)',24,898,9.98),('Rasmus Kristensen','D  M (R)',27,1741,19.34),('Adam Masina','D (L)',31,1083,12.03),('Stefan Posch','D (R)',27,2418,26.87),('Pol Lirola','D (R)',27,1540,17.11),('Emanuele Valeri','D  DM (L)',26,1178,13.09),('Johan Vasquez','D (LC)',26,2851,31.68),('Adrien Tameze','D (R)  DM (C)',31,2153,23.92),('Matias Vina','D  DM (L)',27,1022,11.36),('Lorenzo Venuti','D  M (R)',29,355,3.94),('Rafael Toloi','D (R)',34,962,10.69),('Ruben Vinagre','D  M (L)',25,273,3.03),('Mergim Vojvoda','D (R)  DM (L)',30,1373,15.26),('Jordan Zemura','D  M (L)',25,1031,11.46),('Gabriele Zappa','D (R)',25,2555,28.39),('Filippo Terracciano','D (L)  DM (R)',22,1371,15.23),('Jackson Tchatchoua','D  DM (R)',23,1724,19.16),('Mario Rui','D (L)',33,1207,13.41),('Mattia Viti','D (LC)',23,983,10.92),('Mateus Lusuardi','D (L)',21,220,2.44),('Leonardo Spinazzola','D  M (L)',31,1314,14.60),('Brandon Soppy','D  M (R)',22,177,1.97),('Alessandro Zanoli','D  DM (R)',24,969,10.77),('Djed Spence','D  DM (R)',24,853,9.48),('Jeremy Toljan','D (R)',30,2085,23.17),('Radu Dragusin','D (C)',23,1710,19.00),('Alessandro Buongiorno','D (C)',25,2530,28.11),('Sam Beukema','D (C)',26,2549,28.32),('Riccardo Calafiori','D (CL)',22,2348,26.09),('Pietro Comuzzo','D (C)',19,39,0.43),('Kevin Bonifazi','D (CR)',28,396,4.40),('Jaka Bijol','D (C)',26,2083,23.14),('Pawel Dawidowicz','D (CL)',29,2144,23.82),('Natan','D (CL)',24,955,10.61),('Davide Bettella','D (CR)',24,2,0.02),('Pantelis Chatzidiakos','D (CL)',28,867,9.63),('Tiago Djalo','D (CL)',24,16,0.18),('Stefan de Vrij','D (CL)',33,1579,17.54),('Davide Bartesaghi','D',19,73,0.81),('Jerome Boateng','D (C)',36,239,2.66),('Diego Coppola','D (C)',21,1632,18.13),('Giorgio Cittadini','D (C)',22,117,1.30),('Francesco Acerbi','D (CL)',37,2386,26.51),('Martin Erlic','D (C)',27,2626,29.18),('Nicolo Casale','D (C)',27,1557,17.30),('Federico Baschirotto','D (C)',28,3295,36.61),('Mattia Bani','D (CR)',31,2310,25.67),('Alberto Dossena','D (C)',26,2978,33.09),('Mattia Caldara','D (CR)',30,32,0.36),('Bremer','D (C)',27,3234,35.93),('Patric','D (CR)',31,1609,17.88),('Federico Gatti','D (CR)',26,2642,29.36),('Christian Kabasele','D (CR)',33,859,9.54),('Mario Gila','D (CL)',24,1814,20.16),('Simon Kjar','D (C)',35,1172,13.02),('Gian Marco Ferrari','D (C)',33,2267,25.19),('Giangiacomo Magnani','D (CR)',29,2441,27.12),('Matteo Lovato','D (CR)',25,1488,16.53),('Lautaro Gianetti','D (CL)',31,630,7.00),('Marash Kumbulla','D (CL)',25,359,3.99),('Federico Fazio','D (CL)',37,1356,15.07),('Edoardo Goldaniga','D (CR)',31,1015,11.28),('Norbert Gyomber','D (CR)',32,1764,19.60),('Pablo Mari','D (C)',31,2617,29.08),('Kostas Manolas','D (CR)',33,491,5.46),('Axel Guessand','D (C)',20,44,0.49),('Jhon Lucumi','D (C)',26,2212,24.58),('Diego Llorente','D (C)',31,2248,24.98),('Dean Huijsen','D (C)',19,514,5.71),('Ardian Ismajli','D (CR)',28,2045,22.72),('Gianluca Mancini','D (CR)',28,2875,31.94),('Matteo Gabbia','D (C)',25,1275,14.17),('Pierre Kalulu','D (CR)',24,371,4.12),('Isak Hien','D (C)',26,1794,19.93),('Lucas Martinez','D (CR)',28,2293,25.48),('Malick Thiaw','D (C)',23,1621,18.01),('Yerry Mina','D (C)',30,1258,13.98),('Lorenzo Pirola','D (CL)',22,1992,22.13),('Jan-Carlo Simic','D (C)',19,142,1.58),('Nikola Milenkovic','D (C)',27,2504,27.82),('Marin Pongracic','D (C)',27,3220,35.78),('Juan Jesus','D (CL)',33,2118,23.53),('Amir Rrahmani','D (C)',30,2603,28.92),('Alessio Romagnoli','D (C)',30,2409,26.77),('Triantafyllos Pasalidis','D (CR)',28,451,5.01),('Przemyslaw Szyminski','D (CR)',30,8,0.09),('Jose Luis Palomino','D (CL)',34,23,0.26),('Saba Sazonov','D (C)',23,348,3.87),('Kevin Miranda','D (C)',21,13,0.14),('Marco Pellegrino','D (C)',22,609,6.77),('Daniele Rugani','D (CR)',30,1186,13.18),('Chris Smalling','D (C)',35,389,4.32),('Nehuen Perez','D (CR)',24,3240,36.00),('Simone Romagnoli','D (C)',35,2714,30.16),('Ilario Monterisi','D (CR)',23,1464,16.27),('Perr Schuurs','D (CR)',25,771,8.57),('Caleb Okoli','D (CL)',23,2914,32.38),('Luca Ranieri','D (C)',25,2066,22.96),('Evan N\'Dicka','D (CL)',25,2171,24.12),('Leo Ostigard','D (C)',25,1620,18.00),('Alessandro Vogliacco','D (CR)',26,1172,13.02),('Ahmed Touba','D (CL)',25,275,3.06),('Ruan','D (CR)',25,1513,16.81),('Sebastian Walukiewicz','D (CR)',24,2055,22.83),('David Zima','D (CL)',24,86,0.96),('Mateusz Wieteska','D (CR)',28,959,10.66),('Fikayo Tomori','D (C)',27,2124,23.60);
/*!40000 ALTER TABLE `defender_positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 10:47:15
