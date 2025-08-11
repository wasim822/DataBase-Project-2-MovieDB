--report 5
-- Group functions
-- finds number of new release


SELECT COUNT(*) AS new_release_count
FROM movie
WHERE is_new_release = true;