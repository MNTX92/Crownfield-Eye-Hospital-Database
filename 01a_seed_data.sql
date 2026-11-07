-- CROWNFIELD EYE HOSPITAL | GROUP SHARED SEED | synthetic classroom data only
USE crownfield_eye_demo;

INSERT INTO specialties (specialty_id, specialty_name) VALUES
  (1, 'Glaucoma'),
  (2, 'Retina'),
  (3, 'Cornea'),
  (4, 'Paediatric Ophthalmology'),
  (5, 'Cataract'),
  (6, 'Oculoplastics'),
  (7, 'Neuro-Ophthalmology'),
  (8, 'Uveitis'),
  (9, 'Ocular Oncology'),
  (10, 'Low Vision'),
  (11, 'General Ophthalmology'),
  (12, 'Strabismus'),
  (13, 'Emergency Eye Care');

INSERT INTO clinics (clinic_id, clinic_name, area) VALUES
  (1, 'City Road', 'Central London'),
  (2, 'Bedford', 'Bedford'),
  (3, 'Croydon', 'Croydon'),
  (4, 'Eastgate', 'East London'),
  (5, 'Riverside', 'North London'),
  (6, 'North Campus', 'North London'),
  (7, 'Westgate', 'West London'),
  (8, 'Central Imaging', 'Central London'),
  (9, 'South Wing', 'South London'),
  (10, 'Outreach Clinic', 'East London'),
  (11, 'Meadowbrook', 'South London'),
  (12, 'Lakeside', 'West London'),
  (13, 'Hillcrest', 'North London');

INSERT INTO patients (patient_id, full_name, postcode) VALUES
  ('OP001', 'Amina Yusuf', 'NE1 4AB'),
  ('OP002', 'Daniel Reed', 'N16 7QP'),
  ('OP003', 'Sofia Bennett', 'E8 2LD'),
  ('OP004', 'Michael Okoro', 'SE6 3RT'),
  ('OP005', 'Olivia Carter', 'NW3 1DR'),
  ('OP006', 'Noah Ellis', 'SW2 2BW'),
  ('OP007', 'Leila Ahmed', 'E11 3LT'),
  ('OP008', 'Jack Morgan', 'N5 1RT'),
  ('OP009', 'Emily Clarke', 'SE15 6NW'),
  ('OP010', 'Hassan Ali', 'W4 1AP'),
  ('OP011', 'Grace Turner', 'E2 9XQ'),
  ('OP012', 'Ethan Morris', 'N7 8AB'),
  ('OP013', 'Isla Hughes', 'SW12 0XY'),
  ('OP014', 'Adam Khan', 'EC1 4BZ'),
  ('OP015', 'Ruby Bennett', 'E6 6DL'),
  ('OP016', 'Lucas White', 'N4 3AA');

INSERT INTO clinicians (clinician_id, full_name, specialty_id, work_email) VALUES
  (1, 'Dr Maya Shah', 1, 'clinician01@example.invalid'),
  (2, 'Dr Leo Grant', 2, 'clinician02@example.invalid'),
  (3, 'Dr Priya Nair', 3, 'clinician03@example.invalid'),
  (4, 'Dr Amelia Hart', 4, 'clinician04@example.invalid'),
  (5, 'Dr Imran Qureshi', 5, 'clinician05@example.invalid'),
  (6, 'Dr Chloe Barnes', 6, 'clinician06@example.invalid'),
  (7, 'Dr Owen Price', 7, 'clinician07@example.invalid'),
  (8, 'Dr Farah Malik', 8, 'clinician08@example.invalid'),
  (9, 'Dr Theo Evans', 9, 'clinician09@example.invalid'),
  (10, 'Dr Serena Cole', 10, 'clinician10@example.invalid'),
  (11, 'Dr Peter Wong', 11, 'clinician11@example.invalid'),
  (12, 'Dr Nisha Patel', 12, 'clinician12@example.invalid'),
  (13, 'Dr Daniel Blake', 13, 'clinician13@example.invalid'),
  (14, 'Dr Alice Fox', 1, 'clinician14@example.invalid'),
  (15, 'Dr Aaron Gill', 3, 'clinician15@example.invalid');

