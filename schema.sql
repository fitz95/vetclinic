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

--create table owners

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(200),
	age INT
);


--create table species
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR (200)
);

-- alter table to add foreign key
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);
SELECT * FROM animals;

