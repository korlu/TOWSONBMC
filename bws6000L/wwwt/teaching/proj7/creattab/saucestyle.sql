--// saucestyle.sql
--// create 'SauceStyle' table


drop table SauceStyle;

create table SauceStyle(
SNo	int	NOT NULL,
SauceStyle	varchar(25)	NOT NULL,
primary key(SNo),
UNIQUE(SauceStyle));
