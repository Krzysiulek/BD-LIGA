-- DROP DATABASE liga;
-- CREATE DATABASE liga;
-- USE liga;

CREATE TABLE Attribution
(
  [AttributionID] int IDENTITY PRIMARY KEY,
  [PlayerID] int,
  [SeasonID] int,
  [TeamID] int
);

CREATE TABLE Team
(
  [TeamID] int IDENTITY PRIMARY KEY,
  [Name] varchar(255)
);

CREATE TABLE Game
(
  [MatchID] int IDENTITY PRIMARY KEY,
  [HostTeamID] int,
  [GuestTeamID] int,
  [SeasonID] int,
  [Status] varchar(255),
  [MatchDate] datetime2(0)
);

CREATE TABLE Season
(
  [SeasonID] int IDENTITY PRIMARY KEY,
  [SeasonYear] int
);

CREATE TABLE Player
(
  [PlayerID] int IDENTITY PRIMARY KEY,
  [Name] varchar(255)
);

CREATE TABLE Participation
(
  [ParticipationID] int IDENTITY PRIMARY KEY,
  [PlayerID] int,
  [MatchID] int
);


CREATE TABLE RedCard
(
  [RedCardID] int IDENTITY PRIMARY KEY,
  [MatchID] int,
  [PlayerID] int,
  [CardDate] datetime2(0)
);

CREATE TABLE YellowCard
(
  [YellowCardID] int IDENTITY PRIMARY KEY,
  [MatchID] int,
  [PlayerID] int,
  [CardDate] datetime2(0)
);

CREATE TABLE Goal
(
  [GoalID] int IDENTITY PRIMARY KEY,
  [MatchID] int,
  [PlayerID] int,
  [Type] varchar(255)
);

CREATE TABLE Stats
(
  [StatsID] int IDENTITY PRIMARY KEY,
  [TeamID] int,
  [SeasonID] int,
  [LostMatches] int,
  [WonMatches] int,
  [GoalsAchived] int,
  [GoalsLost] int,
  [DrawMatches] int,
  [PointsAchived] int
);
