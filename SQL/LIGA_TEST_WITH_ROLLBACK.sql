--- ZEBY TESTOWAC JAKIES DODAWANIA I INNE BEZ INTEGRACJI W BAZE DANYCH WSTAW TE ZAPYTANIA TUTAJ	
set implicit_transactions on;
	--- BEGIN

INSERT INTO YellowCard ([MatchID], [PlayerID], [CardDate]) VALUES
(1, 5, GETDATE());

INSERT INTO RedCard ([MatchID], [PlayerID], [CardDate]) VALUES
(1, 3, GETDATE());


	--- END
rollback;
set implicit_transactions off;