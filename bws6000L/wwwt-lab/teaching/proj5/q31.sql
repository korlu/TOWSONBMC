/* List names of the customers whose last name is same as */
/* other's first name in Baltimore area. */

select    f.fname, f.lname, l.fname, l.lname
from      customers f, customers l
where	  f.lname=l.fname	
	  and f.city='Baltimore'
/