INSERT INTO appointments (appointment_id, patient_id, clinician_id, clinic_id, appointment_date, appointment_time, status) VALUES
  (1, 'OP001', 1, 1, '2026-10-05', '09:00', 'Completed'),
  (2, 'OP002', 2, 1, '2026-10-05', '09:30', 'Completed'),
  (3, 'OP001', 1, 2, '2026-11-16', '10:15', 'Scheduled'),
  (4, 'OP003', 1, 1, '2026-10-06', '11:00', 'Completed'),
  (5, 'OP004', 3, 3, '2026-10-07', '14:00', 'Completed'),
  (101, 'OP005', 4, 4, '2026-10-15', '09:00', 'Completed'),
  (102, 'OP006', 1, 1, '2026-10-16', '09:40', 'Completed'),
  (103, 'OP007', 5, 5, '2026-10-17', '10:00', 'Completed'),
  (104, 'OP008', 6, 6, '2026-10-18', '11:00', 'Completed'),
  (105, 'OP009', 7, 7, '2026-10-19', '12:00', 'Completed'),
  (106, 'OP010', 8, 8, '2026-10-20', '13:00', 'Completed'),
  (107, 'OP011', 9, 9, '2026-10-21', '14:00', 'Completed'),
  (108, 'OP012', 10, 10, '2026-10-22', '15:00', 'Completed'),
  (109, 'OP013', 11, 11, '2026-10-23', '16:00', 'Completed'),
  (110, 'OP014', 12, 12, '2026-10-24', '09:30', 'Completed'),
  (111, 'OP005', 2, 2, '2026-11-18', '10:00', 'Scheduled'),
  (112, 'OP006', 3, 3, '2026-11-19', '10:30', 'Scheduled'),
  (113, 'OP007', 1, 1, '2026-11-20', '11:00', 'Scheduled'),
  (114, 'OP008', 2, 2, '2026-11-21', '11:30', 'Scheduled'),
  (115, 'OP009', 4, 4, '2026-11-22', '12:00', 'Scheduled');

INSERT INTO diagnoses (diagnosis_id, diagnosis_name) VALUES
  (1, 'Ocular hypertension'),
  (2, 'Diabetic macular oedema'),
  (3, 'Glaucoma suspect'),
  (4, 'Keratoconus'),
  (5, 'Dry eye syndrome'),
  (6, 'Cataract'),
  (7, 'Retinal detachment'),
  (8, 'Uveitis'),
  (9, 'Strabismus'),
  (10, 'Blepharitis'),
  (11, 'Macular degeneration'),
  (12, 'Conjunctivitis'),
  (13, 'Optic neuritis'),
  (14, 'Corneal abrasion'),
  (15, 'Diabetic retinopathy');

INSERT INTO appointment_diagnoses (appointment_id, diagnosis_id, clinical_note) VALUES
  (1, 1, 'Review IOP'),
  (2, 2, 'OCT before review'),
  (3, 1, 'Visual field'),
  (4, 3, 'Monitor'),
  (5, 4, 'Corneal topography'),
  (101, 5, 'Synthetic finding 1'),
  (102, 6, 'Synthetic finding 2'),
  (103, 7, 'Synthetic finding 3'),
  (104, 8, 'Synthetic finding 4'),
  (105, 9, 'Synthetic finding 5'),
  (106, 10, 'Synthetic finding 6'),
  (107, 11, 'Synthetic finding 7'),
  (108, 12, 'Synthetic finding 8'),
  (109, 13, 'Synthetic finding 9'),
  (110, 14, 'Synthetic finding 10'),
  (101, 1, 'Additional finding'),
  (102, 2, 'Additional finding');

INSERT INTO medicines (medicine_id, medicine_name, formulation) VALUES
  (1, 'Latanoprost', 'Eye drops'),
  (2, 'Timolol', 'Eye drops'),
  (3, 'Aflibercept', 'Injection'),
  (4, 'Sodium chloride drops', 'Eye drops'),
  (5, 'Artificial tears', 'Eye drops'),
  (6, 'Dorzolamide', 'Eye drops'),
  (7, 'Brimonidine', 'Eye drops'),
  (8, 'Prednisolone acetate', 'Eye drops'),
  (9, 'Ofloxacin', 'Eye drops'),
  (10, 'Cyclopentolate', 'Eye drops'),
  (11, 'Atropine', 'Eye drops'),
  (12, 'Travoprost', 'Eye drops'),
  (13, 'Acetazolamide', 'Tablets'),
  (14, 'Ketorolac', 'Eye drops'),
  (15, 'Lubricating gel', 'Eye gel');

INSERT INTO prescriptions (prescription_id, appointment_id, prescribed_on, notes) VALUES
  (1, 1, '2026-10-05', 'Two items from appendix'),
  (2, 2, '2026-10-05', 'Single item from appendix'),
  (3, 3, '2026-11-16', 'Planned appendix visit'),
  (4, 5, '2026-10-07', 'Single item from appendix'),
  (5, 101, '2026-10-15', 'Synthetic medication plan'),
  (6, 102, '2026-10-16', 'Synthetic medication plan'),
  (7, 103, '2026-10-17', 'Synthetic medication plan'),
  (8, 104, '2026-10-18', 'Synthetic medication plan'),
  (9, 105, '2026-10-19', 'Synthetic medication plan'),
  (10, 106, '2026-10-20', 'Synthetic medication plan'),
  (11, 107, '2026-10-21', 'Synthetic medication plan'),
  (12, 108, '2026-10-22', 'Synthetic medication plan'),
  (13, 109, '2026-10-23', 'Synthetic medication plan'),
  (14, 110, '2026-10-24', 'Synthetic medication plan'),
  (15, 102, '2026-10-16', 'Second prescription, same appointment');

