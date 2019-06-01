select [dbo].[goalsInGame](1)
select [dbo].[goalsConceaded](1,1) -- mecz nr 1 druzyna nr 1
select [dbo].[goalsConceaded](1,2) -- mecz nr 1 druzyna nr 2
select * from Goal

INSERT INTO Goal ([MatchID], [PlayerID], [Type]) VALUES
(1, 23, 'normal');

select * from Stats