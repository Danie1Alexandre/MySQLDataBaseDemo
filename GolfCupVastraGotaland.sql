drop database GolfCupVastraGotaland;
create database GolfCupVastraGotaland;
use GolfCupVastraGotaland;

create table player(
playerId char(20),
playerName varchar(20),
age varchar(20),
primary key (playerId)
 ) engine = innodb;
 
 create table jacket(
model char(20),
material varchar(20),
size char(20),
playerId char(20),
primary key (playerId, model),
foreign key (playerId) references player (playerId)
 ) engine = innodb;
 
create table competition(
competitionName varchar(40),
competitionDate char(40),
primary key (competitionName)
 ) engine = innodb;
 
 create table participant(
competitionName varchar(40),
playerId char(40),
primary key (competitionName,playerId ),
foreign key (playerId) references player (playerId),
foreign key (competitionName) references competition (competitionName)
 ) engine = innodb;
 
create table weather(
weatherType varchar(40),
windStrenght char(5),
competitionName varchar(40),
primary key (weatherType,competitionName),
foreign key (competitionName) references competition (competitionName)

 ) engine = innodb;
 
create table weatherTimOfDay(
weatherType varchar(40),
competitionName varchar(40),
time char (5),
primary key (weatherType, competitionName),
foreign key (weatherType) references weather (weatherType),
foreign key (competitionName) references competition (competitionName)
 ) engine = innodb;
 
 
create table club(
clubModel char(20),
material varchar(20),
playerId char(20),
primary key (playerId, clubModel),
foreign key (playerId) references player (playerId)
 ) engine = innodb;
 
create table clubConstruction(
serialNumber char(4),
solidity char(20),
playerId char(20),
clubModel char(20),
primary key (playerId, clubmodel, serialNumber),
foreign key (playerId,clubModel) references club (playerId,clubModel)
)engine = innodb;

INSERT INTO `GolfCupVastraGotaland`.`player` (`playerId`, `playerName`, `age`) VALUES ('1', 'Johan Andersson', '25');
INSERT INTO `GolfCupVastraGotaland`.`player` (`playerId`, `playerName`, `age`) VALUES ('2', 'Nicklas Jansson', '30');
INSERT INTO `GolfCupVastraGotaland`.`player` (`playerId`, `playerName`, `age`) VALUES ('3', 'Annika Persson', '18');
select * from GolfCupVastraGotaland.player;

INSERT INTO `GolfCupVastraGotaland`.`competition` (`competitionName`, `competitionDate`) VALUES ('Big Golf Cup Skövde', '10/06-2021.');
select * from GolfCupVastraGotaland.competition;

INSERT INTO `GolfCupVastraGotaland`.`participant` (`competitionName`, `playerId`) VALUES ('Big Golf Cup Skövde', '1');
INSERT INTO `GolfCupVastraGotaland`.`participant` (`competitionName`, `playerId`) VALUES ('Big Golf Cup Skövde', '2');
INSERT INTO `GolfCupVastraGotaland`.`participant` (`competitionName`, `playerId`) VALUES ('Big Golf Cup Skövde', '3');
select * from GolfCupVastraGotaland.participant;

INSERT INTO `GolfCupVastraGotaland`.`weather` (`weatherType`, `windStrenght`, `competitionName`) VALUES ('Hail', '10/ms', "Big Golf Cup Skövde" );
select * from GolfCupVastraGotaland.weather;


select * from GolfCupVastraGotaland.weatherTimOfDay;

INSERT INTO `GolfCupVastraGotaland`.`jacket` (`model`, `material`, `size`, `playerId`) VALUES ('1', 'fleece', 'm', '1');
INSERT INTO `GolfCupVastraGotaland`.`jacket` (`model`, `material`, `size`, `playerId`) VALUES ('2', 'goretex','m', '1');
INSERT INTO `GolfCupVastraGotaland`.`jacket` (`model`, `material`, `size`, `playerId`) VALUES ('1', 'goretex','m', '2');
select * from GolfCupVastraGotaland.jacket;

INSERT INTO `GolfCupVastraGotaland`.`club` (`clubModel`, `material`, `playerId`) VALUES ('1', 'wood', '2');
INSERT INTO `GolfCupVastraGotaland`.`club` (`clubModel`, `material`, `playerId`) VALUES ('1', 'wood', '3');
INSERT INTO `GolfCupVastraGotaland`.`club` (`clubModel`, `material`, `playerId`) VALUES ('2', 'iron', '1');
select * from GolfCupVastraGotaland.club;

INSERT INTO `GolfCupVastraGotaland`.`clubConstruction` (`serialNumber`, `solidity`, `playerId`, `clubModel`) VALUES ('0001', '10', '2', '1');
INSERT INTO `GolfCupVastraGotaland`.`clubConstruction` (`serialNumber`, `solidity`, `playerId`, `clubModel`) VALUES ('0002', '5', '3', '1');
INSERT INTO `GolfCupVastraGotaland`.`clubConstruction` (`serialNumber`, `solidity`, `playerId`, `clubModel`) VALUES ('0003', '8', '1', '2');
select * from GolfCupVastraGotaland.clubConstruction;

select playerName from GolfCupVastraGotaland.player;


/* Uppgift Operationer 1-10 */
SELECT age FROM GolfCupVastraGotaland.player
WHERE playerId=1;

SELECT competitionDate FROM GolfCupVastraGotaland.competition
WHERE competitionName="Big Golf Cup Skövde";

SELECT competitionDate FROM GolfCupVastraGotaland.competition
WHERE competitionName="Big Golf Cup Skövde";

SELECT material FROM GolfCupVastraGotaland.club
WHERE playerId=1;

SELECT model FROM GolfCupVastraGotaland.jacket
WHERE playerId=1;

select playerId from GolfCupVastraGotaland.participant
WHERE competitionName= "Big Golf Cup Skövde";

select windStrenght from GolfCupVastraGotaland.weather
WHERE competitionName= "Big Golf Cup Skövde";

SELECT playerName FROM GolfCupVastraGotaland.player
WHERE age < 30;

delete from GolfCupVastraGotaland.jacket
WHERE playerId = 1 in(model=1, model=2) ;


delete from GolfCupVastraGotaland.clubConstruction
WHERE playerId = 2 ;
delete from GolfCupVastraGotaland.club
WHERE playerId = 2 ;
delete from GolfCupVastraGotaland.jacket
WHERE playerId = 2 ;
delete from GolfCupVastraGotaland.participant
WHERE playerId = 2 ;
delete from GolfCupVastraGotaland.player
WHERE playerId = 2 ;

SELECT AVG(age)
FROM GolfCupVastraGotaland.player
WHERE playerID;

















