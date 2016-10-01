SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select all supplier ID, company name,home page 
rem		 who supply product#10
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT SUPPLIER_ID,COMPANY_NAME,HOME_PAGE
FROM SUPPLIER,SUPPLIER_ORDER
WHERE SUPPLIER_ID=SUPID AND PROID='P10';

SET ECHO OFF

