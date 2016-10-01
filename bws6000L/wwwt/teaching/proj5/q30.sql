/* List the companies that deliver videos and make catalogs */

select 	distinct comp_name "Company Name"
from	distributors d
where	exists	(select	*
		 from	shipments s
		 where	s.did=d.did)
	and	
	exists	(select *
		 from	catalogs c
		 where	c.did=d.did)
/


