create database course_enroll;
use course_enroll;
create table student(
regno varchar(30),
sname varchar(30),
major varchar(30),
bdate date,
primary key(regno)
);
create table course(
cid int,
cname varchar(30),
dept varchar(30),
primary key(cid)
);
create table enroll(
regno varchar(30),
cid int,
marks int,
sem int,
foreign key(regno) references student(regno),
foreign key(cid) references course(cid)
);

create table textbook(
book_id int,
title varchar(30),
publisher varchar(30),
author varchar(30),
primary key(book_id)
);
create table book_adopt(
cid int,
sem int,
book_id int,
foreign key(cid) references course(cid),
foreign key(book_id) references textbook(book_id)
);

insert into student values('CS01','RAM','DS','1986-05-13');
insert into student values('EC03','AHMED','SNS','1999-02-02');
insert into student values('CS03','SNEHA','DBMS','1998-03-04');
insert into student values('IS02','SMITH','USP','2000-01-01');
insert into student values('TC05','AKHILA','EC','1997-05-05');


insert into course values(11,'DS','CS');
insert into course values(22,'USP','IS');
insert into course values(33,'SNS','EC');
insert into course values(44,'DBMS','CS');
insert into course values(55,'EC','TC');


insert into enroll values('CS01',11, 4, 85);
insert into enroll values('IS02', 22, 6, 80);
insert into enroll values('EC03', 33, 2, 80);
insert into enroll values('CS03', 44 ,6 ,75);
insert into enroll values('TC05', 55, 2, 8);


insert into textbook values(1 ,'DS and C','Princeton' ,'Padma Reddy');
insert into textbook values(2 ,'Fundamentals of DS', 'Princeton','Godse');
insert into textbook values(3 ,'Fundamentals of DBMS', 'Princeton', 'Navathe');
insert into textbook values(4 ,'SQL' ,'Princeton' ,'Foley');
insert into textbook values(5 ,'Electronic circuits' ,'TMH' ,'Elmasri');
insert into textbook values(6 ,'Adv unix prog' ,'TMH', 'Stevens');


insert into book_adopt values(11 ,4 ,1);
insert into book_adopt values(11 ,4 ,2);
insert into book_adopt values(44 ,6, 3);
insert into book_adopt values(44 ,6 ,4);
insert into book_adopt values(55, 2, 5);
insert into book_adopt values(22 ,6, 6);

/****QUERIES****/
/*QUERY 1*/
insert into textbook values(7,'Operating System','John','Peter');
insert into book_adopt values(22,4,7);
/**QUERY 2**/
select c.cid,t.book_id,t.title from course c,textbook t,book_adopt b
where 
t.book_id=b.book_id
and
b.cid=c.cid
and
c.dept="CS"
group by c.cid
having count(b.book_id)>=2;
/* QUERY 3*/
select distinct c.dept from course c,book_adopt b,textbook t
where c.cid=b.cid and
b.book_id=t.book_id and
t.publisher='Princeton';

/* displaying students enrolled in courses offered by cs dept*/
select s.regno,s.sname,s.major from student s,course c,enroll e
where
s.regno=e.regno
and
c.cid=e.cid
and
c.cid in
(select cid from course where dept='CS');

/* QUERY 3 */
select distinct c.dept from course c
inner join book_adopt b
on b.cid=c.cid
inner join textbook t
on t.book_id=b.book_id
where t.publisher="Princeton";


