/*
-- Drop table commands
DROP TABLE college_programs;
DROP TABLE colleges;
*/

-- Table Setup
-- Table containing University/College names
CREATE TABLE colleges(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

-- Table containing programs of study at universities 
CREATE TABLE college_programs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	college INTEGER REFERENCES colleges(id)
);

CREATE TABLE available_quarters(
	id SERIAL PRIMARY KEY,
	year INTEGER,
	quarter VARCHAR CHECK (quarter IN ('Spring', 'Summer', 'Fall', 'Winter'))
);

-- Data Entry
INSERT INTO available_quarters(year, quarter)
VALUES 
	(2019, 'Spring');