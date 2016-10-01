drop table calls;
create table calls ( 
      account	       VARCHAR2(20),
      call_areacode    CHAR(10),
      call_telnum      VARCHAR2(15),
      call_time        DATE,
      call_minutes     INT,
      primary key (account,call_time) );