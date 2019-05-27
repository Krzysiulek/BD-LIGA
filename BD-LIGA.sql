-- DICTIONARY: 
-- samoboj: own
-- normalny gol: normal
-- 
-- koniec meczu: end
-- w tracie: in progress

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
  `HostTeamID` int,
  `GuestTeamID` int,
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
  `ParticipationID` int AUTO_INCREMENT PRIMARY KEY,
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
  `GoalID` int AUTO_INCREMENT PRIMARY KEY,
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
	-- GAME FINISH TRIGGER BEGIN --
DELIMITER $$
CREATE TRIGGER GameUpdate AFTER UPDATE ON Game
FOR EACH ROW
BEGIN
	IF NEW.Status = 'end' THEN
	INSERT INTO Player (Player.Name) VALUES ('Game ended');
    END IF;
END $$
DELIMITER ;
	-- GAME FINISH TRIGGER END --

	-- YELLOW CARDS TRIGGER BEGIN --
DELIMITER $$
CREATE TRIGGER odrzuc
ON PracujePrzy
FOR insert AS
IF (SELECT Count(PlayerID) FROM YellowCard pp, inserted i WHERE pp.PlayerID = i.PlayerID GROUP BY PlayerID, MatchID) > 1 
BEGIN
	ROLLBACK;
END; 

delimiter ;  
    -- YELLOW CARDS TRIGGER END --
-- TRIGGERS END --

-- INIT SOME VALUES BEGIN --
-- INIT SOME TEAMS BEGIN --
INSERT INTO `Team` (`Name`) VALUES('Druzyna1'),
('Druzyna2'),
('Druzyna3'),
('Druzyna4'),
('Druzyna5');
-- INIT SOME TEAMS END --

-- INIT PLAYERS BEGIN --
INSERT INTO `Player` (`Name`) VALUES('Druzyna_1_Zawodnik_1'),
('Druzyna_1_Zawodnik_2'),('Druzyna_1_Zawodnik_3'),('Druzyna_1_Zawodnik_4'),('Druzyna_1_Zawodnik_5'),('Druzyna_1_Zawodnik_6'),('Druzyna_1_Zawodnik_7'),
('Druzyna_1_Zawodnik_8'),('Druzyna_1_Zawodnik_9'),('Druzyna_1_Zawodnik_10'),('Druzyna_1_Zawodnik_11'),('Druzyna_1_Zawodnik_12'),('Druzyna_1_Zawodnik_13'),
('Druzyna_1_Zawodnik_14'),('Druzyna_1_Zawodnik_15'),('Druzyna_1_Zawodnik_16'),('Druzyna_1_Zawodnik_17'),('Druzyna_1_Zawodnik_18'),('Druzyna_1_Zawodnik_19'),
('Druzyna_1_Zawodnik_20'),('Druzyna_2_Zawodnik_1'),('Druzyna_2_Zawodnik_2'),('Druzyna_2_Zawodnik_3'),('Druzyna_2_Zawodnik_4'),('Druzyna_2_Zawodnik_5'),
('Druzyna_2_Zawodnik_6'),('Druzyna_2_Zawodnik_7'),('Druzyna_2_Zawodnik_8'),('Druzyna_2_Zawodnik_9'),('Druzyna_2_Zawodnik_10'),('Druzyna_2_Zawodnik_11'),
('Druzyna_2_Zawodnik_12'),('Druzyna_2_Zawodnik_13'),('Druzyna_2_Zawodnik_14'),('Druzyna_2_Zawodnik_15'),('Druzyna_2_Zawodnik_16'),('Druzyna_2_Zawodnik_17'),
('Druzyna_2_Zawodnik_18'),('Druzyna_2_Zawodnik_19'),('Druzyna_2_Zawodnik_20'),('Druzyna_3_Zawodnik_1'),('Druzyna_3_Zawodnik_2'),('Druzyna_3_Zawodnik_3'),
('Druzyna_3_Zawodnik_4'),('Druzyna_3_Zawodnik_5'),('Druzyna_3_Zawodnik_6'),('Druzyna_3_Zawodnik_7'),('Druzyna_3_Zawodnik_8'),('Druzyna_3_Zawodnik_9'),
('Druzyna_3_Zawodnik_10'),('Druzyna_3_Zawodnik_11'),('Druzyna_3_Zawodnik_12'),('Druzyna_3_Zawodnik_13'),('Druzyna_3_Zawodnik_14'),('Druzyna_3_Zawodnik_15'),
('Druzyna_3_Zawodnik_16'),('Druzyna_3_Zawodnik_17'),('Druzyna_3_Zawodnik_18'),('Druzyna_3_Zawodnik_19'),('Druzyna_3_Zawodnik_20'),('Druzyna_4_Zawodnik_1'),
('Druzyna_4_Zawodnik_2'),('Druzyna_4_Zawodnik_3'),('Druzyna_4_Zawodnik_4'),('Druzyna_4_Zawodnik_5'),('Druzyna_4_Zawodnik_6'),('Druzyna_4_Zawodnik_7'),
('Druzyna_4_Zawodnik_8'),('Druzyna_4_Zawodnik_9'),('Druzyna_4_Zawodnik_10'),('Druzyna_4_Zawodnik_11'),('Druzyna_4_Zawodnik_12'),('Druzyna_4_Zawodnik_13'),
('Druzyna_4_Zawodnik_14'),('Druzyna_4_Zawodnik_15'),('Druzyna_4_Zawodnik_16'),('Druzyna_4_Zawodnik_17'),('Druzyna_4_Zawodnik_18'),('Druzyna_4_Zawodnik_19'),
('Druzyna_4_Zawodnik_20'),('Druzyna_5_Zawodnik_1'),('Druzyna_5_Zawodnik_2'),('Druzyna_5_Zawodnik_3'),('Druzyna_5_Zawodnik_4'),('Druzyna_5_Zawodnik_5'),
('Druzyna_5_Zawodnik_6'),('Druzyna_5_Zawodnik_7'),('Druzyna_5_Zawodnik_8'),('Druzyna_5_Zawodnik_9'),('Druzyna_5_Zawodnik_10'),('Druzyna_5_Zawodnik_11'),
('Druzyna_5_Zawodnik_12'),('Druzyna_5_Zawodnik_13'),('Druzyna_5_Zawodnik_14'),('Druzyna_5_Zawodnik_15'),('Druzyna_5_Zawodnik_16'),('Druzyna_5_Zawodnik_17'),
('Druzyna_5_Zawodnik_18'),('Druzyna_5_Zawodnik_19'),('Druzyna_5_Zawodnik_20');
-- INIT PLAYERS END --


