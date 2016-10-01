drop table planrate;
create table planrate
    ( plan_num         INT,
      plan_areacode    CHAR(10),
      plan_rate        FLOAT,
      primary key ( plan_num,plan_areacode ) );
