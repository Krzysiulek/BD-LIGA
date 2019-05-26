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

ALTER TABLE `Guest` ADD FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

ALTER TABLE `Host` ADD FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

ALTER TABLE `Game` ADD FOREIGN KEY (`HostID`) REFERENCES `Host` (`HostID`);

ALTER TABLE `Game` ADD FOREIGN KEY (`GuestID`) REFERENCES `Guest` (`GuestID`);

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

	-- INIT SOME VALUES
-- INIT PLAYERS
INSERT INTO `Player` (`PlayerID`, `Name`) VALUES ('1', 'Gracz1'), ('2', 'Gracz2'), ('3', 'Gracz3'), ('4', 'Gracz4')
, ('5', 'Gracz5')
, ('6', 'Gracz6')
, ('7', 'Gracz7')
, ('8', 'Gracz8')
, ('9', 'Gracz9')
, ('10', 'Gracz10')
, ('11', 'Gracz11')
, ('12', 'Gracz12')
, ('13', 'Gracz13')
, ('14', 'Gracz14')
, ('15', 'Gracz15')
, ('16', 'Gracz16')
, ('17', 'Gracz17')
, ('18', 'Gracz18')
, ('19', 'Gracz19')
, ('20', 'Gracz20')
, ('21', 'Gracz21')
, ('22', 'Gracz22')
, ('23', 'Gracz23')
, ('24', 'Gracz24')
, ('25', 'Gracz25')
, ('26', 'Gracz26')
, ('27', 'Gracz27')
, ('28', 'Gracz28')
, ('29', 'Gracz29')
, ('30', 'Gracz30')
, ('31', 'Gracz31')
, ('32', 'Gracz32')
, ('33', 'Gracz33')
, ('34', 'Gracz34')
, ('35', 'Gracz35')
, ('36', 'Gracz36')
, ('37', 'Gracz37')
, ('38', 'Gracz38')
, ('39', 'Gracz39')
, ('40', 'Gracz40')
, ('41', 'Gracz41')
, ('42', 'Gracz42')
, ('43', 'Gracz43')
, ('44', 'Gracz44')
, ('45', 'Gracz45')
, ('46', 'Gracz46')
, ('47', 'Gracz47')
, ('48', 'Gracz48')
, ('49', 'Gracz49')
, ('50', 'Gracz50')
, ('51', 'Gracz51')
, ('52', 'Gracz52')
, ('53', 'Gracz53')
, ('54', 'Gracz54')
, ('55', 'Gracz55')
, ('56', 'Gracz56')
, ('57', 'Gracz57')
, ('58', 'Gracz58')
, ('59', 'Gracz59')
, ('60', 'Gracz60')
, ('61', 'Gracz61')
, ('62', 'Gracz62')
, ('63', 'Gracz63')
, ('64', 'Gracz64')
, ('65', 'Gracz65')
, ('66', 'Gracz66')
, ('67', 'Gracz67')
, ('68', 'Gracz68')
, ('69', 'Gracz69')
, ('70', 'Gracz70')
, ('71', 'Gracz71')
, ('72', 'Gracz72')
, ('73', 'Gracz73')
, ('74', 'Gracz74')
, ('75', 'Gracz75')
, ('76', 'Gracz76')
, ('77', 'Gracz77')
, ('78', 'Gracz78')
, ('79', 'Gracz79')
, ('80', 'Gracz80')
, ('81', 'Gracz81')
, ('82', 'Gracz82')
, ('83', 'Gracz83')
, ('84', 'Gracz84')
, ('85', 'Gracz85')
, ('86', 'Gracz86')
, ('87', 'Gracz87')
, ('88', 'Gracz88')
, ('89', 'Gracz89')
, ('90', 'Gracz90')
, ('91', 'Gracz91')
, ('92', 'Gracz92')
, ('93', 'Gracz93')
, ('94', 'Gracz94')
, ('95', 'Gracz95')
, ('96', 'Gracz96')
, ('97', 'Gracz97')
, ('98', 'Gracz98')
, ('99', 'Gracz99');


-- INIT HUESR
INSERT INTO `Guest` (`GuestID`, `TeamID`) VALUES ('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5');

-- INIT GUEST
INSERT INTO `Host` (`HostID`, `TeamID`) VALUES ('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5');





-- SOME QUERIES
SELECT * FROM Player;
SELECT * FROM YellowCard;

-- ENABLE VALIDATION OF FOREIGN KEYS
SET FOREIGN_KEY_CHECKS = 1;