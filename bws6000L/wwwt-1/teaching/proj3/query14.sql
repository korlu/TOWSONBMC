SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Find the sum of the salary of Hardware department
rem
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT SUM(SAL),AVG(SAL),MAX(SAL),MIN(SAL)
FROM SALARY,EMPLOYEE,DEPARTMENT
WHERE EMPSSN=EMP_SSN AND DNO=DEPT_NO AND DEPT_NAME='SOFTWARE';
