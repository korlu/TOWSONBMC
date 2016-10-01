drop table customer;
create table customer ( 
      account	      VARCHAR2(20),
      areacode        CHAR(10),
      telnum          VARCHAR2(15),
      fname           VARCHAR2(15),
      lname           VARCHAR2(15),
      address         VARCHAR2(100),
      primary key (account) );