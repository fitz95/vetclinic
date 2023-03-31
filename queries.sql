/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gaburon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- edit Table 
START TRANSACTION;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
COMMIT TRANSACTION;


BEGIN;
delete from animals;
SELECT species from animals;
ROLLBACK;
SELECT species from animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animal_save1;
select * from animals
 update animals set weight_kg =weight_kg * -1;
 Rollback to savepoint animal_save1;
 update animals set weight_kg =weight_kg * -1 where weight_kg <0;
commit;

COMMIT;

-- get number of animals 
SELECT COUNT(*) num_of_animals from animals;
SELECT COUNT(*) never_escaped from animals where escape_attempts = 0;
SELECT AVG(weight_kg) from animals;

-- who escapes the most , neutered or not neutered 
SELECT neutered as neutered_animals ,
SUM( escape_attempts) as total_attempted_escapes
FROM animals GROUP BY neutered ORDER BY total_attempted_escapes DESC; 
-- Maximum and Minimum weight Each Type 
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
-- average escape number per animal type
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2020-01-01'
GROUP BY species;

