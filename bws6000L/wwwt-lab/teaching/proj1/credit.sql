drop table credit;
create table credit ( 
      account	       VARCHAR2(20),
      credit_date      DATE,
      credit           FLOAT,
      reason           VARCHAR2(200),
      primary key (account,credit_date) );