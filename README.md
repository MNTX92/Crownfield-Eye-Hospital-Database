# Student B — individual assessment repository

**Student name:** [INSERT]   **Student ID:** [INSERT]   **Actual contribution:** [DESCRIBE AND VERIFY]

This is one **independent** six-feature SQL set built on the shared group schema and synthetic data. The other students have different SELECT queries, procedures and triggers. MySQL execution evidence and your personal reflection are still required.

## Setup and execution order

Use a disposable MySQL 8.0.16+ instance, ideally MySQL Workbench, running as admin for role creation.

1. `01_schema.sql`: rebuilds database **destructively**. Do not run against any real data.
2. `01a_seed_data.sql`: adds sample and synthetic records.
3. `02_individual_queries.sql`: Q1–Q4 (each SELECT yields a result set).
4. `03_procedure_and_trigger.sql`: Q5–Q6 (drops/recreates the student's procedure and trigger, then tests with CALL and a transaction; expected output must be checked).
5. `04_security.sql`: four roles, grants, restricted view, synthetic AES encryption, parameterised SELECT. Requires CREATE ROLE/GRANT privileges.
6. `05_transactions_and_tests.sql`: group row counts, controlled update/delete and rollback; negative FK/CHECK tests are commented for safe manual execution.

The SQL scripts should be run in order each time the database is freshly rebuilt. For the paper report use the editable Word draft; the PowerPoint has speaker notes and slots for your own screenshots. The `05_ERD` file was developed jointly and must be individually explained.

## Required six individual features

Q1. Clinicians with at least 2 visits (GROUP BY / HAVING)
Q2. 4-table INNER JOIN clinician/specialty/visit/patient
Q3. LEFT JOIN clinicians with zero bookings
Q4. CTE above-average clinician workload
Q5. sp_s2_clinician_agenda(IN clinician ID)
Q6. trg_s2_no_clinician_overlap BEFORE INSERT

## Evidence expected

- Screenshot Q1: grouped counts with HAVING and a meaningful result.
- Screenshot Q2: 3-or-more-table INNER JOIN and output.
- Screenshot Q3: LEFT JOIN showing missing relationships.
- Screenshot Q4: a CTE or subquery with output.
- Screenshot Q5: stored procedure definition / CALL and returned records.
- Screenshot Q6: trigger definition and meaningful audit/rejection evidence.
- Additional: schema, row counts, actual FK/CHECK test, transaction proof, four role grants, AES demonstration and prepared statement.
- At least 2 SQL features in recorded demonstration, **including Q5 or Q6**.

**Screenshot naming suggestion:** `Q1_GroupBy.png`, `Q2_InnerJoin.png`, `Q3_LeftJoin.png`, `Q4_CTE_Subquery.png`, `Q5_Procedure.png`, `Q6_Trigger.png`, `SEC_Grants.png`, `SEC_AES.png`, `TX_Rollback.png`, `SCHEMA_Tables.png`.

## Testing and verification

The database was tested using MySQL Community Server with the `crownfield_eye_demo` database.

The Student B stored procedure `sp_s2_clinician_agenda` was successfully executed and returned five appointments for clinician 1.

The appointment-overlap trigger was tested with two scenarios. An overlapping appointment was rejected with MySQL Error 1644, while a non-overlapping appointment was accepted. A transaction rollback was also verified to remove the test appointment.

Additional SQL queries and security scripts are included in the repository. Their execution evidence should be checked against the individual assessment report.

## References

- GBS (2025), supplied CPU4:103 assignment brief; GBS (2026), Weeks 1–5 student slides; Oracle MySQL 8.0 manual (see Word report for full Harvard-style candidates).
