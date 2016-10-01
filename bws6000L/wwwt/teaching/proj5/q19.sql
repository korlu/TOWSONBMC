/*  Count total number of shipments whose total cost is greater */
/*  than $5000 in each state that distributors located. List those */
/*  total number greater than 5 only. */

select	   d.state, count(*)
from	   distributors d, shipments s
where      d.did=s.did and total_cost>1000
group by   d.state
having	   count(*)>5
/

