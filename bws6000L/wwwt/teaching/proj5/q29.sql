/* Retrive the customers who always return video in time. */

select 	fname, lname
from	customers 
where	not exists	(select *
			 from	rentals 
			 where	late_fee>0)
/

