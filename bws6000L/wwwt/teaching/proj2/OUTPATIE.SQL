DROP TABLE OUTPATIENT;

CREATE TABLE OUTPATIENT
	(PATIENTNUM	CHAR(6)		NOT NULL,
	 DSSN		CHAR(9)		NOT NULL,
	 VISITDATE	DATE,
	 STARTTIME	CHAR(10),
	 ENDTIME	CHAR(10),
	 VISITREASON	VARCHAR2(15),
	 DIAGNOSIS	VARCHAR2(15),
	 PRIMARY KEY (PATIENTNUM,DSSN));

INSERT INTO OUTPATIENT VALUES
    ('235608','212301123','26-Nov-97','08:00 AM'
    ,'09:00 AM','Chest pain','Lung cancer');
INSERT INTO OUTPATIENT VALUES 
    ('919635','269383399','26-Nov-97','10:00 AM'
    ,'11:00 AM','Abdominal pain','Duodenum ulcer');
INSERT INTO OUTPATIENT VALUES 
    ('405926','313298595','30-Aug-97','07:30 AM'
    ,'08:30 AM','Headache','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('445635','212301123','26-Nov-97','09:30 AM'
    ,'10:30 AM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('051916','269383399','26-Nov-97','01:00 PM'
    ,'02:00 PM','Vomiting','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('245613','212301123','23-Sep-97','03:00 PM'
    ,'04:00 PM','Abdominal pain','Stomach cancer');
INSERT INTO OUTPATIENT VALUES 
    ('412129','269383399','14-Sep-97','10:00 AM'
    ,'11:00 AM','Chest pain','Lung cancer');
INSERT INTO OUTPATIENT VALUES 
    ('992345','313298595','02-Nov-97','08:10 AM'
    ,'09:10 AM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('013256','212301123','19-Sep-97','03:30 PM'
    ,'04:30 PM','Headache','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('385916','313298595','22-Sep-97','02:15 PM'
    ,'03:15 PM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('771312','269383399','17-Nov-97','09:10 AM'
    ,'10:10 AM','Abdominal pain','Stomach cancer');
INSERT INTO OUTPATIENT VALUES 
    ('395921','269383399','13-Sep-97','11:00 AM'
    ,'12:00 PM','Vomiting','Common cold');
INSERT INTO OUTPATIENT VALUES 
    ('331362','212301123','09-Nov-97','07:30 AM'
    ,'08:30 AM','Chest pain','Lung cancer');
INSERT INTO OUTPATIENT VALUES 
    ('063275','313298595','14-Nov-97','09:30 AM'
    ,'10:10 AM','Abdominal pain','Stomach cancer');
INSERT INTO OUTPATIENT VALUES 
    ('245614','313298595','06-Nov-97','10:30 AM'
    ,'11:30 AM','Chest pain','Lung cancer');
INSERT INTO OUTPATIENT VALUES
    ('345622','212301123','29-Nov-97','9:30 AM'
    ,'10:30 AM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('235610','269383399','10-Nov-97','1:00 PM'
    ,'2:00 PM','Vomiting','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('385917','313298595','23-Sep-97','3:00 PM'
    ,'4:00 PM','Abdominal pain','Stomach cancer');
INSERT INTO OUTPATIENT VALUES
    ('771317','212301123','14-Sep-97','10:00 AM'
    ,'11:00 AM','Chest pain','Lung cancer');
INSERT INTO OUTPATIENT VALUES
    ('013257','269383399','02-Nov-97','8:10 AM'
    ,'9:10 AM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('252628','212301123','19-Sep-97','3:30 PM'
    ,'4:30 PM','Headache','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('395923','269383399','22-Sep-97','2:15 PM'
    ,'3:15 PM','Dizziness','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('521920','313298595','17-Nov-97','9:10 AM'
    ,'10:10 AM','Abdominal pain','Stomach cancer');
INSERT INTO OUTPATIENT VALUES
    ('771315','212301123','13_Sep-97','11:00 AM'
    ,'12:00 PM','Vomiting','Common cold');
INSERT INTO OUTPATIENT VALUES
    ('013259','313298595','09-Nov-97','7:30 AM'
    ,'8:30 AM','Chest pain','Lung cancer');


