--
-- Database Table Creation
--
-- This file will create the tables for use with the book 
-- Database Management Systems by Raghu Ramakrishnan and Johannes Gehrke.
-- It is run automatically by the installation script.
--
-- by: Wanxing (Sarah) Xu
--
-- First drop any existing tables. Any errors are ignored.
--
DROP TABLE Department CASCADE;
DROP TABLE Appointment CASCADE;
DROP TABLE Located CASCADE;
DROP TABLE Books CASCADE;
DROP TABLE Attended CASCADE;
DROP TABLE Patients CASCADE;
--
-- Now, add each table.
--

CREATE TABLE Patients (
	PID CHAR(12),
	PName STRING,
	Gender STRING,
	Address STRING,
	Age INTEGER,
	TotalApt INTEGER,
	PRIMARY KEY (PID)
);

CREATE TABLE Department (
	DID CHAR(12),
	Specialty STRING,
	PRIMARY KEY (DID)
);

CREATE TABLE Appointment (
	AptNo CHAR(12),
	Date DATETIME,
	PRIMARY KEY (AptNo)
);

CREATE TABLE Located (
	AptNo CHAR(12),
	DID CHAR(12),
	PRIMARY KEY(AptNo, DID),
	FOREIGN KEY (AptNo) REFERENCES Appointment,
	FOREIGN KEY (DID) REFERENCES Department 
);

CREATE TABLE Books (
	PID CHAR(12),
	AptNo CHAR(12),
	isActive BOOLEAN NOT NULL,
	PRIMARY KEY(PID, AptNo),
	FOREIGN KEY (PID) REFERENCES Patients,
	FOREIGN KEY (AptNo) REFERENCES Appointment
);

CREATE TABLE Attended (
	PID CHAR(12),
	AptNo CHAR(12),
	PRIMARY KEY(PID, AptNo),
	FOREIGN KEY (PID) REFERENCES Patients,
	FOREIGN KEY (AptNo) REFERENCES Appointment
);



--
COPY Department(
	DID,
	Specialty)
FROM 'Department.txt'
WITH DELIMITER ';';

COPY Appointment (
	AptNo,
	Date)
FROM 'Appointment.txt'
WITH DELIMITER ',';

COPY Located (
	AptNo,
	DID)
FROM 'Located.txt'
WITH DELIMITER ',';

COPY Books(
	PID,
	AptNo,
	isActive)
FROM 'Books.txt'
WITH DELIMITER ',';


COPY Attended(
	PID,
	AptNo)
FROM 'Attended.txt'
WITH DELIMITER ',';

COPY Patients(
	PID,
	PName,
	Gender,
	Address,
	Age,
	TotalApt)
FROM 'Patients.txt'
WITH DELIMITER ',';
