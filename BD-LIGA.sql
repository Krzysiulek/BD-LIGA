DROP DATABASE IF EXISTS liga;
CREATE DATABASE IF NOT EXISTS liga;
USE liga;

CREATE TABLE `Attribution`
(
  `AttributionID` int AUTO_INCREMENT PRIMARY KEY,
  `PlayerID` int,
  `SeasonID` int,
  `TeamID` int
);

CREATE TABLE `Team`
(
  `TeamID` int AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(255)
);

CREATE TABLE `Game`
(
  `MatchID` int PRIMARY KEY,
  `HostID` int,
  `GuestID` int,
  `SeasonID` int,
  `Status` varchar(255),
  `MatchDate` datetime
);

CREATE TABLE `Season`
(
  `SeasonID` int PRIMARY KEY,
  `SeasonYear` int
);

CREATE TABLE `Player`
(
  `PlayerID` int AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(255)
);

CREATE TABLE `Participation`
(
  `ParticipationID` int PRIMARY KEY,
  `PlayerID` int,
  `MatchID` int
);

CREATE TABLE `RedCard`
(
  `RedCardID` int PRIMARY KEY,
  `MatchID` int,
  `PlayerID` int,
  `CardDate` datetime
);

CREATE TABLE `YellowCard`
(
  `YellowCardID` int AUTO_INCREMENT PRIMARY KEY,
  `MatchID` int,
  `PlayerID` int,
  `CardDate` datetime
);

CREATE TABLE `Goal`
(
  `GoalID` int PRIMARY KEY,
  `MatchID` int,
  `PlayerID` int,
  `Type` varchar(255)
);

CREATE TABLE `Stats`
(
  `StatsID` int PRIMARY KEY,
  `TeamID` int,
  `SeasonID` int,
  `LostMatches` int,
  `WonMatches` int,
  `GoalsAchived` int,
  `GoalsLost` int,
  `DrawMatches` int,
  `PointsAchived` int
);


ALTER TABLE `Attribution` ADD FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`PlayerID`);

ALTER TABLE `Attribution` ADD FOREIGN KEY (`SeasonID`) REFERENCES `Season` (`SeasonID`);

ALTER TABLE `Attribution` ADD FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

ALTER TABLE `Game` ADD FOREIGN KEY (`SeasonID`) REFERENCES `Season` (`SeasonID`);

ALTER TABLE `Participation` ADD FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`PlayerID`);

ALTER TABLE `Participation` ADD FOREIGN KEY (`MatchID`) REFERENCES `Game` (`MatchID`);

ALTER TABLE `RedCard` ADD FOREIGN KEY (`MatchID`) REFERENCES `Game` (`MatchID`);

ALTER TABLE `RedCard` ADD FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`PlayerID`);

ALTER TABLE `YellowCard` ADD FOREIGN KEY (`MatchID`) REFERENCES `Game` (`MatchID`);

ALTER TABLE `YellowCard` ADD FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`PlayerID`);

ALTER TABLE `Goal` ADD FOREIGN KEY (`MatchID`) REFERENCES `Game` (`MatchID`);

ALTER TABLE `Goal` ADD FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`PlayerID`);

ALTER TABLE `Stats` ADD FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

ALTER TABLE `Stats` ADD FOREIGN KEY (`SeasonID`) REFERENCES `Season` (`SeasonID`);

-- DISABLE VALIDATION OF FOREIGN KEYS
SET FOREIGN_KEY_CHECKS = 0;

-- TRIGGERS --
DELIMITER $$
CREATE TRIGGER yellowCardTriggerInsert BEFORE INSERT ON 
YellowCard
FOR EACH ROW
BEGIN
	INSERT INTO Player (Player.Name) VALUES ('INSERT'); 
END $$

CREATE TRIGGER yellowCardTriggerUpdate AFTER UPDATE ON 
YellowCard
FOR EACH ROW
BEGIN
	INSERT INTO Player (Player.Name) VALUES ('UPDATE'); 
END $$
DELIMITER ;

-- TRIGGERS END --

-- INIT SOME VALUES BEGIN --
-- INIT SOME TEAMS
INSERT INTO `Team` (`Name`) VALUES('Druzyna1'),
('Druzyna2'),
('Druzyna3'),
('Druzyna4'),
('Druzyna5');


