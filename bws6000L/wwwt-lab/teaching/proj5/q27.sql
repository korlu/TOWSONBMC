/* Retrieve list of distributors who located in 'CA' and sells */
/* movie of 'The Godfather'. */

select 	distinct comp_name
from	distributors
where	(state)	in	(select state
			 from	distributors d, catalogs c
			 where	c.title='The Godfather'
				and d.state='CA'
				and d.did=c.did)
/

