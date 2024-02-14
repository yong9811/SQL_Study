---- 단문 주석
--/*
--장문 주석
--*/
--select count(*) from tab;
--select * from tab;
--select * from dept;
--select * from emp;
--select * from salgrade;
--select * from category;
--select * from products;
--select * from member;
--select * from supply_comp;
--day01.sql

create table student(
    no number(4) primary key, 
    name varchar2(30) not null,
    addr varchar2(100),
    tel varchar2(16) not null,
    indate date DEFAULT sysdate,
    sclass varchar2(30),
    sroom number(3)
);

desc student;

insert into student(no, name,tel)
values(1,'이철수','010-2222-3333');
commit;
select * from student;

insert into student(no, name,tel,addr,sclass,sroom)
values(2,'김영희','010-3333-4444','서울 마포구','백엔드 개발자반',201);

select * from student;

commit;

insert into student(no, name,tel,addr,sclass,sroom)
values(3,'김길동','010-5333-4444','서울 강동구','백엔드 개발자반',201);
rollback;
select * from student;
delete from student where no=3;

insert into student(no, name,tel,addr,sclass,sroom)
values(4,'김종국','010-5544-4224','서울 은평구','프런트 개발자반',202);
commit;

insert into student
values(5,'홍길동','수원','010-1231-1233',sysdate,'프런트 개발자반',202);
select * from student;
commit;

update student set addr='서울 강남구',sclass='백엔드 개발자반', sroom=201;
rollback;

select * from student where sclass='백엔드 개발자반';

create table sclass(
    snum number(4) primary key,
    sname varchar2(30) not null,
    sroom number(3)
);

create table student(
    no number(4) primary key,
    name varchar2(30) not null,
    addr varchar2(100),
    tel varchar2(16) not null,
    indate date default sysdate,
    snum_fk number(4) references sclass(snum)
);

drop table student;

insert into sclass(snum,sname,sroom)
values(10,'백엔드 개발자반',201);
insert into sclass
values(20,'프런트엔드 개발자반',202);
insert into sclass
values(30,'빅데이터반',203);
select * from sclass;

insert into student(no,name,addr,tel,snum_fk)
values(2,'김철수','서울 강서구','010-2111-2222',20);
select * from student;

select student.*, sclass.*
from sclass join student
on sclass.snum=student.snum_fk;

