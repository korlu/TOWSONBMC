CREATE TABLE SUPPLIER
( SUPPLIER_ID   CHAR(10)	NOT NULL,
  COMPANY_NAME  VARCHAR(30)     NOT NULL,
  ADDRESS       VARCHAR(30),
  PHONE         CHAR(12),
  FAX           CHAR(15),
  HOME_PAGE     VARCHAR(30),
  PRIMARY KEY (SUPPLIER_ID));

CREATE TABLE CUSTOMER
( CUST_ID       CHAR(10)	NOT NULL,
  CUST_FNAME    VARCHAR(15)     NOT NULL,
  CUST_MINIT    CHAR,
  CUST_LNAME    VARCHAR(15)     NOT NULL,
  ADDRESS       VARCHAR(30),
  SEX           CHAR,
  PHONE         CHAR(12),
  FAX           CHAR(15),
  PRIMARY KEY (CUST_ID));
  


CREATE TABLE DEPARTMENT
( DEPT_NO       INT             NOT NULL,
  DEPT_NAME     VARCHAR(15)     NOT NULL,
  PHONE         CHAR(12),
  FAX           CHAR(15),
  PRIMARY KEY (DEPT_NO));

CREATE TABLE EMP_EDUCATION
( EDSSN         CHAR(9)		NOT NULL,
  DEGREE        VARCHAR(30),
  YEAR          DATE,
  CGPA          DECIMAL(3,2),
  INSTITUTION   VARCHAR(30),
  AWARDS        VARCHAR(20),
  PRIMARY KEY (EDSSN));
  
CREATE TABLE    SALARY
( EMPSSN        CHAR(9)		NOT NULL,
  JOINING_DATE  DATE,
  SAL           DECIMAL(10,2),
  BONUS         DECIMAL(10,2),
  OTHERS        DECIMAL(10,2),
  PRIMARY KEY (EMPSSN));

CREATE TABLE TRANSPORTATION
( TRANS_ID      CHAR(10)	NOT NULL,
  TYPE          VARCHAR(15),
  AMOUNT        DECIMAL(10,2),
  TRANS_DATE    DATE,
  PRIMARY KEY (TRANS_ID));

CREATE TABLE DEPENDENT
(DSSN                   CHAR(9)         NOT NULL,
 DEPENDENT_NAME         VARCHAR(15)     NOT NULL,
 SEX                    CHAR,
 BDATE                  DATE,
 RELATIONSHIP           VARCHAR(8),
 PRIMARY KEY (DSSN));

CREATE TABLE    CATALOG
( CATALOG_ID    INT             NOT NULL,
  CAT_NAME      VARCHAR(25),
  PUB_DATE      DATE,
  PRIMARY KEY (CATALOG_ID));

CREATE TABLE PRODUCT
( PRODUCT_ID    CHAR(10)        NOT NULL,
  DEP_NO        INT             NOT NULL,
  SUPP_ID       CHAR(10)        NOT NULL,
  CAT_ID        INT             NOT NULL,
  P_NAME        VARCHAR(50)     NOT NULL,
  UNIT_PRICE    DECIMAL(10,2),
  QUANTITY      INT,
  T_ID          CHAR(10)        NOT NULL,
  PRIMARY KEY (PRODUCT_ID),
  FOREIGN KEY (DEP_NO) REFERENCES DEPARTMENT (DEPT_NO),
  FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER (SUPPLIER_ID),
  FOREIGN KEY (CAT_ID) REFERENCES CATALOG (CATALOG_ID),
  FOREIGN KEY (T_ID) REFERENCES TRANSPORTATION (TRANS_ID));

CREATE TABLE SUPPLIER_ORDER
( SUP_ORDER_ID  INT             NOT NULL,
  PROID         CHAR(10)        NOT NULL,
  SUPID         CHAR(10)        NOT NULL,
  ORDER_DATE    DATE,
  DELIVERY_DATE DATE,
  QUANTITY      INT,
  PRIMARY KEY (SUP_ORDER_ID),
  FOREIGN KEY (SUPID) REFERENCES SUPPLIER (SUPPLIER_ID),
  FOREIGN KEY (PROID) REFERENCES PRODUCT (PRODUCT_ID));

CREATE TABLE EMPLOYEE
( EMP_SSN       CHAR(9)         NOT NULL,
  DNO           INT             NOT NULL,
  DESIGNATION   VARCHAR(20)     NOT NULL,
  EMP_FNAME     VARCHAR(15)     NOT NULL,
  EMP_MINIT     CHAR,
  EMP_LNAME     VARCHAR(15)     NOT NULL,
  EMP_BDATE     DATE,
  ADDRESS       VARCHAR(30),
  SEX           CHAR,
  PHONE         CHAR(12),
  FAX           CHAR(15),
  PRIMARY KEY (EMP_SSN),
  FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DEPT_NO));

CREATE TABLE CUSTOMER_ORDER
( CUST_ORDER_ID INT             NOT NULL,
  P_ID          CHAR(10)        NOT NULL,
  C_ID          CHAR(10)        NOT NULL,
  E_SSN         CHAR(9)         NOT NULL,
  ORDER_DATE    DATE,
  DELIVERY_DATE DATE,
  QUANTITY      INT,
  PRIMARY KEY (CUST_ORDER_ID),
  FOREIGN KEY (P_ID) REFERENCES PRODUCT (PRODUCT_ID),
  FOREIGN KEY (C_ID) REFERENCES CUSTOMER (CUST_ID));

