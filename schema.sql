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

CREATE TABLE owners
(
    id SERIAL  primary key,
    full_name VARCHAR(250) ,
    age  INT
);

CREATE TABLE species
(
    id SERIAL primary key,
    name VARCHAR(250)
);