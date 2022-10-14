-- practice04: 혼합

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select avg(salary) as avg_salary
  from salaries
 where to_date = '9999-01-01';
 
 -- 72012.2359
 select count(*) as emp_avgsal
   from salaries
  where salary > (select avg(salary) as avg_salary
					from salaries
                   where to_date = '9999-01-01');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요.
-- 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select b.dept_no, max(a.salary) as max_salary
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
 group by b.dept_no;
 
-- sol1) where절 subquery
select d.emp_no, d.first_name, b.dept_no, a.salary
  from salaries a, dept_emp b, departments c, employees d 
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and d.emp_no = a.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   and (b.dept_no, a.salary) in (select b.dept_no, max(a.salary) as max_salary
								   from salaries a, dept_emp b
                                  where a.emp_no = b.emp_no
                                    and a.to_date = '9999-01-01'
                                    and b.to_date = '9999-01-01'
							   group by b.dept_no)
  group by b.dept_no
  order by a.salary asc;

-- sol2) from절 subquery
  select d.emp_no, d.first_name, b.dept_no, a.salary
  from salaries a, dept_emp b, departments c, employees d,
       (select b.dept_no, max(a.salary) as max_salary
								   from salaries a, dept_emp b
                                  where a.emp_no = b.emp_no
                                    and a.to_date = '9999-01-01'
                                    and b.to_date = '9999-01-01'
							   group by b.dept_no) e
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and d.emp_no = a.emp_no
   and a.salary = e.max_salary
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
  group by b.dept_no
  order by max_salary asc;
  

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요.
select b.dept_no, avg(a.salary) as avg_salary
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no;

-- sol)
select c.emp_no, c.first_name, a.salary, b.dept_no
  from salaries a, dept_emp b, employees c
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   and a.salary > any (select avg(a.salary) as avg_salary
			  from salaries a, dept_emp b
             where a.emp_no = b.emp_no
               and a.to_date = '9999-01-01'
               and b.to_date = '9999-01-01'
          group by b.dept_no);
   
   
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
-- 매니저 이름
select a.emp_no, a.first_name as manager_name
  from employees a, dept_manager b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01';

-- sol)
select a.emp_no, a.first_name, d.manager_name, c.dept_name
  from employees a, dept_manager b, departments c,
       (select a.emp_no, a.first_name as manager_name
		  from employees a, dept_manager b
         where a.emp_no = b.emp_no
           and b.to_date = '9999-01-01') d
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and b.to_date = '9999-01-01';

-- 문제5. 000
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
-- 부서별 평균 연봉
select b.dept_no, max(a.avg_salary)
from (select b.dept_no, avg(a.salary) as avg_salary
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no) a,
dept_emp b;

-- 부서별 평균 연봉
select b.dept_no, avg(a.salary)
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no;

-- sol)
select b.emp_no, c.first_name, d.title, a.salary
  from salaries a, dept_emp b, employees c, titles d
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
   and b.dept_no = (select e.max_dept
                         from (select b.dept_no as max_dept, avg(a.salary) as avg_sal
								 from salaries a, dept_emp b
                                where a.emp_no = b.emp_no
                                  and a.to_date = '9999-01-01'
								  and b.to_date = '9999-01-01'
							 group by b.dept_no
                               having max(avg_sal)) e);
   
   and (b.dept_no, a.salary) in (select b.dept_no, avg(a.salary) as avg_salary
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no)

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
-- 부서별 평균 연봉
select b.dept_no, avg(a.salary)
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no;

-- sol)
  select b.dept_no, avg(a.salary) as max_salary
    from salaries a, dept_emp b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by b.dept_no
  having max_salary = (select max(c.avg_salary)
						 from (select b.dept_no, avg(a.salary) as avg_salary
                                 from salaries a, dept_emp b
                                where a.emp_no = b.emp_no
								  and a.to_date = '9999-01-01'
		                          and b.to_date = '9999-01-01'
							 group by b.dept_no) c);
                             
-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select b.title, avg(a.salary) as avg_salary
  from salaries a, titles b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.title;

-- sol)
select b.title, avg(a.salary) as max_salary
  from salaries a, titles b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.title
 having max_salary = (select max(c.avg_salary)
                        from (select b.title, avg(a.salary) as avg_salary
                                from salaries a, titles b
                               where a.emp_no = b.emp_no
                                 and a.to_date = '9999-01-01'
                                 and b.to_date = '9999-01-01'
                            group by b.title) c);
   


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
-- 매니저별 연봉
select b.emp_no, a.salary as sal_manager
  from salaries a, dept_manager b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.emp_no;

-- 매니저 이름
select a.emp_no, a.first_name as manager_name
  from employees a, dept_manager b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01';

-- sol)
select c.dept_name, d.first_name, a.salary, e.manager_name, f.sal_manager
  from salaries a, dept_manager b, departments c, employees d,
         (select a.emp_no, a.first_name as manager_name
            from employees a, dept_manager b
           where a.emp_no = b.emp_no
             and b.to_date = '9999-01-01') e,
		  (select b.emp_no as manager_no, a.salary as sal_manager
			 from salaries a, dept_manager b
            where a.emp_no = b.emp_no
              and a.to_date = '9999-01-01'
              and b.to_date = '9999-01-01'
		 group by b.emp_no) f
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and d.emp_no = a.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by f.manager_no
  having a.salary > f.sal_manager;
