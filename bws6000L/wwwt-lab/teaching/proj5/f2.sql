drop function get_phone;

create function get_phone(cnum in customers.cid%type)
	return	char
as
	cphone	char(15);
begin
	select 	home_phone
	into	cphone
	from	customers
	where	cid=cnum;
	return 	(cphone);
end;
/

select cid, lname, get_phone('C00001') from customers where cid='C00020';		