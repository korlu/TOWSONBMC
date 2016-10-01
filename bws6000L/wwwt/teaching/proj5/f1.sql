create or replace function get_age (dob in date)
   return number
is
   age number(3);
begin
   select months_between(sysdate,dob)/12 into age from dual;
   return (age);
end;
/


select get_age('1-Jan-86') from dual;