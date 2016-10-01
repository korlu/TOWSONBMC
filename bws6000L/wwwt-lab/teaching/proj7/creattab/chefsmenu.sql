--//  chefsmenu.sql
--// create chef's menu table

drop table ChefsMenu;

create table ChefsMenu(
ChefsNo      INT             NOT NULL,
ChefsName    varchar(36)     NOT NULL,
Price   float,
StyleNo int,
primary key(ChefsNo),
UNIQUE(ChefsName));

