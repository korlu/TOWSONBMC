CREATE TABLE VENDORS
(
 VNAME      VARCHAR(20)     NOT NULL,
 VADDRESS   VARCHAR(25)     NOT NULL,
 VPHONE     CHAR(10)        NOT NULL,
 VDEPT      INT             NOT NULL,
 VBUSTYPE   VARCHAR(15),
PRIMARY KEY (VNAME)
);
