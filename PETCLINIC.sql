CREATE SCHEMA IF NOT EXISTS PETCLINIC;
USE PETCLINIC;

CREATE TABLE IF NOT EXISTS VET (
	VET_ID INT NOT NULL,
    F_NAME VARCHAR(30) NOT NULL,
    L_NAME VARCHAR(30) NOT NULL,
    ADDRESS VARCHAR(40),
    PHONE VARCHAR(15),
    SEX CHAR,
    PRIMARY KEY(VET_ID)
);

CREATE TABLE IF NOT EXISTS OWNER (
	OWNER_ID INT NOT NULL,
    F_NAME VARCHAR(30) NOT NULL,
    L_NAME VARCHAR(30) NOT NULL,
    ADDRESS VARCHAR(40),
    PHONE VARCHAR(15),
    SEX CHAR,
    PRIMARY KEY(OWNER_ID)
);

CREATE TABLE IF NOT EXISTS PET (
	PET_ID INT NOT NULL,
    OWNER_ID INT NOT NULL,
    PET_NAME VARCHAR(30) NOT NULL,
    DATE_OF_BIRTH DATE,
    BREED TEXT,
    SEX CHAR,
    PRIMARY KEY(PET_ID)
);

CREATE TABLE IF NOT EXISTS MEDICINE (
	MEDICINE_ID INT NOT NULL,
    NAME VARCHAR(30) NOT NULL,
    PRICE FLOAT,
    DESCRIPTION TEXT,
    PRIMARY KEY(MEDICINE_ID)
);

CREATE TABLE IF NOT EXISTS PRESCRIPTION (
	PRE_ID INT NOT NULL,
    DR_ID INT NOT NULL,
    MEDICINE_ID INT NOT NULL,
    TOTAL_PRICE FLOAT,
    PRIMARY KEY(PRE_ID)
);

CREATE TABLE IF NOT EXISTS DIAGNOSIS_RECORD (
	DR_ID INT NOT NULL,
    PET_ID INT NOT NULL,
    VET_ID INT NOT NULL,
    DATE_OF_RECORD DATE,
    DETAIL LONGTEXT,
    PRIMARY KEY(DR_ID)
);

ALTER TABLE DIAGNOSIS_RECORD ADD FOREIGN KEY (PET_ID) REFERENCES PET(PET_ID);
ALTER TABLE DIAGNOSIS_RECORD ADD FOREIGN KEY (VET_ID) REFERENCES VET(VET_ID);
ALTER TABLE PRESCRIPTION ADD FOREIGN KEY (DR_ID) REFERENCES DIAGNOSIS_RECORD(DR_ID);
ALTER TABLE PRESCRIPTION ADD FOREIGN KEY (MEDICINE_ID) REFERENCES MEDICINE(MEDICINE_ID);
ALTER TABLE PET ADD FOREIGN KEY (OWNER_ID) REFERENCES OWNER(OWNER_ID);
