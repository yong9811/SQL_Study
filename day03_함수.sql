SELECT DEPTNO,INITCAP(DNAME),INITCAP(LOC) FROM DEPT;

--[����]
--	 
--	 ��ǰ ���̺��� �ǸŰ��� ȭ�鿡 ������ �� �ݾ��� ������ �Բ� 
--	 �ٿ��� ����ϼ���.
--     
select concat(output_price, '��')
from products;
--     �����̺��� �� �̸��� ���̸� �ϳ��� �÷����� ����� ������� ȭ�鿡
--	       �����ּ���.
--           
select concat(name, age)
from member;
--  ��� ���̺��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� �����
--	  ���,�̸�,����,�޿��� ����ϼ���. �� �̸������� �����ϼ���. 
--      
select empno, ename, job, sal
from emp
where ename between 'K' and 'Y'
order by ename;
--  ������̺��� �μ��� 20���� ����� ���,�̸�,�̸��ڸ���,
--	�޿�,�޿��� �ڸ����� ����ϼ���.
--	
select empno, ename, length(ename), sal, length(sal)
from emp;
--	
--	������̺��� ����̸� �� 6�ڸ� �̻��� �����ϴ� ������̸��� 
--	�̸��ڸ����� �����ּ���.
select ename, length(ename)
from emp
where length(ename) >= 6;

SELECT ENAME, LPAD(ENAME,15,'#') FROM EMP;

SELECT ENAME, SAL, LPAD(CONCAT('$',SAL),10,' ')�޿� FROM EMP;

SELECT '    ������ ����      ', LENGTH('    ������ ����      ') FROM DUAL;
SELECT LTRIM('    ������ ����      ',' ')FROM DUAL;

SELECT JOB ,REPLACE(JOB,'A','$') FROM EMP;

