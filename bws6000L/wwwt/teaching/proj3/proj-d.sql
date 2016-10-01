REM DATA FOR SUPPLIER
INSERT INTO     SUPPLIER
VALUES          ('S1','DELL Computer Company','321 Castle,Spring,MD',
		'410-876-9453','(410)-986-1262','http://www.dell.com');
INSERT INTO     SUPPLIER
VALUES          ('S2','Compaq Computer Company','125 Baltimore Street,MD',
                '410-876-9053','(410)-986-1212','http://www.compaq.com');
INSERT INTO     SUPPLIER
VALUES          ('S3','Microsoft Corporation','17 Joppa Road,MD',
		'410-896-9400','(410)-996-1262','http://www.microsoft.com');
INSERT INTO     SUPPLIER
VALUES          ('S4','IBM Corporation','19 York Road,MD',
                '410-816-9488','(410)-186-1260','http://www.ibm.com');
INSERT INTO     SUPPLIER
VALUES          ('S5','Intel Corporation','98 Charles Street,MD',
                '410-116-9773','(410)-996-1002','http://www.intel.com');
INSERT INTO     SUPPLIER
VALUES          ('S6','Umax Technologies','85 Fayette Street,MD',
                '410-812-9765','(410)-980-9262','http://www.umax.com');
INSERT INTO     SUPPLIER
VALUES          ('S7','NEC Computer Systems','88 Baltimore Street,MD',
                '410-806-5453','(410)-986-8862','http://www.nec.com');
INSERT INTO     SUPPLIER
VALUES          ('S8','Gateway Computer Company','700 Vally View,MD',
		'410-866-9453','(410)-986-1052','http://www.gateway.com');
INSERT INTO     SUPPLIER
VALUES          ('S9','AEC Software Ltd','25 Moravia Road,MD',
                '410-843-8769','(410)-125-1662','http://www.aec.com');
INSERT INTO     SUPPLIER
VALUES          ('S10','Lotus Corporation','23 Loch Raven blvd,MD',
		'410-887-9431','(410)-986-1431','http://www.lotus.com');


REM DATA FOR CUSTOMER
INSERT INTO     CUSTOMER
VALUES          ('C1','John','B','Smith','731 Fondren,Houston,TX',
		'M','410-765-9876','(410)-987-6546');
INSERT INTO     CUSTOMER
VALUES          ('C2','Joyce','P','Kumar','7701 Green,Terrace,MD',
		'M','410-336-9485','(410)-276-8576');
INSERT INTO     CUSTOMER
VALUES          ('C3','George','D','Bush','117 Fondren,Houston,TX',
		'M','310-236-9433', '(310)-276-3155');  
INSERT INTO     CUSTOMER
VALUES          ('C6','Phil','H','Ashio','23 East Bend Ct,MD',
		'M','410-236-0196','(410)-273-4756');
INSERT INTO     CUSTOMER
VALUES          ('C8','Scott','B','Jamisson','71 East Bend Ct,MD',
		'M','410-277-9485','(310)-277-3456');
INSERT INTO     CUSTOMER
VALUES          ('C10', 'Ronald','D','Boer','2305 Moravia Road,MD',
		'M','410-236-9225','(410)-276-2276');
INSERT INTO     CUSTOMER
VALUES          ('C15','Tom','M','Rahman','110 Joppa Road,MD',
 		'M','410-256-9465','(410)-256-8570');
INSERT INTO     CUSTOMER
VALUES          ('C16','Christina','S','Norton','121 West Joppa,MD',
		'F','410-436-9485','(410)-476-8576');
INSERT INTO     CUSTOMER
VALUES          ('C17','David','B','Stevenson','25 Northern Park,MD',
		'M','410-136-1485','(410)-176-8570');
INSERT INTO     CUSTOMER
VALUES          ('C19', 'Emily','B','Smith','285 Northern Park,MD',
		'F','410-136-9485', '(410)-176-8576');  
INSERT INTO     CUSTOMER
VALUES          ('C21','Droopy','D','Becker','195 East Bend Ct,MD',
		'M','410-236-0485', '(410)-236-8976');
