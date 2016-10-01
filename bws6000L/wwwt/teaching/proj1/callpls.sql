drop table call_places;
create table call_places ( 
      call_areacode	CHAR(10),
      call_telnum	VARCHAR2(15),
      call_place	VARCHAR2(50),
      primary key (call_areacode) );