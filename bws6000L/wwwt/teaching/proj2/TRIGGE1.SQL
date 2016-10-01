DROP TABLE CHARGE;

CREATE TABLE CHARGE
        (CHARGENUM              CHAR(6)         NOT NULL,
         ITEMNAME               VARCHAR2(13)    NOT NULL,
         CHARGEDATE             DATE,
         PATIENTNUM             CHAR(6)         NOT NULL,
         ICNUMBER               CHAR(6)         NOT NULL,
         CHARGETOPA             DECIMAL(10,2),
         CHARGETOIC             DECIMAL(10,2),
         PRIMARY KEY (CHARGENUM));   
      
create or replace package fee_pkg as
	procedure enforce_chargetopa(
		fee in charge.chargetopa%type);
end fee_pkg;
/

create or replace package body fee_pkg as
	procedure enforce_chargetopa(
		fee in charge.chargetopa%type) as
	begin
		if(fee<5 or fee>10000) then 
		raise_application_error(-20110, 'Copy can not be less than
		5 or greater than 10000');
		end if;
	end enforce_chargetopa;
end fee_pkg;
/

create or replace trigger charge_bef_ins_row
before insert on charge
for each row
	begin
		fee_pkg.enforce_chargetopa(:new.chargetopa);
	end;
/	
