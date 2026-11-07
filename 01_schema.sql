-- CROWNFIELD EYE HOSPITAL | GROUP SHARED | MySQL 8.0.16+ (CHECK constraints enforced)
-- WARNING: This is a rebuild script. Running it deletes crownfield_eye_demo data.
DROP DATABASE IF EXISTS crownfield_eye_demo;
CREATE DATABASE crownfield_eye_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE crownfield_eye_demo;

CREATE TABLE specialties (
 specialty_id INT PRIMARY KEY,
 specialty_name VARCHAR(90) NOT NULL UNIQUE
);
CREATE TABLE clinics (
 clinic_id INT PRIMARY KEY,
 clinic_name VARCHAR(100) NOT NULL UNIQUE,
 area VARCHAR(90) NOT NULL
);
CREATE TABLE patients (
 patient_id VARCHAR(12) PRIMARY KEY,
 full_name VARCHAR(100) NOT NULL,
 postcode VARCHAR(12) NOT NULL,
 date_of_birth DATE NULL,
 phone_ciphertext VARBINARY(255) NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE clinicians (
 clinician_id INT PRIMARY KEY,
 full_name VARCHAR(100) NOT NULL,
 specialty_id INT NOT NULL,
 work_email VARCHAR(150) NOT NULL UNIQUE,
 CONSTRAINT fk_clinician_specialty FOREIGN KEY(specialty_id) REFERENCES specialties(specialty_id)
);
CREATE TABLE appointments (
 appointment_id INT PRIMARY KEY,
 patient_id VARCHAR(12) NOT NULL,
 clinician_id INT NOT NULL,
 clinic_id INT NOT NULL,
 appointment_date DATE NOT NULL,
 appointment_time TIME NOT NULL,
 duration_minutes SMALLINT NOT NULL DEFAULT 30,
 status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
 CONSTRAINT chk_duration CHECK(duration_minutes BETWEEN 10 AND 120),
 CONSTRAINT chk_appt_status CHECK(status IN ('Scheduled','Completed','Cancelled')),
 CONSTRAINT uq_clinician_start UNIQUE(clinician_id, appointment_date, appointment_time),
 CONSTRAINT fk_appt_patient FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
 CONSTRAINT fk_appt_clinician FOREIGN KEY(clinician_id) REFERENCES clinicians(clinician_id),
 CONSTRAINT fk_appt_clinic FOREIGN KEY(clinic_id) REFERENCES clinics(clinic_id)
);
CREATE TABLE diagnoses (
 diagnosis_id INT PRIMARY KEY,
 diagnosis_name VARCHAR(130) NOT NULL UNIQUE
);
CREATE TABLE appointment_diagnoses (
 appointment_id INT NOT NULL,
 diagnosis_id INT NOT NULL,
 clinical_note VARCHAR(220) NULL,
 PRIMARY KEY(appointment_id, diagnosis_id),
 CONSTRAINT fk_ad_appt FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id),
 CONSTRAINT fk_ad_diag FOREIGN KEY(diagnosis_id) REFERENCES diagnoses(diagnosis_id)
);
CREATE TABLE medicines (
 medicine_id INT PRIMARY KEY,
 medicine_name VARCHAR(100) NOT NULL UNIQUE,
 formulation VARCHAR(65) NOT NULL
);
CREATE TABLE prescriptions (
 prescription_id INT PRIMARY KEY,
 appointment_id INT NOT NULL,
 prescribed_on DATE NOT NULL,
 notes VARCHAR(250) NULL,
 CONSTRAINT fk_rx_appt FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id)
);
CREATE TABLE prescription_items (
 prescription_id INT NOT NULL,
 medicine_id INT NOT NULL,
 dose VARCHAR(70) NOT NULL,
 route VARCHAR(40) NOT NULL,
 frequency VARCHAR(75) NOT NULL,
 duration_days INT NOT NULL,
 PRIMARY KEY(prescription_id,medicine_id),
 CONSTRAINT chk_rx_duration CHECK(duration_days>0),
 CONSTRAINT fk_item_prescription FOREIGN KEY(prescription_id) REFERENCES prescriptions(prescription_id),
 CONSTRAINT fk_item_medicine FOREIGN KEY(medicine_id) REFERENCES medicines(medicine_id)
);
CREATE TABLE followup_plans (
 followup_id INT PRIMARY KEY,
 appointment_id INT NOT NULL UNIQUE,
 due_date DATE NOT NULL,
 priority VARCHAR(15) NOT NULL DEFAULT 'Routine',
 status VARCHAR(20) NOT NULL DEFAULT 'Pending',
 followup_note VARCHAR(220),
 CONSTRAINT chk_followup_priority CHECK(priority IN('Routine','High','Urgent')),
 CONSTRAINT chk_followup_status CHECK(status IN('Pending','Booked','Completed','Cancelled')),
 CONSTRAINT fk_followup_appt FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id)
);
CREATE TABLE treatments (
 treatment_id INT PRIMARY KEY,
 treatment_name VARCHAR(100) NOT NULL UNIQUE,
 description VARCHAR(230) NULL
);
CREATE TABLE appointment_treatments (
 appointment_id INT NOT NULL,
 treatment_id INT NOT NULL,
 treatment_note VARCHAR(220),
 PRIMARY KEY (appointment_id,treatment_id),
 CONSTRAINT fk_at_appt FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id),
 CONSTRAINT fk_at_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(treatment_id)
);
-- Technical audit table, deliberately empty until Student A trigger is tested.
CREATE TABLE appointment_status_audit (
 audit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
 appointment_id INT NOT NULL,
 old_status VARCHAR(20) NOT NULL,
 new_status VARCHAR(20) NOT NULL,
 changed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_audit_appt FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id)
);
-- Demonstrates ALTER TABLE and an appropriate additional indexed relationship.
ALTER TABLE appointments ADD INDEX idx_patient_date (patient_id,appointment_date);
ALTER TABLE followup_plans ADD INDEX idx_followup_due (due_date,priority);
