-- Create the "disease_dw" schema
CREATE SCHEMA disease_dw;

-- Set the search path to include the new schema
SET search_path TO disease_dw, public;

-- Create dimension tables
CREATE TABLE PatientDim (
    PatientID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE
);

CREATE TABLE DoctorDim (
    DoctorID SERIAL PRIMARY KEY,
    DocFirstName VARCHAR(50),
    DocLastName VARCHAR(50),
    Specialty VARCHAR(50)
);

CREATE TABLE NurseDim (
    NurseID SERIAL PRIMARY KEY,
    NurFirstName VARCHAR(50),
    NurLastName VARCHAR(50)
);

CREATE TABLE DiseaseDim (
    DiseaseID SERIAL PRIMARY KEY,
    DiseaseName VARCHAR(50),
    DiseaseType VARCHAR(50)
);

CREATE TABLE MedicationDim (
    MedicationID SERIAL PRIMARY KEY,
    MedicationName VARCHAR(50),
    MedDosage VARCHAR(20)
);

CREATE TABLE VaccineDim (
    VaccineID SERIAL PRIMARY KEY,
    VaccineName VARCHAR(50),
    Manufacture VARCHAR(50),
    Efficiency DECIMAL(5, 2),
    VaccineDosage VARCHAR(20)
);

CREATE TABLE WardDim (
    WardID SERIAL PRIMARY KEY,
    WardName VARCHAR(50)
);

-- Create fact tables
CREATE TABLE TreatmentFact (
    TreatmentID SERIAL PRIMARY KEY,
    Plan VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    PatientID INT REFERENCES PatientDim(PatientID),
    DoctorID INT REFERENCES DoctorDim(DoctorID),
    DiseaseID INT REFERENCES DiseaseDim(DiseaseID),
    MedicationID INT REFERENCES MedicationDim(MedicationID),
    NurseID INT REFERENCES NurseDim(NurseID),
    VaccineID INT REFERENCES VaccineDim(VaccineID),
    WardID INT REFERENCES WardDim(WardID)
);

CREATE TABLE AppointmentFact (
    AppointmentID SERIAL PRIMARY KEY,
    Date DATE,
    Time TIME,
    PatientID INT REFERENCES PatientDim(PatientID),
    DoctorID INT REFERENCES DoctorDim(DoctorID),
    TreatmentID INT REFERENCES TreatmentFact(TreatmentID)
);