INSERT INTO     CUSTOMER
VALUES          ('C23','Jerry','T','Rice','243 Green Terrace,MD',
		'M','410-825-9485','(410)-825-8576');
INSERT INTO     CUSTOMER
VALUES          ('C18','Buggs','B','Bunny','34 Moravia road MD',
		'F','410-436-0485','(410)-436-8576');
INSERT INTO     CUSTOMER
VALUES          ('C31', 'Bob', 'M','Sharpe','236 Baltimore Street,MD',
		'M','410-206-9485','(410)-206-8576'); 
INSERT INTO     CUSTOMER
VALUES          ('C33', 'Patrick', 'K','Sam','174 York Road MD ',
		'M','410-236-0485','(410)-270-8506');
INSERT  INTO    CUSTOMER
VALUES          ('C34', 'Christy','B','Flower','67 East Frederic,MD',
		'F','410-206-9480','(410)-206-8976');
INSERT  INTO    CUSTOMER
VALUES          ('C45', 'Hary','G','Rode','233 York Road MD','M',
		'410-236-9485','(410)-376-8576');
INSERT  INTO    CUSTOMER
VALUES          ('C29', 'Joe', 'B','Montana','95 Fayette Street,MD','M',
		'310-236-0485','(310)-276-0576');                              
INSERT  INTO    CUSTOMER
VALUES          ('C20','Thomas','R','Jeferson','185,Fayette Street','M',
		'310-236-9480','(310)-276-8575');                              
INSERT  INTO    CUSTOMER
VALUES          ('C7','Micky','K','Gilbard','555 West Joppa Road,MD','M',
		'410-825-3485', '(410)-825-6576');
INSERT  INTO    CUSTOMER
VALUES          ('C9','Joel','R','Garner','235 Park Road MD','M',
		'410-026-9485','(310)-026-8576');


REM DATA FOR DEPARTMENT
INSERT INTO     DEPARTMENT
VALUES		(1,'HARDWARE','410-546-9875','(410)-657-1421');
INSERT INTO     DEPARTMENT
VALUES          (2,'SOFTWARE','410-147-9988','(410)-356-3441');
INSERT INTO     DEPARTMENT
VALUES          (3,'ACCESSORIES','410-875-9934','(410)-157-3229');

REM DATA FOR EMPLOYEE EDUCATION
INSERT INTO     EMP_EDUCATION
VALUES          ('123456789','Associate Degree in CIS','16-JAN-91',
                3.11,'Essex Community College','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('124456789','Associate Degree in IS','12-JUN-90',
                3.0,'Austin Community College','Deans List');

INSERT INTO     EMP_EDUCATION
VALUES          ('223456685','Bachelors in Management','16-JUN-92',
                3.10,'Towson University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('123445678','High School graduate','11-FEB-95',
                3.0,'City College of New York','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('123456709','MS in Computer Engineering','16-JAN-85',
                3.95,'City University of New York','Cum Laude');

INSERT INTO     EMP_EDUCATION
VALUES          ('119456789','Bachelors in Computer Science','19-JUN-90',
                3.65,'Ohio State University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('128456789','Bachelors in IS','16-MAR-92',
                3.65,'Okolahama State University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('137456789','MS in Computer Science','12-JUL-94',
                4.0,'Virginia Tech.','Presidents list');

INSERT INTO     EMP_EDUCATION
VALUES          ('233356685','Associate Degree in Business','14-JAN-94',
                3.0,'Towson University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('123226789','Bachelors in Management','11-JAN-95',
                3.12,'Loyola College','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('119456399','MS in Computer Engineering','16-MAR-85',
                3.85,'Texas University','Honors List');

INSERT INTO     EMP_EDUCATION
VALUES          ('126544444','Associate Degree in IS','17-JUN-90',
                3.11,'Morgan State University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('225566778','Bachelors in Management','16-JAN-95',
                3.65,'Towson University','NULL');

INSERT INTO     EMP_EDUCATION
VALUES          ('334422678','Bachelors in Business','23-DEC-90',
                3.0,'Towson University','NULL');
