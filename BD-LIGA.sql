DROP DATABASE IF EXISTS liga;
CREATE DATABASE IF NOT EXISTS liga;
USE liga;

CREATE TABLE `Attribution`
(
  `AttributionID` int PRIMARY KEY,
  `PlayerID` int,
  `SeasonID` int,
  `TeamID` int
);

CREATE TABLE `Team`
(
  `TeamID` int PRIMARY KEY,
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
-- INIT PLAYERS --
INSERT INTO `Player` (`Name`) VALUES('Gracz1'),
('Gracz2'),
('Gracz3'),
('Gracz4'),
('Gracz5'),
('Gracz6'),
('Gracz7'),
('Gracz8'),
('Gracz9'),
('Gracz10'),
('Gracz11'),
('Gracz12'),
('Gracz13'),
('Gracz14'),
('Gracz15'),
('Gracz16'),
('Gracz17'),
('Gracz18'),
('Gracz19'),
('Gracz20'),
('Gracz21'),
('Gracz22'),
('Gracz23'),
('Gracz24'),
('Gracz25'),
('Gracz26'),
('Gracz27'),
('Gracz28'),
('Gracz29'),
('Gracz30'),
('Gracz31'),
('Gracz32'),
('Gracz33'),
('Gracz34'),
('Gracz35'),
('Gracz36'),
('Gracz37'),
('Gracz38'),
('Gracz39'),
('Gracz40'),
('Gracz41'),
('Gracz42'),
('Gracz43'),
('Gracz44'),
('Gracz45'),
('Gracz46'),
('Gracz47'),
('Gracz48'),
('Gracz49'),
('Gracz50'),
('Gracz51'),
('Gracz52'),
('Gracz53'),
('Gracz54'),
('Gracz55'),
('Gracz56'),
('Gracz57'),
('Gracz58'),
('Gracz59'),
('Gracz60'),
('Gracz61'),
('Gracz62'),
('Gracz63'),
('Gracz64'),
('Gracz65'),
('Gracz66'),
('Gracz67'),
('Gracz68'),
('Gracz69'),
('Gracz70'),
('Gracz71'),
('Gracz72'),
('Gracz73'),
('Gracz74'),
('Gracz75'),
('Gracz76'),
('Gracz77'),
('Gracz78'),
('Gracz79'),
('Gracz80'),
('Gracz81'),
('Gracz82'),
('Gracz83'),
('Gracz84'),
('Gracz85'),
('Gracz86'),
('Gracz87'),
('Gracz88'),
('Gracz89'),
('Gracz90'),
('Gracz91'),
('Gracz92'),
('Gracz93'),
('Gracz94'),
('Gracz95'),
('Gracz96'),
('Gracz97'),
('Gracz98'),
('Gracz99'),
('Gracz100'),
('Krzysio'),
('Błażejo');


-- INIT SOME VALUES END --

-- SOME QUERIES
SELECT * FROM Player;
SELECT * FROM YellowCard;

-- ENABLE VALIDATION OF FOREIGN KEYS
SET FOREIGN_KEY_CHECKS = 1;