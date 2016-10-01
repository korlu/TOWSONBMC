/* Retrieve the name and address of all customers who rented */
/* video on '15-Jan-98'. */


select    c.fname, c.lname, c.street, c.city, c.state, c.zipcode
from      customers c, rentals r
where     date_out='15-Jan-98'
          and   c.cid=r.cid
/