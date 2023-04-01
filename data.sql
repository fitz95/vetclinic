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