/* For the movie, retrieve the color, distributor's country and */
/* the number of shipments issued. */

select	   c.color, d.country, count(*)
from	   catalogs c, distributors d, shipments s
where      c.did=d.did and d.did=s.did
group by   c.color, d.country
/

