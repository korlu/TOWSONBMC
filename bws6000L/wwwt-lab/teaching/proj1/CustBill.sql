-- Get customer information
select * from customer where account='0000005';

-- Get customer's monthly phone calls and amount for each call(December, 1998 period)
SELECT plan_rate*call_minutes,call_place,calls.call_areacode,calls.call_telnum,
       TO_CHAR(calls.call_time,'DD-MM-YY HH:MI AM'),plan_rate,call_minutes
       FROM planrate,calls,call_places,customer
       WHERE plan_num=(SELECT plan_num FROM schedule
                       WHERE account='0000005' 
                             AND TO_CHAR(end_date,'yy/mm')>='98/01' 
                             AND TO_CHAR(start_date,'yy/mm')<='99/12')
             AND calls.account='0000005'
             AND calls.account=customer.account
             AND customer.areacode<>calls.call_areacode
             AND plan_areacode=calls.call_areacode
             AND calls.call_areacode=call_places.call_areacode
             AND TO_CHAR(call_time,'mm/yy')='12/98';

-- Get and calculate total amount and tax for the month period(December of 1998)
SELECT SUM(plan_rate*call_minutes),SUM(plan_rate*call_minutes*tax_rate)
       FROM planrate,calls,call_places,customer,tax_rate
       WHERE plan_num=(SELECT plan_num FROM schedule
                       WHERE account='0000005' 
                             AND TO_CHAR(end_date,'yy/mm')>='98/01' 
                             AND TO_CHAR(start_date,'yy/mm')<='99/12')
             AND calls.account='0000005'
             AND calls.account=customer.account
             AND customer.areacode<>calls.call_areacode
             AND plan_areacode=calls.call_areacode
             AND calls.call_areacode=call_places.call_areacode
             AND area_code=customer.areacode
             AND TO_CHAR(call_time,'mm/yy')='12/98';

-- Customer's plan number ( which plan ) within a certain schedule.
SELECT plan_num FROM schedule
                       WHERE account='0000005' 
                             AND TO_CHAR(end_date,'yy/mm')>='98/01' 
                             AND TO_CHAR(start_date,'yy/mm')<='99/12';

-- Pull out all the special services with rate the company is offering when users ask for
SELECT service_name,monthly_fee FROM special_service_fee;

-- When the customer wants a special service, the telephone system
-- will insert a special service information into the database with the
-- the period of time the customer is going to use.
INSERT INTO special_service
VALUES  ('0000005',1002,TO_DATE('11/01/98 12:00 A.M.','MM/DD/YY HH:MI A.M.') ,TO_DATE('12/31/98 12:00 A.M.','MM/DD/YY HH:MI A.M.'));

-- Query all the special services the customer '0000005' has had
SELECT service_name,monthly_fee FROM special_service_fee
      WHERE service_num=(SELECT service_num FROM special_service
                                                       WHERE account='0000005');
