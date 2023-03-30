/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial primary key,
	name varchar(50),
	date_of_birth date,
	escape_attempts INT,
	neutered boolean,
	weight_kg decimal
);
