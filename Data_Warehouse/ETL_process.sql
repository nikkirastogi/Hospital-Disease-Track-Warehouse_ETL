-- Extract and Load Patient Dimension
INSERT INTO disease_dw.PatientDim (PatientID, FirstName, LastName, Gender, DOB)
SELECT PatientID, FirstName, LastName, Gender, DOB
FROM public.Patients;


-- Extract and Load Doctor Dimension
INSERT INTO disease_dw.DoctorDim (DoctorID, DocFirstName, DocLastName, Specialty)
SELECT DoctorID, DocFirstName, DocLastName, Specialty
FROM public.Doctors;


-- Extract and Load Nurse Dimension
INSERT INTO disease_dw.NurseDim (NurseID, NurFirstName, NurLastName)
SELECT NurseID, NurFirstName, NurLastName
FROM public.Nurses;

-- Extract and Load Ward Dimension
INSERT INTO disease_dw.WardDim (WardID, WardName)
SELECT WardID, WardName
FROM public.Hospital_Wards;

-- Extract and Load Disease Dimension
INSERT INTO disease_dw.DiseaseDim (DiseaseID, DiseaseName, DiseaseType)
SELECT DiseaseID, DiseaseName, DiseaseType
FROM public.Diseases;

-- Extract and Load Medication Dimension
INSERT INTO disease_dw.MedicationDim (MedicationID, MedicationName, MedDosage)
SELECT MedicationID, MedicationName, MedDosage
FROM public.Medications;

-- Extract and Load Vaccine Dimension
INSERT INTO disease_dw.VaccineDim (VaccineID, VaccineName, Manufacture, Efficiency, VaccineDosage)
SELECT VaccineID, VaccineName, Manufacture, Efficiency, VaccineDosage
FROM public.Vaccine;

-- Extract and Load Treatment Fact
INSERT INTO disease_dw.TreatmentFact (TreatmentID, Plan, StartDate, EndDate, DoctorID, DiseaseID, MedicationID, NurseID)
SELECT
    t.TreatmentID, t.Plan, t.StartDate, t.EndDate,
    d.DoctorID, dis.DiseaseID, m.MedicationID, n.NurseID
FROM
    public.Treatments t 
    JOIN public.Doctors d ON t.DoctorID = d.DoctorID
    JOIN public.Diseases dis ON t.DiseaseID = dis.DiseaseID
    JOIN public.Medications m ON t.MedicationID = m.MedicationID
    JOIN public.Nurses n ON t.NurseID = n.NurseID;
Select * from disease_dw.TreatmentFact

-- Extract and Load Appointment Fact
INSERT INTO disease_dw.AppointmentFact (AppointmentID, Date, Time, PatientID, DoctorID, TreatmentID)
SELECT
    a.AppointmentID, a.Date, a.Time,
    p.PatientID, d.DoctorID, t.TreatmentID
FROM
    public.Appointments a
    JOIN public.Patients p ON a.PatientID = p.PatientID
    JOIN public.Doctors d ON a.DoctorID = d.DoctorID
    JOIN public.Treatments t ON a.TreatmentID = t.TreatmentID;










