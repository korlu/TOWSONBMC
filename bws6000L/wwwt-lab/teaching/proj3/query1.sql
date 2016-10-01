SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select all product Name and product ID bought by
rem              customer whose last name is Smith
rem
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT PRODUCT_ID,P_NAME
FROM PRODUCT,CUSTOMER_ORDER,CUSTOMER
WHERE CUST_ID=C_ID AND CUST_LNAME='Smith' AND PRODUCT_ID=P_ID; 


SET ECHO OFF

