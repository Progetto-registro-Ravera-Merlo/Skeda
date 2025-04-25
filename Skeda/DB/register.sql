-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 24, 2025 alle 12:24
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `register`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `absence`
--

CREATE TABLE `absence` (
  `absenceID` int(11) NOT NULL,
  `absenceDate` date NOT NULL,
  `absenceTime` time DEFAULT NULL,
  `excused` tinyint(1) NOT NULL DEFAULT 0,
  `reason` varchar(30) DEFAULT NULL,
  `studentID` int(11) NOT NULL,
  `absenceType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `absence`
--

INSERT INTO `absence` (`absenceID`, `absenceDate`, `absenceTime`, `excused`, `reason`, `studentID`, `absenceType`) VALUES
(1, '2025-04-12', '08:00:00', 1, 'Influenza', 1, 'A'),
(2, '2025-04-18', '08:00:00', 0, NULL, 2, 'A'),
(3, '2025-04-20', '10:30:00', 1, 'Visita medica', 3, 'R');

-- --------------------------------------------------------

--
-- Struttura della tabella `admins`
--

CREATE TABLE `admins` (
  `adminID` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `admins`
--

INSERT INTO `admins` (`adminID`, `name`, `phone`, `email`, `password`, `location`) VALUES
(1, 'Vallauri', '3331234567', 'vallauri@vallauri.edu', 'v4ll4ur1', 'Fossano'),
(2, 'ArimondiEula', '3339876543', 'arimondi@eula.edu', '4r1m0nd13ul4', 'Savigliano');

-- --------------------------------------------------------

--
-- Struttura della tabella `classes`
--

CREATE TABLE `classes` (
  `classID` int(11) NOT NULL,
  `classSection` varchar(2) NOT NULL,
  `classAddress` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `classes`
--

INSERT INTO `classes` (`classID`, `classSection`, `classAddress`) VALUES
(1, '1A', 'INF'),
(2, '2B', 'LSA');

-- --------------------------------------------------------

--
-- Struttura della tabella `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `eventDate` date NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `classID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `events`
--

INSERT INTO `events` (`eventID`, `eventDate`, `title`, `description`, `classID`, `teacherID`, `subjectID`) VALUES
(1, '2025-05-10', 'Uscita Didattica', 'Museo della scienza', 1, 1, 1),
(2, '2025-05-15', 'Verifica', 'tema di italiano sulla noia', 2, 2, 2),
(3, '2025-05-16', 'Compito', 'completare pag 12->823', 2, 2, 2),
(4, '2025-05-17', 'Compito', 'Finire gli es inerenti alle derivate', 1, 1, 1),
(5, '2025-05-17', 'Verifica', 'verifica sulle derivate', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `grades`
--

CREATE TABLE `grades` (
  `gradeID` int(11) NOT NULL,
  `gradeDate` date DEFAULT NULL,
  `gradeValue` float DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `studentID` int(11) NOT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `gradeType` text NOT NULL,
  `weight` tinyint(1) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `grades`
--

INSERT INTO `grades` (`gradeID`, `gradeDate`, `gradeValue`, `subjectID`, `studentID`, `teacherID`, `gradeType`, `weight`, `description`) VALUES
(1, '2025-04-01', 8.5, 1, 1, 1, 'Scritto', 1, 'Algebra'),
(2, '2025-04-10', 7, 2, 2, 2, 'Orale', 1, 'Letteratura italiana'),
(3, '2025-04-15', 9, 1, 3, 1, 'Pratico', 1, 'Geometria');

-- --------------------------------------------------------

--
-- Struttura della tabella `meeting`
--

CREATE TABLE `meeting` (
  `meetingID` int(11) NOT NULL,
  `meetingDate` date NOT NULL,
  `parentID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `meeting`
--

INSERT INTO `meeting` (`meetingID`, `meetingDate`, `parentID`, `teacherID`) VALUES
(1, '2025-04-25', 1, 1),
(2, '2025-04-28', 2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `parents`
--

CREATE TABLE `parents` (
  `parentID` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `studentID` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `adminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `parents`
--

INSERT INTO `parents` (`parentID`, `firstName`, `lastName`, `studentID`, `phone`, `email`, `password`, `adminID`) VALUES
(1, 'Paolo', 'Ferrari', 1, '3400000001', 'paolo.ferrari@email.it', 'parent001', 1),
(2, 'Sara', 'Russo', 2, '3400000002', 'sara.russo@email.it', 'parent002', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `students`
--

CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `adminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `students`
--

INSERT INTO `students` (`studentID`, `firstName`, `lastName`, `classID`, `phone`, `email`, `password`, `adminID`) VALUES
(1, 'Marco', 'Ferrari', 1, '3391111222', 'marco.ferrari@email.it', 'stud001', 1),
(2, 'Giulia', 'Russo', 1, '3393333444', 'giulia.russo@email.it', 'stud002', 1),
(3, 'Alessia', 'Conti', 2, '3395555666', 'alessia.conti@email.it', 'stud003', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `subjects`
--

CREATE TABLE `subjects` (
  `subjectID` int(11) NOT NULL,
  `subjectName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `subjects`
--

INSERT INTO `subjects` (`subjectID`, `subjectName`) VALUES
(2, 'Italiano'),
(1, 'Matematica');

-- --------------------------------------------------------

--
-- Struttura della tabella `teachers`
--

CREATE TABLE `teachers` (
  `teacherID` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `adminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `teachers`
--

INSERT INTO `teachers` (`teacherID`, `firstName`, `lastName`, `email`, `phone`, `password`, `adminID`) VALUES
(1, 'Luca', 'Verdi', 'luca.verdi@email.it', '3311111111', 'teach123', 1),
(2, 'Elisa', 'Neri', 'elisa.neri@email.it', '3322222222', 'teach456', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `teachers_classes`
--

CREATE TABLE `teachers_classes` (
  `classID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `teachers_classes`
--

INSERT INTO `teachers_classes` (`classID`, `teacherID`, `subjectID`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(2, 2, 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`absenceID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indici per le tabelle `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `UQ_admin_email` (`email`),
  ADD UNIQUE KEY `UQ_admin_phone` (`phone`);

--
-- Indici per le tabelle `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classID`),
  ADD UNIQUE KEY `UQ_classSection_classAddress` (`classSection`,`classAddress`);

--
-- Indici per le tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `classID` (`classID`),
  ADD KEY `teacherID` (`teacherID`),
  ADD KEY `subjectID` (`subjectID`);

--
-- Indici per le tabelle `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`gradeID`),
  ADD KEY `subjectID` (`subjectID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indici per le tabelle `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meetingID`),
  ADD KEY `parentID` (`parentID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indici per le tabelle `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parentID`),
  ADD UNIQUE KEY `UQ_parents_email` (`email`),
  ADD UNIQUE KEY `UQ_parents_phone` (`phone`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indici per le tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentID`),
  ADD UNIQUE KEY `UQ_students_email` (`email`),
  ADD UNIQUE KEY `UQ_students_phone` (`phone`),
  ADD KEY `classID` (`classID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indici per le tabelle `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subjectID`),
  ADD UNIQUE KEY `subjectName` (`subjectName`);

--
-- Indici per le tabelle `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherID`),
  ADD UNIQUE KEY `UQ_teachers_email` (`email`),
  ADD UNIQUE KEY `UQ_teachers_phone` (`phone`),
  ADD KEY `adminID` (`adminID`);

--
-- Indici per le tabelle `teachers_classes`
--
ALTER TABLE `teachers_classes`
  ADD PRIMARY KEY (`classID`,`teacherID`,`subjectID`),
  ADD KEY `teacherID` (`teacherID`),
  ADD KEY `subjectID` (`subjectID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `absence`
--
ALTER TABLE `absence`
  MODIFY `absenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `classes`
--
ALTER TABLE `classes`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `grades`
--
ALTER TABLE `grades`
  MODIFY `gradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `meeting`
--
ALTER TABLE `meeting`
  MODIFY `meetingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `parents`
--
ALTER TABLE `parents`
  MODIFY `parentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `students`
--
ALTER TABLE `students`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`) ON DELETE SET NULL;

--
-- Limiti per la tabella `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `parents` (`parentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admins` (`adminID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admins` (`adminID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admins` (`adminID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `teachers_classes`
--
ALTER TABLE `teachers_classes`
  ADD CONSTRAINT `teachers_classes_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_classes_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_classes_ibfk_3` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
