-- Security and data-protection demonstration. Run as MySQL administrator.
-- NOTE: Demo-only key never belongs in production source control.
USE crownfield_eye_demo;
CREATE OR REPLACE VIEW v_clinic_public_directory AS
SELECT clinic_id,clinic_name,area FROM clinics;

CREATE ROLE IF NOT EXISTS 'cf_admin_role','cf_doctor_role','cf_reception_role','cf_patient_role';
GRANT SELECT,INSERT,UPDATE,DELETE ON crownfield_eye_demo.* TO 'cf_admin_role';
GRANT SELECT ON crownfield_eye_demo.patients TO 'cf_doctor_role';
GRANT SELECT ON crownfield_eye_demo.clinics TO 'cf_doctor_role';
GRANT SELECT ON crownfield_eye_demo.appointments TO 'cf_doctor_role';
GRANT SELECT ON crownfield_eye_demo.diagnoses TO 'cf_doctor_role';
GRANT SELECT ON crownfield_eye_demo.medicines TO 'cf_doctor_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.appointment_diagnoses TO 'cf_doctor_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.prescriptions TO 'cf_doctor_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.prescription_items TO 'cf_doctor_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.followup_plans TO 'cf_doctor_role';
GRANT SELECT ON crownfield_eye_demo.patients TO 'cf_reception_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.appointments TO 'cf_reception_role';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.patients TO 'cf_reception_role';
GRANT SELECT ON crownfield_eye_demo.clinics TO 'cf_reception_role';
GRANT SELECT ON crownfield_eye_demo.clinicians TO 'cf_reception_role';
-- Patient role cannot see other patients: only the non-sensitive public directory.
-- A real patient portal needs verified per-user filtering in an authenticated application.
GRANT SELECT ON crownfield_eye_demo.v_clinic_public_directory TO 'cf_patient_role';
SHOW GRANTS FOR 'cf_admin_role';
SHOW GRANTS FOR 'cf_doctor_role';
SHOW GRANTS FOR 'cf_reception_role';
SHOW GRANTS FOR 'cf_patient_role';

-- Encryption of a synthetic phone number (not a real secret or patient record).
-- Demonstration only: production keys must be kept outside SQL files in a key-management system.
SET @demo_key='DEMO_KEY_NOT_FOR_PRODUCTION_2026';
UPDATE patients SET phone_ciphertext = AES_ENCRYPT('07700 900123',@demo_key) WHERE patient_id='OP001';
SELECT patient_id,HEX(phone_ciphertext) AS encrypted_value FROM patients WHERE patient_id='OP001';
SELECT patient_id,CAST(AES_DECRYPT(phone_ciphertext,@demo_key) AS CHAR(30)) AS demo_decrypted_phone
FROM patients WHERE patient_id='OP001';
SET @demo_key=NULL;

-- Parameterized prepared statement (not string-concatenated SQL).
PREPARE safe_find FROM 'SELECT patient_id,full_name FROM patients WHERE patient_id = ?';
SET @requested_id='OP001';
EXECUTE safe_find USING @requested_id;
DEALLOCATE PREPARE safe_find;
