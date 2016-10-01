drop table line_fix_charge;
create table line_fix_charge ( 
      account	       VARCHAR2(20),
      order_num        INT,
      charge_fee       FLOAT,
      time             DATE,
      primary key (account,order_num) );