-- Create Patients table
CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(20),
    Address VARCHAR(100)
);

-- Create Diseases table
CREATE TABLE Diseases (
    DiseaseID SERIAL PRIMARY KEY,
    DiseaseName VARCHAR(50),
    DiseaseType VARCHAR(50)
);

-- Create Medications table
CREATE TABLE Medications (
    MedicationID SERIAL PRIMARY KEY,
    MedicationName VARCHAR(50),
    MedDosage VARCHAR(20)
);

-- Create Vaccine table
CREATE TABLE Vaccine (
    VaccineID SERIAL PRIMARY KEY,
    VaccineName VARCHAR(50),
    Manufacture VARCHAR(50),
    Efficiency DECIMAL(5, 2),
    VaccineDosage VARCHAR(20)
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    DocFirstName VARCHAR(50),
    DocLastName VARCHAR(50),
    Specialty VARCHAR(50),
    Contact VARCHAR(20)
);
-- Create Nurses table
CREATE TABLE Nurses (
    NurseID SERIAL PRIMARY KEY,
    NurFirstName VARCHAR(50),
    NurLastName VARCHAR(50),
    Contact VARCHAR(20)
);
-- Create Treatments table
CREATE TABLE Treatments (
    TreatmentID SERIAL PRIMARY KEY,
    Plan VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);
-- Create Hospital_Wards table
CREATE TABLE Hospital_Wards (
    WardID SERIAL PRIMARY KEY,
    WardName VARCHAR(50)
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID SERIAL PRIMARY KEY,
    Date DATE,
    Time TIME
);

-- Create PatientDiseases table for many-to-many relationship
CREATE TABLE PatientDiseases (
    PatientID INT NOT NULL,
    DiseaseID INT NOT NULL,
    PRIMARY KEY (PatientID, DiseaseID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID)
);

-- Create PatientVaccines table for many-to-many relationship
CREATE TABLE PatientVaccines (
    PatientID INT NOT NULL,
    VaccineID INT NOT NULL,
    PRIMARY KEY (PatientID, VaccineID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID)
);

-- Alter Patients table to add a foreign key for a one-to-many relationship with Hospital_Wards
ALTER TABLE Patients
ADD COLUMN WardID INT NOT NULL,
ADD FOREIGN KEY (WardID) REFERENCES Hospital_Wards(WardID);

-- Alter Treatments table to add foreign keys for one-to-many relationships with Doctors, Diseases, Medications, Nurses
ALTER TABLE Treatments
ADD COLUMN DoctorID INT NOT NULL,
ADD COLUMN DiseaseID INT NOT NULL,
ADD COLUMN MedicationID INT NOT NULL,
ADD COLUMN NurseID INT NOT NULL,
ADD FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
ADD FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID),
ADD FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID),
ADD FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID);

-- Alter Hospital_Wards table to add a foreign key for a one-to-many relationship with Nurses table
ALTER TABLE Hospital_Wards
ADD COLUMN NurseID INT NOT NULL,
ADD FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID);

-- Alter Medications table to add foreign key references to Patients, Doctors, Diseases
ALTER TABLE Medications
ADD COLUMN PatientID INT NOT NULL,
ADD COLUMN DoctorID INT NOT NULL,
ADD COLUMN DiseaseID INT NOT NULL,
ADD FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
ADD FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
ADD FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID);

-- Add foreign keys to Appointments for one-to-many relationships with Patients, Doctors, Treatments
ALTER TABLE Appointments
ADD PatientID INT NOT NULL,
ADD DoctorID INT NOT NULL,
ADD TreatmentID INT NOT NULL,
ADD FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
ADD FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
ADD FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID);
