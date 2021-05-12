create database banking;
use banking;
create table BRANCH(
branch_name varchar(20),
branch_city varchar(20),
assets real,
primary key (branch_name)
);
create table accounts(
acc_no int,
branch_name varchar(20),
balance real,
primary key(acc_no),
foreign key(branch_name) references BRANCH(branch_name) on delete set null on update cascade
);
create table depositor(
cust_name varchar(20),
cust_street varchar(30),
cust_city varchar(30),
primary key(cust_name)
);
create table loan(
loan_num int,
branch_name varchar(20),
amount real,
primary key(loan_num),
foreign key(branch_name) references BRANCH(branch_name) on delete set null on update cascade
);
create table borrower(
cust_name varchar(20),
loan_num int,
foreign key(loan_num) references loan(loan_num),
foreign key(cust_name) references depositor(cust_name)
);


insert into BRANCH values('SBI PD NAGAR','BANGALORE', 200000);
insert into BRANCH values('SBI RAJAJI NAGAR','BANGALORE', 500000);
insert into BRANCH values('SBI JAYANAGAR', 'BANGALORE', 660000);
insert into BRANCH values('SBI VIJAY NAGAR','BANGALORE', 870000);
insert into BRANCH values('SBI HOSAKEREHALLI','BANGALORE', 550000);


insert into accounts values(1234602 ,'SBI HOSAKEREHALLI', 5000);
insert into accounts values(1234603 ,'SBI VIJAY NAGAR', 5000);
insert into accounts values(1234604 ,'SBI JAYANAGAR', 5000);
insert into accounts values(1234605 ,'SBI RAJAJI NAGAR', 10000);
insert into accounts values(1234503 ,'SBI VIJAY NAGAR', 40000);
insert into accounts values(1234504 ,'SBI PD NAGAR', 4000);


insert into depositor values('KEZAR', 'M G ROAD', 'BANGALORE');
insert into depositor values('LAL KRISHNA', 'ST MKS ROAD', 'BANGALORE');
insert into depositor values('RAHUL','AUGSTEN ROAD','BANGALORE');
insert into depositor values('LALLU','V S ROAD','BANGALORE');
insert into depositor values('FAIZAL','RESEDENCY ROAD','BANGALORE');
insert into depositor values('RAJEEV','DICKNSN ROAD','BANGALORE');


insert into loan values(10011,'SBI JAYANAGAR', 10000);
insert into loan values(10012 ,'SBI VIJAY NAGAR', 5000);
insert into loan values(10013 ,'SBI HOSAKEREHALLI', 20000);
insert into loan values(10014 ,'SBI PD NAGAR', 15000);
insert into loan values(10015 ,'SBI RAJAJI NAGAR', 25000);


insert into borrower values('KEZAR',10011);
insert into borrower values('LAL KRISHNA', 10012);
insert into borrower values('RAHUL', 10013);
insert into borrower values('LALLU', 10014);
insert into borrower values('LAL KRISHNA', 10015);

/** general queries **/
select borrower.cust_name,loan.amount 
from borrower
inner join loan
where borrower.loan_num=loan.loan_num;

select borrower.cust_name,max(loan.amount) 
from borrower
inner join loan
where borrower.loan_num=loan.loan_num;

/**number of customers in a city **/
select count(accounts.acc_no)
from accounts 
inner join branch
where accounts.branch_name=branch.branch_name and branch.branch_city="BANGALORE";

delete from accounts where branch_name="SBI PD NAGAR";