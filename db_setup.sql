
/*
-- Drop table commands
DROP TABLE student_trans;
DROP TABLE student_info;
DROP TABLE class_by_quarter;
DROP TABLE classes;
DROP TABLE individual_programs;
DROP TABLE fields_of_study;
DROP TABLE colleges;
*/

-- Table Setup
-- Table containing University/College names
CREATE TABLE college(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

-- Table containing fields of study
CREATE TABLE fields_of_study(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	program_id VARCHAR(10) UNIQUE,
	parent_college INTEGER REFERENCES college(id)
);

-- Table containing programs of study at universities 
CREATE TABLE individual_programs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	program_id VARCHAR(10) UNIQUE,
	parent_field VARCHAR(10) REFERENCES fields_of_study(program_id)
);

-- Table containing all classes
CREATE TABLE classes(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	class_id VARCHAR(10) UNIQUE
);

-- Table containg possible quarters
CREATE TABLE class_by_quarter(
	id SERIAL PRIMARY KEY,
	class_id VARCHAR(10) REFERENCES classes(class_id),
	year INTEGER,
	quarter VARCHAR CHECK (quarter IN ('Spring', 'Summer', 'Fall', 'Winter'))
);

-- Table containing student information
CREATE TABLE student_info(
	student_id INTEGER PRIMARY KEY,
	name VARCHAR(50),
	program_id VARCHAR(10) REFERENCES individual_programs(program_id),
	transcript_id INTEGER UNIQUE NOT NULL
);

-- Table containing student transcripts
CREATE TABLE student_trans(
	transcript_id INTEGER PRIMARY KEY REFERENCES student_info(transcript_id),
	year INTEGER,
	quarter VARCHAR CHECK (quarter IN ('Spring', 'Summer', 'Fall', 'Winter')),
	class_id VARCHAR(10) REFERENCES classes(class_id)
);


/*
-- Data Entry
INSERT INTO available_quarters(year, quarter)
VALUES 
	(2019, 'Spring');
*/