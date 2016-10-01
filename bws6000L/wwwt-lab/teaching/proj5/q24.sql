/* Select video number that rented by customers who live in Baltimore */

select  v.serial_no
from	videos v
where	not exists
	(select  *
	 from	 rentals a
	 where   (a.cid in	(select	c.cid
				 from	customers c
				 where  city='Baltimore'))
		 and
		 not exists	(select *
				 from	rentals b
				 where  a.rid=b.rid
					and b.vid=v.vid))
/

