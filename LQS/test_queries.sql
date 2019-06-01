select [dbo].[goalsInGame](1)
select [dbo].[goalsConceaded](1,1) -- mecz nr 1 druzyna nr 1
select [dbo].[goalsConceaded](1,2) -- mecz nr 1 druzyna nr 2
select * from Goal

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(1, 23, 'normal');

use liga
select * from Stats
ORDER BY PointsAchived DESC

select * from Team

select * from Game

-- konczymy mecze (wczesniej MatchID = 1 ustawione na 'in progress'
-- UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'in progress' WHERE Game.MatchID ='1'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'end' WHERE Game.MatchID ='2'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'end' WHERE Game.MatchID ='1'

UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'in progress' WHERE Game.MatchID ='3'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'in progress' WHERE Game.MatchID ='4'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'in progress' WHERE Game.MatchID ='5'

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(3, 45, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(3, 45, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(3, 67, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(4, 5, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(4, 5, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(4, 82, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(5, 21, 'normal');

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(5, 45, 'normal');

UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'end' WHERE Game.MatchID ='3'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'end' WHERE Game.MatchID ='4'
UPDATE Game Set Game.MatchDate = GETDATE(), Game.GameStatus = 'end' WHERE Game.MatchID ='5'


--czyszczenie tabeli
UPDATE STATS 
SET LostMatches = 0, WonMatches = 0, GoalsAchived = 0, GoalsLost = 0, DrawMatches = 0, PointsAchived = 0