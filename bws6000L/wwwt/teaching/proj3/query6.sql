SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select name, designation and joining date  of all
rem              employees whose salary is less than or equal to 25000
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT EMP_FNAME,EMP_LNAME,JOINING_DATE,DESIGNATION
FROM SALARY,EMPLOYEE
WHERE EMPSSN=EMP_SSN AND SAL<=25000;

SET ECHO OFF

