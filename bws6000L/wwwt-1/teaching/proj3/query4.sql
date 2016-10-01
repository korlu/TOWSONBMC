SET ECHO ON
rem
rem              Towson University
rem Subject:     Database Management System(COSC 578)
rem
rem Description: Select all product ID, name and unit price from catalog
rem 		 named Computer Life
SET HEADSEP!
TTITLE 'Computer Stock Inventory Database System'
BTITLE '...report prepared by Mirza Ashek Ahmed.'

SELECT PRODUCT_ID,P_NAME,UNIT_PRICE
FROM PRODUCT,CATALOG
WHERE CAT_ID=CATALOG_ID AND CAT_NAME='Computer Life';

SET ECHO OFF

