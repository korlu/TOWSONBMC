/* List all the purchase numbers that total_cost less than that of '1-Jan-98'. */

select	po_no
from	shipments 
where	total_cost < all (select   total_cost 
			    from   shipments 
			    where  order_date='1-Jan-98')
/