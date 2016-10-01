/* Retrieve the home phone number, zipcode for customer 'charles K Eagle'. */


select   home_phone, zipcode
from     customers
where    fname='Charles'
         and  minit='K'
         and  lname='Eagle'
/