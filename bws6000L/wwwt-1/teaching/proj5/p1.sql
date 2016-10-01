drop table cust_status cascade constraints;

create table cust_status
    (city	varchar2(30),
     state	char(8));
/

insert into cust_status (city, state)
    select	city, state
    from	customers 
/

select count(*) from cust_status where city='Baltimore';

create or replace procedure rm_co(cname cust_status.city%type)
as
begin
   delete from cust_status where city=cname;
end;
/

select count(*) from cust_status where city='Baltimore';

execute rm_co('Baltimore');

select count(*) from cust_status where city='Baltimore';

drop table cust_status cascade constraints;
