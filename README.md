# Hospital-Disease-Track-Warehouse_ETL

# 🏥 Business Problem Definition:

In modern healthcare facilities, managing patient records, diseases, treatments, medications, and vaccination histories efficiently is essential to ensure high-quality care.
However, hospitals often struggle with disparate data sources, manual tracking, and limited integration between treatment plans, patient diagnostics, and vaccination history.

This project addresses these issues by developing a comprehensive **PostgreSQL-based Disease Management System**
that not only handles operational data but also supports **analytical reporting** through a dimensional data warehouse.

---

## Steps :

- ER Model & Data Dictionary
- OLTP schema with referential integrity
- Dimensional Modeling using Kimball's methodology
- ELT processes to populate data warehouse
- Analytical SQL queries

## 🧱 Technologies Used
- PostgreSQL
- dbSchema / draw.io

## 🎯 Objective
The primary goal of this project is to design and implement a robust, scalable healthcare database system that:

- Stores detailed records of patients, doctors, nurses, diseases, medications, vaccines, treatments, and appointments.
- Tracks many-to-many relationships like patients,## disease history and vaccination records.
- Supports operational needs such as scheduling appointments and assigning wards and treatments.
- Enables healthcare administrators to generate insights and reports using analytical queries and dashboards.

---

## ✅ Key Use Cases

### 1. Operational Use Cases (OLTP):
- Schedule and manage appointments between patients and doctors.
- Track medications prescribed for a particular disease per patient.
- Record vaccination history for patients and measure coverage.
- Assign nurses to hospital wards and link them to treatment plans.
- Capture and update patient demographics and contact information.

### 2. Analytical Use Cases (OLAP/DW):
- Analyze trends in disease incidence and treatment effectiveness.
- Monitor ward occupancy and patient distribution by gender/age.
- Evaluate doctor performance based on number of appointments.
- Compute average vaccine efficiency across manufacturers.
- Measure number of patients treated for specific disease types.

## 💡 Business Impact

This integrated system enhances **clinical decision-making**, supports **regulatory reporting**,
and enables **data-driven insights**. By implementing a normalized OLTP model alongside a dimensional warehouse,
the hospital can:

- Improve patient care coordination.
- Optimize resource (doctor, nurse, medication) allocation.
- Enable public health monitoring of diseases and vaccinations.
- Foster research and predictive analytics around disease outcomes.

---

## 🧠 Future Enhancements

- Integration with external Electronic Health Record (EHR) systems.
- Real-time streaming data ingestion via AWS Kinesis or Kafka.
- Predictive analytics using machine learning on historical treatment outcomes.
- Role-based access and HIPAA-compliant data security measures.

