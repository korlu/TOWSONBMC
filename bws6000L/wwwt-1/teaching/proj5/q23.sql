/* Retrieve the videos' cost that shiped from company named */
/* 'MTC Systems', and 150% of each video cost. */

select    v.serial_no, v.cost, 1.5*v.cost
from      videos v, shipments s, distributors d
where     v.sid=s.sid and s.did=d.did 
	  and d.comp_name='MTC Systems'
/


