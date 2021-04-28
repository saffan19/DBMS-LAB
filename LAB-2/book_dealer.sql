create database bookdealer;
use bookdealer;
create table AUTHOR(
author_id int,
auth_name varchar(20),
city varchar(20),
country varchar(20),
primary key(author_id)
);
create table PUBLISHER(
pub_id int,
pub_name varchar(20),
city varchar(20),
country varchar(20),
primary key(pub_id)
);
create table CATEGORY(
cat_id int,
descrip varchar(100),
primary key(cat_id)
);
create table CATALOG(
book_id int,
title varchar(30),
author_id int,
pub_id int,
cat_id int,
pyear year,
price int,
primary key(book_id),
foreign key(author_id) references AUTHOR(author_id),
foreign key(pub_id) references PUBLISHER(pub_id),
foreign key(cat_id) references CATEGORY(cat_id)
);
create table ORDER_DETAILS(
order_no int,
book_id int,
quantity int,
primary key(order_no),
foreign key(book_id) references CATALOG(book_id)
);


insert into AUTHOR values(1,'TERAS CHAN','CA','USA');
insert into AUTHOR values(2,'STEVENS' ,'ZOMBI' ,'UGANDA');
insert into AUTHOR values(3,'M MANO' ,'CAIR','CANADA');
insert into AUTHOR values(4,'KARTHIK B.P','NEW YORK','USA');
insert into AUTHOR values(5,'WILLIAM STALLINGS','LAS VEGAS','USA');


insert into PUBLISHER values(1, 'PEARSON' ,'NEW YORK' ,'USA');
insert into PUBLISHER values(2 ,'EEE' ,'NEW SOUTH VALES' ,'USA');
insert into PUBLISHER values(3 ,'PHI' ,'DELHI' ,'INDIA');
insert into PUBLISHER values(4 ,'WILLEY' ,'BERLIN' ,'GERMANY');
insert into PUBLISHER values(5 ,'MGH' ,'NEW YORK' ,'USA');

insert into CATEGORY values(1001 ,'COMPUTER SCIENCE');
insert into CATEGORY values(1002 ,'ALGORITHM DESIGN');
insert into CATEGORY values(1003 ,'ELECTRONICS');
insert into CATEGORY values(1004 ,'PROGRAMMING');
insert into CATEGORY values(1005 ,'OPERATING SYSTEMS');


insert into CATALOG values(11 ,'Unix System Prg', 1,1,1001,2000,250);
insert into CATALOG values(12 ,'Digital Signals', 2 ,2, 1003 ,2001,451);
insert into CATALOG values(13 ,'Logic Design' ,3 ,3 ,1002 ,1999,225);
insert into CATALOG values(14 ,'Server Prg' ,4 ,4, 1004, 2001,333);
insert into CATALOG values(15 ,'Linux OS' ,5, 5 ,1005, 2003,467);
insert into CATALOG values(16,'C++ Bible' ,5, 5, 1001, 2000,543);
insert into CATALOG values(17, 'COBOL Handbook' ,5, 4, 1001, 2000,700);


insert into ORDER_DETAILS values(1,11,5);
insert into ORDER_DETAILS values(2,12,8);
insert into ORDER_DETAILS values(3,13,15);
insert into ORDER_DETAILS values(4,14,22);
insert into ORDER_DETAILS values(5,15,3);
insert into ORDER_DETAILS values(6,17,10);


/****QUERIES****/

select auth_name from AUTHOR;
select title,price from CATALOG where price<500;
select title,price from CATALOG where price between 400 and 500;
select title,pyear from CATALOG where pyear>2000;
select avg(price) from CATALOG;
select * from catalog order by price desc;
select auth_name,country from AUTHOR where country='USA';
select auth_name from AUTHOR where auth_name like 'W%';
select title,price,1.10*price as NEW_PRICE from CATALOG;
update CATALOG set price=100 where book_id=11;
select title,max(price) from CATALOG;
select title,price from CATALOG where price!=(select max(price)from CATALOG);
select count(auth_name),country from AUTHOR group by country;
