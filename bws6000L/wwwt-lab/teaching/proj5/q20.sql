/*  Count total number of distributors in each state that issues */
/*  video with user rating greater than 8 and group by video color. */

select	   d.state, count(*)
from	   distributors d, catalogs c
where      d.did=c.did 
	   and c.user_rating > 8
	   and c.color in (select	c.color
		       	   from     	catalogs c
		           group by 	c.color
		           having   	count(*) > 2 )
group by   d.state
/