REM DATA FOR SALARY
INSERT  INTO    SALARY
VALUES          ('123456789','10-NOV-97',25000,2000,1000); 

INSERT  INTO    SALARY
VALUES          ('124456789','10-JUN-98',23000,1500,800); 

INSERT  INTO    SALARY
VALUES          ('223456685','13-NOV-97',25000,3000,1500); 

INSERT  INTO    SALARY
VALUES          ('123456709','10-NOV-95',35000,2000,1000); 

INSERT  INTO    SALARY
VALUES          ('119456789','10-JAN-97',25000,2000,1000); 

INSERT  INTO    SALARY
VALUES          ('128456789','05-MARCH-97',25000,1500,1200); 

INSERT  INTO    SALARY
VALUES          ('137456789','01-NOV-93',45000,5000,2000); 

INSERT  INTO    SALARY
VALUES          ('233356685','10-DEC-97',25000,2000,1000); 

INSERT  INTO    SALARY
VALUES          ('123226789','10-NOV-97',25000,2000,1000); 

INSERT  INTO    SALARY
VALUES          ('119456399','22-NOV-94',40000,2500,1500); 

INSERT  INTO    SALARY
VALUES          ('123450789','10-AUG-97',25000,2000,800); 

INSERT  INTO    SALARY
VALUES          ('126544444','10-AUG-98',20000,3000,1000); 

INSERT  INTO    SALARY
VALUES          ('123445678','29-OCT-97',25000,2500,1500); 



REM DATA FOR TRANSPORTATION
INSERT INTO     TRANSPORTATION
VALUES          ('T1','VAN',300,'22-JUN-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T2','TRUCK',400,'25-JUN-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T3','EXPRESS',800,'29-JUN-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T4','VAN',700,'30-JUN-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T5','TRUCK',400,'3-JUL-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T6','EXPRESS',1000,'6-JUL-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T7','VAN',200,'8-JUL-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T8','VAN',300,'22-JUL-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T9','TRUCK',400,'25-JUL-98');
INSERT INTO     TRANSPORTATION
VALUES          ('T10','EXPRESS',800,'29-JUL-98');

REM DATA FOR DEPENDENT
INSERT   INTO  DEPENDENT
VALUES             ('137456789','Alice','F','05-APR-86','DAUGHTER');

INSERT   INTO  DEPENDENT
VALUES             ('334422678','Theodore','M','25-OCT-90','SON');

INSERT   INTO  DEPENDENT
VALUES             ('119456399','Joy','F','03-MAY-65','SPOUSE');

INSERT   INTO  DEPENDENT
VALUES             ('123456709','Abner','F','21-FEB-55','SPOUSE');

INSERT   INTO  DEPENDENT
VALUES             ('123456789','Micheal','M','01-JAN-90','SON');

INSERT   INTO  DEPENDENT
VALUES              ('124456789','Elizabeth','F','05-MAY-90','DAUGHTER');

INSERT   INTO  DEPENDENT
VALUES             ('223456685','Crystina','F','05-APR-80','SPOUSE');

INSERT   INTO  DEPENDENT
VALUES             ('119456789','Pamela','F','25-OCT-65','SPOUSE');

REM DATA FOR CATALOGUE
INSERT INTO     CATALOG
VALUES          (1,'Computer Life','09-MAY-98');
INSERT INTO     CATALOG
VALUES          (2,'PC World','09-JUL-98');
INSERT INTO     CATALOG
VALUES          (3,'Bits and Bytes','09-SEP-98');
INSERT INTO     CATALOG
VALUES          (4,'Computing','09-NOV-98');



REM DATA FOR PRODUCT
INSERT INTO     PRODUCT
VALUES          ('P1',1,'S1',1,'IMB PORTABLE DESKTOP SOLO 9100XL',
		4099.99,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P2',1,'S1',1,'EPSON 1440 DPI INK JET PRINTERS',
                199,210,'T2');
