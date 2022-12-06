CREATE DATABASE SportsDB;

--2.1 BASic Structure of the DatabASe
--Part a

GO

CREATE PROCEDURE createAllTables AS
BEGIN

CREATE TABLE SystemUser (
username VARCHAR(20) PRIMARY KEY,
password VARCHAR(20),
);

CREATE TABLE Stadium (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
location  VARCHAR(20),
status BIT,
capacity INT,
);

CREATE TABLE StadiumManager (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20),
stadium_id INT,
FOREIGN KEY (username) REFERENCES SystemUser(username),
FOREIGN KEY (stadium_id) REFERENCES Stadium(ID), --relatiON 1 to 1 between stadium & stadium manager
);

CREATE TABLE Club (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
location VARCHAR(20),
);

CREATE TABLE ClubRepresentative (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20),
club_id INT,
FOREIGN KEY (username) REFERENCES SystemUser(username),
FOREIGN KEY (club_id) REFERENCES Club(id),--relatiON 1 to 1 between club & ClubRepresentative
);

CREATE TABLE Fan (
national_id INT PRIMARY KEY,
username VARCHAR(20),
name VARCHAR(20),
phone_number INT,
birthdate DATE,
address VARCHAR(20),
status BIT,
FOREIGN KEY (username) REFERENCES SystemUser(username),
);

CREATE TABLE SportAssociationManager (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES SystemUser(username),
);

CREATE TABLE SystemAdmin (
id INT IDENTITY PRIMARY KEY,
name VARCHAR(20),
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES SystemUser(username),
);


CREATE TABLE HostRequest (
id INT IDENTITY PRIMARY KEY,
status VARCHAR(20), --unhandled, accepted or rejected
match_id INT,
stadium_manager_id INT,
club_representative_id INT,
FOREIGN KEY (stadium_manager_id) REFERENCES StadiumManager(id),
FOREIGN KEY (club_representative_id) REFERENCES ClubRepresentative(id),
);

CREATE TABLE Match (
id INT IDENTITY PRIMARY KEY,
start_time DATETIME,
end_time DATETIME,
host_id INT,
guest_id INT,
stadium_id INT,
FOREIGN KEY (stadium_id) REFERENCES Stadium(id),--relatiON 1 to many between Stadium & Match
FOREIGN KEY (host_id) REFERENCES Club(id),--relatiON 1 to many between Club & Match
FOREIGN KEY (guest_id) REFERENCES Club(id),--relatiON 1 to many between Club & Match
);

CREATE TABLE Ticket (
id INT IDENTITY PRIMARY KEY,
status BIT,
fan_id INT,
match_id INT,
FOREIGN KEY (fan_id) REFERENCES Fan (national_id),
FOREIGN KEY (match_id) REFERENCES Match (id),
);

END;

EXEC createAllTables;

--------------------------------------------------
--Part b

GO

CREATE PROCEDURE dropAllTables
AS
BEGIN

DROP TABLE SystemAdmin;
DROP TABLE SportAssociationManager;
DROP TABLE HostRequest;
DROP TABLE Ticket;
DROP TABLE Match;
DROP TABLE Fan;
DROP TABLE ClubRepresentative;
DROP TABLE Club;
DROP TABLE StadiumManager;
DROP TABLE Stadium;
DROP TABLE SystemUser;

END;

GO;

EXEC dropAllTables;

