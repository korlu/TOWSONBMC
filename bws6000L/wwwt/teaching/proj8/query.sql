spool query
set echo on


-- *************************************************************************
--	query-1 : For every item which is ordered by department and still 
--		on pendind, list the department-item number, part number 
--		and part quantity.
-- *************************************************************************

SELECT	 	DI_NO, P_NO, QUANTITY
FROM		DEPT_ITEM
WHERE		STATE='PENDING';



-- *************************************************************************
--	query-2 : For P_NO=101, 402 or 1206, list part number and total 
--		quantities on hand from different warehouses.
-- *************************************************************************

SELECT		P_NO, SUM( QUANTITY) AS QUAN_ON_HAND
FROM 		STORAGE
WHERE		P_NO IN ( 101, 402, 1206) 
GROUP BY	P_NO;
	


-- *************************************************************************
--	query-3 : Retrieve all numbers, names, contact people, telephones 
--		and quantities of warehouses which store part number=101.
-- *************************************************************************

SELECT 		W.W_NO, W.NAME, W.CONTACT, W.TEL, S.QUANTITY
FROM		STORAGE S, WAREHOUSE W
WHERE		S.W_NO=W.W_NO AND
		S.P_NO=101;



-- *************************************************************************
--	query-4 : For P-NO=402 or 1206 and order by price, list number of
--		parts, number of suppliers who can deliver their parts in 
--		6 days, price, maximum quantity and minimum quantity 
--		suppliers provide.
-- *************************************************************************

SELECT		Q.P_NO, Q.S_NO, Q.PRICE, Q.MAX_QUA, Q.MIN_QUA
FROM		QUOTATION Q, SUPPLIER S
WHERE		Q.S_NO=S.S_NO AND
		( Q.P_NO=402 OR Q.P_NO=1206 ) AND
		S.DELI_DAY<=6
ORDER BY 	PRICE ASC;



-- *************************************************************************
--	query-5 : For every supplier who sell parts, list supplier number,
--      	part number, part price, part quantity and sub_total for 
--		every item, order by supplier number and part number.
-- *************************************************************************

SELECT		Q.S_NO, Q.P_NO, Q.PRICE, PI.QUANTITY, 
		Q.PRICE*PI.QUANTITY AS SUB_TOTAL
FROM		PURCHASE_ITEM PI, QUOTATION Q
WHERE		PI.P_NO=Q.P_NO AND
		PI.S_NO=Q.S_NO
ORDER BY 	Q.S_NO ASC, Q.P_NO ASC;



-- *************************************************************************
--	query-6 : For every supplier who sell parts, list supplier 
--		number, supplier name, and total_charge.
-- *************************************************************************

SELECT		Q.S_NO,S.NAME, SUM(Q.PRICE*PI.QUANTITY) AS TOTAL_CHARGE
FROM		PURCHASE_ITEM PI, QUOTATION Q, SUPPLIER S
WHERE		PI.P_NO=Q.P_NO AND
		PI.S_NO=Q.S_NO AND
		Q.S_NO=S.S_NO
GROUP BY	Q.S_NO, S.NAME;



-- *************************************************************************
--	query-7 : Retrieve the supplier number, name, contact person, and
--		telephone number of suppliers who need more than 5 days 
--		to deliver their parts.
-- *************************************************************************

SELECT 		S_NO, NAME,CONTACT,TEL
FROM		SUPPLIER
WHERE		DELI_DAY>5;



-- *************************************************************************
--	query-8: Retrieve the number, name and price of parts supplied
--		by supplier 'IVY BEST'.
-- *************************************************************************

SELECT		P.P_NO, P.NAME, Q.PRICE
FROM		PART P, QUOTATION Q, SUPPLIER S
WHERE		P.P_NO=Q.P_NO AND
		Q.S_NO=S.S_NO AND
		S.NAME='IVY BEST';



-- *************************************************************************
--	query-9: For part 'A/C CLUTCH', retrieve the highest price and 
--		the lowest price provided by different suppliers.
-- *************************************************************************

SELECT 		MAX(Q.PRICE) AS HIGH_PRICE, MIN(Q.PRICE) AS LOW_PRICE
FROM		QUOTATION Q, PART P
WHERE		Q.P_NO=P.P_NO AND P.NAME='A/C CLUTCH';



-- *************************************************************************
--	query-10: Retrieve the number of all parts which are supplied 
--		by more than one supplier.
-- *************************************************************************

SELECT		Q.P_NO
FROM 		QUOTATION Q
GROUP BY	Q.P_NO
HAVING		COUNT(Q.S_NO)>1;



-- *************************************************************************
--	query-11: Retrieve the supplier who supplies at least a part 
--		whose class is 'ABS'.
-- *************************************************************************

SELECT		DISTINCT S.NAME
FROM 		SUPPLIER S
WHERE		S.S_NO IN
		(SELECT Q.S_NO
		 FROM 	QUOTATION Q
		 WHERE	Q.P_NO IN
			(SELECT	P.P_NO
			 FROM	PART P
			 WHERE	P.CLASS='ABS'));



-- *************************************************************************
--	query-12: Retrieve the suppliers who don't supply part 101.
-- *************************************************************************

SELECT		DISTINCT S.NAME
FROM		SUPPLIER S
WHERE		S.S_NO NOT IN
		(SELECT	Q.S_NO
		 FROM   QUOTATION Q
		 WHERE  Q.P_NO=101);





set echo off
spool off