INSERT INTO     PRODUCT
VALUES          ('P3',1,'S1',2,'TOSHIBA SATELLITE 4000CDS TAPTOP',
                1699,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P4',1,'S1',3,'14 X CD-ROM DRIVER PCGA-CD',
                299.99,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P5',1,'S1',3,'GATEWAY FAMILY FOUNDATION PC G6-350',
                1599,1000,'T5');
INSERT INTO     PRODUCT
VALUES          ('P6',1,'S1',4,'GATEWAY FRIEND OF THE FAMILY PC G6-450',
                1999,1000,'T5');
INSERT INTO     PRODUCT
VALUES          ('P7',1,'S1',4,'GATEWAY FAR-FLUNG FAMILY SOLO PC 3100LS',
                2499,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P8',1,'S1',4,'GATEWAY THE BUDDING SCHOLAR G6-33C',
                1499,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P9',1,'S1',1,'GATEWAY THE PERSONAL TUTOR G6-400',
                1799,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P10',1,'S1',2,'GATEWAY BLAST OFF G6-450',
                2499,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P11',1,'S1',3,'GATEWAY HYPERSPACE GX-450XL',
                3999,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P12',1,'S1',4,'GATEWAY PORTABLE DESKTOP SOLO 9100XL',
                4099,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P13',1,'S1',1,'COMPAQ ARMADA 1592 NOTEBOOK',
                1399,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P14',1,'S1',3,'COMPAQ PRESARIO 4640',
                769,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P15',1,'S1',1,'COMPAQ PRESARIO 5610',
                1399,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P16',1,'S1',2,'COMPAQ DESKPRO 6000',
                799,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P17',1,'S1',1,'DELL DIMENSION V350 PC',
                19999,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P18',1,'S1',2,'DELL DIMENSION XPS R450 PC',
                3249,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P19',1,'S1',1,'DELL DIMENSION XPS R400 PC',
                2299,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P20',1,'S1',3,'DELL DIMENSION V33c',
                1599,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P21',1,'S1',4,'MONORAIL PERSONAL COMPUTER 8325',
                1200,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P22',1,'S1',1,'NEC POWERMATE 8100 SERIES',
                1349,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P23',1,'S1',2,'POWERMATE 5100 SERIES',
                939,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P24',1,'S1',1,'NEC VERSA LX/SX',
                2399,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P25',1,'S1',2,'TOSHIBA SATELLITE 4010CDT',
                2271.76,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P26',1,'S1',1,'CANON BJC-80 COLOR BUBBLE JET PRINTER',
                299,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P27',1,'S1',2,'EPSON STYLUS COLOR 640 INK JET PRINTER',
                199,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P28',1,'S1',1,'MILLENNIA C333 PC',
                1249,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P29',1,'S1',2,'MILLENNIA 350 PC',
                1499,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P30',1,'S1',1,'MILLENNIA 450 PC',
                1699,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P31',1,'S1',4,'MILLENNIA 450 MAX PC',
                2499,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P32',1,'S1',4,'TREK2 233 LAPLOP OF MICRON CLECTRONICS',
                1799,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P33',1,'S1',1,'CLIENT PRO CS 450',
                2099,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P34',1,'S1',2,'NETFRAME 2101 PC',
                1899,1000,'T1');
INSERT INTO     PRODUCT
VALUES          ('P35',2,'S1',2,'Microsoft Office Plus',
                579.95,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P36',2,'S1',1,'Microsoft Office Professional',
                495.85,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P37',2,'S1',2,'Microsoft Office Standard',
                349.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P38',2,'S1',1,'Windows98 WITH ALL OPTIONS',
                279.95,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P39',2,'S1',3,'Outlook98',
                129.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P40',2,'S1',1,'Windows CE',
                129.95,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P41',2,'S1',3,'Word97',
                279.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P42',2,'S1',3,'Excel97',
                239.95,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P43',2,'S1',3,'WindowsNT 4.0',
                899.95,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P44',2,'S1',1,'Lotus Notes 4.6',
                1139.95,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P45',2,'S1',4,'Unix',
                569.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P46',2,'S1',4,'PowerPoint97',
                129.95,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P47',2,'S1',1,'AutoCAD/LT 14',
                649.95,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P48',2,'S1',4,'Visual Basic 5.0',
                769.95,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P49',2,'S1',1,'Crystal Reports 6.0',
                329.95,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P50',2,'S1',4,'Oracle 8.0',
                699.95,1000,'T10');
