/*
Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
*/

--Write your SQL query
SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income<20000
UNION
SELECT 'Average Salary', COUNT(*)
FROM Accounts WHERE income BETWEEN 20000 AND 50000
UNION
SELECT 'High Salary', COUNT(*)
FROM Accounts WHERE income>50000;
