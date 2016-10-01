/* Create a view that show city name, number of customers in that */
/* city and total sale about that city. */

drop view rent_info cascade constraints;

create view	rent_info (city_name, no_of_cust, total_sal)
as select	c.city, count(*), sum(r.total_fee)
   from		customers c, rentals r
   where	c.cid=r.cid
   group by	c.city
/

select  city_name city, no_of_cust "Customer Number", total_sal "Total Sale"
from	rent_info
where	city_name='Baltimore'
/

