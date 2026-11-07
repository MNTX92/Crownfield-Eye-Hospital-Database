-- Crownfield Eye Hospital | Student B | Q5 and Q6
-- MySQL database: crownfield_eye_demo
USE crownfield_eye_demo;

-- Q5: Stored procedure: show one clinician's appointment agenda.
DROP PROCEDURE IF EXISTS sp_s2_clinician_agenda;
DELIMITER $$
CREATE PROCEDURE sp_s2_clinician_agenda(IN p_clinician_id INT)
BEGIN
    SELECT a.appointment_id,
           p.full_name AS patient,
           cl.clinic_name,
           a.appointment_date,
           a.appointment_time,
           a.duration_minutes,
           a.status
    FROM appointments AS a
    INNER JOIN patients AS p ON p.patient_id = a.patient_id
    INNER JOIN clinics AS cl ON cl.clinic_id = a.clinic_id
    WHERE a.clinician_id = p_clinician_id
    ORDER BY a.appointment_date, a.appointment_time;
END$$
DELIMITER ;

-- Verified in MySQL: clinician 1 returned five appointments on 2026-11-07.
CALL sp_s2_clinician_agenda(1);

-- Q6: Prevent overlapping appointments for the same clinician/date on INSERT.
-- Tested: 11:15 rejected against 11:00-11:30 booking; 11:30 accepted.
-- Cancelled bookings do not block slots; inserting a cancelled booking is allowed.
DROP TRIGGER IF EXISTS trg_prevent_appointment_overlap;
DELIMITER $$
CREATE TRIGGER trg_prevent_appointment_overlap
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
    IF NEW.status <> 'Cancelled'
       AND EXISTS (
           SELECT 1
           FROM appointments a
           WHERE a.clinician_id = NEW.clinician_id
             AND a.appointment_date = NEW.appointment_date
             AND a.status <> 'Cancelled'
             AND NEW.appointment_time <
                 ADDTIME(a.appointment_time, SEC_TO_TIME(a.duration_minutes * 60))
             AND ADDTIME(NEW.appointment_time,
                         SEC_TO_TIME(NEW.duration_minutes * 60)) > a.appointment_time
       )
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Appointment overlaps with an existing booking';
    END IF;
END$$
DELIMITER ;

-- Verified manual test (do not execute these inserts as part of routine setup):
-- Existing appointment 113: clinician 1, 2026-11-20 11:00, 30 minutes.
-- Test A: START TRANSACTION; INSERT INTO appointments
-- (appointment_id,patient_id,clinician_id,clinic_id,appointment_date,
--  appointment_time,duration_minutes,status)
-- VALUES (9991,'OP007',1,1,'2026-11-20','11:15:00',30,'Scheduled');
-- Expected: MySQL Error 1644, overlap rejected. Then ROLLBACK;
-- Test B: START TRANSACTION; INSERT INTO appointments
-- (appointment_id,patient_id,clinician_id,clinic_id,appointment_date,
--  appointment_time,duration_minutes,status)
-- VALUES (9992,'OP007',1,1,'2026-11-20','11:30:00',30,'Scheduled');
-- Expected: insert succeeds. SELECT * FROM appointments WHERE appointment_id=9992;
-- ROLLBACK; SELECT * FROM appointments WHERE appointment_id=9992;
-- Expected: zero rows after rollback.
-- Limitations: this trigger only checks INSERT; UPDATE and concurrent booking
-- scenarios require further controls for a production scheduling system.
