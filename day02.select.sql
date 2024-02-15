--day02_select.sql
desc dept;
select*from dept;

desc emp;
select*from emp;

select ename, job, sal from emp;
--[1] EMP���̺��� ���(EMPNO), �̸�(ENAME), �޿�(SAL), ���ʽ�(COMM)�� ������ 
--   �����ּ���
select empno, ename, sal, comm from emp;
--[2] ������̺��� �����, �޿�, �޿��� 10%�λ���� ������ �����ּ���
select ename, sal, sal*1.1 salup_10 from emp;
--[3]  ������̺��� �����, �޿�,���ʽ�, 1�� ������ ����� �����ּ���
--1�� ����=�޿�*12 +���ʽ�(COMM)
select ename, sal, comm, sal*12+nvl(comm,0) "1�� ����" from emp;

select ename, mgr, nvl2(mgr,1,0) "������ ���� ����" from emp;

select ename||' IS A '||job "employees detail" from emp;

select job from emp;

select DISTINCT job from emp;

select distinct deptno, job from emp order by deptno asc;

[����]
--	 1] EMP���̺��� �ߺ����� �ʴ� �μ���ȣ�� ����ϼ���.
select distinct empno from emp;
--	 2] MEMBER���̺��� ȸ���� �̸��� ���� ������ �����ּ���.
select name, age, job from member;
--	 3] CATEGORY ���̺� ����� ��� ������ �����ּ���.
select * from category;
--	 4] MEMBER���̺��� ȸ���� �̸��� ������ ���ϸ����� �����ֵ�,
--	      ���ϸ����� 13�� ���� ����� "MILE_UP"�̶�� ��Ī����
--	      �Բ� �����ּ���.
select name, mileage*13 MILE_UP from member;
--    5] EMP���̺��� �̸��� ������ "KING: 1 YEAR SALARY = 60000"
--	�������� ����϶�.
select ename||': 1 YEAR SALARY = '||(sal*12+nvl(comm,0)) from emp;

--[�ǽ�]
--	[1] emp���̺��� �޿��� 1300���� 1500������ ����� �̸�,����,�޿�,
--	�μ���ȣ�� ����ϼ���
select ename,job,sal,deptno from emp where sal between 1300 and 1500;
--    [2] emp���̺��� �����ȣ�� 7902,7788,7566�� ����� �����ȣ,
--	�̸�,����,�޿�,�Ի����ڸ� ����ϼ���.
select empno,ename,job,sal,hiredate from emp where empno in(7902,7788,7566);  
--    [3] 10�� �μ��� �ƴ� ����� �̸�,����,�μ���ȣ�� ����ϼ���
select ename, job, deptno from emp where deptno!=10;

--[4] emp���̺��� ������ SALESMAN �̰ų� PRESIDENT��
--	����� �����ȣ,�̸�,����,�޿��� ����ϼ���.
select empno, ename, job, sal from emp where job in('SALESMAN','PRESIDENT');
--	[5] Ŀ�̼�(COMM)�� 300�̰ų� 500�̰ų� 1400�� ��������� ����ϼ���
SELECT * FROM EMP WHERE COMM IN(300,500,1400);
--	[6] Ŀ�̼��� 300,500,1400�� �ƴ� ����� ������ ����ϼ���
SELECT * FROM EMP WHERE COMM NOT IN(300,500,1400);

SELECT * FROM EMP WHERE ENAME LIKE 'S%';

--[����]
	
	- �� ���̺� ��� ���� �达�� ����� ������ �����ּ���.
SELECT * FROM MEMBER WHERE NAME LIKE '��%';
	- �� ���̺� ��� '������'�� ���Ե� ������ �����ּ���.
SELECT * FROM MEMBER WHERE ADDR LIKE '%����%';

	- ī�װ� ���̺� ��� category_code�� 0000�� ���� ��ǰ������ �����ּ���.
SELECT * FROM CATEGORY WHERE CATEGORY_CODE LIKE '%0000';

	- EMP���̺��� �Ի����ڰ� 82�⵵�� �Ի��� ����� ���,�̸�,����
	   �Ի����ڸ� ����ϼ���.
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE LIKE '82%';
    

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
SELECT ENAME, HIREDATE FROM EMP;

--[����]
--	- EMP���̺��� �޿��� 1000�̻� 1500���ϰ� �ƴ� �����
--
-- EMP���̺��� �̸��� 'S'�ڰ� ���� ���� ����� �̸��� ��� ����ϼ���.
SELECT ENAME FROM EMP WHERE ENAME NOT LIKE 'S%';
--	- ������̺��� ������ PRESIDENT�̰� �޿��� 1500�̻��̰ų�
--	   ������ SALESMAN�� ����� ���,�̸�,����,�޿��� ����ϼ���.
SELECT EMPNO,ENAME, JOB,SAL FROM EMP WHERE JOB='PRESIDENT' AND SAL <=1500 OR JOB='SALESMAN';

--- �� ���̺��� �̸��� ȫ�浿�̸鼭 ������ �л��� ������ 
--	    ��� �����ּ���.
SELECT * FROM MEMBER WHERE NAME='ȫ�浿' AND JOB='�л�';

--	- �� ���̺��� �̸��� ȫ�浿�̰ų� ������ �л��� ������ 
--	��� �����ּ���.
SELECT * FROM MEMBER WHERE NAME='ȫ�浿' OR JOB='�л�';
--	- ��ǰ ���̺��� �����簡 S�� �Ǵ� D���̸鼭 
--	   �ǸŰ��� 100���� �̸��� ��ǰ ����� �����ּ���.
SELECT * FROM PRODUCTS WHERE COMPANY='�Ｚ' OR COMPANY='���' AND OUTPUT_PRICE<1000000;
--��� ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ���
--	�޿��� ���� ������ �����Ͽ� ���,�̸�,����,�μ���ȣ,�޿���
--	����ϼ���.
SELECT EMPNO,ENAME,JOB,DEPTNO,SAL FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
--    
--    ��� ���̺��� ù��° ������ �μ���ȣ��, �ι�° ������
--	������, ����° ������ �޿��� ���� ������ �����Ͽ�
--	���,�̸�,�Ի�����,�μ���ȣ,����,�޿��� ����ϼ���.
SELECT  EMPNO, ENAME, HIREDATE, DEPTNO, JOB, SAL FROM EMP
ORDER BY DEPTNO, JOB, SAL DESC; 

--��ǰ ���̺��� ��ۺ��� ������������ �����ϵ�, 
--	    ���� ��ۺ� �ִ� ��쿡��
--		���ϸ����� ������������ �����Ͽ� �����ּ���.

SELECT * FROM PRODUCTS ORDER BY 7 DESC, 8 DESC;