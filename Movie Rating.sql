/*
Input: 
Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+
MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
*/

--Write your MySQL query statement below
(
    --Top User By Number of Ratings
    SELECT u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id=u.user_id
    GROUP BY mr.user_id
    ORDER BY COUNT(mr.movie_id) DESC, u.name ASC
    LIMIT 1
)

UNION ALL

(
    --Top movie by highest average rating in Feb 2020
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m
    ON mr.movie_id=m.movie_id
    WHERE mr.created_at>='2020-02-01' AND mr.created_at<'2020-03-01'
    GROUP BY mr.movie_id
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);