INSERT INTO prescription_items (prescription_id, medicine_id, dose, route, frequency, duration_days) VALUES
  (1, 1, '1 drop', 'Ophthalmic', 'At night', 42),
  (1, 2, '1 drop', 'Ophthalmic', 'Twice daily', 42),
  (2, 3, '2 mg', 'Intravitreal', 'Once', 1),
  (3, 1, '1 drop', 'Ophthalmic', 'At night', 84),
  (4, 4, '1 drop', 'Ophthalmic', 'Twice daily', 56),
  (5, 1, '1 drop', 'Ophthalmic', 'Daily', 28),
  (6, 2, '1 drop', 'Ophthalmic', 'Daily', 28),
  (7, 3, '2 mg', 'Intravitreal', 'Once', 28),
  (8, 5, '1 drop', 'Ophthalmic', 'Daily', 28),
  (9, 6, '1 drop', 'Ophthalmic', 'Daily', 28),
  (10, 7, '1 drop', 'Ophthalmic', 'Daily', 28),
  (11, 8, '1 drop', 'Ophthalmic', 'Daily', 28),
  (12, 9, '1 drop', 'Ophthalmic', 'Daily', 28),
  (13, 10, '1 drop', 'Ophthalmic', 'Daily', 28),
  (14, 11, '1 drop', 'Ophthalmic', 'Daily', 28),
  (15, 12, '1 drop', 'Ophthalmic', 'Daily', 28);

INSERT INTO followup_plans (followup_id, appointment_id, due_date, priority, status, followup_note) VALUES
  (1, 1, '2026-11-16', 'High', 'Pending', 'Review IOP'),
  (2, 2, '2026-11-02', 'Urgent', 'Booked', 'OCT before review'),
  (3, 3, '2027-02-08', 'Routine', 'Pending', 'Visual field test'),
  (4, 4, '2027-04-06', 'Routine', 'Pending', 'Monitor'),
  (5, 5, '2026-12-02', 'Routine', 'Booked', 'Corneal topography'),
  (6, 101, '2026-11-04', 'Routine', 'Pending', 'Synthetic follow-up 6'),
  (7, 102, '2026-11-06', 'High', 'Pending', 'Synthetic follow-up 7'),
  (8, 103, '2026-11-08', 'Urgent', 'Pending', 'Synthetic follow-up 8'),
  (9, 104, '2026-11-10', 'Routine', 'Pending', 'Synthetic follow-up 9'),
  (10, 105, '2026-11-12', 'High', 'Pending', 'Synthetic follow-up 10'),
  (11, 106, '2026-11-14', 'Urgent', 'Pending', 'Synthetic follow-up 11'),
  (12, 107, '2026-11-16', 'Routine', 'Pending', 'Synthetic follow-up 12'),
  (13, 108, '2026-11-18', 'High', 'Pending', 'Synthetic follow-up 13'),
  (14, 109, '2026-11-20', 'Urgent', 'Pending', 'Synthetic follow-up 14'),
  (15, 110, '2026-11-22', 'Routine', 'Pending', 'Synthetic follow-up 15');

INSERT INTO treatments (treatment_id, treatment_name, description) VALUES
  (1, 'OCT scan', 'Synthetic training reference'),
  (2, 'Visual field assessment', 'Synthetic training reference'),
  (3, 'Corneal topography', 'Synthetic training reference'),
  (4, 'Retinal imaging', 'Synthetic training reference'),
  (5, 'IOP measurement', 'Synthetic training reference'),
  (6, 'Slit-lamp examination', 'Synthetic training reference'),
  (7, 'Eye irrigation', 'Synthetic training reference'),
  (8, 'Laser consultation', 'Synthetic training reference'),
  (9, 'Patch therapy review', 'Synthetic training reference'),
  (10, 'Low-vision counselling', 'Synthetic training reference');

INSERT INTO appointment_treatments (appointment_id, treatment_id, treatment_note) VALUES
  (101, 1, 'Synthetic attendance procedure'),
  (102, 2, 'Synthetic attendance procedure'),
  (103, 3, 'Synthetic attendance procedure'),
  (104, 4, 'Synthetic attendance procedure'),
  (105, 5, 'Synthetic attendance procedure'),
  (106, 6, 'Synthetic attendance procedure'),
  (107, 7, 'Synthetic attendance procedure'),
  (108, 8, 'Synthetic attendance procedure'),
  (109, 9, 'Synthetic attendance procedure'),
  (110, 10, 'Synthetic attendance procedure');

-- Sample appendix row 4 contains 'None' for medicines: appointment 4 has no prescription.
-- OP015 and OP016 have no appointments (used to prove LEFT JOIN semantics).
-- Clinicians 13, 14 and 15 have no appointments.
-- Appointments 111-115 have no diagnoses, prescriptions, or follow-up.
