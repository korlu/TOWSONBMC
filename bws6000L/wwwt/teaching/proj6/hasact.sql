CREATE TABLE HAS_ACCOUNT
(
 HCUSTNO       CHAR(9)    NOT NULL,
 HACCTTYPE     CHAR(8)    NOT NULL,
 HACCTNUM      INT        NOT NULL,
PRIMARY KEY (HCUSTNO,HACCTTYPE,HACCTNUM)
);
