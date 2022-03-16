CREATE DATABASE match_games;
use match_games;

select * from  data_p7;
SELECT COUNT(*) FROM data_p7;

select Date,  HomeTeam, AwayTeam, FTHG, FTAG from data_p7 
where Date >= '2020-01-01'
  and Date <= '2020-12-31' 
  and ( HomeTeam ="Real Madrid" or AwayTeam="Real Madrid") order by FTHG   desc ;
  select Date,  HomeTeam, AwayTeam, FTHG, FTAG from data_p7 
  
  
where Date >= '2020-01-01'
  and Date <= '2020-12-31' 
  and ( HomeTeam ="Real Madrid" or AwayTeam="Real Madrid") order by FTAG desc ;


