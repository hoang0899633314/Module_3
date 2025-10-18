create database java05_sqc;

use java05_sqc;

create table student (
id int primary key auto_increment,
name varchar(50) not null,
score double
);

insert into student (name, score) values ('Lợi', 2);
insert into student (name, score) values ('Linh', 3);

select name, score from student;
select id, name, score from student;
select * from student;

select * from student where id =2;
delete from student where id = 1;

insert into student (name, score) values ('Vi', 2);
insert into student (name, score) values ('Đàm', 3);

update student
set score = 9
where id = 4;

ALTER TABLE student
ADD address varchar(50);

update student
set address = 'Đà Nẵng'
where id in (2, 3, 4);



