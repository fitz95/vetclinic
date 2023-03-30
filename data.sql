/* Populate database with sample data. */

--Populate to created table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon',DATE '2020-03-02', 0, true, 10.23),
('Gabumon',DATE '2018-03-02', 2, true, 8),
('Pikachu',DATE '2021-01-07', 1, false, 15.04),
('Devimon',DATE '2017-05-12', 5, true, 11);