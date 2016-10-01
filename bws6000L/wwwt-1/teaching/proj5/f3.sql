create or replace function max_to_rent(cust_id in char)
   return number
is
   num_out number(5) := 0;
   num_avail number(1);
   cursor mycur is
      select count(*) from rentals 
         where cid=cust_id 
           and date_in is null;
begin
   open mycur;
   fetch mycur into num_out;
   num_avail := 5 - num_out;
   close mycur;
   return (num_avail);
end;
/

select rid, cid, max_to_rent('C00005') from rentals where rid='R00025';
