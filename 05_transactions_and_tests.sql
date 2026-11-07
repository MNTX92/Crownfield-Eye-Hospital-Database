-- Group test log helpers (run AFTER schema and seed, before individual triggers).
USE crownfield_eye_demo;
SELECT 'patients' AS table_name,COUNT(*) AS n FROM patients
UNION ALL SELECT 'clinicians',COUNT(*) FROM clinicians
UNION ALL SELECT 'clinics',COUNT(*) FROM clinics
UNION ALL SELECT 'appointments',COUNT(*) FROM appointments
UNION ALL SELECT 'diagnoses',COUNT(*) FROM diagnoses
UNION ALL SELECT 'appointment_diagnoses',COUNT(*) FROM appointment_diagnoses
UNION ALL SELECT 'medicines',COUNT(*) FROM medicines
UNION ALL SELECT 'prescriptions',COUNT(*) FROM prescriptions
UNION ALL SELECT 'prescription_items',COUNT(*) FROM prescription_items
UNION ALL SELECT 'followup_plans',COUNT(*) FROM followup_plans
UNION ALL SELECT 'treatments',COUNT(*) FROM treatments
UNION ALL SELECT 'appointment_treatments',COUNT(*) FROM appointment_treatments;

-- Controlled successful INSERT, UPDATE, DELETE inside one transaction.
START TRANSACTION;
INSERT INTO patients(patient_id,full_name,postcode)
VALUES('OP_TEMP','Disposable Test Record','E1 6AN');
UPDATE patients SET postcode='E1 6AX' WHERE patient_id='OP_TEMP';
SELECT patient_id,postcode FROM patients WHERE patient_id='OP_TEMP';
DELETE FROM patients WHERE patient_id='OP_TEMP';
SELECT COUNT(*) AS should_be_zero FROM patients WHERE patient_id='OP_TEMP';
COMMIT;

-- Non-destructive rollback demonstration.
START TRANSACTION;
UPDATE patients SET postcode='TEST POST' WHERE patient_id='OP010';
SELECT patient_id,postcode AS inside_transaction FROM patients WHERE patient_id='OP010';
ROLLBACK;
SELECT patient_id,postcode AS after_rollback FROM patients WHERE patient_id='OP010';

-- Expected failures (run ONE statement at a time manually, screenshot error):
-- INSERT INTO appointments(appointment_id,patient_id,clinician_id,clinic_id,appointment_date,appointment_time)
-- VALUES(9991,'OP_DOES_NOT_EXIST',1,1,'2026-12-01','12:00'); -- FK rejection
-- INSERT INTO followup_plans(followup_id,appointment_id,due_date,priority,status)
-- VALUES(9991,115,'2026-12-15','Impossible','Pending'); -- CHECK rejection
