/* Populate database with sample data. */

--Populate to created table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon',DATE '2020-03-02', 0, true, 10.23),
('Gabumon',DATE '2018-03-02', 2, true, 8),
('Pikachu',DATE '2021-01-07', 1, false, 15.04),
('Devimon',DATE '2017-05-12', 5, true, 11);

--Populate to created table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmanda',DATE '2020-02-08', 0, false, 11),
('Plantmon',DATE '2021-11-15', 2, true, 5.7),
('Squirtle',DATE '1993-04-02', 3, true, 12.13),
('Angemon',DATE '2005-06-12', 1, true, 45),
('Boarmon',DATE '2005-06-07', 7, true, 20.4),
('Blossom',DATE '1998-10-13', 3, true, 17),
('Ditto',DATE '2022-05-14', 4, true, 22);

-- add data to owners table

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester',14),
('Jodie Whittaker', 38);
select * from owners;

-- Insert the following data into the species table

INSERT INTO species (name) VALUES
 ('Pokemon'),
 ('Digimon');
 UPDATE animals
 SET species_id =
   CASE
      WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
	  ELSE (SELECT id FROM species WHERE name = 'Pokemon')
   END;
   select * from species;

-- add sam smith owner information to animal table
  UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';

-- add Jenifer as owner from owner table to animal table
UPDATE animals
SET owner_id = owners.id
FROM owners 
Where animals.name = 'Gabumon' AND owners.full_name = 'Jennifer Orwell' or
      animals.name = 'Pikachu' AND owners.full_name = 'Jennifer Orwell';
select * from animals;

UPDATE animals
SET owner_id = owners.id
FROM owners 
Where animals.name = 'Devimon' AND owners.full_name = 'Bob' or
      animals.name = 'Plantmon' AND owners.full_name = 'Bob';
select * from animals;

UPDATE animals
SET owner_id = owners.id
FROM owners 
Where animals.name = 'Chamander' AND owners.full_name = 'Melody Pond' or
      animals.name = 'Squirtle' AND owners.full_name = 'Melody Pond' or
      animals.name = 'Blossom' AND owners.full_name = 'Melody Pond'
select * from animals;

UPDATE animals
SET owner_id = owners.id
FROM owners 
Where animals.name = 'Angemon' AND owners.full_name = 'Dean Winchester' or
      animals.name = 'Boarmon' AND owners.full_name = 'Dean Winchester';
select * from animals;

-- add data to vet

INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-- add data for many to many relationship in the helper table specialization
INSERT INTO specializations (species_id,vets_id)
VALUES 
     ((SELECT id from species  WHERE species.name = 'Pokemon'),
		(SELECT id from vets WHERE vets.name = 'William Tatcher')),
     ((SELECT id from species  WHERE species.name = 'Pokemon'),
		(SELECT id from vets WHERE vets.name = 'Stephanie Mendez')),
		((SELECT id from species  WHERE species.name = 'Digimon'),
		(SELECT id from vets WHERE vets.name = 'Stephanie Mendez')),
		((SELECT id from species  WHERE species.name = 'Digimon'),
		(SELECT id from vets WHERE vets.name = 'Jack Harkness'));


--add diiferent visit data  to visit table
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES 
    ((SELECT id FROM animals WHERE name = 'Agumon'),
     (SELECT id FROM vets WHERE name = 'William Tatcher'),
     '2020-05-24'),

    ((SELECT id FROM animals WHERE name = 'Agumon'),
     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
     '2020-07-22'),

    ((SELECT id FROM animals WHERE name = 'Gabumon'),
     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
     '2021-02-02'),

    ((SELECT id FROM animals WHERE name = 'Pikachu'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2020-01-05'),

    ((SELECT id FROM animals WHERE name = 'Pikachu'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2020-03-08'),

    ((SELECT id FROM animals WHERE name = 'Pikachu'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2020-05-14'),

    ((SELECT id FROM animals WHERE name = 'Devimon'),
     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
     '2021-05-04'),

    ((SELECT id FROM animals WHERE name = 'Charmander'),
     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
     '2021-02-24'),

    ((SELECT id FROM animals WHERE name = 'Plantmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2019-12-21'),

    ((SELECT id FROM animals WHERE name = 'Plantmon'),
     (SELECT id FROM vets WHERE name = 'William Tatcher'),
     '2020-08-10'),

    ((SELECT id FROM animals WHERE name = 'Plantmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2021-04-07'),

    ((SELECT id FROM animals WHERE name = 'Squirtle'),
     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
     '2019-09-29'),

    ((SELECT id FROM animals WHERE name = 'Angemon'),
     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
     '2020-10-03'),

    ((SELECT id FROM animals WHERE name = 'Angemon'),
     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
     '2020-11-04'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2019-01-24'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2019-05-15'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2020-02-27'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'),
     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
     '2020-08-03'),

    ((SELECT id FROM animals WHERE name = 'Blossom'),
     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	 '2020-05-24'),
	 ((SELECT id FROM animals WHERE name = 'Blossom'),
     (SELECT id FROM vets WHERE name = 'William Tatcher'),
	 '2021-01-11');
	 select * from visits;

     