--------------------------------------------------
--Part c
GO
CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
BEGIN
DROP PROCEDURE createAllTables;
DROP PROCEDURE dropAllTables;
DROP PROCEDURE clearAllTables;
DROP PROCEDURE addAssociationManager;
DROP PROCEDURE addNewMatch;
DROP PROCEDURE deleteMatch;
DROP PROCEDURE deleteMatchesOnStadium;
DROP PROCEDURE addClub;
DROP PROCEDURE AddTicket;
DROP PROCEDURE deleteClub;
DROP PROCEDURE addStadium;
DROP PROCEDURE deleteStadium;
DROP PROCEDURE blockFan;
DROP PROCEDURE unblockFan;
DROP PROCEDURE addRepresentative;
DROP PROCEDURE addHostRequest;
DROP PROCEDURE addStadiumManager;
DROP PROCEDURE acceptRequest;
DROP PROCEDURE RejectRequest;
DROP PROCEDURE addFan;
DROP PROCEDURE purchaseTicket;
DROP PROCEDURE updateMatchHost;
DROP PROCEDURE deleteMatchesOnStadium;
DROP VIEW allAssocManagers;
DROP VIEW allClubRepresentatives;
DROP VIEW allStadiumManagers;
DROP VIEW allFans;
DROP VIEW allMatches;
DROP VIEW allTickets;
DROP VIEW allCLubs;
DROP VIEW allStadiums;
DROP VIEW allRequests;
DROP VIEW clubsWithNoMatches;
DROP VIEW matchesPerTeam;
DROP VIEW clubsNeverMatched;
DROP FUNCTION viewAvailableStadiumsOn;
DROP FUNCTION allUnassignedMatches;
DROP FUNCTION allPendingRequests;
DROP FUNCTION upcomingMatchesOfClub;
DROP FUNCTION availableMatchesToAttend;
DROP FUNCTION clubsNeverPlayed;
DROP FUNCTION matchWithHighestAttendance;
DROP FUNCTION matchesRankedByAttendance;
DROP FUNCTION requestsFromClub;
END;
GO;

EXEC dropAllProceduresFunctionsViews;

--------------------------------------------------
--Part d
GO
CREATE PROCEDURE clearAllTables
AS
BEGIN
TRUNCATE TABLE SystemAdmin;
TRUNCATE TABLE SportAssociationManager;
TRUNCATE TABLE HostRequest;
TRUNCATE TABLE Ticket;
-- Cannot truncate : ( 
TRUNCATE TABLE Match;
TRUNCATE TABLE Fan;
TRUNCATE TABLE ClubRepresentative;
TRUNCATE TABLE Club;
TRUNCATE TABLE StadiumManager;
TRUNCATE TABLE Stadium;
TRUNCATE TABLE SystemUser;
--
END;
GO;

EXEC clearAllTables;
--------------------------------------------------
--2.2 BASic Data Retrieval
--Part a
GO
CREATE VIEW allAssocManagers AS
SELECT username,name 
FROM SportAssociationManager 

--Part b

GO
CREATE VIEW allClubRepresentatives AS
SELECT CR.username,CR.name,C.name AS Club 
FROM Club C INNER JOIN ClubRepresentative CR ON C.id = CR.club_id;

--Part c

GO
CREATE VIEW allStadiumManagers AS
SELECT SM.Username,SM.name,S.name AS Stadium
FROM Stadium S INNER JOIN StadiumManager SM ON S.id = SM.stadium_id;

--Part d

GO
CREATE VIEW allFans AS
SELECT name, national_id, birthdate, status
FROM Fan

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
SELECT h.status,s.name AS StadiumManager,cr.name AS ClubRepresentative
FROM HostRequest h
INNER JOIN StadiumManager s
ON h.stadium_manager_id = s.ID
INNER JOIN
ClubRepresentative cr
ON h.club_representative_id = cr.ID

-- 2.3 part (iv)
GO
CREATE VIEW clubsWithNoMatches AS
SELECT C.name 
FROM Club C
EXCEPT (
		SELECT *
		FROM Club
		WHERE Club.id = Match.club_1_id
		OR Club.id = Match.club_2_id
)

--------------------------------------------------
--2.3  All Other Requirements

-- Stored Procedures

-- (i)
GO
CREATE PROCEDURE addAssociationManager (@name VARCHAR(20), @username VARCHAR(20), @password VARCHAR(20)) AS

	INSERT INTO SportAssociationManager (name,  username,  password) VALUES (@name,  @username,  @password)

-- (ii)
GO
CREATE PROCEDURE addNewMatch (@firstClubName VARCHAR(20),  @secondClubName VARCHAR(20),  @hostClubName VARCHAR(20),  @startTime DATETIME) AS
	DECLARE @host_id VARCHAR(20), @guest_id	VARCHAR(20)

	SELECT @host_id = C.id
	FROM Club C
	WHERE C.name = @hostClubName
	

	SELECT @guest_id = C.id
	FROM Club C
	WHERE (C.name = @secondClubName AND C.name <> @hostClubName) OR (C.name = @firstClubName AND C.name <> @hostClubName) 
	
	INSERT INTO Match (host_id, guest_id, start_time) VALUES (@host_id, @guest_id, @startTime) 


-- (iii)
GO


