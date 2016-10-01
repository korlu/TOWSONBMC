/* create a temporary table that has company name, shipment times */
/* and total sale for each company. Then insert data from two tables. */

drop table ship_info cascade constraints;

create table ship_info
	(comp_name  varchar2(50),
  	 no_of_ship integer,
         total_sal  integer)
/
insert into ship_info (comp_name, no_of_ship, total_sal)
	select	    d.comp_name, count(*), sum(s.total_cost)
	from	    distributors d, shipments s
	where	    d.did=s.did
	group by    d.comp_name
/
select  comp_name, no_of_ship, total_sal
from	ship_info
where	comp_name='CES Corporation'
/
	




