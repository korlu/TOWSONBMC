/* List sum, maximum, minimum, and average total cost shipment fee */
/* for company of 'MTC Systems'. */

select sum(s.total_cost), max(s.total_cost), min(s.total_cost), avg(s.total_cost)
from   shipments s, distributors d
where  s.did=d.did and d.comp_name='MTC Systems'
/


