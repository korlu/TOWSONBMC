drop table tax_rate;
create table tax_rate ( 
      area_code	       CHAR(10),
      tax_rate         FLOAT,
      primary key (area_code) );