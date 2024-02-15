SELECT DEPTNO,INITCAP(DNAME),INITCAP(LOC) FROM DEPT;

--[문제]
--	 
--	 상품 테이블에서 판매가를 화면에 보여줄 때 금액의 단위를 함께 
--	 붙여서 출력하세요.
--     
select concat(output_price, '원')
from products;
--     고객테이블에서 고객 이름과 나이를 하나의 컬럼으로 만들어 결과값을 화면에
--	       보여주세요.
--           
select concat(name, age)
from member;
--  사원 테이블에서 첫글자가 'K'보다 크고 'Y'보다 작은 사원의
--	  사번,이름,업무,급여를 출력하세요. 단 이름순으로 정렬하세요. 
--      
select empno, ename, job, sal
from emp
where ename between 'K' and 'Y'
order by ename;
--  사원테이블에서 부서가 20번인 사원의 사번,이름,이름자릿수,
--	급여,급여의 자릿수를 출력하세요.
--	
select empno, ename, length(ename), sal, length(sal)
from emp;
--	
--	사원테이블의 사원이름 중 6자리 이상을 차지하는 사원의이름과 
--	이름자릿수를 보여주세요.
select ename, length(ename)
from emp
where length(ename) >= 6;

SELECT ENAME, LPAD(ENAME,15,'#') FROM EMP;

SELECT ENAME, SAL, LPAD(CONCAT('$',SAL),10,' ')급여 FROM EMP;

SELECT '    오늘의 날씨      ', LENGTH('    오늘의 날씨      ') FROM DUAL;
SELECT LTRIM('    오늘의 날씨      ',' ')FROM DUAL;

SELECT JOB ,REPLACE(JOB,'A','$') FROM EMP;

