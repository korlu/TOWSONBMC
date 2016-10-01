select fname,lname,starttime,endtime,visitreason,diagnosis
from   patient,outpatient
where  visitdate='26-Nov-97' and pnumber=patientnum;
                              
