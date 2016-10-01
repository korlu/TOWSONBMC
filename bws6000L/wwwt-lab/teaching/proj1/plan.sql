drop table plan;
create table plan
    ( plan_num         INT,
      plan_name        VARCHAR2(20),
      plan_start       DATE,
      plan_expire      DATE,
      primary key ( plan_num ) );
