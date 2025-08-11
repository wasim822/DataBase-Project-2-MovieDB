--report 1
--joins 
-- find all the actors in the movie Executive.

select  a.first_name , a.last_name , m.title 
from actor a
join movie_actor USING(actor_id)
join movie m using(movie_Id)
where m.title = 'Executive.';