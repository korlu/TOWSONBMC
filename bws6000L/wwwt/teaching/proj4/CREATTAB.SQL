--
-- creattab.sql
--
-- This script creates the tables for a airline ticket reservation system
--

set TERMOUT on
prompt Creating tables. Please wait.
-- set TERMOUT off

--
--  drop tables for possible pre-existence
--
DROP TABLE CUSTOMER;
DROP TABLE FLIGHT_RESERVATION;
DROP TABLE FLIGHT_LEG;
DROP TABLE LEG_INSTANCE;
DROP TABLE CREDIT_RATE;
DROP TABLE CREDIT_TYPE;
DROP TABLE AIRLINE;
DROP TABLE AIRPLANE;
DROP TABLE AIRPLANE_TYPE;
DROP TABLE AIRPORT;
DROP TABLE TIMEZONE;
DROP TABLE RESERVATION_HISTORY;

--
-- table CUSTOMER
--
CREATE TABLE CUSTOMER (
    SSN			NUMBER(9, 0)	NOT NULL,
    First_Name		VARCHAR2(20)	NOT NULL,
    Last_Name		VARCHAR2(30)    NOT NULL,
    Age			NUMBER(3, 0)	NOT NULL,
    Mail_Address	VARCHAR2(255)	NOT NULL,
    Phone_Num		CHAR(10),
    Credit_Type		CHAR DEFAULT 'F' NOT NULL,
    PRIMARY KEY (SSN)
);

--
-- table RESERVATION_HISTORY
--
CREATE TABLE RESERVATION_HISTORY (
    CSSN 		NUMBER(9, 0) 	NOT NULL,
    Reservation_Date	DATE		NOT NULL,
    Flight_Num  	CHAR(9)		NOT NULL,
    PRIMARY KEY (CSSN, Reservation_Date)
);

--
-- table CREDIT_TYPE
--
CREATE TABLE CREDIT_TYPE (
    Reservations	NUMBER(3)	NOT NULL,
    Credit_Type		CHAR		NOT NULL,
    PRIMARY KEY(Reservations)
);

--
-- table FLIGHT_RESERVATION
--
CREATE TABLE FLIGHT_RESERVATION (
    CSSN		NUMBER(9, 0) 	NOT NULL,
    Reservation_Date	DATE		NOT NULL,
    Flight_Num		CHAR(9)		NOT NULL,
    Fare		NUMBER(7, 2)	NOT NULL,
    PRIMARY KEY (CSSN, Reservation_Date)
);

--
-- table CREDIT_RATE
--
CREATE TABLE CREDIT_RATE (
    Credit_Type		CHAR 	     			NOT NULL,
    Discount		NUMBER(3, 2) DEFAULT(1.0) 	NOT NULL,
    Comments		VARCHAR2(255),
    PRIMARY KEY (Credit_Type)
);

--
-- table FLIGHT_LEG
--
CREATE TABLE FLIGHT_LEG (
    Flight_Num		CHAR(9)		NOT NULL,
    Departure_Airport	CHAR(128)	NOT NULL,
    Departure_Time      CHAR(5)		NOT NULL,
    Arrival_Airport	CHAR(128)	NOT NULL,
    Arrival_Time	CHAR(5)		NOT NULL,
    Weekday		CHAR(4)		NOT NULL,
    PRIMARY KEY (Flight_Num)
);

--
-- table LEG_INSTATNCE
--
CREATE TABLE LEG_INSTANCE (
    Flight_Num		CHAR(9)		NOT NULL,
    Flight_Date		DATE		NOT NULL,
    Airplane_Id		NUMBER(5)	NOT NULL,
    Available_Seats	NUMBER(3)	NOT NULL,
    Fare		NUMBER(7, 2)    NOT NULL,
    PRIMARY KEY(Flight_Num, Flight_Date)
);

--
-- table AIRLINE
--
CREATE TABLE AIRLINE (
    Flight_Num		CHAR(9)		NOT NULL,
    Airline		VARCHAR2(128)	NOT NULL,
    PRIMARY KEY (Flight_Num)
);

--
-- table AIRPORT
--
CREATE TABLE AIRPORT (
    Airport_Id		NUMBER(5)	NOT NULL,
    Name		VARCHAR2(128)	NOT NULL,
    City		VARCHAR2(32)    NOT NULL,
    State		CHAR(2)		NOT NULL,
    Timezone		CHAR(4)		NOT NULL,
    Airport_Level	NUMBER(2)	NOT NULL, 
    PRIMARY KEY (AIRPORT_ID)
);

--
-- table TIMEZONE
--
CREATE TABLE TIMEZONE (
    Zone    		CHAR(4)		NOT NULL, 
    Difference 		NUMBER(1)	NOT NULL,
    PRIMARY KEY (Zone)
);

--
-- table AIRPLANE
--
CREATE TABLE AIRPLANE (
    Airplane_Id		CHAR(15)	NOT NULL,
    Airplane_Type	CHAR(30)	NOT NULL,
    Company		VARCHAR2(128)	NOT NULL,
    PRIMARY KEY(Airplane_Id)
);

--
-- table AIRPLANE_TYPE
--
CREATE TABLE AIRPLANE_TYPE (
    Airplane_Type 	CHAR(30)	NOT NULL,
    Airport_Level	NUMBER(2)	NOT NULL,
    Num_Seats		NUMBER(3)	NOT NULL,
    PRIMARY KEY (Airplane_Type)
);

COMMIT;
