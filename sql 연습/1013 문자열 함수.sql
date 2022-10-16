-- 함수 : 문자열

-- upper
select upper('seoul'), upper('sEouL'), upper('Seoul');
select upper(first_name) from employees;

-- lower
select lower('seoul'), lower('sEouL'), lower('Seoul');
select lower(first_name) from employees;

-- substring(문자열, index, length)
-- 프로그램은 0부터, 데이터는 1부터 counting
select substring('Hello World',3,2);

-- 예제: 1989년에 입사한 사원들의 이름, 입사일 출력
select first_name, hire_date
  from employees
  where hire_date like '1989%';
  
select first_name, hire_date
  from employees
  where '1989' = substring(hire_date, 1,4);
  
-- lpad(오른쪽 정렬), rpad(왼쪽 정렬, x자리로 출력, 빈공간은 '무엇')
select lpad('1234', 10, '-'), rpad('1234', 10, '-');

-- 예제: 직원들의 월급을 오른쪽 정렬(빈공간*)
select lpad(salary, 10, '*') from salaries;

-- trim, ltrim(왼쪽 빈공간 자르기), rtrim(오른쪽 빈공간 자르기)
select ltrim('   hello   ');
select concat('---',ltrim('   hello   '), '---');
select concat('---',rtrim('   hello   '), '---');
select concat('---',trim(both 'x' from 'xxxhelloxxx'), '---');


