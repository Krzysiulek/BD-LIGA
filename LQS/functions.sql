DROP FUNCTION goalsInGame
USE liga
GO

CREATE FUNCTION goalsInGame(@MatchID as int)
Returns int
as
begin
	DECLARE @value as int
	Select @value = COUNT(*) from Game
	JOIN Goal ON Game.MatchID = Goal.MatchID
	JOIN Attribution ON Goal.PlayerID = Attribution.PlayerID
	WHERE Game.MatchID = @MatchID

	RETURN @value
end

CREATE FUNCTION goalsConceaded(@MatchID as int, @TeamID as int)
Returns int
as
begin
	DECLARE @value as int
	Select @value = COUNT(*)



	RETURN @value
end

--wywolanie
--select [dbo].[goalsInGame](1)