drop table special_service_fee;
create table special_service_fee ( 
      service_num      INT,
      service_name     VARCHAR2(50),
      monthly_fee      FLOAT,
      primary key (service_num) );