SELECT	FNAME,LNAME,SEX,BDATE,ANAPHYLACTOGEN,STARTDATE
FROM	PATIENT,ALLERGY
WHERE	PATIENTNUM=PNUMBER;
