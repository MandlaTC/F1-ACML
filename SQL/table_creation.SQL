
CREATE TABLE status(statusId INT NOT NULL, status VARCHAR(255) NOT NULL, Primary Key(statusId));

CREATE TABLE seasons(year INT, url VARCHAR(255));

CREATE TABLE circuits(circuitId INT NOT NULL, circuitRef VARCHAR(255), 
name VARCHAR(255), location VARCHAR(255), 
country VARCHAR(255), lat INT, lng INT, alt INT, 
url VARCHAR(255), PRIMARY KEY(circuitId));

CREATE TABLE constructors(constructorId INT NOT NULL, 
constructorRef VARCHAR(255), name VARCHAR(255), 
nationality VARCHAR(255), url VARCHAR(255), 
PRIMARY KEY(constructorId));

CREATE TABLE races (raceId INT NOT NULL, year INT, 
round INT, circuitID INT, name VARCHAR(255), 
date VARCHAR(255), time VARCHAR(255), url VARCHAR(255),
Primary Key (raceId), 
FOREIGN KEY(circuitId) REFERENCES circuits(circuitID));

CREATE TABLE drivers(driverId INT NOT NULL, driverRef VARCHAR(255), 
number INT, code VARCHAR(255), forename VARCHAR(255), surname VARCHAR(255),
dob VARCHAR(255), nationality VARCHAR(255), url VARCHAR(255),
Primary Key(driverId));

CREATE TABLE constructor_results(constructorResultsId INT NOT NULL, 
raceID INT NOT NULL, constructorId INT NOT NULL, points INT,
Primary Key(constructorResultsId), 
FOREIGN KEY (raceId) REFERENCES races(raceID),
FOREIGN KEY (constructorId) REFERENCES constructors(constructorId));

CREATE TABLE constructor_standings(constructorStandingsId INT NOT NULL, 
raceID INT NOT NULL, constructorId INT NOT NULL, points INT, position INT,
positionText VARCHAR(255), wins INT,
Primary Key(constructorStandingsId), 
FOREIGN KEY (raceId) REFERENCES races(raceID),
FOREIGN KEY (constructorId) REFERENCES constructors(constructorId));

CREATE TABLE driver_standings(driverStandingsId INT NOT NULL,
raceId INT NOT NULL, driverId INT NOT NULL, points INT, 
position INT, positionText VARCHAR(255), wins INT, 
Primary Key(driverStandingsId),
FOREIGN KEY (raceId) REFERENCES races(raceId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId));

CREATE TABLE lap_times(raceId INT NOT NULL, 
driverId INT NOT NULL, lap INT, position INT, time VARCHAR(255), 
milliseconds INT,
FOREIGN KEY (raceId) REFERENCES races(raceId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId));

CREATE TABLE pit_stops(raceId INT NOT NULL, 
driverId INT NOT NULL, stop INT, lap INT,
time VARCHAR(255), duration DECIMAL(12,3),
FOREIGN KEY (raceId) REFERENCES races(raceId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId));

CREATE TABLE qualifying(qualifyingId INT NOT NULL,
raceId INT NOT NULL, driverId INT NOT NULL,
constructorId INT NOT NULL, number INT, position INT, 
q1 VARCHAR(255), q2 VARCHAR(255), q3 VARCHAR(255),
PRIMARY KEY (qualifyingId),
FOREIGN KEY (raceId) REFERENCES races(raceId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId),
FOREIGN KEY (constructorId) REFERENCES constructors(constructorId));


CREATE TABLE results(resultId INT NOT NULL,
raceId INT NOT NULL, driverId INT NOT NULL, constructorId INT NOT NULL,
number INT, grid INT, position INT, positionText VARCHAR(255),
positionOrder INT, points INT, laps INT, time VARCHAR(255),
milliseconds INT, fastestLap INT, ranking INT,
fastestLapTime VARCHAR(255), fastestLapSpeed VARCHAR(255),
statusId INT NOT NULL,
PRIMARY KEY (resultId),
FOREIGN KEY (raceId) REFERENCES races(raceId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId),
FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
FOREIGN KEY (statusId) REFERENCES status(statusId));