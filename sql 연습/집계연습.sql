-- 집계쿼리: select 절에 그룹함수(avg, max, min, count, sum,...)가 적용된 경우

select avg(salary), sum(salary)
  from salaries;
  
-- select절에 그룹함수가 있는 경우, 어떤 컬럼도 select절에 올 수 없다.
-- emp_no는 아무 의미없다. 오류!!
select avg(salary), emp_no
  from salaries;
  
-- query 순서
-- 1) from: 접근 테이블 확인
-- 2) where: 조건에 맞는 row를 선택
-- 3) 집계
-- 4) projection
select avg(salary)
  from salaries
  where emp_no = '10060';

-- group by에 참여하고 있는 컬럼은 projection이 가능하다(select절에 올 수 있다)
select emp_no, avg(salary)
  from salaries
  group by emp_no;
  
-- having
-- 집계결과(결과 임시 테이블)에서 row를 선택해야 하는 경우
-- 이미 where절은 실행이 되었기 때문에 having절에서 이 조건을 주어야 한다.
select emp_no, avg(salary) as avg_salary
  from salaries
  group by emp_no
  having avg_salary > 60000
  order by avg_salary desc;
  
-- 입력순서: from, where, group by, having, orderby

-- 예제
-- salaries 테이블에서 사번이 10060인 직원의 사번, 급여평균, 급여총합을 출력하세요.

-- 문법적으로 오류!!
-- 의미적으로는 맞다
select emp_no, avg(salary), sum(salary)
  from salaries
  where emp_no = '10060';

-- 문법적으로 True
select emp_no, avg(salary), sum(salary)
  from salaries
  group by emp_no
  having emp_no = '10060';
  
-- select절에 통계함수가 들어가면 select절에 컬럼이 들어갈 수 없다.
-- 단, 'group by oo'가 있으면 통계함수가 들어간 select절 일반 컬럼 oo가 들어갈 수 있다.
