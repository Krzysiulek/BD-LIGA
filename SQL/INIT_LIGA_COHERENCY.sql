-- warunki spojnosci
-- DROP TRIGGER nazwa_triggera
-- Gracz nie moze dostac wiecej niz 1 czerwonej i dwoch zoltych kartek
create trigger STATS_update on Game
after update
as
begin
	Declare @MatchID int, @HostTeamID int, @GuestTeamID int, @SeasonID int, @GameStatus varchar(20),
			@LostMatches int, @WonMatches int, @GoalsAchived int, @GoalsLost int,
			@DrawMatches int, @PointsAchived int

			select @MatchID = MatchID from inserted
			select @GameStatus = Status from inserted
			select @HostTeamID = HostTeamID from inserted
			select @GuestTeamID = GuestTeamID from inserted
			select @SeasonID = SeasonID from inserted
			

			print @HostTeamID
			print @GuestTeamID
			print @SeasonID
			print @GameStatus
			
			--wygrywa gosc
			if @GameStatus = 'end' AND ([dbo][goalsConceaded](@MatchID, @HostTeam) > [dbo][goalsConceaded](@MatchID, @GuestTeam))
				UPDATE Stats 
				SET 
				WHERE TeamID = @HostTeamID
			--wygrywa gospodarz


			--remis



		print 'dupa'

end
go

UPDATE Game Set Game.MatchDate = GETDATE() WHERE Game.MatchID ='1'
DROP TRIGGER STATS_update


create trigger YC_abort on YellowCard
after insert
as
begin
	Declare @Count int, @newPlayerID int, @newMatchID int
	select @newPlayerID = PlayerID from inserted
	select @newMatchID = MatchID from inserted

	Select @Count = COUNT(*) from YellowCard where PlayerID = @newPlayerID and MatchID = @newMatchID  group by PlayerID, MatchID

	if @Count > 2
		rollback


	print @Count
	print @newPlayerID
	print @newMatchID
end
go



create trigger RC_abort on RedCard
after insert
as
begin
	Declare @Count int, @newPlayerID int, @newMatchID int
	select @newPlayerID = PlayerID from inserted
	select @newMatchID = MatchID from inserted

	Select @Count = COUNT(*) from RedCard where PlayerID = @newPlayerID and MatchID = @newMatchID  group by PlayerID, MatchID

	if @Count > 1
		rollback


	print @Count
	print @newPlayerID
	print @newMatchID
end
go




	





