drop table special_service;
create table special_service ( 
      account              VARCHAR2(20),
      service_num      INT,
      start_date          DATE,
      end_date           DATE,
      primary key (account) );