select    p.fname, p.lname, i.diagnosis, i.treatment
from      patient p,inpatient i
where     i.patientnum = p.pnumber and i.diagnosis = 'Lung cancer' ;
