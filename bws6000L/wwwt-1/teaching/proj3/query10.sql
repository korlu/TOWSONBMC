SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Display the maximum quantity of a customer order of
rem		 product#2
rem              
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT MAX(QUANTITY)
FROM CUSTOMER_ORDER
WHERE P_ID='P2';

SET ECHO OFF

