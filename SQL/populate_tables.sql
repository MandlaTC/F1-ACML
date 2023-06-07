DELETE FROM qualifying;

DELETE FROM results;

DELETE FROM pit_stops;

DELETE FROM lap_times;

DELETE FROM constructor_results;

DELETE FROM constructor_standings;

DELETE FROM driver_standings;

DELETE FROM races;

DELETE FROM constructors;

DELETE FROM drivers;

DELETE FROM circuits;

DELETE FROM seasons;

DELETE FROM status;

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/status.csv' INTO
TABLE
    f1.status FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/seasons.csv' INTO
TABLE
    f1.seasons FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/circuits.csv' INTO
TABLE
    f1.circuits FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/drivers.csv' INTO
TABLE
    f1.drivers FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/constructors.csv' INTO
TABLE
    f1.constructors FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/races.csv' INTO
TABLE
    f1.races FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/driver_standings.csv' INTO
TABLE
    f1.driver_standings FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/constructor_standings.csv' INTO
TABLE
    f1.constructor_standings FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/constructor_results.csv' INTO
TABLE
    f1.constructor_results FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/lap_times.csv' INTO
TABLE
    f1.lap_times FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/pit_stops.csv' INTO
TABLE
    f1.pit_stops FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/results.csv' INTO
TABLE
    f1.results FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/Users/mandlachavarika/Desktop/Development/School-Repos/2023/ACML/Project/RaceData/archive-2/qualifying.csv' INTO
TABLE
    f1.qualifying FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';