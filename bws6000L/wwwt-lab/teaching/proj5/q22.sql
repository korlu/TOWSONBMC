/* Retrieve the customers whose street name has '----5' pattern. */

select  fname, lname, street
from    customers
where   street like '____5%'
/



