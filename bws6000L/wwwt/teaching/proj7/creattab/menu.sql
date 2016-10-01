--// menu.sql
--// create regular menu table.


drop table menu;

create table Menu(
No	INT     	NOT NULL,
Name	varchar(36)     NOT NULL,
Price	float,
StyleNo	int,
primary key(No),
UNIQUE(Name)); 
