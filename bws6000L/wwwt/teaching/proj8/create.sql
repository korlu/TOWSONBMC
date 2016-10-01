spool create
set echo on

-- **************************************************
-- 	 CREATE TABLE DEPT
-- **************************************************

CREATE TABLE DEPT
       (
	D_NO		INT		NOT NULL,
	NAME		VARCHAR(20)	NOT NULL,
	CONTACT		VARCHAR(20),
	TEL		CHAR(10),
	ADDR		VARCHAR(50),
	PRIMARY KEY (D_NO)
	);	



-- **************************************************
-- 	 CREATE TABLE DEPT_ORDER
-- **************************************************

CREATE TABLE DEPT_ORDER
       (
	DO_NO		INT		NOT NULL,
	D_NO		INT		NOT NULL,
	DATE_ORDER	DATE,	
	DAYS_NEED	INT		NOT NULL,	
	PRIMARY KEY (DO_NO)
	);

	

-- **************************************************
-- 	 CREATE TABLE DEPT_ITEM
-- **************************************************

CREATE TABLE DEPT_ITEM
       (
	DI_NO		INT		NOT NULL,
	DO_NO		INT		NOT NULL,
	P_NO		INT		NOT NULL,
	QUANTITY	INT		NOT NULL,
	STATE		VARCHAR(50)	NOT NULL,
	PRIMARY KEY (DI_NO)
	);

	

-- **************************************************
-- 	 CREATE TABLE PART
-- **************************************************

CREATE TABLE PART
       (
	P_NO		INT		NOT NULL,
	NAME		VARCHAR(40)	NOT NULL,
	CLASS		VARCHAR(20),
	PRIMARY KEY (P_NO)
	);

	

-- **************************************************
-- 	 CREATE TABLE QUOTATION
-- **************************************************

CREATE TABLE QUOTATION
       (
	P_NO		INT		NOT NULL,
	S_NO		INT		NOT NULL,
	PRICE		DECIMAL(10,2)	NOT NULL,
	MAX_QUA		INT,
	MIN_QUA		INT,
	PRIMARY KEY (S_NO, P_NO)
	);

	

-- **************************************************
-- 	 CREATE TABLE SUPPLIER
-- **************************************************

CREATE TABLE SUPPLIER
       (		
	S_NO		INT		NOT NULL,
	NAME		VARCHAR(20)	NOT NULL,
	CONTACT		VARCHAR(20),
	TEL		CHAR(10),
	ADDR		VARCHAR(50),
	DELI_DAY	INT		NOT NULL,
	PRIMARY KEY (S_NO)
	);	



-- **************************************************
-- 	 CREATE TABLE STORAGE
-- **************************************************

CREATE TABLE STORAGE
       (
	P_NO		INT		NOT NULL,
	W_NO		INT		NOT NULL,
	QUANTITY	INT		NOT NULL,
	PRIMARY KEY (P_NO, W_NO)
	);



-- **************************************************
-- 	 CREATE TABLE WAREHOUSE
-- **************************************************

CREATE TABLE WAREHOUSE
       (
	W_NO		INT		NOT NULL,
	NAME		VARCHAR(20)	NOT NULL,
	CONTACT		VARCHAR(20),
	TEL		CHAR(10),
	ADDR		VARCHAR(50),
	PRIMARY KEY (W_NO)
	);	



-- **************************************************
-- 	 CREATE TABLE PURCHASE-ORDER
-- **************************************************

CREATE TABLE PURCHASE_ORDER
       (
	PO_NO		INT		NOT NULL,
	DO_NO		INT		NOT NULL,
	DATE_ORDER	DATE,	
	DAYS_NEED	INT		NOT NULL,	
	PRIMARY KEY (PO_NO)
	);

	

-- **************************************************
-- 	 CREATE TABLE PURCHASE_ITEM
-- **************************************************

CREATE TABLE PURCHASE_ITEM
       (
	PI_NO		INT		NOT NULL,
	PO_NO		INT		NOT NULL,
	P_NO		INT		NOT NULL,
	S_NO		INT		NOT NULL,
	QUANTITY	INT		NOT NULL,
	PRIMARY KEY (PI_NO)
	);	



set echo off
spool off
