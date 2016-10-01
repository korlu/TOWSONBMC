/* this is file will create table of patient */

DROP TABLE PATIENT;

CREATE TABLE PATIENT
       (FNAME		VARCHAR2(10)	NOT NULL,
	LNAME		VARCHAR2(10)	NOT NULL,
	PNUMBER		CHAR(8)     	NOT NULL,
	PSSN		CHAR(9)		NOT NULL,
	SEX		CHAR(5)		NOT NULL,
	BDATE		CHAR(13),
	ADDRESS		VARCHAR2(30),
	PHONE		CHAR(10),
	PRIMARY KEY(PNUMBER,PSSN));

/* this file will insert tuple to the table patient */

INSERT INTO PATIENT VALUES
	('George', 'Wong','235608','257293164','M','28-May-32',
	 '916 Alan Dr. Baltimore MD','4107370512');
INSERT INTO PATIENT VALUES
	('Jack','Lee','051919','739241923','M','23-Mar-56',
	 '313 Hooper Ave, Baltimore MD','4102473563');
INSERT INTO PATIENT VALUES
	('Paul','Albert','405926','626532986','M','05-Feb-64',
	 '5594 Cedar ln, Ellicott MD','4102555656');
INSERT INTO PATIENT VALUES
	('Carol','Best','445635','395583320','F','12-May-60',
	 '202 Creenway, Baltimore MD','4102376593');
INSERT INTO PATIENT VALUES
	('Kohan','David','051916','586351424','M','18-Sep-45',
	 '471 Steven Ln, Towson MD','4108280317');
INSERT INTO PATIENT VALUES
	('Robert','Brown','245613','212301125','M','25-Mar-41',
	 '10 Grass Ct Owings Mills MD','4105819524');
INSERT INTO PATIENT VALUES
	('Frank','Brown','412129','217253987','M','22-May-35',
	 '1112 Bay Rd , Annapolis MD','4105781380');
INSERT INTO PATIENT VALUES
	('Francis','Lee','992345','202591924','F','01-Feb-34',
	 '437 N Chas St. Baltimore MD','4103589022');
INSERT INTO PATIENT VALUES
	('Harvey','Cohen','013256','471568988','F','11-Oct-58',
	 '1132 Gypsy Ln. Towson MD','4102963677');
INSERT INTO PATIENT VALUES
	('Cullop','Barry','385916','257293167','F','05-Nov-46',
	 '330 Perry Ln. Owings Mills MD','4106470316');
INSERT INTO PATIENT VALUES
	('Hohn','Dafin','771312','739241918','M','11-Feb-32',
	 '170 Fox Dr. Towson MD','4104362943');
INSERT INTO PATIENT VALUES
	('Rose','Hallen','395921','586351420','F','16-Feb-38',
	 '1953 Little Pkwy Columbia MD','4109979200');
INSERT INTO PATIENT VALUES
	('Stephen','David','331362','471568991','M','22-May-53',
	 '637 Sunspot Ct. Towson MD','4104782344');
INSERT INTO PATIENT VALUES
	('William','Amstad','063275','257293166','M','28-Nov-33',
	 '4331 Roland Ct. Towson MD','4103216527');
INSERT INTO PATIENT VALUES
	('Fllorance','Best','245614','626532989','F','21-Aug-55',
	 '1348 Hilltop Ln. Ellicott MD','4104183312');
INSERT INTO PATIENT VALUES
	('Jack','Erdossy','885488','313298586','M','23-Jul-22',
	 '1818 Shield Rd. Towson MD','4105328644');
INSERT INTO PATIENT VALUES
	('Warren','Ershow','323233','296383365','F','28-May-65',
	 '600 33th St. Baltimore MD','4103139070');
INSERT INTO PATIENT VALUES
	('Jerry','Fruit','252627','325385912','F','25_mar-68',
	 '401 Loop St. Glen Burnie MD','4105539761');
INSERT INTO PATIENT VALUES
	('Mark','Gordan','521918','739241920','M','25-May-42',
	 '2300 Fulton Ave. Baltimor MD','4104865006');
INSERT INTO PATIENT VALUES
	('John','Harden','395925','313298597','M','13-Feb-58',
	 '1501 Natl Rd Baltimore MD','4108664011');
INSERT INTO PATIENT VALUES
	('Arthur','Jones','323232','325385920','M','03-Nov-41',
	 '211 Spring Ct. Baltimore MD','4106853790');
INSERT INTO PATIENT VALUES
	('James','Kues','345618','39583324','M','27-Mar-55',
	 '439 Enfld Rd Ellicott MD','4103139563');
INSERT INTO PATIENT VALUES
	('Wayne','Kukila','663938','202581918','F','05-Apr-47',
	 '2387 Homewood Baltimore MD','4105376862');
INSERT INTO PATIENT VALUES
	('Richard','Lewis','555638','217253996','M','05-Sep-33',
	 '2554 Bright Ln Ellicott MD','4103134548');
INSERT INTO PATIENT VALUES
	('Kevin','Lykens','423217','257293166','F','09-Feb-45',
	 '1190 St. Paul Baltimore MD','4106365427');
INSERT INTO PATIENT VALUES
	('Mandir','Malwitz','732632','212301129','M','08-Jul-51',
	 '313 Charlse St. Baltimore MD','4105783440');
INSERT INTO PATIENT VALUES
	('Clara','Mason','032562','296383312','F','14-Apr-32',
	 '660 Chester St. Baltimore MD','4104836039');
INSERT INTO PATIENT VALUES
	('Ann','Marris','293926','535353324','F','22-Nov-62',
	 '14 Oak St. Catnsvle MD','4106653780');