-- INIT SEASON BEGIN --
INSERT INTO `Season` (`SeasonID`, `SeasonYear`) VALUES(1, 2018);
INSERT INTO `Season` (`SeasonID`, `SeasonYear`) VALUES(2, 2019);
-- INIT SEASON END --


-- INIT ATTRIBUTION BEGIN --
INSERT INTO `Attribution` (`PlayerID`, `SeasonID`, `TeamID`) VALUES(1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),
(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),
(21,1,2),(22,1,2),(23,1,2),(24,1,2),(25,1,2),(26,1,2),(27,1,2),(28,1,2),(29,1,2),(30,1,2),
(31,1,2),(32,1,2),(33,1,2),(34,1,2),(35,1,2),(36,1,2),(37,1,2),(38,1,2),(39,1,2),(40,1,2),
(41,1,3),(42,1,3),(43,1,3),(44,1,3),(45,1,3),(46,1,3),(47,1,3),(48,1,3),(49,1,3),(50,1,3),
(51,1,3),(52,1,3),(53,1,3),(54,1,3),(55,1,3),(56,1,3),(57,1,3),(58,1,3),(59,1,3),(60,1,3),
(61,1,4),(62,1,4),(63,1,4),(64,1,4),(65,1,4),(66,1,4),(67,1,4),(68,1,4),(69,1,4),(70,1,4),
(71,1,4),(72,1,4),(73,1,4),(74,1,4),(75,1,4),(76,1,4),(77,1,4),(78,1,4),(79,1,4),(80,1,4),
(81,1,5),(82,1,5),(83,1,5),(84,1,5),(85,1,5),(86,1,5),(87,1,5),(88,1,5),(89,1,5),(90,1,5),
(91,1,5),(92,1,5),(93,1,5),(94,1,5),(95,1,5),(96,1,5),(97,1,5),(98,1,5),(99,1,5),(100,1,5);
-- INIT ATTRIBUTION END --


-- INIT PARTICIPATION BEGIN -- 
INSERT INTO `Participation` (`PlayerID`, `MatchID`) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),
(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1);
-- INIT PARTICIPATION END -- 


-- INIT GAME BEGIN --
INSERT INTO `Game` (`MatchID`,`HostTeamID`, `GuestTeamID`, `SeasonID`, `Status`, `MatchDate`) VALUES
(1, 1, 2, 1, 'in progress', NOW());
-- INIT GAME END --


-- INIT SOME GOALS BEGIN --
INSERT INTO `Goal` (`MatchID`, `PlayerID`, `Type`) VALUES
(1, 3, 'own');

INSERT INTO `Goal` (`MatchID`, `PlayerID`, `Type`) VALUES
(1, 5, 'normal');

INSERT INTO `Goal` (`MatchID`, `PlayerID`, `Type`) VALUES
(1, 5, 'normal');

INSERT INTO `Goal` (`MatchID`, `PlayerID`, `Type`) VALUES
(1, 5, 'normal');
-- INIT SOME GOALS END --


-- INIT SOME YELLOW CARDS BEGIN --
INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(1, 3, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(1, 3, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(1, 5, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(1, 1, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(1, 3, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(2, 3, NOW());

INSERT INTO `YellowCard` (`MatchID`, `PlayerID`, `CardDate`) VALUES
(2, 3, NOW());


-- INIT SOME YELLOW CARDS END --

-- UPDATE GAME TO FINISHED --
UPDATE Game SET Game.Status = 'end' WHERE Game.MatchID = 1;


-- INIT SOME VALUES END --

-- SOME QUERIES
SELECT * FROM Player;
SELECT * FROM YellowCard;

SELECT Player.Name, Team.Name, Season.SeasonID FROM Attribution
JOIN Player ON Player.PlayerID = Attribution.PlayerID
JOIN Team ON Team.TeamID = Attribution.TeamID
JOIN Season ON Season.SeasonID = Attribution.SeasonID;

SELECT * FROM Game;
SELECT PlayerID,COUNT(PlayerID) FROM YellowCard WHERE YellowCard.PlayerID = 3 GROUP BY MatchID, PlayerID ;
SELECT MatchID, PlayerID, Count(PlayerID) FROM YellowCard
GROUP BY MatchID, PlayerID;

SELECT PlayerID, Count(PlayerID) FROM YellowCard GROUP BY MatchID, PlayerID;


-- ENABLE VALIDATION OF FOREIGN KEYS
SET FOREIGN_KEY_CHECKS = 1;