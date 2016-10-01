
drop table customers cascade constraints;
drop table movies cascade constraints;
drop table distributors cascade constraints;
drop table shipments cascade constraints;
drop table actors_actresses cascade constraints;
drop table catalogs cascade constraints;
drop table casts cascade constraints;
drop table videos cascade constraints;
drop table rentals cascade constraints;
drop table directors cascade constraints;


create table customers 
	(cid 	     char(6) primary key
	     check (substr(cid,1,1)='C'),                         
	 fname   varchar2(20) 
             constraint cust_nn_fname not null,
         minit  char(1) 
             constraint cust_n_mid_int null,
	 lname   varchar2(20) 
             constraint cust_nn_lname not null,
         street      varchar2(30) 
             constraint cust_nn_street not null,
         city        varchar2(20)      
             constraint cust_nn_city not null,
         state       char(2) not null
             check (state in ('MD', 'VA', 'DC')),
         zipcode     char(10) 
             constraint cust_nn_zipcode not null,
         home_phone  char(15) 
             constraint cust_n_home_phone null);

create table movies 
   	(mid         char(6) primary key
             check (substr(mid,1,1)='M'),
    	 title varchar2(50) not null,
   	 yr_rlsd     char(4) not null
             check (yr_rlsd between '1900' and '2000'),
    	 genre       varchar2(60) not null,
    	 user_rating number(3,1) not null,
    	 run_time    number(3),
    	 country     char(20),
    	 language    char(20),
    	 color       char(15),
    	 sound       varchar2(50),
    	 certificate varchar2(15));

create table distributors 
   	(did         char(6) primary key
             check (substr(did,1,1)='D'),
    	 comp_name   varchar2(40) not null,
    	 street      varchar2(40) not null,
    	 city        varchar2(25) not null,
    	 state       char(4) not null,
    	 zipcode     varchar2(10) not null,
    	 country     char(10),
    	 phone       char(18) not null,
    	 contact     char(30),
    	 website     varchar2(50),
    	 email       varchar2(50));

create table shipments 
   	(sid         char(6) primary key
       	     check (substr(sid,1,1)='S'),
    	 did         char(6) references distributors,
    	 po_no	char(7) not null,
    	 order_date  date not null,
    	 due_date    date not null,
    	 ship_date   date not null,
    	 recv_date   date not null,
    	 quantity    number(3) not null
       	     check (quantity>0.),
    	 total_cost  number(10,2) not null
       	     check (total_cost>0.));

create table actors_actresses 
   	(actid       char(6) primary key
             check (substr(actid,1,1) in ('Y','X')),
    	 act_name    varchar2(30) not null);

create table catalogs 
   	(lid         char(6) primary key,
             check (substr(lid,1,1)='L'),
    	 did         char(6) references distributors,
    	 title varchar2(50) not null,
    	 yr_rlsd     char(4) not null
             check (yr_rlsd between '1900' and '2000'),
    	 genre       varchar2(60) not null,
    	 user_rating number(3,1) not null,
    	 run_time    number(3),
    	 country     char(20),
    	 language    char(20),
    	 color       char(15),
    	 sound       varchar2(50),
    	 certificate varchar2(25));

create table casts 
   	(mid         char(6) not null references movies,
    	 actid       char(6) not null references actors_actresses,
    	 name_played varchar2(45), 
             primary key (mid,actid));

create table videos 
   	(vid         char(6) primary key 
       	     check (substr(vid,1,1)='V'),
    	 mid         char(6) references movies,
    	 sid         char(6) references shipments,
    	 cost        number(5,2) not null check (cost>0.),
    	 serial_no   varchar2(15),
    	 daily_rate  number(4,2) not null
             check (daily_rate>.99));

create table rentals 
   	(rid         char(6) primary key
             check (substr(rid,1,1)='R'),
    	 cid         char(6) references customers,
    	 vid         char(6) references videos,
    	 date_out    date not null,
    	 date_due    date not null,
    	 date_in     date,
    	 daily_fee   number(4,2) not null check (daily_fee>0.),
    	 late_fee    number(4,2),
    	 rewind_fee  number(4,2),
    	 total_fee   number(4,2) check (total_fee>0.));

create table directors 
	(dir_id      char(6) primary key
	     check (substr(dir_id,1,2)='DI'),
	 mid  	     char(6) not null references movies,
	 first_name  varchar2(20) not null,
         last_name   varchar2(20) not null);

@d1.sql;
@d2.sql;
@d3.sql;
@d4.sql;
@d5.sql;
@d6.sql;
@d7.sql;
@d8.sql;
@d9.sql;
@d10.sql;
@d11.sql;
@d12.sql;
@d13.sql;

@f1.sql;
@f2.sql;
@f3.sql;

@t1.sql;

@p1.sql;

@q1.sql;
@q2.sql;
@q3.sql;
@q4.sql;
@q5.sql;
@q6.sql;
@q7.sql;
@q8.sql;
@q9.sql;
@q10.sql;
@q11.sql;
@q12.sql;
@q13.sql;
@q14.sql;
@q15.sql;
@q16.sql;
@q17.sql;
@q18.sql;
@q19.sql;
@q20.sql;
@q21.sql;
@q22.sql;
@q23.sql;
@q24.sql;
@q25.sql;
@q26.sql;
@q27.sql;
@q28.sql;
@q29.sql;
@q30.sql;
@q31.sql;

@u1.sql;

@v1.sql;
@v2.sql;

select table_name from user_tables;
select count(*) from user_tables;
desc user_objects;
select count(*) from user_objects;
select object_name, object_type from user_objects;
select trigger_name from user_triggers;


