-- warunki spojnosci
-- DROP TRIGGER nazwa_triggera
-- Gracz nie moze dostac wiecej niz 1 czerwonej i dwoch zoltych kartek

use liga
go
create trigger STATS_update on Game
after update
as
begin
	Declare @MatchID int, @HostTeamID int, @GuestTeamID int, @SeasonID int, @GameStatus varchar(20),
			@LostMatches int, @WonMatches int, @GoalsAchived int, @GoalsLost int,
			@DrawMatches int, @PointsAchived int, @HostGoals int, @GuestGoals int

			select @MatchID = MatchID from inserted
			select @GameStatus = GameStatus from inserted
			select @HostTeamID = HostTeamID from inserted
			select @GuestTeamID = GuestTeamID from inserted
			select @SeasonID = SeasonID from inserted
			select @HostGoals = [dbo].[goalsConceaded](@MatchID, @GuestTeamID)
			select @GuestGoals = [dbo].[goalsConceaded](@MatchID, @HostTeamID)


			print @HostTeamID
			print @GuestTeamID
			print @SeasonID
			print @GameStatus
			print @HostGoals
			print @GuestGoals
			
			
			if @GameStatus = 'end'
			BEGIN
			--wygrywa gosc
				if (@GuestGoals > @HostGoals)
				BEGIN
					UPDATE Stats 
					SET 
						Stats.WonMatches = Stats.WonMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @GuestGoals,
						Stats.GoalsLost = Stats.GoalsLost + @HostGoals,
						Stats.PointsAchived = Stats.PointsAchived + 3
					WHERE TeamID = @GuestTeamID

					UPDATE Stats 
					SET 
						Stats.LostMatches = Stats.LostMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @HostGoals,
						Stats.GoalsLost = Stats.GoalsLost + @GuestGoals
					WHERE TeamID = @HostTeamID

					print 'Guest Won!'
				END
			--wygrywa gospodarz
				if (@GuestGoals < @HostGoals)
				BEGIN
					UPDATE Stats 
					SET 
						Stats.WonMatches = Stats.WonMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @HostGoals,
						Stats.GoalsLost = Stats.GoalsLost + @GuestGoals,
						Stats.PointsAchived = Stats.PointsAchived + 3
					WHERE TeamID = @HostTeamID

					UPDATE Stats 
					SET 
						Stats.LostMatches = Stats.LostMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @GuestGoals,
						Stats.GoalsLost = Stats.GoalsLost + @HostGoals
					WHERE TeamID = @GuestTeamID

					print 'Host Won!'
				END
			--remis
				if (@GuestGoals = @HostGoals)
				BEGIN
					UPDATE Stats 
					SET 
						Stats.DrawMatches = Stats.DrawMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @GuestGoals,
						Stats.GoalsLost = Stats.GoalsLost + @HostGoals,
						Stats.PointsAchived = Stats.PointsAchived + 1
					WHERE TeamID = @GuestTeamID

					UPDATE Stats 
					SET 
						Stats.DrawMatches = Stats.DrawMatches + 1,
						Stats.GoalsAchived = Stats.GoalsAchived + @GuestGoals,
						Stats.GoalsLost = Stats.GoalsLost + @HostGoals,
						Stats.PointsAchived = Stats.PointsAchived + 1
					WHERE TeamID = @HostTeamID

					print 'Tie!'
				END
			END
		print 'dupa'

end
go

--DROP TRIGGER STATS_update

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




	





