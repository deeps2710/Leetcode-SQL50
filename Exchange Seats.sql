/*
Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
*/

--Write your MySQL query statement below
SELECT CASE
    WHEN id%2<>0 AND id<>(SELECT MAX(id) FROM Seat) THEN id+1
    WHEN id%2=0 THEN id-1
    ELSE id
END AS id, student
FROM Seat ORDER BY id;
