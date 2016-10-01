--Create table SCHEDULE
drop table schedule;
create table schedule ( 
      account	       VARCHAR2(20),
      start_date       DATE,
      end_date         DATE,
      plan_num         INT,
      primary key (account,start_date) );