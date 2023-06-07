/*RACE WINNERS*/

SELECT
    races.name,
    drivers.surname,
    constructors.name,
    results.number,
    results.grid,
    results.position,
    results.fastestLap,
    status
from
    results,
    status,
    races,
    drivers,
    constructors
where
    races.year > 1999
    and races.raceId = results.raceId
    and constructors.constructorId = results.constructorId
    and results.statusId = status.statusId
    and results.driverId = drivers.driverId
    and results.position < 2;

SELECT
    DISTINCT drivers.surname AS DRIVERS,
    drivers.dob AS DOB
from
    results,
    status,
    races,
    drivers,
    constructors
where
    races.raceId = results.raceId
    and constructors.constructorId = results.constructorId
    and results.statusId = status.statusId
    and results.driverId = drivers.driverId
    and results.position < 2;

SELECT
    COUNT(resultId) AS RaceWins
from
    results,
    races,
    drivers,
    constructors
where
    results.driverId = drivers.driverId
    and results.position < 2
    and drivers.driverId = 1;

SELECT
    races.name,
    races.date,
    drivers.surname,
    constructors.name,
    results.number,
    results.grid,
    results.position,
    results.fastestLapTime,
    status
from
    results,
    status,
    races,
    drivers,
    constructors
where
    races.raceId = results.raceId
    and constructors.constructorId = results.constructorId
    and results.statusId = status.statusId
    and results.driverId = drivers.driverId
    and drivers.driverRef = '"hamilton"'
ORDER BY races.year;

SELECT count(*)
from
    results,
    status,
    races,
    drivers,
    constructors
where
    races.year < 2021
    and races.raceId = results.raceId
    and constructors.constructorId = results.constructorId
    and results.statusId = status.statusId
    and results.driverId = drivers.driverId
    and drivers.driverRef = '"hamilton"'
    and results.position = 1;

SELECT races.name, drivers.surname, constructors.name, q1, q2, q3, races.year
from  races, drivers, constructors, qualifying
where races.raceId=qualifying.raceId and constructors.constructorId = qualifying.constructorId 
and qualifying.driverId = drivers.driverId and !(q3= '' or q3= '""') 
and races.year >= 2014 and races.year <= 2021 ORDER BY races.year;