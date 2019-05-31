-- To teraz potrzebujemy zapytania, 
-- które dadzą informację o tym, kto ile punktów, bramek strzelił w meczu

--wybieranie bramek z danego meczu
use liga
select COUNT(*) as bramki, Goal.PlayerId, Goal.Type, Game.MatchID, Attribution.TeamID from Game
JOIN Goal ON Game.MatchID = Goal.MatchID
JOIN Attribution ON Goal.PlayerID = Attribution.PlayerID
WHERE Game.MatchID = 1
Group By Goal.PlayerID, Goal.Type, Game.MatchID, Attribution.TeamID

-- krol strzelcow :
select COUNT(*), Goal.PlayerId, Goal.Type from Game
JOIN Goal ON Game.MatchID = Goal.MatchID
Group By Goal.PlayerID, Goal.Type


--gole stracone przez zespol gospodarzy - zdobyte przez przyjezdnych
select COUNT(*) as bramki from Game
JOIN Goal ON Game.MatchID = Goal.MatchID
JOIN Attribution ON Goal.PlayerID = Attribution.PlayerID
WHERE Game.MatchID = 1 AND (Goal.Type = 'own' AND Game.HostTeamID = 1)