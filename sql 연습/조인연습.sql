-- 지금까지는 row의 선택 조건
-- join은 (필요한 테이블-1)개의 조건이 필요함
-- join의 종류는 2가지다; inner join(join 조건 만족; where equi join, join ~ on-표준), 
--                    outter join(join 조건 맞지 않는 얘들도 출력; join left,right,full ~on)
-- equi join은 표준문법(join ~ on) 아님

-- inner join
-- 예제1: 현재 근무하고 있는 직원의 이름과 직책을 모두 출력하세요.
select a.first_name, b.title   -- employees.first_name 너무 기니까
  from employees a, titles b
 where a.emp_no = b.emp_no -- join 조건 (2-1)개
   and b.to_date = '9999-01-01';   -- row 선택 조건
   
-- 예제2: 현재 근무하고 있는 직원의 이름과 직책을 출력하되 여성 engineer만 출력하세요.
select a.first_name,a.gender, b.title   -- employees.first_name 너무 기니까
  from employees a, titles b
 where a.emp_no = b.emp_no -- join 조건 (2-1)개
   and b.to_date = '9999-01-01'   -- row 선택 조건1
   and a.gender = 'f'             -- row 선택 조건2
   and b.title = 'engineer';      -- row 선택 조건3


-- ANSI/ISO SQL1999 JOIN 표준문법

-- 1) Natural Join  / inner join의 한 종류
-- 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않아도 암묵적으로 조인이 됨
-- 예제1: 현재 근무하고 있는 직원의 이름과 직책을 모두 출력하세요.
select a.first_name, b.title   -- employees.first_name 너무 기니까
  from employees a natural join titles b -- on a.emp_no = b.emp_no
 where b.to_date = '9999-01-01';
 
-- 2) join ~ using
-- natural join의 문제점(이름이 같은 컬럼이 여러 개일 때) 해결을 위해 사용
select count(*)
  from salaries a natural join titles b
 where b.to_date = '1999-01-01';
 
select count(*)
  from salaries a join titles b using(emp_no)
 where b.to_date = '1999-01-01';
 
-- 3) join ~ on
-- 예제: 현재 직책별 평균 연봉을 큰 순서대로 출력하세요.
select b.title, avg(salary)
  from salaries a 
  join titles b on a.emp_no = b.emp_no
 where b.to_date = '1999-01-01'
   and a.to_date = '1999-01-01'
 group by b.title
 order by avg(salary) desc;

-- 실습문제1: 
-- 현재 회사생활을 반영한 직원별 근무부서를 사번, 직원 전체이름, 근무부서 순으로 출력하세요.
select a.emp_no, concat(a.first_name, a.last_name), 
  from employees a join dept_manager b on a.emp_no = b.emp_no
 where b.to_date = '1999-01-01'
group by 

-- 실습문제2: 
-- 

-- 실습문제3: 
-- 

-- 실습문제4: 
-- 