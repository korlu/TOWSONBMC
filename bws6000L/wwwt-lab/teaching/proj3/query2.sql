SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Get full details of all supplier's ID, Company name and
rem		 address	
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT SUPPLIER_ID,COMPANY_NAME,ADDRESS
FROM SUPPLIER;


SET ECHO OFF