INSERT INTO     PRODUCT
VALUES          ('P51',2,'S1',1,'MCSC Plus Internet',
                2999.95,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P52',2,'S1',2,'MCSC Certification Plus',
                1999.95,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P53',2,'S1',1,'MCSC Certification Pro',
                1299.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P54',3,'S1',2,'16 MB DISK BOX',
                19.99,1000,'T1');
INSERT INTO     PRODUCT
VALUES          ('P55',3,'S1',2,'32 MB DISK BOX',
                39.99,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P56',3,'S1',1,'Lomega 2.0 GB Jaz Drive',
                399.95,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P57',3,'S1',1,'MODEM 3Com US Robotics Internal',
                127.99,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P58',3,'S1',3,'MODEM 3Com US Robotics External',
                147.99,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P59',3,'S1',1,'Zip external drive',
                199.95,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P60',3,'S1',1,'Zip internal ATAPI drive',
                99.95,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P61',3,'S1',4,'Zip 10-pack',
                99.95,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P62',3,'S1',1,'Zip 6-pack',
                79.95,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P63',3,'S1',4,'Zip 3-pack',
                49.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P64',3,'S1',1,'Jaz 2GB external drive',
                349.95,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P65',3,'S1',4,'Jaz 2GB internal drive',
                349.95,1000,'T1');
INSERT INTO     PRODUCT
VALUES          ('P66',3,'S1',4,'Jaz 2GB single',
                124.95,1000,'T6');
INSERT INTO     PRODUCT
VALUES          ('P67',3,'S1',1,'Jaz 2GB 3-pack',
                299.95,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P68',3,'S1',2,'Jaz 1GB single',
                99.95,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P69',3,'S1',2,'Jaz 1GB 3-pack',
                269.95,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P70',3,'S1',2,'Fast EtherLink XL 10/100 PCI Adapter',
                88.74,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P71',3,'S1',1,'56K Faxmodem v.90 copmatible Internal',
                127.99,1000,'T9');
INSERT INTO     PRODUCT
VALUES          ('P72',3,'S1',3,'Cisco 2501 Single LAN/WAN Router',
                1744.20,1000,'T8');
INSERT INTO     PRODUCT
VALUES          ('P73',3,'S1',4,'24-port SuperStack Dual Hub 500',
                1042.80,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P74',3,'S1',1,'ISDN Adapter',
                260,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P75',3,'S1',2,'3-D Game card',
                199,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P76',3,'S1',2,'Multimedia Accelerator',
                169,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P77',3,'S1',1,'Video capture',
                229,1000,'T1');
INSERT INTO     PRODUCT
VALUES          ('P78',3,'S1',3,'Presentation projector',
                5999,1000,'T7');
INSERT INTO     PRODUCT
VALUES          ('P79',3,'S1',3,'CD-Rewritable Drive',
                999,1000,'T2');
INSERT INTO     PRODUCT
VALUES          ('P80',3,'S1',3,'Network Storage',
                1149,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P81',3,'S1',1,'Input Device',
                60,1000,'T3');
INSERT INTO     PRODUCT
VALUES          ('P82',3,'S1',2,'IBM ThinkPad 600',
                99.99,1000,'T4');
INSERT INTO     PRODUCT
VALUES          ('P83',3,'S1',1,'USB Joystick',
                49,1000,'T2');


