DROP TABLE INPATIENT;

CREATE TABLE INPATIENT
	(PATIENTNUM	CHAR(10)	NOT NULL,
	 SYMPTOM	VARCHAR2(15),
	 DIAGNOSIS	VARCHAR2(15),
	 TREATMENT	VARCHAR2(15),
	 RESULT		VARCHAR2(6),
	 DAYNUM		INT,
	 DSSN		CHAR(9)		NOT NULL,
	 PRIMARY KEY (PATIENTNUM,DSSN));


INSERT INTO INPATIENT VALUES
    ('885488','Chest pain','Lung cancer',
    'Operation','Good','20','212301123');
INSERT INTO INPATIENT VALUES
    ('323233','Abdominal pain','Stomach cancer',
    'Operation','Good','27','296383311');
INSERT INTO INPATIENT VALUES
    ('252627','Chest pain','Lung cancer',
    'Chemotherapy','Better','30','313298595');
INSERT INTO INPATIENT VALUES
    ('521918','diahrea','Colon cancer',
    'Chemotherapy','Good','18','313298595');
INSERT INTO INPATIENT VALUES
    ('395925','Abdominal pain','Stomach cancer',
    'Operation','Better','30','212301123');
INSERT INTO INPATIENT VALUES
    ('323232','Chest pain','Lung cancer',
    'Chemotherapy','Worst','41','217253993');
INSERT INTO INPATIENT VALUES
    ('345618','Chest pain','Lung cancer',
    'Radiology','Good','33','269383399');
INSERT INTO INPATIENT VALUES
    ('663938','Abdominal pain','Stomach cancer',
    'Chemotherapy','Better','45','212301127');
INSERT INTO INPATIENT VALUES
    ('555638','Checst pain','Lung cancer',
    'Operation','Good','29','212301123');
INSERT INTO INPATIENT VALUES
    ('423217','Abdominal apin','Stomach cancer',
    'Radiology','Good','50','737251632');
INSERT INTO INPATIENT VALUES
    ('732632','Coughing','Lung cancer',
    'Operation','Worst','31','212301123');
INSERT INTO INPATIENT VALUES
    ('032562','Coughing','Lung cancer',
    'Operation','Better','27','296383311');
INSERT INTO INPATIENT VALUES
    ('293926','Chest pain','Lung cancer',
    'Chemotherapy','Better','43','313298595');
INSERT INTO INPATIENT VALUES
    ('412529','	Abdominal pain','Stomach cancer',
    'Chemotherapy','Good','37','217253993');
INSERT INTO INPATIENT VALUES
    ('235612','Diahrea','Colon cancer',
    'Operation','Good','22','212301123');
INSERT INTO INPATIENT VALUES
    ('331366','Diahrea','Colon cancer',
    'Radiology','better','49','269383399');
INSERT INTO INPATIENT VALUES
    ('252629','Chest pain','Lung cancer',
    'Operation','Good','20','212301123');
INSERT INTO INPATIENT VALUES
    ('063277','Chest pain','Lung cancer',
    'Chemotherapy','Better','30','313298595');
INSERT INTO INPATIENT VALUES
    ('445624','diahrea','Colon cancer',
    'Chemotherapy','Good','18','313298595');
INSERT INTO INPATIENT VALUES
    ('412229','Abdominal pain','Stomach cancer',
    'Operation','Better','30','212301123');
INSERT INTO INPATIENT VALUES
    ('663939','Chest pain','Lung cancer',
    'Chemotherapy','Worst','41','217253993');
INSERT INTO INPATIENT VALUES
    ('919635','Chest pain','Lung cancer',
    'Radiology','Good','33','269383399');
INSERT INTO INPATIENT VALUES
    ('331363','Abdominal pain','Stomach cancer',
    'Chemotherapy','Better','45','212301127');
INSERT INTO INPATIENT VALUES
    ('412429','Abdominal apin','Stomach cancer',
     'Radiology','Good','50','737251632');
INSERT INTO INPATIENT VALUES
    ('663941','Coughing','Lung cancer',
    'Operation','Worst','31','212301123');
INSERT INTO INPATIENT VALUES
    ('916636','Coughing','Lung cancer',
    'Operation','Better','27','296383311');
INSERT INTO INPATIENT VALUES
    ('331364','Chest pain','Lung cancer',
    'Chemotherapy','Better','43','313298595');
INSERT INTO INPATIENT VALUES
    ('445637','Abdominal pain','Stomach cancer',
    'Chemotherapy','Good','37','217253993');
INSERT INTO INPATIENT VALUES
    ('555639','Diahrea','Colon cancer',
    'Operation','Good','22','212301123');
INSERT INTO INPATIENT VALUES
    ('423218','Diahrea','Colon cancer',
    'Radiology','better','49','269383399');
INSERT INTO INPATIENT VALUES
    ('732635','Coughing','Lung cancer',
    'Operation','Better','27','29638331');



