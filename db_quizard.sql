-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2024 at 06:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quizard`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkEmailExist` (IN `email` VARCHAR(100))   SELECT tbl_users.fld_userId FROM tbl_users WHERE tbl_users.fld_userEmail = email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkUser` (IN `userEmail` VARCHAR(100))   SELECT tbl_users.fld_userId, tbl_users.fld_userName, tbl_users.fld_userPass FROM tbl_users WHERE tbl_users.fld_userEmail=userEmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getQuestions` ()   SELECT T1.fld_question, T0.fld_answer1, T0.fld_answer2, T1.fld_answer
FROM tbl_answers T0
LEFT JOIN tbl_questions T1 ON T0.fld_questionId = T1.fld_questionId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getScores` ()   SELECT tbl_users.fld_userName, tbl_quiz.fld_quizName, tbl_score.fld_score
FROM tbl_score
JOIN tbl_users ON tbl_score.fld_userId = tbl_users.fld_userId
JOIN tbl_quiz ON tbl_score.fld_quizId = tbl_quiz.fld_gameId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertScore` (IN `score` INT(20), IN `userId` INT(20), IN `quizId` INT)   INSERT INTO tbl_score (tbl_score.fld_score, tbl_score.fld_userId, tbl_score.fld_quizId)
VALUES (score, userID, quizId)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUser` (IN `name` VARCHAR(100), IN `pass` VARCHAR(50), IN `email` VARCHAR(100))   INSERT INTO `tbl_users` (`fld_userName`, `fld_userPass`, `fld_userEmail`) 
VALUES (name, pass, email)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_answers`
--

CREATE TABLE `tbl_answers` (
  `fld_answerId` int(20) NOT NULL,
  `fld_questionId` int(20) NOT NULL,
  `fld_answer1` varchar(50) NOT NULL,
  `fld_answer2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_answers`
--

INSERT INTO `tbl_answers` (`fld_answerId`, `fld_questionId`, `fld_answer1`, `fld_answer2`) VALUES
(1, 1, 'var', 'varchar'),
(2, 2, 'forin', 'foreach'),
(3, 3, 'Document Object Mode', 'Daring Ostrich Migration'),
(4, 4, 'parselnt', 'Integer'),
(5, 5, '\"===\"', '\"+++\"'),
(6, 6, 'function', 'Lecture'),
(7, 7, 'length', 'width'),
(8, 8, 'push', 'pull'),
(9, 9, 'Type checking', 'Inventory'),
(10, 10, 'click', 'Dot'),
(11, 11, 'style', 'asdfg'),
(12, 12, 'image', 'hjghn'),
(13, 13, 'break', 'erdgf'),
(14, 14, 'table', 'cvbnn'),
(15, 15, 'input', 'dfghm'),
(16, 16, 'def', 'jcghnby'),
(17, 17, 'int', 'ghjedfl'),
(18, 18, 'for', 'sbntetg'),
(19, 19, 'var', 'bstysmj'),
(20, 20, 'len', 'fmyudrb');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gametype`
--

CREATE TABLE `tbl_gametype` (
  `fld_gameId` int(20) NOT NULL,
  `fld_gameName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_gametype`
--

INSERT INTO `tbl_gametype` (`fld_gameId`, `fld_gameName`) VALUES
(1, 'Bookworm'),
(2, '4 pics 1 word'),
(3, 'Hangman');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE `tbl_questions` (
  `fld_questionId` int(20) NOT NULL,
  `fld_question` varchar(200) NOT NULL,
  `fld_answer` varchar(100) NOT NULL,
  `fld_quizId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_questions`
--

INSERT INTO `tbl_questions` (`fld_questionId`, `fld_question`, `fld_answer`, `fld_quizId`) VALUES
(1, 'What keyword is used to declare a variable in JavaScript?', 'var', 1),
(2, 'Which loop is used for iterating over the properties of an object?', 'forin', 1),
(3, 'What does the acronym DOM stand for?', 'Document Object Mode', 1),
(4, 'In JavaScript, what function is used to convert a string to an integer?', 'parseInt', 1),
(5, 'Which operator is used for strict equality comparison in JavaScript?', '===', 1),
(6, 'What keyword is used to define a function in JavaScript?', 'function', 1),
(7, 'How can you check the length of an array in JavaScript?', 'length', 1),
(8, 'What method is used to add an element to the end of an array?', 'push', 1),
(9, 'In JavaScript, what is the purpose of the typeof operator?', 'Type checking', 1),
(10, 'Which event is triggered when a user clicks on an HTML element?', 'click', 1),
(11, 'Which attribute is used to define inline styles in HTML?', 'style', 2),
(12, 'What HTML tag is used for inserting an image?', 'image', 2),
(13, 'Which HTML tag is used to create a line break?', 'break', 2),
(14, 'What is the HTML tag for defining a table?', 'table', 2),
(15, 'What HTML tag is used for creating an input field?', 'input', 2),
(16, 'Which keyword is used for defining a function in Python?', 'def', 3),
(17, 'What data type is used for whole numbers in Python?', 'int', 3),
(18, 'Which loop is used for iterating over a sequence (like a list or string) in Python?', 'for', 3),
(19, 'How do you declare a variable in Python?', 'var', 3),
(20, 'How do you check the length of a list in Python?', 'len', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quiz`
--

CREATE TABLE `tbl_quiz` (
  `fld_quizId` int(20) NOT NULL,
  `fld_quizName` varchar(100) NOT NULL,
  `fld_gameId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_quiz`
--

INSERT INTO `tbl_quiz` (`fld_quizId`, `fld_quizName`, `fld_gameId`) VALUES
(1, 'JavaScript', 1),
(2, 'HTML', 2),
(3, 'Python', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_score`
--

CREATE TABLE `tbl_score` (
  `fld_scoreId` int(11) NOT NULL,
  `fld_score` int(11) NOT NULL,
  `fld_userId` int(11) NOT NULL,
  `fld_quizId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_score`
--

INSERT INTO `tbl_score` (`fld_scoreId`, `fld_score`, `fld_userId`, `fld_quizId`) VALUES
(4, 8, 5, 1),
(7, 5, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `fld_userId` int(20) NOT NULL,
  `fld_userName` varchar(100) NOT NULL,
  `fld_userPass` varchar(50) NOT NULL,
  `fld_userEmail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`fld_userId`, `fld_userName`, `fld_userPass`, `fld_userEmail`) VALUES
(5, 'Jem', 'jem123', 'jem@gmail.com'),
(6, 'Yuki', 'jcjcjc123', 'jcboi@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_answers`
--
ALTER TABLE `tbl_answers`
  ADD PRIMARY KEY (`fld_answerId`);

--
-- Indexes for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  ADD PRIMARY KEY (`fld_gameId`);

--
-- Indexes for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD PRIMARY KEY (`fld_questionId`);

--
-- Indexes for table `tbl_quiz`
--
ALTER TABLE `tbl_quiz`
  ADD PRIMARY KEY (`fld_quizId`);

--
-- Indexes for table `tbl_score`
--
ALTER TABLE `tbl_score`
  ADD PRIMARY KEY (`fld_scoreId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`fld_userId`),
  ADD UNIQUE KEY `fld_userEmail` (`fld_userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_answers`
--
ALTER TABLE `tbl_answers`
  MODIFY `fld_answerId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  MODIFY `fld_gameId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  MODIFY `fld_questionId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_quiz`
--
ALTER TABLE `tbl_quiz`
  MODIFY `fld_quizId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tbl_score`
--
ALTER TABLE `tbl_score`
  MODIFY `fld_scoreId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `fld_userId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
