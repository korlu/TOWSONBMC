SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select all customer id, product name and their unit price
rem		 in stock which are ordered by customer 1 or 2
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT C_ID,P_NAME,UNIT_PRICE
FROM PRODUCT,CUSTOMER_ORDER
WHERE PRODUCT_ID=P_ID AND (C_ID='C1' OR C_ID='C2');

SET ECHO OFF

