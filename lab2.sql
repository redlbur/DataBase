CREATE DATABASE lab_2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INTEGER DEFAULT NULL,
  population INTEGER
);

INSERT INTO countries VALUES (1, 'Kyrgyzstan', 1, 65000000);

INSERT INTO countries (country_id, country_name) VALUES (2, 'Georgia');

INSERT INTO countries (country_name,region_id, population)VALUES ('USA', DEFAULT , 123000000);

INSERT INTO countries VALUES (DEFAULT, 'Russia', 12, 34),
(DEFAULT, 'Turkey', 13, 35),(DEFAULT, 'KZ', 14, 36);

ALTER TABLE countries ALTER country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries VALUES (DEFAULT, DEFAULT, 15, 37);

ALTER TABLE countries ALTER region_id SET DEFAULT 55;
ALTER TABLE countries ALTER population SET DEFAULT 50000000;
INSERT INTO countries VALUES (DEFAULT,DEFAULT,DEFAULT, DEFAULT);

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING*;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new USING countries WHERE countries_new.country_id = countries.country_id RETURNING*;

DELETE FROM countries;

SELECT * FROM countries;