SELECT count(*)
FROM RESERVATION_HISTORY
WHERE CSSN = 219578216;

COLUMN Last_Name HEADING 'Last Name' FORMAT A10
COLUMN Discount HEADING Discount FORMAT 0.99
COLUMN Age HEADING Age FORMAT 99
SELECT SSN, Last_Name, Age, Discount
FROM CUSTOMER a, CREDIT_RATE b
WHERE Last_Name = 'Humphrey' AND
      a.Credit_Type = b.Credit_Type;


COLUMN Flight_Num HEADING Flight
COLUMN Departure_Time HEADING Departure FORMAT A9
COLUMN Arrival_Time HEADING Arrival FORMAT A7
COLUMN Fare HEADING Fare FORMAT $999.99
SELECT a.Flight_Num, Departure_Time, Arrival_Time, Fare
FROM  FLIGHT_LEG a, LEG_INSTANCE b
WHERE Weekday = 'Tues' AND 
      Departure_Airport = 'New York City Airport' AND
      arrival_airport = 'Miami Airport' AND
      Available_Seats > 0 AND
      a.Flight_Num = b.Flight_Num;


INSERT INTO FLIGHT_RESERVATION VALUES
    (219578216, '22-Dec-1998', 'NW752', 0.75 * 432.5);

UPDATE LEG_INSTANCE
SET Available_Seats = Available_Seats - 1
WHERE Flight_Num = 'NW752' AND
      Flight_Date = '22-Dec-1998';



UPDATE FLIGHT_RESERVATION 
SET Flight_Num = 'Delta500',
    Fare = 0.75 * 380.5
WHERE CSSN = 219578216 AND
      Reservation_Date = '22-Dec-1998';

UPDATE LEG_INSTANCE
SET Available_Seats = Available_Seats + 1
WHERE Flight_Num = 'NW752' AND
      Flight_Date = '22-Dec-1998';

UPDATE LEG_INSTANCE
SET Available_Seats = Available_Seats - 1
WHERE Flight_Num = 'Delta500' AND
      Flight_Date = '22-Dec-1998';


DELETE FROM FLIGHT_RESERVATION
WHERE Flight_Num = 'Delta500' AND
      Reservation_Date = '22-Dec-1998';

UPDATE LEG_INSTANCE
SET Available_Seats = Available_Seats + 1
WHERE Flight_Num = 'Delta500' AND
      Flight_Date = '22-Dec-1998';


