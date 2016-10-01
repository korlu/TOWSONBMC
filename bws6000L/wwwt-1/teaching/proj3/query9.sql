SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Display the total number of employee 
rem              
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT COUNT(*)
FROM EMPLOYEE;

SET ECHO OFF

