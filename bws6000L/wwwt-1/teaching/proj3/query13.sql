SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: select all employee's ssn no. address and department name
rem              
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT EMP_SSN,ADDRESS,DEPT_NAME
FROM EMPLOYEE,DEPARTMENT
WHERE DNO=DEPT_NO;

SET ECHO OFF

