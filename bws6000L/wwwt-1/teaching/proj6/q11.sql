select ELNAME, EMPNUM 
from employees e
where e.essn not in (select m.mssn from members m);
