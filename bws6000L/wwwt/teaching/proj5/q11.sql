/* Count video rentals for the customers who live in 'Baltimore'. */

select count(*)
from   customers c, rentals r
where  c.cid=r.cid
       and c.city='Baltimore'
/

