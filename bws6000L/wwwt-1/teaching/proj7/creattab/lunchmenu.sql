--// lunchmenu.sql
--// create lunch menu table

drop table LunchMenu;

create table LunchMenu(
LunchNo		INT     	NOT NULL,
LunchName	varchar(36)     NOT NULL,
Price		float,
StyleNo		int,
primary key(LunchNo),
UNIQUE(LunchName)); 
