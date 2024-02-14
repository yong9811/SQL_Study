---- �ܹ� �ּ�
--/*
--�幮 �ּ�
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
values(1,'��ö��','010-2222-3333');
commit;
select * from student;

insert into student(no, name,tel,addr,sclass,sroom)
values(2,'�迵��','010-3333-4444','���� ������','�鿣�� �����ڹ�',201);

select * from student;

commit;

insert into student(no, name,tel,addr,sclass,sroom)
values(3,'��浿','010-5333-4444','���� ������','�鿣�� �����ڹ�',201);
rollback;
select * from student;
delete from student where no=3;

insert into student(no, name,tel,addr,sclass,sroom)
values(4,'������','010-5544-4224','���� ����','����Ʈ �����ڹ�',202);
commit;

insert into student
values(5,'ȫ�浿','����','010-1231-1233',sysdate,'����Ʈ �����ڹ�',202);
select * from student;
commit;

update student set addr='���� ������',sclass='�鿣�� �����ڹ�', sroom=201;
rollback;

select * from student where sclass='�鿣�� �����ڹ�';

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
values(10,'�鿣�� �����ڹ�',201);
insert into sclass
values(20,'����Ʈ���� �����ڹ�',202);
insert into sclass
values(30,'�����͹�',203);
select * from sclass;

insert into student(no,name,addr,tel,snum_fk)
values(2,'��ö��','���� ������','010-2111-2222',20);
select * from student;

select student.*, sclass.*
from sclass join student
on sclass.snum=student.snum_fk;

