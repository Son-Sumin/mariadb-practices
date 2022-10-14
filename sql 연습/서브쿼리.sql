-- subquery
-- 서브쿼리 = != < > 등과 같이 쓰려면 서브쿼리가 1row만 있어야함
-- 1) select절
select (select version());

-- 2) from절의 서브쿼리 ; from절에 서브쿼리가 있을 경우 alias 부여해야함
select s.a, s.b, s.c
  from (select now() as a, sysdate() as b, 3+1 as c) s;
  
-- 3) where절의 서브쿼리
-- 여러 명이 공유하기에 정보가 바뀌면 여러 개의 쿼리보다 서브쿼리를 이용해 하나의 쿼리를 사용하는 것이 나음
-- 예제: 현재, Fai Bale이 근무하는 부서의 직원들의 사번, 이름을 출력하세요.
-- 서브쿼리 사용 안한 경우;
select dept_no
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and concat(b.first_name, ' ', b.last_name) = 'Fai Bale';
   
select a.emp_no, b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and a.dept_no = 'd004';
   
-- 서브쿼리 사용한 경우;
select a.emp_no, b.first_name 
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and a.dept_no = (select dept_no
					  from dept_emp a, employees b
					 where a.emp_no = b.emp_no
					   and a.to_date = '9999-01-01'
					   and concat(first_name, ' ', last_name) = 'Fai Bale');


