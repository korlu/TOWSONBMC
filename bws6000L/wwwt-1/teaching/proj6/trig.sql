CREATE OR REPLACE TRIGGER low_balance
BEFORE INSERT OR UPDATE ON savings
FOR EACH ROW 
DECLARE 
  low_balance_error EXCEPTION; 
BEGIN 

SELECT sbalance from savings;

IF :sbalance < 50 THEN 
  RAISE low_balance_error ; 
END IF; 

EXCEPTION 
 WHEN low_balance_error THEN 
  RAISE_APPLICATION_ERROR (-20001,'Balance below 50 dollars not allowed.'); 
END;
