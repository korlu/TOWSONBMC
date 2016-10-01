/* Retrieve the companies that shiped videos on '15-Jun-98'. */

select  d.comp_name
from	distributors d, shipments s
where	d.did=s.did
        and s.ship_date='15-Jun-98'
/





