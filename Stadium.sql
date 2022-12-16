--- Database Control Functions ---
CREATE DATABASE SportsDB;
USE SportsDB;
DROP DATABASE SportsDB;

--- Create DB ---
EXEC createAllTables

--- Drop DB ---
EXEC dropAllTables
EXEC dropAllProceduresFunctionsViews
exec clearAllTables

---------------- TEST DATA ----------------------

--INSERT INTO SystemUser VALUES ('Mohammed', 'mopassword'),
--							  ('Malek', '123'),
--							  ('Omar', 'omarPass'),
--							  ('Ahmed', 'ahmedPass'),
--							  ('FanOne', 'FPass')



--INSERT INTO Stadium (name, location, capacity) VALUES ('Stad al Kahera', 'Cairo', 50),
			--										  ('Monroe Stadium', 'USA', 100),
		--											  ('Reuben Arena', 'Germany', 150),
	--												  ('Maxwell Plaza', 'Switzerland', 500)


--INSERT INTO StadiumManager (name, username) VALUES ('MoSalah', 'Mohammed')

--INSERT INTO Club (name, location) VALUES ('New York Jets', 'USA'),
	--									 ('Ahly', 'Cairo'),
		--								 ('Zamalek', 'Cairo'),
			--							 ('FC Bayern', 'Germany')

--INSERT INTO ClubRepresentative (name, username, club_id) VALUES ('Omariko', 'Omar', 1)

--INSERT INTO Fan (username,national_id,name, phone_number, birthdate, address) VALUES ('FanOne', '54321','FavFan', 018572398, 22-03-2022, '14 Gomhoreya St.')
--INSERT INTO SportAssociationManager (name, username) VALUES ('ManagerMo', 'Mohammed')
--INSERT INTO SystemAdmin (name, username) VALUES ('OmarMgr', 'Omar')
--INSERT INTO Match (start_time, end_time, host_id, guest_id) VALUES ('2015-01-01 08:22:13', '2015-03-05 17:56:31', 2, 3);


--insert into SystemUser values('meky',1),('omar',2),('hima',3),('malek',4),('user1',5),('user2',6),('user3',7),('admin',8),('abdo',9),('user4',10);
--INSERT INTO Stadium values ('yehiastadium','Egypt',1 , 20000)
--INSERT INTO Club values ('ahly','Egypt')
--insert into Club values ('zamlek', 'Egypt')
--insert into Club values ('club3', 'Egypt')
--insert into Club values ('club4', 'Egypt')
--insert into StadiumManager values ('yehia', 'abdo',1)
--insert into ClubRepresentative values ('meky', 'meky', 1)
--insert into ClubRepresentative values ('omar', 'omar', 3)
--insert into ClubRepresentative values ('hima', 'hima', 2)
--insert into ClubRepresentative values ('malek', 'malek', 4)
--insert into Fan values ('1234','user1','mosha8b','12','2002-1-2 01:10:59','ad1',1)
--insert into Fan values ('123','user2','mosha8b1','1','2002-1-3 01:10:59','ad2',1)
--insert into Fan values ('12','user3','mosha8b12','14','2002-1-3 01:10:59','ad2',0)
--insert into SportAssociationManager values ('manager1', 'user4')
--insert into SystemAdmin values ('ana', 'admin')
--insert into Match values ('2022-12-15 01:00:00', '2022-12-15 03:00:00', 2, 3,1)
--insert into Match values ('2021-12-15 01:00:00', '2021-12-15 03:00:00', 1, 3,1)
--insert into Match values ('2023-12-15 01:00:00', '2023-12-15 03:00:00', 1, 4,1)
--insert into HostRequest values (1, 1, 1, 2)
--insert into HostRequest values (1, 2, 1, 3)
--insert into Ticket values (1, 2)
--insert into Ticket values (1, 2)
--insert into Ticket values (1, 1)
--insert into Ticket values (1, 1)
--select * from Ticket

INSERT INTO Stadium values ('stadium1','Cairo',1,20000)
INSERT INTO Stadium values ('stadium2','Alex',1,30000)
INSERT INTO Stadium values ('stadium3','Suez',0,30000)

insert into SystemUser values ('manager1username',1),('manager2username',1),('manager3username',1)
insert into StadiumManager values ('manager1', 'manager1username',1)
insert into StadiumManager values ('manager2', 'manager2username',2)
insert into StadiumManager values ('manager3', 'manager3username',3)

