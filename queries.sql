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
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT TRANSACTION;


BEGIN;
delete from animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animal_save1;
select * from animals

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

-- display info from owner melody pond by join 
SELECT  owners.full_name as owner_fullname , animals.name as animal_name from animals 
INNER join owners on animals.owner_id=owners.id
where owners.full_name ='Melody Pond';

SELECT   animals.name as animal_name, species.name as species_name  from animals 
inner join species on animals.species_id=species.id
where species.name ='Pokemon';

--display all owners even those with no animal
SELECT   owners.full_name as owners_fullname , animals.name as animal_name from animals 
full join owners on animals.owner_id=owners.id;

--display by specie name and number of animals for each specie
SELECT  species.name as species_name, count(animals.name) as animals_number from animals 
inner join species on animals.species_id=species.id
group by species.name;

-- display jennifer orwell animals with specie digimon
SELECT   owners.full_name as owners_fullname , animals.name as animal_name, species.name as species_name from animals 
inner join owners on animals.owner_id=owners.id
inner join species on animals.species_id=species.id
where owners.full_name ='Jennifer Orwell' and species.name='Digimon';

-- display dean winchester animals with no escape 
SELECT  owners.full_name as owners_fullname , animals.name as animal_name, animals.escape_attempts from animals 
inner join owners on animals.owner_id=owners.id
where owners.full_name ='Dean Winchester'and animals.escape_attempts =0;

-- display who owns the next animals 
SELECT  owners.full_name as owners_fullname, count(animals.name) as animals_number from animals 
full join owners on animals.owner_id=owners.id
group by owners.full_name
order by animals_number desc;

--last animal seen by thatcher
select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='William Tatcher'
order by date_of_visit desc
limit 1

-- different animals stephanie saw  
select DISTINCT   *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Stephanie Mendez';

-- vet and specialties 
select  *  from vets 
left join specializations on specializations.vets_id=vets.id
left join species on species.id =specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Stephanie Mendez' and date_of_visit between '2020-04-01' and '2020-04-30'

-- animal has the most visits to vets
select  animals.name as animal_name, count( animals.name) as number_of_visited from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
group by animals.name 
order by  number_of_visited desc

-- Maisy Smith's first visit?
select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
where  vets.name ='Maisy Smith'
order by date_of_visit asc
limit 1

-- most recent visit: animal information, vet information, and date of visit.
select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
order by date_of_visit desc
limit 1

--  visits  with  vet that did not specialize in that animal's species
select  count(visits.id) as number_of_vists  from animals
inner join visits on visits.animals_id =animals.id
inner join vets on vets.id=visits.vets_id
left join specializations on specializations.vets_id=vets.id
where specializations.species_id is  null;

-- Optimizing the database:

-- query 1

SELECT COUNT(*) FROM visits where animal_id = 4;

-- optimise

CREATE INDEX animal_id_index ON visits (animal_id);
-- query 2

SELECT * FROM visits where vet_id = 2;

-- optimise

CREATE INDEX vet_id_index ON visits (vet_id);
--query 3

SELECT * FROM owners where email = 'owner_18327@mail.com';

-- optimise

CREATE INDEX email_index ON owners (email);