REM DATA FOR SUPPLIER_ORDER
INSERT INTO     SUPPLIER_ORDER
VALUES		(1,'P3','S1','25-JUN-98','8-JUL-98',10);
INSERT INTO     SUPPLIER_ORDER
VALUES          (2,'P10','S1','25-JUN-98','9-JUL-98',12);
INSERT INTO     SUPPLIER_ORDER
VALUES          (3,'P11','S6','26-JUN-98','12-JUL-98',18);
INSERT INTO     SUPPLIER_ORDER
VALUES          (4,'P14','S1','27-JUN-98','10-JUL-98',19);
INSERT INTO     SUPPLIER_ORDER
VALUES          (5,'P35','S9','28-JUN-98','15-JUL-98',20);
INSERT INTO     SUPPLIER_ORDER
VALUES          (6,'P36','S3','28-JUN-98','17-JUL-98',30);
INSERT INTO     SUPPLIER_ORDER
VALUES          (7,'P38','S3','28-JUN-98','12-JUL-98',40);
INSERT INTO     SUPPLIER_ORDER
VALUES          (8,'P41','S9','29-JUN-98','22-JUL-98',70);
INSERT INTO     SUPPLIER_ORDER
VALUES          (9,'P61','S10','29-JUN-98','20-JUL-98',20);
INSERT INTO     SUPPLIER_ORDER
VALUES          (10,'P71','S8','29-JUN-98','12-JUL-98',10);
INSERT INTO     SUPPLIER_ORDER
VALUES          (11,'P73','S2','1-JUL-98','18-JUL-98',30);
INSERT INTO     SUPPLIER_ORDER
VALUES          (12,'P78','S6','1-JUL-98','16-JUL-98',70);
INSERT INTO     SUPPLIER_ORDER
VALUES          (13,'P79','S6','2-JUL-98','22-JUL-98',60);
INSERT INTO     SUPPLIER_ORDER
VALUES          (14,'P80','S6','2-JUL-98','23-JUL-98',80);
INSERT INTO     SUPPLIER_ORDER
VALUES          (15,'P82','S1','4-JUL-98','25-JUL-98',90);

REM DATA FOR EMPLOYEE
INSERT INTO     EMPLOYEE
VALUES		('123456789',1,'HARDWARE ENGINEER','James','T','Borg',
		'23-MAY-63','123 East Fredrecick,Towson,MD','M',
		'410-100-8712','(410)-906-1876');

INSERT INTO     EMPLOYEE
VALUES		('124456789',1,'TROUBLE SHOOTER','Flower','K','Patric',
		'19-NOV-62','25 Charls Street,Towson,MD','F',
		'410-834-7884','(410)-976-3512');

INSERT INTO     EMPLOYEE
VALUES		('223456685',1,'OFFICER','Harri','B','Montana',
		'18-JAN-75','112 Northern Park,Baltimore,MD','M',
		'410-200-1234','(410)-912-1123');

INSERT INTO     EMPLOYEE
VALUES		('123445678',1,'OFFICE ASSISTANT','Sam','T','Cristy',
		'11-APR-77','185 Joppa Road,Towson,MD','F',
		'410-994-7954','(410)-911-6243');

INSERT INTO     EMPLOYEE
VALUES		('123456709',1,'MANAGER','Steven','E','David',
		'29-JUN-51','34 Frederick,Towson,MD','M',
		'410-114-7114','(410)-916-1243');

INSERT INTO     EMPLOYEE
VALUES		('119456789',2,'PROGRAMMER','Scott','S','Bany',
		'10-MAR-59','185 Towson Woods,Baltimore,MD','M',
		'410-204-7657','(410)-976-6247');

INSERT INTO     EMPLOYEE
VALUES		('128456789',2,'SYSTEM ANALYST','Bob','K','Sham',
		'11-NOV-64','555 Park Road,Towson,MD','M',
		'410-234-7604','(410)-906-6240');

INSERT INTO     EMPLOYEE
VALUES		('137456789',2,'MANAGER','Norton','G','Boer',
		'27-DEC-55','121 Muravia Road,MD','M',
		'410-234-1651','(410)-956-9249');

INSERT INTO     EMPLOYEE
VALUES		('233356685',2,'OFFICE ASSISTANT','Joel','R','Peterson',
		'05-AUG-68','236 Fayette Street,Towson,MD','M',
		'410-333-7699','(410)-936-6773');

INSERT INTO     EMPLOYEE
VALUES		('123226789',2,'OFFICER','Allen','D','Boder',
		'19-MAR-75','25 East Bend,Baltimore,MD','M',
		'410-233-7554','(410)-256-6222');

