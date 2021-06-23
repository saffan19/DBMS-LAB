create database airline;
use airline;
create table aircraft(
aid int, 
aname varchar(30), 
cruisingrange int,
primary key(aid)
);
create table flights(
fno int,
aid int,
f_from varchar(30), 
f_to varchar(30), 
distance int, 
departs time, 
arrives time, 
price int,
primary key(fno),
foreign key(aid) references aircraft(aid)
);
create table EMPLOYEE (eid int, 
ename varchar(30), 
salary int,
primary key(eid)
);

create table CERTIFIED (
eid int,
aid int,
foreign key(eid) references employee(eid),
foreign key(aid) references aircraft(aid)
);
insert into aircraft values(1,'indigo',3000);
insert into aircraft values(2,'airindia',2000);
insert into aircraft values(3,'spicejet',1500);
insert into aircraft values(4,'trujet',800);
insert into aircraft values(5,'airasia',3000);
insert into aircraft values(6,'boeing747',4000); 
insert into aircraft values(7,'boeing777',2000);

insert into flights values(1,1,'bangalore','delhi',2000,'12:00:00','4:00:00',10000);
insert into flights values(2,2,'mumbai','delhi',1500,'8:00:00','13:00:00',9000);
insert into flights values(3,3,'bangalore','hyderabad',700,'6:00:00','8:00:00',5000);
insert into flights values(4,4,'mumbai','chennai',2000,'5:00:00','10:00:00',7000);
insert into flights values(5,5,'mumbai','hyderabad',500,'5:00:00','6:30:00',4000);
insert into flights values(6,6,'bangalore','frankfurt',10000,'6:00:00','23:00:00',150000);
insert into flights values(7,7,'bangalore','frankfurt',10000,'6:00:00','23:00:00',200000);



insert into employee values(1,'noah',300000);
insert into employee values(2,'jim',250000);
insert into employee values(3,'scott',50000);
insert into employee values(4,'john',25000);
insert into employee values(5,'halpert',100000);
insert into employee values(6,'joe',90000);
insert into employee values(7,'amy',60000);

insert into certified values(1,5);
insert into certified values(2,4);
insert into certified values(3,2);
insert into certified values(4,3);
insert into certified values(5,1);
insert into certified values(5,2);
insert into certified values(5,4);
insert into certified values(6,6);
insert into certified values(7,7);

/*query 1*/
select distinct(A.aname) from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
where salary>=80000;
/*query 2*/
select max(A.cruisingrange),E.eid from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
group by eid having count(E.eid)>2;

/*query 3*/
select ename from employee where salary <
(select min(price) from flights where f_from='bangalore' and f_to='frankfurt');

/*query 4*/
select A.aname,avg(E.salary) from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid where A.cruisingrange>1000
group by(A.aid);

/*query 5*/
select ename from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
where A.aname like 'boeing%';

/*query 6*/
select F.aid from flights F inner join aircraft A on F.aid=A.aid where F.f_from="bangalore" and F.f_to="delhi";


