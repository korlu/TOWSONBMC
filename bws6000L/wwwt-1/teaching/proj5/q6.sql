/* Retrieve the companies that shiped videos on '15-Jun-98'. */

select  d.comp_name
from	distributors d
where	exists   (select    *
                  from	    shipments s
                  where	    s.ship_date='15-Jun-98'
			    and s.did=d.did)
/







