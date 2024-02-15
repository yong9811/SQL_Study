--day02_select.sql
desc dept;
select*from dept;

desc emp;
select*from emp;

select ename, job, sal from emp;
--[1] EMP테이블에서 사번(EMPNO), 이름(ENAME), 급여(SAL), 보너스(COMM)를 가져와 
--   보여주세요
select empno, ename, sal, comm from emp;
--[2] 사원테이블에서 사원명, 급여, 급여의 10%인상액을 가져와 보여주세요
select ename, sal, sal*1.1 salup_10 from emp;
--[3]  사원테이블에서 사원명, 급여,보너스, 1년 연봉을 계산해 보여주세요
--1년 연봉=급여*12 +보너스(COMM)
select ename, sal, comm, sal*12+nvl(comm,0) "1년 연봉" from emp;

select ename, mgr, nvl2(mgr,1,0) "관리자 존재 여부" from emp;

select ename||' IS A '||job "employees detail" from emp;

select job from emp;

select DISTINCT job from emp;

select distinct deptno, job from emp order by deptno asc;

[문제]
--	 1] EMP테이블에서 중복되지 않는 부서번호를 출력하세요.
select distinct empno from emp;
--	 2] MEMBER테이블에서 회원의 이름과 나이 직업을 보여주세요.
select name, age, job from member;
--	 3] CATEGORY 테이블에 저장된 모든 내용을 보여주세요.
select * from category;
--	 4] MEMBER테이블에서 회원의 이름과 적립된 마일리지를 보여주되,
--	      마일리지에 13을 곱한 결과를 "MILE_UP"이라는 별칭으로
--	      함께 보여주세요.
select name, mileage*13 MILE_UP from member;
--    5] EMP테이블에서 이름과 연봉을 "KING: 1 YEAR SALARY = 60000"
--	형식으로 출력하라.
select ename||': 1 YEAR SALARY = '||(sal*12+nvl(comm,0)) from emp;

--[실습]
--	[1] emp테이블에서 급여가 1300에서 1500사이의 사원의 이름,업무,급여,
--	부서번호를 출력하세요
select ename,job,sal,deptno from emp where sal between 1300 and 1500;
--    [2] emp테이블에서 사원번호가 7902,7788,7566인 사원의 사원번호,
--	이름,업무,급여,입사일자를 출력하세요.
select empno,ename,job,sal,hiredate from emp where empno in(7902,7788,7566);  
--    [3] 10번 부서가 아닌 사원의 이름,업무,부서번호를 출력하세요
select ename, job, deptno from emp where deptno!=10;

--[4] emp테이블에서 업무가 SALESMAN 이거나 PRESIDENT인
--	사원의 사원번호,이름,업무,급여를 출력하세요.
select empno, ename, job, sal from emp where job in('SALESMAN','PRESIDENT');
--	[5] 커미션(COMM)이 300이거나 500이거나 1400인 사원정보를 출력하세요
SELECT * FROM EMP WHERE COMM IN(300,500,1400);
--	[6] 커미션이 300,500,1400이 아닌 사원의 정보를 출력하세요
SELECT * FROM EMP WHERE COMM NOT IN(300,500,1400);

SELECT * FROM EMP WHERE ENAME LIKE 'S%';

--[문제]
	
	- 고객 테이블 가운데 성이 김씨인 사람의 정보를 보여주세요.
SELECT * FROM MEMBER WHERE NAME LIKE '김%';
	- 고객 테이블 가운데 '강남구'가 포함된 정보를 보여주세요.
SELECT * FROM MEMBER WHERE ADDR LIKE '%강북%';

	- 카테고리 테이블 가운데 category_code가 0000로 끝는 상품정보를 보여주세요.
SELECT * FROM CATEGORY WHERE CATEGORY_CODE LIKE '%0000';

	- EMP테이블에서 입사일자가 82년도에 입사한 사원의 사번,이름,업무
	   입사일자를 출력하세요.
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE LIKE '82%';
    

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
SELECT ENAME, HIREDATE FROM EMP;

--[문제]
--	- EMP테이블에서 급여가 1000이상 1500이하가 아닌 사원의
--
-- EMP테이블에서 이름에 'S'자가 들어가지 않은 사람의 이름을 모두 출력하세요.
SELECT ENAME FROM EMP WHERE ENAME NOT LIKE 'S%';
--	- 사원테이블에서 업무가 PRESIDENT이고 급여가 1500이상이거나
--	   업무가 SALESMAN인 사원의 사번,이름,업무,급여를 출력하세요.
SELECT EMPNO,ENAME, JOB,SAL FROM EMP WHERE JOB='PRESIDENT' AND SAL <=1500 OR JOB='SALESMAN';

--- 고객 테이블에서 이름이 홍길동이면서 직업이 학생이 정보를 
--	    모두 보여주세요.
SELECT * FROM MEMBER WHERE NAME='홍길동' AND JOB='학생';

--	- 고객 테이블에서 이름이 홍길동이거나 직업이 학생이 정보를 
--	모두 보여주세요.
SELECT * FROM MEMBER WHERE NAME='홍길동' OR JOB='학생';
--	- 상품 테이블에서 제조사가 S사 또는 D사이면서 
--	   판매가가 100만원 미만의 상품 목록을 보여주세요.
SELECT * FROM PRODUCTS WHERE COMPANY='삼성' OR COMPANY='대우' AND OUTPUT_PRICE<1000000;
--사원 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우
--	급여가 많은 순으로 정렬하여 사번,이름,업무,부서번호,급여를
--	출력하세요.
SELECT EMPNO,ENAME,JOB,DEPTNO,SAL FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
--    
--    사원 테이블에서 첫번째 정렬은 부서번호로, 두번째 정렬은
--	업무로, 세번째 정렬은 급여가 많은 순으로 정렬하여
--	사번,이름,입사일자,부서번호,업무,급여를 출력하세요.
SELECT  EMPNO, ENAME, HIREDATE, DEPTNO, JOB, SAL FROM EMP
ORDER BY DEPTNO, JOB, SAL DESC; 

--상품 테이블에서 배송비의 내림차순으로 정렬하되, 
--	    같은 배송비가 있는 경우에는
--		마일리지의 내림차순으로 정렬하여 보여주세요.

SELECT * FROM PRODUCTS ORDER BY 7 DESC, 8 DESC;