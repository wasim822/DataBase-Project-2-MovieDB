--report 6
--OLAP/Analytical functions
--orders movies by when they came out 

SELECT title, ROW_NUMBER() OVER (ORDER BY release_date) AS row_num
FROM movie;