--// tastestyle.sql
--// create table ' TasteStyle'


drop table TasteStyle;

create table TasteStyle(
TNo	int	NOT NULL,
TasteStyle	varchar(12)	NOT NULL,
primary key(TNo),
UNIQUE(TasteStyle));
