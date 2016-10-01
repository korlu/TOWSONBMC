SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Find out the joining date, name and address of the
rem 		 manager of the Hardware depertmnent
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT EMP_FNAME,EMP_LNAME,ADDRESS,JOINING_DATE
FROM SALARY,DEPARTMENT,EMPLOYEE
WHERE EMPSSN=EMP_SSN AND DESIGNATION='MANAGER' AND DNO=DEPT_NO AND
DEPT_NAME='HARDWARE';
