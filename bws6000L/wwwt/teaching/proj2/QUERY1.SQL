SELECT     D.FNAME,D.LNAME,D.DSSN
FROM       DEPARTMENT P, DOCTOR D
WHERE      P.DNAME='Surgery' AND D.DNUM=P.DNUMBER;
