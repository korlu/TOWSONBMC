/* Retrieve all customers who rent video on '15-Jan-98' and */
/* live in Baltimore. */

select    *
from      customers s, rentals r
where     s.city='Bethesda' 
	  and r.date_out='15-Jan-98'
          and s.cid=r.cid
/