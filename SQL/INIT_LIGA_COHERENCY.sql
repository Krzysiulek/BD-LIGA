-- warunki spojnosci

-- Gracz nie moze dostac wiecej niz 1 czerwonej i dwoch zoltych kartek
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




	





