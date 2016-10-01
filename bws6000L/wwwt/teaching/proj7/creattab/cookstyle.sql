--// cookstyle.sql
--// create cook style table


drop table CookStyle;

create table CookStyle(
CNo	int	NOT NULL,
CookStyle	varchar(12)	NOT NULL,
primary key(CNo),
UNIQUE(CookStyle));