INSERT INTO Club values ('club1','Egypt')
insert into Club values ('club2', 'Egypt')
insert into Club values ('club3', 'Egypt')
insert into Club values ('club4', 'Egypt')
insert into Club values ('club5', 'Egypt')

insert into SystemUser values ('rep1username',1),('rep2username',1),('rep3username',1),('rep4username',1)
insert into ClubRepresentative values ('representative1', 'rep1username',  1)
insert into ClubRepresentative values ('representative2', 'rep2username',  3)
insert into ClubRepresentative values ('representative3', 'rep3username',  2)
insert into ClubRepresentative values ('representative4', 'rep4username',  4)

insert into SystemUser values ('fan1username',1),('fan2username',1),('fan3username',1)
insert into Fan values ('1','fan1username','fan1',123,'2002-1-2 01:10:59','address1',1)
insert into Fan values  ('2','fan2username','fan2',456,'2002-1-3 01:10:59','address2',1)
insert into Fan values  ('3','fan3username','fan3',789,'2002-1-3 01:10:59','address3',0)

insert into SystemUser values ('managerusername',1)
insert into SportAssociationManager values ('manager1', 'managerusername')

insert into SystemUser values ('adminUsername',1)
insert into SystemAdmin values ('adminName', 'adminUsername')

insert into Match values ('2022-12-15 01:00:00', '2022-12-15 03:00:00', 2,3,1)
insert into Match values ('2021-12-15 01:00:00', '2021-12-15 03:00:00', 1,3,2)
insert into Match values ('2023-12-15 01:00:00', '2023-12-15 03:00:00', 1,4,1)
insert into Match values ('2023-12-15 01:00:00', '2023-12-15 03:00:00', 4,2,null)
insert into Match values ('2023-12-15 01:00:00', '2023-12-15 03:00:00', 3,4,null)

insert into HostRequest values ('accepted', 3, 1, 2)
insert into HostRequest values ('unhandled', 4, 1, 3)
insert into HostRequest values ('rejected', 5, 1, 1)

insert into TicketBuyingTransactions values (1,'1'),(2,'2'),(3,'3')

--2.1 BASic Structure of the DatabASe
--Part a
GO
CREATE PROCEDURE createAllTables AS

CREATE TABLE SystemUser (
username VARCHAR(20) PRIMARY KEY,
password VARCHAR(20) NOT NULL
);

CREATE TABLE Stadium (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
location  VARCHAR(20),
status BIT default 1 ,-- 0 unavailable , 1 available
capacity INT
);


