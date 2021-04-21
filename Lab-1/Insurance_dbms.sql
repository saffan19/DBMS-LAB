create database Insurance;
use Insurance;
create table PERSON(
driver_id varchar(10),
name varchar(30),
address varchar(50),
Primary key(driver_id)
);
create table CAR(
Regno varchar(30),
model varchar(30),
manu_year int,
PRIMARY KEY(Regno)
);
create table ACCIDENT
(
report_number int,
acc_date date,
location varchar(30),
PRIMARY KEY(report_number)
);
create table OWNS(
driver_id varchar(10),
Regno varchar(30),
FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id) on delete cascade,
FOREIGN KEY(Regno) REFERENCES CAR(Regno) on delete cascade,
PRIMARY KEY(driver_id,Regno)
);
create table PARTICIPATED(
driver_id varchar(10),
Regno varchar(30),
report_number int,
damage_amount int,
FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id) on delete cascade ,
FOREIGN KEY(Regno) REFERENCES CAR(Regno) on delete cascade,
FOREIGN KEY (report_number) REFERENCES ACCIDENT(report_number) on delete cascade,
PRIMARY KEY(driver_id,Regno,report_number)
);
insert into PERSON values('1','Jake','203 abc street xyz city');
insert into PERSON values('2','Mark','90 street mno city');
insert into PERSON values('3','Henry','20 street qwe city');
insert into PERSON values('4','John','56 abc street asd city');
insert into PERSON values('5','Carl','03 abc street xyz city');
insert into PERSON values('6','Pratt','23 abc street xyz city');
insert into PERSON values('7','Tim','403 abc street tyz city');
insert into PERSON values('8','Cuban','83 abc street xvc city');
insert into PERSON values('9','Elon','44 abc street sdf city');
insert into PERSON values('10','Sam','206 abc street xyyz city');

insert into CAR values('KA10','ford',2011);
insert into CAR values('KA20','tesla',2016);
insert into CAR values('KA30','toyota',2005);
insert into CAR values('KA40','tesla',2018);
insert into CAR values('KA50','ford',2009);
insert into CAR values('KA60','honda',2015);
insert into CAR values('KA70','chev',2009);
insert into CAR values('KA80','nissan',2016);
insert into CAR values('KA90','ford',2020);
insert into CAR values('KA99','honda',2014);

insert into ACCIDENT values(1,'2008-05-19','bangalore');
insert into ACCIDENT values(2,'2008-01-29','bangalore');
insert into ACCIDENT values(3,'2008-09-22','delhi');
insert into ACCIDENT values(4,'2016-05-19','mumbai');
insert into ACCIDENT values(5,'2012-05-19','mumbai');

insert into OWNS values ('1','KA10');
insert into OWNS values ('2','KA20');
insert into OWNS values ('3','KA30');
insert into OWNS values ('4','KA40');
insert into OWNS values ('5','KA50');
insert into OWNS values ('6','KA60');
insert into OWNS values ('7','KA70');
insert into OWNS values ('8','KA80');
insert into OWNS values ('9','KA90');
insert into OWNS values ('10','KA99');

insert into PARTICIPATED values('1','KA10',1,20000);
insert into PARTICIPATED values('3','KA30',2,50000);
insert into PARTICIPATED values('5','KA50',3,1000);
insert into PARTICIPATED values('7','KA70',4,12000);
insert into PARTICIPATED values('9','KA90',5,15000);

update PARTICIPATED 
set damage_amount=0
where driver_id=1;

select count(*) from ACCIDENT
where acc_date like'2008-__-__';

select count(distinct A.report_number) from ACCIDENT as A,PARTICIPATED as P,CAR as C
where
C.model='ford'
and
A.report_number=P.report_number;
