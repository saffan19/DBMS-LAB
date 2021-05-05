create database order_process;
use order_process;
create table CUSTOMER (
c_id int, 
cname varchar(30), 
city varchar(30),
primary key(c_id)
);
create table ORDER_DETAIL(
o_id int,
o_date date,
c_id int,
o_amt int,
primary key(o_id),
foreign key(c_id) references CUSTOMER(c_id)
);
create table ITEM(
i_id int,
unit_price int,
primary key(i_id)
);
create table ORDER_ITEM(
o_id int,
i_id int,
qty int,
foreign key(o_id) references ORDER_DETAIL(o_id),
foreign key(i_id) references ITEM(i_id) on delete cascade,
primary key(o_id,i_id)
);

create table WAREHOUSE(
w_id int,
city varchar(30),
primary key(w_id)
);
create table SHIPMENT(
o_id int,
w_id int,
ship_date date,
foreign key(o_id) references ORDER_DETAIL(o_id),
foreign key(w_id) references WAREHOUSE(w_id)
);


insert into CUSTOMER values(771,'PUSHPA K', 'BANGALORE');
insert into CUSTOMER values(772,'SUMAN' ,'MUMBAI');
insert into CUSTOMER values(773,'SOURAV' ,'CALICUT');
insert into CUSTOMER values(774 ,'LAILA','HYDERABAD');
insert into CUSTOMER values(775 ,'FAIZAL' ,'BANGALORE');


insert into ORDER_DETAIL values(111,'2020-05-19',771,18000);
insert into ORDER_DETAIL values(112 ,'2018-06-10' ,774 ,6000);
insert into ORDER_DETAIL values(113 ,'2019-01-01',775 ,9000);
insert into ORDER_DETAIL values(114,'2016-08-21',775,29000);
insert into ORDER_DETAIL values(115,'2016-05-21',773,23000);
insert into ORDER_DETAIL values(116 ,'2017-03-13' ,772 ,56000);
insert into ORDER_DETAIL values(117 ,'2018-01-01',771 ,20000);


insert into item values(5001,503);
insert into item values(5002,750);
insert into item values(5003,150);
insert into item values(5004,600);
insert into item values(5005,890);


insert into order_item values(111,5001,50);
insert into order_item values(112,5003,20);
insert into order_item values(113,5002,50);
insert into order_item values(114,5005,60);
insert into order_item values(115,5004,90);

insert into warehouse values(1,'DELHI');
insert into warehouse values(2,'BOMBAY');
insert into warehouse values(3,'CHENNAI');
insert into warehouse values(4,'BANGALORE');
insert into warehouse values(5,'BANGALORE');


insert into shipment values(111,1,'2019-05-21');
insert into shipment values(112,2,'2017-03-18');
insert into shipment values(113,3,'2016-02-01');
insert into shipment values(114,4,'2021-01-01');
insert into shipment values(115,5,'2020-04-15');

/*query 1*/
select order_detail.c_id,customer.cname,count(order_detail.c_id),avg(order_detail.o_amt) 
from order_detail 
inner join customer 
on 
order_detail.c_id=customer.c_id
group by c_id;

/***query 2***/
select shipment.o_id,warehouse.city from shipment inner join warehouse
on
shipment.w_id=warehouse.w_id;

/***query 3***/
delete from item where i_id=5004;

/**Extra queries**/
update item set unit_price=10 where i_id=5002;
select max(unit_price) from item;
select i_id,unit_price from item where unit_price=(select max(unit_price) from item);
