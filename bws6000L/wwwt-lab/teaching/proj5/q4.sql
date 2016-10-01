/* Retrieve the companies that shiped videos on '15-Jun-98'. */

select  d.comp_name
from	distributors d
where	d.did in (select    s.did
                  from	    shipments s
                  where	    s.ship_date='15-Jun-98')
/





