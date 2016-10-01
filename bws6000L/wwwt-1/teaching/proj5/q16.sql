/* Compare the number of movies and user's rating for all movies */
/* made in different countries. */

select 	country, count(*), avg(user_rating), max(user_rating)
from  	movies
      	group by country
/ 