INSERT INTO PATIENT VALUES
	('Alice','Massey','412529','418333927','F','04-May-66',
	 '3417 Chester St. Baltimore MD','4104723356');
INSERT INTO PATIENT VALUES
	('Adana','Masur','235612','212301110','F','06-Nov-57',
	 '561 Meadow Ln. Baltimore MD','4107370411');
INSERT INTO PATIENT VALUES
	('Benjamine','Mathews','331366','395583322','M','22-Oct-33',
	 '2533 Calvrt St. Baltimore MD','4108753312');
INSERT INTO PATIENT VALUES
	('Thomas','Mcdaniel','345622','212301128','M','05-Mar-41',
	 '2143 Lori Dr. Glen Burnie MD','4107667159');
INSERT INTO PATIENT VALUES
	('Kethy','Brown','235610','325385916','F','18-Mar-66',
	 '410 Cedar Hill Baltimore MD','4106362309');
INSERT INTO PATIENT VALUES
	('Michelle','Rhyu','385917','257293165','M','13-Feb-65',
	 '232 Hooper Ave. Baltimore MD','4107375914');
INSERT INTO PATIENT VALUES
	('Anne','Vojtek','771317','586351421','F','19-Apr-35',
	 '408 Alan Dr. Baltimore MD','4107374327');
INSERT INTO PATIENT VALUES
	('Jonathan','Cooper','013257','535353325','M','25-Nov-48',
	 '1233 West Dr. Towson MD','4107560418');
INSERT INTO PATIENT VALUES
	('Robin','Weiss','252628','418333924','M','05-Dec-41',
	 '518 Sun Rise Rd. Ellicott MD','4104183379');
INSERT INTO PATIENT VALUES
	('Hellen','Tailor','395923','257293167','F','02-Oct-38',
	 '313 Alan Dr. Baltimore MD','4107379070');
INSERT INTO PATIENT VALUES
	('Joel','Huberman','521920','586351422','F','03-Apr-35',
	 '3318 Pear Ln. Baltimore MD','4106873355');
INSERT INTO PATIENT VALUES
	('Steven','Zimmerly','771315','739241919','M','02-Nov-45',
	 '5662 Fox Dr. Ellicott MD','4104189988');
INSERT INTO PATIENT VALUES
	('Huatao','Guo','013259','395583321','F','08-Dec-47',
	 '33 Hooper Ave. Baltimore MD','4107377766');
INSERT INTO PATIENT VALUES
	('Philip','Perlman','345620','739241921','M','09-Nov-56',
	 '692 Hill Dr. Towson MD','4105786633');
INSERT INTO PATIENT VALUES
	('Karla','Henning','405928','395583323','F','11-Oct-57',
	 '563 Ceder Dr. Ellicott MD','4104181122');
INSERT INTO PATIENT VALUES
	('Narayan','Lyer','252629','739241922','F','06-Apr-57',
	 '291 Oak Ct. Ellicott MD','4104189944');
INSERT INTO PATIENT VALUES
	('Lisa','McDaniel','992347','626532987','F','11-Oct-48',
	 '9901 HillTop Ln Ellicott MD','4103139012');
INSERT INTO PATIENT VALUES
	('Michael','Reagan','063277','471568989','M','02-Nov-34',
	 '571 Lori Dr. Towson  MD','4105783323');
INSERT INTO PATIENT VALUES
	('Randy','Legerski','445624','626532988','M','05-Apr-38',
	 '3312 Homewood Baltimore MD','4106613312');
INSERT INTO PATIENT VALUES
	('Roger','Schultz','412229','471568992','M','03-May-56',
	 '538 Bright Ln. Ellicott MD','4103139977');
INSERT INTO PATIENT VALUES
	('Miria','Stefenini','663939','418333923','F','05-Jan-58',
	 '449 Steven Ln Towson MD','4106893344');
INSERT INTO PATIENT VALUES
	('Alan','Lehmann','919635','626532990','M','22-Jul-38',
	 '4233 Homewood Baltimore MD','4105789918');
INSERT INTO PATIENT VALUES
	('Lynne','Mayne','331363','535353326','F','03-May-42',
	 '3346 Roland Ct. Towson MD','4103215588');
INSERT INTO PATIENT VALUES
	('Errol','Freidberg','455636','418333925','F','05-Mar-41',
	 '334 Hooper Ave. Baltimore MD','4107379911');
INSERT INTO PATIENT VALUES
	('Stig','Hansen','412429','471568990','F','08-May-47',
	 '3911 Fulton Ave. Baltimore MD','4105780413');
INSERT INTO PATIENT VALUES
	('Robert','Tjian','663941','212301122','M','11-Oct-56',
	 '939 Chestnut Ln. Baltimore MD','4103136678');
INSERT INTO PATIENT VALUES
	('Daniel','Reines','916636','313298587','F','05-Apr-32',
	 '498 Charlse St. Baltimore MD','4105786688');
INSERT INTO PATIENT VALUES
	('Paul','Doetsh','331364','325385913','M','04-Aug-52',
	 '209 Greenway Baltimore MD','4102376676');
INSERT INTO PATIENT VALUES
	('David','Gdula','445637','217253988','M','05-Mar-66',
	 '3314 St Paul St Baltimore MD','4105786699');
INSERT INTO PATIENT VALUES
	('Denis','Gerosmov','555639','296383366','F','08-Apr-45',
	 '2769 Cavert St. Baltimore MD','4108759911');
INSERT INTO PATIENT VALUES
	('Olga','Simonova','423218','202591923','F','11-Dec-56',
	 '345 Paradise Rd. Baltimore MD','4107379922');
INSERT INTO PATIENT VALUES
	('Victor','Corces','732635','296383377','M','10-Nov-58',
	 '1143 N Chas St. Baltimore MD','4103584478');
