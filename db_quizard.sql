-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 06:09 PM
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getQuiz` (IN `quizId` INT(20))   SELECT tbl_questions.fld_questionId, tbl_quiz.fld_quizName, tbl_questions.fld_question, tbl_questions.fld_answer
FROM tbl_questions
LEFT JOIN tbl_quiz
ON tbl_questions.fld_quizId=tbl_quiz.fld_quizId
WHERE tbl_quiz.fld_quizId=quizId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertScore` (IN `score` INT(20), IN `userId` INT(20), IN `quizId` INT)   INSERT INTO tbl_score (tbl_score.fld_score, tbl_score.fld_userId, tbl_score.fld_quizId)
VALUES (score, userID, quizId)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUser` (IN `name` VARCHAR(100), IN `pass` VARCHAR(50), IN `email` VARCHAR(100))   INSERT INTO `tbl_users` (`fld_userName`, `fld_userPass`, `fld_userEmail`) 
VALUES (name, pass, email)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblanswer`
--

CREATE TABLE `tblanswer` (
  `fldAnswerId` int(11) NOT NULL,
  `fldQuestionId` int(11) DEFAULT NULL,
  `fldAnswer1` varchar(100) DEFAULT NULL,
  `fldAnswer2` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblanswer`
--

INSERT INTO `tblanswer` (`fldAnswerId`, `fldQuestionId`, `fldAnswer1`, `fldAnswer2`) VALUES
(1, 1, 'var', 'varchar'),
(2, 2, 'forin', 'foreach');

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
(1, 'Hangman'),
(2, '4 pics 1 word'),
(3, 'Bookworm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pictures`
--

CREATE TABLE `tbl_pictures` (
  `fld_pictureId` int(20) NOT NULL,
  `fld_picName` varchar(100) NOT NULL,
  `fld_questionId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pictures`
--

INSERT INTO `tbl_pictures` (`fld_pictureId`, `fld_picName`, `fld_questionId`) VALUES
(1, '1image1.png', 11),
(2, '1image2.png', 11),
(3, '1image2.png', 11),
(4, '1image2.png', 11),
(5, '2image1.png', 12),
(6, '2image2.png', 12),
(7, '2mage3.png', 12),
(8, '2image4.png', 12),
(9, '3image1.jpg', 13),
(10, '3image2.jpg', 13),
(11, '3image3.jpg', 13),
(12, '3image4.jpg', 13),
(13, '4image1.jpg', 14),
(14, '4image2.jpg', 14),
(15, '4image3.jpg', 14),
(16, '4image4.jpg', 14),
(17, '5image1.jpg', 15),
(18, '5image2.jpg', 15),
(19, '5image3.jpg', 15),
(20, '5image4.jpg', 15),
(21, '6image1.jpg', 16),
(22, '6image2.jpg', 16),
(23, '6image3.jpg', 16),
(24, '6image4.jpg', 16),
(25, '7image1.jpg', 17),
(26, '7image2.jpg', 17),
(27, '7image3.jpg', 17),
(28, '7image4.jpg', 17),
(29, '8image1.jpg', 18),
(30, '8image2.jpg', 18),
(31, '8image3.jpg', 18),
(32, '8image4.jpg', 18),
(33, '9image1.jpg', 19),
(34, '9image2.jpg', 19),
(35, '9image3.jpg', 19),
(36, '9image4.jpg', 19),
(37, '10image1.jpg', 20),
(38, '10image2.jpg', 20),
(39, '10image3.jpg', 20),
(40, '10image4.jpg', 20);

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
(11, 'What does HTML stand for?', 'Hypertext Markup Language', 2),
(12, 'Which HTML tag is used for creating hyperlinks?', 'a', 2),
(13, 'What is the HTML tag used for creating an unordered list?', 'ul', 2),
(14, 'Which tag is used to define the structure of an HTML document, such as headings and paragraphs?', 'body', 2),
(15, 'What attribute is used to provide alternative text for images in HTML?', 'alt', 2),
(16, 'In HTML, which tag is used for creating a line break?', 'br', 2),
(17, 'What is the purpose of the HTML <meta> tag?', 'metadata', 2),
(18, 'Which HTML tag is used for defining the main content of an HTML document?', 'main', 2),
(19, 'What is the purpose of the HTML <head> element?', 'metadata', 2),
(20, 'Which HTML tag is used for creating a table?', 'table', 2),
(21, 'What is the term for a named storage location in Python?', 'variable', 3),
(22, 'Which keyword is used for defining a function in Python?', 'def', 3),
(23, 'What data type is used for whole numbers in Python?', 'int', 3),
(24, 'In Python, what is the term for a block of code that only runs when a certain condition is true?', 'if', 3),
(25, 'Which operator is used for exponentiation in Python?', '**', 3),
(26, 'What is the built-in function used to get the length of a sequence in Python?', 'len', 3),
(27, 'What is the purpose of the elif keyword in Python?', 'else if', 3),
(28, 'Which loop is used for iterating over a sequence (like a list or string) in Python?', 'for', 3),
(29, 'What is the term for a collection of elements where each element is indexed in Python?', 'list', 3),
(30, 'Which module is used for working with dates and times in Python?', 'datetime', 3);

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
(5, 'Jem', 'jem123', 'jem@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblanswer`
--
ALTER TABLE `tblanswer`
  ADD PRIMARY KEY (`fldAnswerId`);

--
-- Indexes for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  ADD PRIMARY KEY (`fld_gameId`);

--
-- Indexes for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  ADD PRIMARY KEY (`fld_pictureId`);

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
-- AUTO_INCREMENT for table `tblanswer`
--
ALTER TABLE `tblanswer`
  MODIFY `fldAnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_gametype`
--
ALTER TABLE `tbl_gametype`
  MODIFY `fld_gameId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  MODIFY `fld_pictureId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `fld_scoreId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `fld_userId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
