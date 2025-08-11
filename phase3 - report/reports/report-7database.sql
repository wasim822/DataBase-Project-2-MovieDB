--report 7
--all the ideas together
--orders movies by when they came out 

SELECT director_id,
       first_name || ' ' || last_name AS director_name,
       title AS latest_title,
       release_date
FROM (
  SELECT d.director_id,
         d.first_name, d.last_name,
         m.title, m.release_date,
         ROW_NUMBER() OVER (
           PARTITION BY d.director_id
           ORDER BY m.release_date DESC, m.title
         ) AS rn
  FROM director d
  JOIN movie m ON m.director_id = d.director_id
) t
WHERE rn = 1
ORDER BY director_name;