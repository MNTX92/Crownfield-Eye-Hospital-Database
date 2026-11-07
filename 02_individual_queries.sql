-- STUDENT B: individual SELECTs Q1-Q4
USE crownfield_eye_demo;
-- Q1: Clinicians with at least two appointments.
SELECT c.clinician_id,c.full_name,COUNT(a.appointment_id) AS booked_count
FROM clinicians c JOIN appointments a ON a.clinician_id=c.clinician_id
GROUP BY c.clinician_id,c.full_name HAVING COUNT(a.appointment_id)>=2
ORDER BY booked_count DESC,c.clinician_id;

-- Q2: Show clinician, specialty, appointment, patient (4-table INNER JOIN).
SELECT c.full_name AS clinician,s.specialty_name,a.appointment_date,
       p.full_name AS patient,a.status
FROM clinicians c INNER JOIN specialties s ON s.specialty_id=c.specialty_id
INNER JOIN appointments a ON a.clinician_id=c.clinician_id
INNER JOIN patients p ON p.patient_id=a.patient_id
ORDER BY c.clinician_id,a.appointment_date LIMIT 20;

-- Q3: Find clinicians without any booked appointment (LEFT JOIN).
SELECT c.clinician_id,c.full_name,s.specialty_name
FROM clinicians c JOIN specialties s ON s.specialty_id=c.specialty_id
LEFT JOIN appointments a ON a.clinician_id=c.clinician_id
WHERE a.appointment_id IS NULL ORDER BY c.clinician_id;

-- Q4: Clinicians with booking count higher than average across all clinicians.
WITH workload AS (
 SELECT c.clinician_id,c.full_name,COUNT(a.appointment_id) AS appointment_count
 FROM clinicians c LEFT JOIN appointments a ON a.clinician_id=c.clinician_id
 GROUP BY c.clinician_id,c.full_name
)
SELECT clinician_id,full_name,appointment_count FROM workload
WHERE appointment_count > (SELECT AVG(appointment_count) FROM workload)
ORDER BY appointment_count DESC;
