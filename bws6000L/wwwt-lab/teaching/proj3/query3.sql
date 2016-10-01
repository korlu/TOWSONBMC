SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select all the department manager's first name
rem              last name and address
rem
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT EMP_FNAME,EMP_LNAME,ADDRESS
FROM EMPLOYEE
WHERE DESIGNATION='MANAGER';

SET ECHO OFF

