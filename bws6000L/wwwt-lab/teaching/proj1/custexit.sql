drop table customer_exit;
create table customer_exit ( 
      account	        VARCHAR2(20),
      exit_date         DATE,
      exit_balance     FLOAT,
      primary key (account,exit_date) );