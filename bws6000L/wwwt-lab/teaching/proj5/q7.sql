/* List home phone numbers for the customers who live in 'Cockeysville', */
/* 'Sparks', and 'Bowie'. */

select   distinct home_phone
from	 customers
where	 city in ('Cockeysville', 'Sparks', 'Bowie')
/

