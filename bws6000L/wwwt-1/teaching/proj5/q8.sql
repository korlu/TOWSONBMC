/* List rental number that rented video between 5-Jan-98 and 7-Jan-98 */
/* returned in time (without late charge). */

select 	rid 
from 	rentals
where 	late_fee is null
	and date_out between '5-Jan-98' and '7-Jan-98'
/