INSERT INTO     EMPLOYEE
VALUES		('119456399',3,'MANAGER','Jeferson','H','Guilbard',
		'10-NOV-58','459 Vally View,Baltimore,MD','M',
		'410-239-7654','(410)-956-9243');

INSERT INTO     EMPLOYEE
VALUES		('126544444',3,'SUPPORT ASSISTANT','Viv','R','Richard',
		'10-FEB-62','71 Green Terrace,Towson,MD','M',
		'410-234-7615','(410)-156-6143');

INSERT INTO     EMPLOYEE
VALUES		('123450789',3,'OFFICER','Pattrick','S','Garner',
		'16-NOV-65','250 Joppa,Towson,MD','M',
		'410-234-7654','(410)-956-6243');

INSERT INTO     EMPLOYEE
VALUES		('334422678',3,'SALES PERSONNEL','Silvon','H','Moby',
		'10-JAN-60','236 York road,Towson,MD','M',
		'410-244-7614','(410)-756-6241');


REM DATA FOR CUSTOMER ORDER
INSERT INTO     CUSTOMER_ORDER
VALUES          (1,'P1','C1','123656789','09-JAN-95','19-JAN-95',15);
INSERT INTO     CUSTOMER_ORDER
VALUES          (2,'P3','C10','124456789','09-JUN-98','16-JUN-98',19); 
INSERT INTO     CUSTOMER_ORDER
VALUES          (3,'P9','C34','223456685','09-JUN-98','10-JUN-98',50);
INSERT INTO     CUSTOMER_ORDER
VALUES          (4,'P33','C6','123445678','09-JUN-98','19-JUN-98',13);
INSERT INTO     CUSTOMER_ORDER
VALUES          (5,'P9','C18','123445678','09-JUN-98','21-JUN-98',25);
INSERT INTO     CUSTOMER_ORDER
VALUES          (6,'P5','C2','123456709','09-JUN-98','19-JUN-98',15 ) ;
INSERT INTO     CUSTOMER_ORDER
VALUES          (7,'P1','C17','119456789','09-JUN-98','11-JUN-98',5);
INSERT INTO     CUSTOMER_ORDER
VALUES          (8,'P1','C23','128456789','11-JUN-98','19-JUN-98',15);
INSERT INTO     CUSTOMER_ORDER
VALUES          (9,'P49','C8','137456789','11-JUN-98','29-JUN-98',35);
INSERT INTO     CUSTOMER_ORDER
VALUES          (10,'P34','C45','233356685','11-JUN-98','20-JUN-98',24);
INSERT INTO     CUSTOMER_ORDER
VALUES          (11,'P28','C33','123456709','11-JUN-98','21-JUN-98',18);
INSERT INTO     CUSTOMER_ORDER
VALUES          (12,'P13','C1','137456789','12-JUN-98','19-JUN-98',18);
INSERT INTO     CUSTOMER_ORDER
VALUES          (13,'P22','C19','123226789','12-JUN-98','23-JUN-98',12);
INSERT INTO     CUSTOMER_ORDER
VALUES          (14,'P23','C6','223456685','12-JUN-98','29-JUN-98',5); 
INSERT INTO     CUSTOMER_ORDER
VALUES          (15,'P2','C15','119456399','12-JUN-98','28-JUN-98',24);
INSERT INTO     CUSTOMER_ORDER
VALUES          (16,'P28','C21','126544444','13-JUN-98','22-JUN-98',15);
INSERT INTO     CUSTOMER_ORDER
VALUES          (17,'P39','C17','223456685','14-JUN-98','25-JUN-98',15);
INSERT INTO     CUSTOMER_ORDER
VALUES          (18,'P21','C31','119456399','14-JUN-98','26-JUN-98',25);
INSERT INTO     CUSTOMER_ORDER
VALUES          (19,'P11','C16','128456789','15-JUN-98','25-JUN-98',30);
INSERT INTO     CUSTOMER_ORDER
VALUES          (20,'P31','C6','123456709','15-JUN-98','30-JUN-98',25);










