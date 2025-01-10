-- Write your PostgreSQL query statement below
SELECT *
FROM Patients
WHERE conditions ~ '^DIAB1| DIAB1';

-- | patient_id | patient_name | conditions    |
-- | ---------- | ------------ | ------------- |
-- | 1          | George       | ACNE +DIAB100 |
-- | 2          | Alain        | DIAB201       |