-- INIT PLAYERS --
INSERT INTO `Player` (`Name`) VALUES('Druzyna_1_Zawodnik_1'),
('Druzyna_1_Zawodnik_2'),
('Druzyna_1_Zawodnik_3'),
('Druzyna_1_Zawodnik_4'),
('Druzyna_1_Zawodnik_5'),
('Druzyna_1_Zawodnik_6'),
('Druzyna_1_Zawodnik_7'),
('Druzyna_1_Zawodnik_8'),
('Druzyna_1_Zawodnik_9'),
('Druzyna_1_Zawodnik_10'),
('Druzyna_1_Zawodnik_11'),
('Druzyna_1_Zawodnik_12'),
('Druzyna_1_Zawodnik_13'),
('Druzyna_1_Zawodnik_14'),
('Druzyna_1_Zawodnik_15'),
('Druzyna_1_Zawodnik_16'),
('Druzyna_1_Zawodnik_17'),
('Druzyna_1_Zawodnik_18'),
('Druzyna_1_Zawodnik_19'),
('Druzyna_1_Zawodnik_20'),
('Druzyna_2_Zawodnik_1'),
('Druzyna_2_Zawodnik_2'),
('Druzyna_2_Zawodnik_3'),
('Druzyna_2_Zawodnik_4'),
('Druzyna_2_Zawodnik_5'),
('Druzyna_2_Zawodnik_6'),
('Druzyna_2_Zawodnik_7'),
('Druzyna_2_Zawodnik_8'),
('Druzyna_2_Zawodnik_9'),
('Druzyna_2_Zawodnik_10'),
('Druzyna_2_Zawodnik_11'),
('Druzyna_2_Zawodnik_12'),
('Druzyna_2_Zawodnik_13'),
('Druzyna_2_Zawodnik_14'),
('Druzyna_2_Zawodnik_15'),
('Druzyna_2_Zawodnik_16'),
('Druzyna_2_Zawodnik_17'),
('Druzyna_2_Zawodnik_18'),
('Druzyna_2_Zawodnik_19'),
('Druzyna_2_Zawodnik_20'),
('Druzyna_3_Zawodnik_1'),
('Druzyna_3_Zawodnik_2'),
('Druzyna_3_Zawodnik_3'),
('Druzyna_3_Zawodnik_4'),
('Druzyna_3_Zawodnik_5'),
('Druzyna_3_Zawodnik_6'),
('Druzyna_3_Zawodnik_7'),
('Druzyna_3_Zawodnik_8'),
('Druzyna_3_Zawodnik_9'),
('Druzyna_3_Zawodnik_10'),
('Druzyna_3_Zawodnik_11'),
('Druzyna_3_Zawodnik_12'),
('Druzyna_3_Zawodnik_13'),
('Druzyna_3_Zawodnik_14'),
('Druzyna_3_Zawodnik_15'),
('Druzyna_3_Zawodnik_16'),
('Druzyna_3_Zawodnik_17'),
('Druzyna_3_Zawodnik_18'),
('Druzyna_3_Zawodnik_19'),
('Druzyna_3_Zawodnik_20'),
('Druzyna_4_Zawodnik_1'),
('Druzyna_4_Zawodnik_2'),
('Druzyna_4_Zawodnik_3'),
('Druzyna_4_Zawodnik_4'),
('Druzyna_4_Zawodnik_5'),
('Druzyna_4_Zawodnik_6'),
('Druzyna_4_Zawodnik_7'),
('Druzyna_4_Zawodnik_8'),
('Druzyna_4_Zawodnik_9'),
('Druzyna_4_Zawodnik_10'),
('Druzyna_4_Zawodnik_11'),
('Druzyna_4_Zawodnik_12'),
('Druzyna_4_Zawodnik_13'),
('Druzyna_4_Zawodnik_14'),
('Druzyna_4_Zawodnik_15'),
('Druzyna_4_Zawodnik_16'),
('Druzyna_4_Zawodnik_17'),
('Druzyna_4_Zawodnik_18'),
('Druzyna_4_Zawodnik_19'),
('Druzyna_4_Zawodnik_20'),
('Druzyna_5_Zawodnik_1'),
('Druzyna_5_Zawodnik_2'),
('Druzyna_5_Zawodnik_3'),
('Druzyna_5_Zawodnik_4'),
('Druzyna_5_Zawodnik_5'),
('Druzyna_5_Zawodnik_6'),
('Druzyna_5_Zawodnik_7'),
('Druzyna_5_Zawodnik_8'),
('Druzyna_5_Zawodnik_9'),
('Druzyna_5_Zawodnik_10'),
('Druzyna_5_Zawodnik_11'),
('Druzyna_5_Zawodnik_12'),
('Druzyna_5_Zawodnik_13'),
('Druzyna_5_Zawodnik_14'),
('Druzyna_5_Zawodnik_15'),
('Druzyna_5_Zawodnik_16'),
('Druzyna_5_Zawodnik_17'),
('Druzyna_5_Zawodnik_18'),
('Druzyna_5_Zawodnik_19'),
('Druzyna_5_Zawodnik_20');

-- INIT SEASON
INSERT INTO `Season` (`SeasonID`, `SeasonYear`) VALUES(1, 2018);
INSERT INTO `Season` (`SeasonID`, `SeasonYear`) VALUES(2, 2019);

-- INIT ATTRIBUTION


-- INIT SOME VALUES END --

-- SOME QUERIES
SELECT * FROM Player;
SELECT * FROM YellowCard;

-- ENABLE VALIDATION OF FOREIGN KEYS
SET FOREIGN_KEY_CHECKS = 1;