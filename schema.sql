/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial primary key,
	name varchar(50),
	date_of_birth date,
	escape_attempts INT,
	neutered boolean,
	weight_kg decimal
);

-- add species by updating table animal

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- create a new table owners
CREATE TABLE owners
(
    id SERIAL  primary key,
    full_name VARCHAR(250) ,
    age  INT
);

-- create a table species 
CREATE TABLE species
(
    id SERIAL primary key,
    name VARCHAR(250)
);

--Modify animals table:
ALTER TABLE animals DROP COLUMN species;  
--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD COLUMN species_id INT
CONSTRAINT fk_animals_species
REFERENCES species (id); 
--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD COLUMN owner_id INT
CONSTRAINT fk_animals_owners
REFERENCES owners (id);

-- create a table vets 
CREATE TABLE vets(
    id serial primary key,
    name TEXT ,
    age  integer,
	date_of_graduation date
);

-- create a helper table specializtion for the many to many relationship
CREATE TABLE specializations(
  id serial primary key, 
  species_id int  references species(id) ,
  vets_id int  references vets(id)
);
select * from specializations;

-- create helper table visit for many to many relationship
CREATE TABLE visits (
     id serial primary key,
     animals_id INTEGER references animals(id),
     vets_id INTEGER references vets(id),
    date_of_visit date
);
select * from visits;

--Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);