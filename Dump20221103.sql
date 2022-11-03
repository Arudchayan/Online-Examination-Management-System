-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineexaminationmanagement
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `AnswerID` char(16) NOT NULL,
  `ExamID` char(6) NOT NULL,
  `StudentID` char(10) NOT NULL,
  `AnswerFile` varchar(100) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  PRIMARY KEY (`AnswerID`,`ExamID`,`StudentID`),
  KEY `Answer_Examid_FK` (`ExamID`),
  KEY `Answer_Studentid_FK` (`StudentID`),
  CONSTRAINT `Answer_Examid_FK` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`),
  CONSTRAINT `Answer_Studentid_FK` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('AN0001','EX0001','IS18758649','IS18758649AN0001.xlsx',45);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `BatchID` char(7) NOT NULL,
  `SID` char(10) NOT NULL,
  PRIMARY KEY (`BatchID`,`SID`),
  KEY `Batch_batchid_FK` (`SID`),
  CONSTRAINT `Batch_batchid_FK` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES ('Y3S1G1','CN19465738'),('Y3S2G1','DS18234876'),('Y1S1G1','IT18234568'),('Y1S1G1','IT19275687'),('Y3S1G1','SE19238567'),('Y3S2G1','SE20284567');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CID` char(6) NOT NULL,
  `Cname` varchar(50) DEFAULT NULL,
  `C_Description` varchar(200) DEFAULT NULL,
  `C_fee` int DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CS','Cyber Security','Information systems engineering specialty programme is the key to develop and manage complex systems that solve real-world problems.',174000),('CSNE','Computer Systems And Network Engineering','The programme aims to provide students with the knowledge, skills, planning, and designing',155000),('DS','Data Science','The meticulous curriculum focuses on the fundamentals of computer science, statistics, and applied mathematics',170000),('ISE','Information System Engineering','Information systems engineering specialty programme is the key to develop and manage complex systems that solve real-world problems',145000),('IT','Infromaton Technology','The programme is designed for technically focused students who capabilities in programming',175000),('SE','Software Engineering','Software engineering is the discipline of designing, creating and maintaining',185000);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `ExamID` char(6) NOT NULL,
  `Mcode` char(6) DEFAULT NULL,
  `ExamName` varchar(30) DEFAULT NULL,
  `BatchID` char(7) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  `ExamTime` time DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `ExamFile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `Exam_batchid_FK` (`BatchID`),
  CONSTRAINT `Exam_batchid_FK` FOREIGN KEY (`BatchID`) REFERENCES `batch` (`BatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('EX0001','IT1010','IP Online Test 1','Y1S1G1','2022-10-15','12:30:00',300,'IWT.xlsx'),('EX0002','IT1050','OOC Online Test 2','Y1S1G1','2022-10-16','12:30:00',300,'OOP.xlsx'),('EX0003','IT1100','IWT Mid-Exam','Y3S2G1','2022-10-15','12:30:00',300,'CN.xlsx'),('EX0004','IT2050','CN Online Test 1','Y3S1G1','2022-10-16','12:30:00',300,'IP.xlsx');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `MessageID` int NOT NULL,
  `SID` char(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ExamID` char(6) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `Feedback_sid_FK` (`SID`),
  KEY `Feedback_examID_FK` (`ExamID`),
  CONSTRAINT `Feedback_examID_FK` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`),
  CONSTRAINT `Feedback_sid_FK` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  CONSTRAINT `subject_check` CHECK ((`Subject` in (_utf8mb4'comments',_utf8mb4'suggestions',_utf8mb4'issues',_utf8mb4'questions')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'IT18234568','2022-10-11','EX0001','comments','Issue regarding the marking of paper'),(2,'CS18234867','2022-10-10','EX0002','suggestions','Issue regarding the marking of paper'),(3,'DS18375688','2022-10-09','EX0002','issues','Issue regarding the marking of paper'),(4,'SE19238567','2022-10-09','EX0003','questions','Issue regarding the marking of paper'),(5,'CN19465738','2022-10-12','EX0004','issues','Issue regarding the marking of paper');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `Mcode` char(6) NOT NULL,
  `Mname` varchar(50) DEFAULT NULL,
  `M_Description` varchar(200) DEFAULT NULL,
  `NoOfCredits` int DEFAULT NULL,
  PRIMARY KEY (`Mcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES ('IE2051','Information Systems Project','subject under ISE',4),('IE3030','Wide area Networks','subject under CSNE',4),('IE3051','E Business Strategy & Architecture and Design','subject under ISE',3),('IE3070','Network Technology Project','subject under CSNE',4),('IE3080','Network Security Engineering','subject under CSNE',4),('IE3081','Enterprise Resource Planning','subject under ISE',4),('IE3082','Cryptography','subject under CS',4),('IE3102','Enterprise Standards for Information Security','subject under CS',4),('IE4011','Business Process Managemet','subject under ISE',4),('IE4040','Information Assurance and Auditing','subject under CSNE',4),('IE4042','Secure Software Engineering','subject under CS',4),('IE4052','Hardware Security','subject under CS',4),('IT1010','Introduction to Programming','subject under IT',4),('IT1050','Object Oriented Concepts','subject under IT',2),('IT1100','Internet and Web Technologies','subject under IT',4),('IT2050','Computer Networks','subject under IT',4),('IT3011','Theory and Practices in Statistical Modelling','subject under DS',4),('IT3051','Fundamentals of Data Mining','subject under DS',4),('IT3071','Machine Learning and Optimization Methods','subject under DS',4),('IT3100','Industry Placement','subject under SE',8),('IT4011','Database Administration and Storage Systems','subject under DS',4),('SE3020','Distributed Systems','subject under SE',4),('SE3050','User Experience Engineering','subject under SE',3),('SE4030','Secure Software Development','subject under SE',4);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `CID` char(6) NOT NULL,
  `Mcode` char(6) NOT NULL,
  `Accadamic_year` char(2) DEFAULT NULL,
  `Semester` int DEFAULT NULL,
  PRIMARY KEY (`CID`,`Mcode`),
  KEY `Offers_Mcode_FK2` (`Mcode`),
  CONSTRAINT `Offers_cid_FK1` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`),
  CONSTRAINT `Offers_Mcode_FK2` FOREIGN KEY (`Mcode`) REFERENCES `module` (`Mcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES ('CS','IE3082','Y3',1),('CS','IE3102','Y3',2),('CS','IE4042','Y4',1),('CS','IE4052','Y4',1),('CSNE','IE3030','Y3',1),('CSNE','IE3070','Y3',1),('CSNE','IE3080','Y3',2),('CSNE','IE4040','Y4',1),('DS','IT3011','Y3',1),('DS','IT3051','Y3',2),('DS','IT3071','Y3',2),('DS','IT4011','Y4',1),('ISE','IE2051','Y2',2),('ISE','IE3051','Y3',1),('ISE','IE3081','Y3',2),('ISE','IE4011','Y4',1),('IT','IT1010','Y1',2),('IT','IT1050','Y1',2),('IT','IT1100','Y1',2),('IT','IT2050','Y2',1),('SE','IT3100','Y3',2),('SE','SE3020','Y3',2),('SE','SE3050','Y3',2),('SE','SE4030','Y4',1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `userId` int DEFAULT NULL,
  `SID` char(10) NOT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `NIC` char(10) DEFAULT NULL,
  `CID` char(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `Studnet_cid_FK` (`CID`),
  KEY `Studnet_userid_FK` (`userId`),
  CONSTRAINT `Studnet_cid_FK` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`),
  CONSTRAINT `Studnet_userid_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (100006,'CN18384756','Siva','No122, Rose street, matale','1994-05-02','946785467v','CSNE','sk@gmail.com'),(100005,'CN19465738','Jack','No173, New kandy Road, kaduwella','1996-11-20','968764567v','CSNE','bp@ymail.com'),(100009,'CS18223645','Vicky','No08 , Gamini Road, Anuradhapura','1996-10-11','968564857v','CS','vicky12@gmail.com'),(100010,'CS18234867','Sathya','No125 , 1st street, kurunegala','1996-02-15','968763456v','CS','sathya@ymail.com'),(100011,'DS18234876','Gobi','No678 , 3rd new lane, Maharahgama','1994-11-08','948763759v','DS','gobi@ymail.com'),(100012,'DS18375688','Sanga','No10 , new street, jaffna','1994-03-05','948763456v','DS','sanga@tmail.com'),(100007,'IS18758649','Ajithi','No111, Perera street, kurunegala','1998-09-07','982359856v','ISE','ak@mail.com'),(100008,'IS19234876','Vinayak','No124 , 2nd street, colombo10','1998-12-08','983485764v','ISE','manga@tmail.com'),(100002,'IT15974577','John','No14, flower street, colombo12','1994-01-10','945673456v','IT','john@gmail.com'),(100001,'IT18234568','Vetri','No12, Kings street, colombo','1996-11-11','961234587v','IT','vetri@gmail.com'),(100000,'IT19275687','John','No15, Alfred Place, colombo 7','1995-02-10','955673123v','IT','rocky@gmail.com'),(100003,'SE19238567','Vikram','No08, st.thomas street, Kandy','1992-12-20','922356785v','SE','vikram@gmail.com'),(100004,'SE20284567','Durairaj','No15, lakshmi Road, jaffna','1996-08-07','965678645v','SE','dj@mhoo.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  `pNumber` int DEFAULT NULL,
  `userType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=100016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (100000,'John','Peter','&\'()*+,-.%',30,'rocky@mail.com',778811221,'Admin'),(100001,'Vetri','Maaran','flZginj^de',22,'vetri@gmail.com',777722221,'Student'),(100002,'John','Danial','flZginj^de',21,'john@gmail.com',774365451,'Student'),(100003,'Vikram','karnan','VhY[]_`a0&',34,'vikram@gmail.com',777213455,'Student'),(100004,'Durairaj','John','ffVVoollhh',30,'dj@mhoo.com',765443432,'Lecturer'),(100005,'Jack','Sparrow','&\'&\'&\'&\'&\'',23,'bp@ymail.com',778877222,'Student'),(100006,'Siva ','Kumar','%%%%%%%%%%%%%%%%',45,'sk@gmail.com',778844563,'Student'),(100007,'Ajithi','Kumar',')*)*)*)*)*)*',45,'ak@mail.com',778862525,'Lecturer'),(100008,'Vinayak','MahaDeva','&\'()&\'()&\'',24,'manga@tmail.com',773434349,'Lecturer'),(100009,'Vicky','Ram','&\'&\'&\'&\'&\'',20,'vicky12@gmail.com',788383839,'Student'),(100010,'Sathya','Devan','&\'()*+&\'()',44,'sathya@ymail.com',776253232,'Lecturer'),(100011,'Gobi','Krishna','&\'()*+,-.%',55,'gobi@ymail.com',765439858,'Admin'),(100012,'Sanga','Kumar','&\'()*+,-.%',35,'sanga@tmail.com',776363534,'Admin'),(100013,'Aditiya','Karigalan','&\'()*+,-.%',26,'nandi@gamil.com',774354564,'Lecturer'),(100014,'Surya','Deva','flZginj^de',53,'surya124@ymail.com',776635353,'Admin'),(100015,'Chiti','Kutti','flZginj^de',54,'vasi@ymail.com',765353922,'Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03  7:35:05
