create database movie_db;
use movie_db;
create table actor(
act_id int,
act_name varchar(30),
act_gender varchar(10),
primary key(act_id)
);
create table director(
dir_id int,
dir_name varchar(30),
dir_phone varchar(10),
primary key(dir_id)
);
create table movie(
mov_id int,
mov_title varchar(30),
mov_year year,
mov_lang varchar(30),
dir_id int,
primary key(mov_id),
foreign key(dir_id) references director(dir_id) on delete set null
);
create table movie_cast(
act_id int,
mov_id int,
act_role varchar(30),
foreign key(act_id) references actor(act_id),
foreign key(mov_id)references movie(mov_id)
);
create table rating(
mov_id int,
stars int,
foreign key(mov_id) references movie(mov_id)
);


insert into actor values(1,'Anthony','male');
insert into actor values(2,'Janet','female');
insert into actor values(3,'Cary','male');
insert into actor values(4,'Grace','female');
insert into actor values(5,'DiCaprio','male');
insert into actor values(6,'Tom','male');

insert into director values(1,'Hitchcock','1100010101');
insert into director values(2,'Nolan','1234567890');
insert into director values(3,'Martin','9999221');
insert into director values(4,'Steven','3456372');


/*id title year lang dirid*/
insert into movie values(1,'psycho',1960,'english',1);
insert into movie values(2,'To Catch a Thief',1955,'english',1);
insert into movie values(3,'Inception',2010,'english',2);
insert into movie values(4,'Shutter Island',2010,'english',3);
insert into movie values(5,'War of the worlds',2005,'english',4);

/*act_id movid role*/
insert into movie_cast values(1,1,'lead actor');
insert into movie_cast values(2,1,'lead actress');
insert into movie_cast values(3,2,'lead actor');
insert into movie_cast values(4,2,'lead actress');
insert into movie_cast values(5,3,'lead actor');
insert into movie_cast values(5,4,'lead actor');
insert into movie_cast values(6,5,'lead actor');

/*movid stars*/
insert into rating values(1,9);
insert into rating values(1,10);
insert into rating values(1,6);
insert into rating values(2,7);
insert into rating values(3,9);
insert into rating values(3,8);
insert into rating values(4,7);
insert into rating values(5,6);

/*QUERIES*/
/*Q1*/
select M.mov_title from movie M,director D where M.dir_id=D.dir_id and D.dir_name='Hitchcock';

/*Q5*/
update rating R,movie M,director D
set R.stars=5 where
R.mov_id=M.mov_id and M.dir_id=D.dir_id and D.dir_name="Steven";

/*Q3*/
select actor.act_name from actor inner join movie_cast on actor.act_id=movie_cast.act_id 
inner join movie on movie_cast.mov_id=movie.mov_id
where movie.mov_year<2000 or movie.mov_year>2015;

/*Q4*/
select M.mov_title,avg(R.stars) from movie M,rating R where M.mov_id=R.mov_id group by R.mov_id order by R.stars desc,M.mov_title asc; 

/*Q2*/

select mov_title from movie where mov_id in
	(select mov_id from movie_cast where act_id in
		(select act_id from actor where act_id in
        (select act_id from movie_cast group by act_id having count(act_id)>1)));


