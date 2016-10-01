/* For each city whose video rentals late charges are more than */
/* 15 times, retrieve the late charge number and city name. */

select   c.city, count(*)
from     customers c, rentals r
where 	 c.cid=r.cid
	 and r.late_fee>0
group by c.city
having	 count(*)>15
/



