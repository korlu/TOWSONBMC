CREATE OR REPLACE TRIGGER delete_cust 
   BEFORE DELETE ON customers
   FOR EACH ROW
DECLARE
   delete_error EXCEPTION;
BEGIN
   IF DELETING THEN
      RAISE delete_error;
   END IF;
EXCEPTION
   WHEN delete_error THEN
      RAISE_APPLICATION_ERROR(-20001,'Customer deletes not allowed');
END;
/

delete from customers where cid='C00001';