CREATE TABLE StadiumManager (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE NOT NULL,
stadium_id INT,
CONSTRAINT SM_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT SM_FK2 FOREIGN KEY (stadium_id) REFERENCES Stadium(ID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Club (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
location VARCHAR(20)
);


CREATE TABLE ClubRepresentative (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE NOT NULL,
club_id INT,
CONSTRAINT CR_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT CR_FK2 FOREIGN KEY (club_id) REFERENCES Club(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Fan (
national_id INT PRIMARY KEY,
username VARCHAR(20) UNIQUE NOT NULL,
name VARCHAR(20),
phone_number INT,
birthdate DATETIME,
address VARCHAR(20),
status BIT default 1,			-- 1 for unblocked , 0 for blocked
CONSTRAINT F_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE SportAssociationManager (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE NOT NULL,
CONSTRAINT SAM_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE SystemAdmin (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE NOT NULL,
CONSTRAINT SA_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE Match (
id INT IDENTITY PRIMARY KEY,
start_time DATETIME,
end_time DATETIME,
host_id INT,
guest_id INT,
stadium_id INT,
CONSTRAINT M_FK1 FOREIGN KEY (stadium_id) REFERENCES Stadium(id) ON DELETE SET NULL,--relatiON 1 to many between Stadium & Match
CONSTRAINT M_FK2 FOREIGN KEY (host_id) REFERENCES Club(id) ,--relatiON 1 to many between Club & Match
CONSTRAINT M_FK3 FOREIGN KEY (guest_id) REFERENCES Club(id)  --relatiON 1 to many between Club & Match
);



CREATE TABLE HostRequest (
id INT IDENTITY PRIMARY KEY,
status VARCHAR(20), --unhandled, accepted or rejected
match_id INT,
stadium_manager_id INT,
club_representative_id INT,
CONSTRAINT HR_FK1 FOREIGN KEY (match_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE,--added nardy
CONSTRAINT HR_FK2 FOREIGN KEY (stadium_manager_id) REFERENCES StadiumManager(id),
CONSTRAINT HR_FK3 FOREIGN KEY (club_representative_id) REFERENCES ClubRepresentative(id)
);



CREATE TABLE Ticket (
id INT IDENTITY PRIMARY KEY,
status BIT DEFAULT 1,
match_id INT,
CONSTRAINT T_FK1 FOREIGN KEY (match_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE
);
insert into Ticket values (1, 2)
insert into Ticket values (1, 2)
insert into Ticket values (0, 1)
insert into Ticket values (0, 1)


CREATE TABLE TicketBuyingTransactions (
ticket_id INT,
fan_id INT,
CONSTRAINT TBT_FK1 FOREIGN KEY (fan_id) REFERENCES Fan (national_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT TBT_FK2 FOREIGN KEY (ticket_id) REFERENCES Ticket(id) ON DELETE CASCADE ON UPDATE CASCADE
);


--------------------------------------------------
--Part b

GO
CREATE PROCEDURE dropAllTables AS
DROP TABLE SystemAdmin
DROP TABLE TicketBuyingTransactions
DROP TABLE SportAssociationManager
DROP TABLE HostRequest
DROP TABLE Ticket
DROP TABLE Match
DROP TABLE ClubRepresentative
DROP TABLE Club
DROP TABLE StadiumManager
DROP TABLE Stadium
DROP TABLE Fan
DROP TABLE SystemUser
--------------------------------------------------
--Part c
GO
CREATE PROCEDURE dropAllProceduresFunctionsViews AS
DROP PROCEDURE createAllTables
DROP PROCEDURE dropAllTables
DROP PROCEDURE clearAllTables
DROP PROCEDURE addAssociationManager
DROP PROCEDURE addNewMatch
DROP PROCEDURE deleteMatch
DROP PROCEDURE deleteMatchesOnStadium
DROP PROCEDURE addClub
DROP PROCEDURE AddTicket
DROP PROCEDURE deleteClub
DROP PROCEDURE addStadium
DROP PROCEDURE deleteStadium
DROP PROCEDURE blockFan
DROP PROCEDURE unblockFan;
DROP PROCEDURE addRepresentative
DROP PROCEDURE addHostRequest
DROP PROCEDURE addStadiumManager
DROP PROCEDURE acceptRequest
DROP PROCEDURE RejectRequest
DROP PROCEDURE addFan
DROP PROCEDURE purchaseTicket
DROP PROCEDURE updateMatchHost
DROP VIEW allAssocManagers
DROP VIEW allClubRepresentatives
DROP VIEW allStadiumManagers
DROP VIEW allFans
DROP VIEW allMatches
DROP VIEW allTickets
DROP VIEW allCLubs
DROP VIEW allStadiums
DROP VIEW allRequests
DROP VIEW clubsWithNoMatches
DROP VIEW matchesPerTeam
DROP VIEW clubsNeverMatched
DROP FUNCTION viewAvailableStadiumsOn
DROP FUNCTION allUnassignedMatches
DROP FUNCTION allPendingRequests
DROP FUNCTION upcomingMatchesOfClub
DROP FUNCTION availableMatchesToAttend
DROP FUNCTION clubsNeverPlayed
DROP FUNCTION matchWithHighestAttendance
DROP FUNCTION matchesRankedByAttendance
DROP FUNCTION requestsFromClub
--------------------------------------------------
--Part d

GO

CREATE PROCEDURE clearAllTables AS


ALTER TABLE StadiumManager DROP CONSTRAINT SM_FK1,SM_FK2;
ALTER TABLE ClubRepresentative DROP CONSTRAINT CR_FK1,CR_FK2;			
ALTER TABLE Fan DROP CONSTRAINT F_FK1;
ALTER TABLE SportAssociationManager DROP CONSTRAINT SAM_FK1;
ALTER TABLE SystemAdmin DROP CONSTRAINT SA_FK1;
ALTER TABLE Match DROP CONSTRAINT M_FK1,M_FK2,M_FK3;
ALTER TABLE HostRequest DROP CONSTRAINT HR_FK1,HR_FK2,HR_FK3;
ALTER TABLE Ticket DROP CONSTRAINT T_FK1;
ALTER TABLE TicketBuyingTransactions DROP CONSTRAINT TBT_FK1,TBT_FK2;

TRUNCATE TABLE SystemAdmin;
TRUNCATE TABLE TicketBuyingTransactions;
TRUNCATE TABLE SportAssociationManager;
TRUNCATE TABLE HostRequest;
TRUNCATE TABLE Ticket;
TRUNCATE TABLE Match;
TRUNCATE TABLE Fan;
TRUNCATE TABLE ClubRepresentative;
TRUNCATE TABLE Club;
TRUNCATE TABLE StadiumManager;
TRUNCATE TABLE Stadium;
TRUNCATE TABLE SystemUser;

ALTER TABLE StadiumManager add constraint SM_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE StadiumManager add constraint SM_FK2 FOREIGN KEY (stadium_id) REFERENCES Stadium(ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ClubRepresentative add constraint CR_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ClubRepresentative add constraint  CR_FK2 FOREIGN KEY (club_id) REFERENCES Club(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Fan add constraint F_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SportAssociationManager add constraint SAM_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SystemAdmin add constraint SA_FK1 FOREIGN KEY (username) REFERENCES SystemUser(username) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Match add constraint M_FK1 FOREIGN KEY (stadium_id) REFERENCES Stadium(id) ON DELETE SET NULL;										--(1)	these three need to be checked
ALTER TABLE Match add constraint M_FK2 FOREIGN KEY (host_id) REFERENCES Club(id) ON DELETE SET NULL;											--(2)
ALTER TABLE Match add constraint M_FK3 FOREIGN KEY (guest_id) REFERENCES Club(id);																--(3)

ALTER TABLE HostRequest add constraint HR_FK1 FOREIGN KEY (match_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE HostRequest add constraint HR_FK2 FOREIGN KEY (stadium_manager_id) REFERENCES StadiumManager(id);									--check this 
ALTER TABLE HostRequest add constraint HR_FK3 FOREIGN KEY (club_representative_id) REFERENCES ClubRepresentative(id);

ALTER TABLE Ticket add constraint  T_FK1 FOREIGN KEY (match_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TicketBuyingTransactions ADD CONSTRAINT TBT_FK1 FOREIGN KEY (fan_id) REFERENCES Fan (national_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TicketBuyingTransactions ADD CONSTRAINT TBT_FK2 FOREIGN KEY (ticket_id) REFERENCES Ticket(id) ON DELETE CASCADE ON UPDATE CASCADE;

--------------------------------------------------

--2.2 Basic Data Retrieval
--Part a
GO
CREATE VIEW allAssocManagers AS
SELECT sam.username,su.password,sam.name
FROM SportAssociationManager sam INNER JOIN SystemUser su
ON sam.username =su.username

--Part b

GO
CREATE VIEW allClubRepresentatives AS
SELECT CR.username,su.password,CR.name,C.name AS Club 
FROM Club C INNER JOIN SystemUser su  ON C.username =su.username
INNER JOIN ClubRepresentative CR ON C.id = CR.club_id;

--Part c

GO
CREATE VIEW allStadiumManagers AS
SELECT SM.Username, su.password ,SM.name,S.name AS Stadium
FROM Stadium S INNER JOIN SystemUser su  ON S.username =su.username INNER JOIN StadiumManager SM ON S.id = SM.stadium_id;

--Part d

GO
CREATE VIEW allFans AS
SELECT F.username,su.password,F.name, F.national_id, F.birthdate, F.status
FROM Fan F INNER JOIN SystemUser su  ON F.username =su.username

--Part e

GO
CREATE VIEW allMatches AS
SELECT H.name AS Club_1, G.name AS Club_2, H.name AS Host, M.start_time
FROM Club H 
INNER JOIN Match M
ON H.id = M.host_id
INNER JOIN Club G
ON M.guest_id = G.ID

--Part f

GO
CREATE VIEW allTickets AS
SELECT H.name AS Club_1, G.name AS Club_2, S.name AS Staduim, M.start_time
FROM Ticket T 
INNER JOIN Match M
ON T.match_id = M.ID
INNER JOIN Club H
ON H.id = M.host_id
INNER JOIN Club G
ON G.id = M.guest_id
INNER JOIN Stadium S
ON S.id = M.stadium_id

--Part g

GO
CREATE VIEW allClubs AS
SELECT name,location
FROM Club

--Part h

GO
CREATE VIEW allStadiums AS
SELECT name,location,capacity,status
FROM Stadium

--part i
GO
CREATE VIEW allRequests AS
SELECT cr.username AS ClubRepresentative_username,s.name AS StadiumManager,s.username AS StadiumManager_username, h.status
FROM HostRequest h
INNER JOIN StadiumManager s
ON h.stadium_manager_id = s.ID
INNER JOIN
ClubRepresentative cr
ON h.club_representative_id = cr.ID


-------------------------------------------------
--2.3  All Other Requirements 

------------------------------ START OF OMAR'S PART ----------------------------------------

--- Stored Procedures (Parts (i) - (xiii)) ---

-- (i)
GO
CREATE PROCEDURE addAssociationManager (@name VARCHAR(20), @username VARCHAR(20), @password VARCHAR(20)) AS
	INSERT INTO SystemUser VALUES (@username, @password)
	INSERT INTO SportAssociationManager (name, username) VALUES (@name, @username)


-- (ii)
GO
CREATE PROCEDURE addNewMatch (@hostClubName VARCHAR(20), @guestClubName VARCHAR(20), @startTime DATETIME, @endTime DATETIME) AS
	DECLARE @hostID INT, @guestID INT

	SELECT @hostID = id
	FROM Club 
	WHERE name = @hostClubName
	

	SELECT @guestID = id
	FROM Club
	WHERE name = @guestClubName
	

	INSERT INTO Match (host_id, guest_id, start_time, end_time) VALUES (@hostID, @guestID, @startTime, @endTime) 

-- (iii)
GO
CREATE VIEW clubsWithNoMatches AS

SELECT name
FROM Club 
FULL OUTER JOIN Match M1
ON Club.id = M1.host_id 
FULL OUTER JOIN Match M2
ON Club.id = M2.guest_id
WHERE M1.host_id IS NULL AND M1.guest_id IS NULL AND M2.host_id IS NULL AND M2.guest_id IS NULL AND name IS NOT NULL



-- (iv)
GO
CREATE PROCEDURE deleteMatch (@hostClubName VARCHAR(20), @guestClubName VARCHAR(20)) AS
	DECLARE @hostID INT, @guestID INT, @matchID INT

	SELECT @hostID = id
	FROM Club
	WHERE name = @hostClubName
	

	SELECT @guestID = id
	FROM Club
	WHERE name = @guestClubName
	

	DELETE FROM Match 
	WHERE host_id = @hostID AND guest_id = @guestID


	-- Delete the match's tickets
	SELECT @matchID = id
	FROM Match 
	WHERE host_id = @hostID AND guest_id = @guestID 


	DELETE FROM Ticket 
	WHERE match_id = @matchID 



-- (v)
GO

CREATE PROCEDURE deleteMatchesOnStadium (@stadiumName VARCHAR(20)) AS
	DECLARE @stadiumID INT, @matchID INT

	SELECT @stadiumID = id
	FROM Stadium
	WHERE name = @stadiumName

	DELETE FROM Match 
	WHERE stadium_id = @stadiumID AND start_time > CURRENT_TIMESTAMP
 

-- (vi)
GO
CREATE PROCEDURE addClub (@clubName VARCHAR(20), @clubLocation VARCHAR(20)) AS
	INSERT INTO Club (name, location) VALUES (@clubName, @clubLocation)

-- (vii)
GO
CREATE PROCEDURE addTicket (@hostClubName VARCHAR(20), @guestClubName VARCHAR(20), @startTime DATETIME) AS
	DECLARE @hostClubID INT, @guestClubID INT, @matchID INT

	SELECT @hostClubID = id
	FROM Club
	WHERE name = @hostClubName

	SELECT @guestClubID = id
	FROM Club
	WHERE name = @guestClubName

	SELECT @matchID = id
	FROM Match
	WHERE host_id = @hostClubID AND guest_id = @guestClubID AND start_time = @startTime


	INSERT INTO Ticket VALUES (1, @matchID)



-- (viii)
GO
CREATE PROCEDURE deleteClub (@clubName VARCHAR(20)) AS
	DELETE FROM Club 
	WHERE name = @clubName
	

-- (ix)
GO
CREATE PROCEDURE addStadium (@stadiumName VARCHAR(20), @stadiumLocation VARCHAR(20), @stadiumCapacity VARCHAR(20)) AS
	INSERT INTO Stadium VALUES (@stadiumName, @stadiumLocation, 1, @stadiumCapacity)


-- (x)
GO
CREATE PROCEDURE deleteStadium (@stadiumName VARCHAR(20)) AS
	DELETE FROM Stadium WHERE name = @stadiumName

------------------------------- END OF OMAR'S PART ------------------------------------------------

-- (xi)                                           
GO
CREATE PROCEDURE blockFan
@nationalID VARCHAR(20)
AS
BEGIN
UPDATE Fan
SET Status  = 0
WHERE Fan.National_ID = @nationalID
END


-- (xii)                           
GO
CREATE PROCEDURE unblockFan
@nationalID VARCHAR(20)
AS
BEGIN
UPDATE Fan
SET Status  = 1
WHERE Fan.National_ID = @nationalID
END

-- (xiii)                          
GO
CREATE PROCEDURE addRepresentative
@name VARCHAR(20),
@clubName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
BEGIN

INSERT INTO SystemUser
VALUES (@userName,@password)

DECLARE @clubID INT
SELECT @clubID = Club.ID
FROM Club
WHERE Club.Name = @clubName

INSERT INTO ClubRepresentative
VALUES(@name,@userName,@clubID)
END

-- (xiv) -- not sure need to check for dates
GO
CREATE FUNCTION viewAvailableStadiumsOn
(@date DATETIME)
RETURNS TABLE
AS
RETURN
	SELECT S.name,S.location,S.capacity
	FROM Stadium S
	WHERE S.status = 1 AND NOT EXISTS(
		SELECT S2.name,S2.location,S2.capacity
		FROM Stadium S2 INNER JOIN Match M ON M.stadium_id = S2.id
		WHERE S.name = S2.name AND @date BETWEEN M.start_time AND M.end_time
	)  

GO

-- (xv)                           
GO
CREATE PROCEDURE addHostRequest
@clubName VARCHAR(20),
@stadiumName VARCHAR(20),
@startTime DATETIME
AS
BEGIN

DECLARE @clubRepID INT
DECLARE @stadiumManID INT
DECLARE @matchID INT

SELECT @clubRepID = CR.id, @matchID = M.id
FROM Match M
INNER JOIN Club H ON M.host_id = H.id
INNER JOIN ClubRepresentative CR ON CR.club_id = H.id
WHERE H.name = @clubName AND M.start_time = @startTime

SELECT @stadiumManID = SM.id
FROM Stadium S 
INNER JOIN StadiumManager SM ON SM.stadium_id = S.id
WHERE S.name = @stadiumName

INSERT INTO HostRequest
VALUES('unhandled',@MatchID,@StadiumManID,@ClubRepID)
END


-- (xvi)                           
GO
CREATE FUNCTION  allUnassignedMatches
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN 
	SELECT G.name,M.start_time
	FROM Club H
	INNER JOIN Match M ON M.host_id = H.id
	INNER JOIN Club G ON M.guest_id = G.id
	WHERE H.name = @clubName AND M.stadium_id IS NULL

-- (xvii)                           
GO
CREATE PROCEDURE addStadiumManager
@name VARCHAR(20),
@stadiumName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
BEGIN

INSERT INTO SystemUser
VALUES (@userName,@password)

DECLARE @stadiumID INT
SELECT @stadiumID = Stadium.ID
FROM Stadium
WHERE Stadium.Name = @stadiumName

INSERT INTO StadiumManager
VALUES(@name,@userName,@stadiumID)
END

-- (xviii)                           
GO
CREATE FUNCTION allPendingRequests
(@stadiumManUsername VARCHAR(20))
RETURNS TABLE
AS
RETURN
	SELECT CR.name AS ClubRepresentative,G.name AS Guest,M.start_time
	FROM HostRequest HR 
	INNER JOIN StadiumManager SM ON HR.stadium_manager_id = SM.id
	INNER JOIN Match M ON HR.match_id = M.id
	INNER JOIN ClubRepresentative CR ON HR.club_representative_id = CR.id
	INNER JOIN Club G ON M.guest_id = G.id
	WHERE SM.username = @stadiumManUsername AND HR.status = 'unhandled'

-- (xix)
GO
CREATE PROCEDURE acceptRequest
@stadiumManUsername VARCHAR(20),
@hostClubName VARCHAR(20),
@guestClubName VARCHAR(20),
@startTime DATETIME
AS
BEGIN
DECLARE @matchID INT
SELECT @matchID = M.id
FROM Match M 
INNER JOIN Club H ON M.host_id = H.id
INNER JOIN Club G ON M.guest_id = G.id
WHERE H.name = @hostClubName AND G.name = @guestClubName AND M.start_time = @startTime

UPDATE HostRequest
SET status = 'accepted'
WHERE stadium_manager_id = (SELECT SM.id FROM StadiumManager SM WHERE SM.username = @stadiumManUsername) AND match_id = @matchID

UPDATE Match
SET stadium_id = (SELECT SM.stadium_id FROM StadiumManager SM WHERE SM.username = @stadiumManUsername)
WHERE id = @matchID
END



-- (xx)
GO
CREATE PROCEDURE rejectRequest
@stadiumManUsername VARCHAR(20),
@hostClubName VARCHAR(20),
@guestClubName VARCHAR(20),
@startTime DATETIME
AS
BEGIN
UPDATE HostRequest
SET status = 'rejected'
WHERE stadium_manager_id = (SELECT SM.id FROM StadiumManager SM WHERE SM.username = @stadiumManUsername)
AND match_id = (SELECT M.id
				FROM Match M 
				INNER JOIN Club H ON M.host_id = H.id
				INNER JOIN Club G ON M.guest_id = G.id
				WHERE H.name = @hostClubName AND G.name = @guestClubName AND M.start_time = @startTime)
END


-------------------------------malek part
-- (XXi)	
go
create procedure addFan (@name VARCHAR(20),@username VARCHAR(20),@password VARCHAR(20),@national_id VARCHAR(20),@birth_date datetime,@address VARCHAR(20),@phone_number int) as	
	insert into SystemUser values(@username,@password)
	insert into Fan  values(@national_id,@username,@name,@phone_number,@birth_date,@address,1);
go	


-- (XXII) 
go
CREATE FUNCTION upcomingMatchesOfClub (@club_name varchar(20))
	returns @table table(club_name varchar(20),
						 competing_club_name varchar(20),
						 starting_time datetime,
						  stadium varchar(20))
	as
		begin
			insert into @table
			select  C1.name club_name, C2.name competing_club_name, Match.start_time starting_time, stadium.name stadium from  match,club C1,club C2,Stadium
			where match.host_id=C1.id and match.guest_id=C2.id and Match.stadium_id=Stadium.id and (@club_name like C1.name or @club_name like C2.name ) and Match.start_time>CURRENT_TIMESTAMP
		return
	end;



-- (XXIII)
go
CREATE FUNCTION availableMatchesToAttend (@date datetime)
	returns @table table(
		host_club_name	varchar(20),
		 competing_club_name varchar(20),
		  starting_time datetime,
		   stadium varchar(20)
	)
	as
		begin
			insert into @table
			select  C1.name club_name, C2.name competing_club_name, Match.start_time starting_time, stadium.name stadium from  match,club C1,club C2,Stadium
			where match.host_id=C1.id and match.guest_id=C2.id and Match.stadium_id=Stadium.id and  Match.start_time>=@date
					and exists(select T.id from Ticket T
								where T.match_id=match.id and T.status=1)
		return
	end;
go



-- (xxiv)

go

create procedure purchaseTicket (@national_id int,@hosting_club varchar(20),@competing_club varchar(20),@date datetime) as
	declare @hosting_club_id varchar(20);
	declare @competing_club_id varchar(20);
	declare @match_id int;
	declare @ticket_id int;
	declare @state bit;
	select @hosting_club_id = id from Club where name like @hosting_club;
	select @competing_club_id = id from Club where name like @competing_club;
	select @match_id=id from match where @date = start_time and @hosting_club_id = host_id and @competing_club_id = guest_id;
	select @state = status from fan where national_id = @national_id;
	select top 1 @ticket_id = id from Ticket
	where match_id = @match_id and status = 1;
	if @state=1 and @ticket_id is not null
	begin
	update Ticket
	set status = 0
	where id = @ticket_id;
	insert into TicketBuyingTransactions values (@ticket_id,@national_id);
	end
go
--exec purchaseTicket 13,'mohamed','malek','2002-01-10 00:00:00.000'


-- (xxv)
go
create procedure updateMatchHost (@hosting_club VARCHAR(20),@competing_club VARCHAR(20),@date datetime) as
	declare @tmp_host_id int;
	declare @tmp_guest_id int;
	declare @match_id int;
	select  @tmp_host_id = id from club
	where name like @hosting_club;
	select  @tmp_guest_id = id from club
	where name like @competing_club;
	select @match_id=id from Match
	where host_id=@tmp_host_id and guest_id =@tmp_guest_id and start_time = @date;
	update match
	set host_id=@tmp_guest_id,guest_id=@tmp_host_id
	where id = @match_id

--exec updateMatchHost 'club2','club3','2022-12-15 01:00:00.000'

go

-- (XXVi)
create view matchesPerTeam as
 select C3.name , COUNT(C3.id) number_of_matches from (select Match.host_id,Match.guest_id,Match.end_time from club C1,club C2,Match
	where Match.host_id=C1.id and Match.guest_id = C2.id) table1 , Club C3
	where (C3.id = table1.host_id or C3.id = table1.guest_id) and CURRENT_TIMESTAMP>table1.end_time
	group by C3.name
go
-- (XXVII)
create view clubsNeverMatched as
	
	select C1.name First_club ,C2.name Second_club 
	from Club C1,Club C2
	where C1.id<C2.id
	except
	(
	select c3.name c33 ,c4.name c44
	from Match , club c3 , club c4
	where host_id in (c3.id,c4.id)  and guest_id in (c4.id,c3.id) and CURRENT_TIMESTAMP >= Match.end_time
	)

go



-- (xxviii)	

go
CREATE FUNCTION clubsNeverPlayed (@representing varchar(20))    ---------> NOT TESTED 
	returns @table table(
						club_name varchar(20)
	)
	as
		begin
			insert into @table 
				select name from club cl
				where name <> @representing
				except (
				select c3.name from Match , club c2 , club c3
				where Match.host_id in (c2.id,c3.id) and Match.guest_id in (c2.id,c3.id)
				and c2.name = @representing and c3.name <> @representing and CURRENT_TIMESTAMP >= Match.end_time
				union
				select c2.name from Match , club c2 , club c3
				where Match.host_id in (c2.id,c3.id) and Match.guest_id in (c2.id,c3.id)
				and c2.name <> @representing and c3.name = @representing and CURRENT_TIMESTAMP >= Match.end_time
				)
				
		return
	end;
go

-- (xxix)
go

CREATE FUNCTION matchWithHighestAttendance ()
	returns @table table(
						host_club varchar(20),
						guest_club varchar(20)
	)
	as
		begin
			insert into @table 
			select top 1 club_name, competing_club_name
			from(
			select  C1.name club_name, C2.name competing_club_name ,count(tick.match_id) cou from  match,club C1,club C2 , Ticket tick
			where match.host_id=C1.id and match.guest_id=C2.id and CURRENT_TIMESTAMP>=Match.end_time and tick.match_id=match.id and tick.status = 0 
			group by C1.name,C2.name
			) t1
			order by cou 
		return
	end;
go

-- (xxx) 
go
CREATE FUNCTION matchesRankedByAttendance ()
	returns @table table(host_club varchar(20),
						guest_club varchar(20)
	)
	as
		begin
			insert into @table 
			select club_name, competing_club_name
			from(
			select  C1.name club_name, C2.name competing_club_name ,count(tick.match_id) cou from  match,club C1,club C2 , Ticket tick
			where match.host_id=C1.id and match.guest_id=C2.id and CURRENT_TIMESTAMP>=Match.end_time and tick.match_id=match.id and tick.status = 0 
			group by C1.name,C2.name
			) t1
			order by cou desc
		return
	end;


go

--(XXXi)

CREATE FUNCTION requestsFromClub (@stadium_name varchar(20),@club_name varchar(20))			-- Not Tested
	returns @table table(
		host_club varchar(20),
		guest_club varchar(20)
	)
	as
		begin
			insert into @table 
			select matches.host_club,matches.guest_club from 
			(select ma.id match_id , C1.name host_club , C2.name guest_club, Sta.name Stadium_name from match ma,Club C1 , Club C2 , Stadium sta
			where ma.host_id=C1.id and ma.guest_id = C2.id and ma.stadium_id = Sta.id) matches
			
			inner join 

			(select c3.name clu3, HostRequest.match_id mat2  from HostRequest,ClubRepresentative ,Club C3
			where C3.id = ClubRepresentative.club_id and HostRequest.club_representative_id = ClubRepresentative.id
			)rep
			on  clu3=matches.host_club and mat2 = matches.match_id
			where @club_name like matches.host_club and @stadium_name like matches.Stadium_name
		return
	end;
go