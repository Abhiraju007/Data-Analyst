create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

--select *from icc_world_cup
select team_name, count(*) as no_of_match_played, SUM(winner_flag) as no_of_match_winner,count(*)-SUM(winner_flag) as no_of_lost from
(
select team_1 as team_name, case when team_1 = winner then 1 else 0 end as winner_flag from icc_world_cup
UNION all
select team_2 as team_name, case when team_2 = winner then 1 else 0 end as winner_flag from icc_world_cup
) A
group by team_name
order by no_of_match_winner DESC





