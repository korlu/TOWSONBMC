SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select name and relationship of all department 
rem		 managers who have dependent
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT EMP_FNAME,EMP_LNAME,RELATIONSHIP
FROM EMPLOYEE,DEPENDENT
WHERE EMP_SSN=DSSN AND DESIGNATION='MANAGER';

SET ECHO OFF

