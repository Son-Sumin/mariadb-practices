-- practice04: 혼합

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select avg(salary) as avg_salary
  from salaries
 where to_date = '9999-01-01';
 
 -- 72012.2359
 select count(*)
   from salaries
  where to_date = '9999-01-01'
    and salary > (select avg(salary) as avg_salary
					from salaries
                   where to_date = '9999-01-01');
                   
-- sol2)
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    to_date = '9999-01-01'
        AND salary > (SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            to_date = '9999-01-01');

-- ------------------------------------------------------------------------------

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
select d.emp_no, d.first_name, c.dept_name, a.salary
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
  order by a.salary desc;

-- sol2) from절 subquery
  select d.emp_no, d.first_name, c.dept_name, a.salary
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
  order by max_salary desc;
  
  
-- sol3)
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name),
    d.dept_name,
    b.salary
FROM
    employees a,
    salaries b,
    dept_emp c,
    departments d,
    (SELECT 
        c.dept_no, max(b.salary) AS max_salary
    FROM
        employees a, salaries b, dept_emp c
    WHERE
        a.emp_no = b.emp_no
            AND a.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) e
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND c.dept_no = e.dept_no
        AND b.salary = e.max_salary
        AND e.dept_no = d.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
ORDER BY b.salary DESC;    
  -- ------------------------------------------------------------------------------

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
          
-- sol2)
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM
    employees a,
    salaries b,
    dept_emp c,
    (SELECT 
        c.dept_no, AVG(b.salary) AS avg_salary
    FROM
        employees a, salaries b, dept_emp c
    WHERE
        a.emp_no = b.emp_no
            AND a.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND c.dept_no = d.dept_no
        AND b.salary > d.avg_salary
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01';
  
 -- ------------------------------------------------------------------------------ 
   
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

-- ------------------------------------------------------------------------------

-- 문제5. 000
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
-- 부서별 평균 연봉 중 가장 높은 부서
select b.dept_no, avg(a.salary) as max_salary
  from salaries a, dept_emp b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by b.dept_no
  having max_salary = (select max(a.avg_salary)
						 from (select b.dept_no, avg(a.salary) as avg_salary
                                 from salaries a, dept_emp b
                                where a.emp_no = b.emp_no
                                  and a.to_date = '9999-01-01'
                                  and b.to_date = '9999-01-01'
							 group by b.dept_no) a)
order by max_salary desc;

-- sol)
select a.emp_no, a.first_name, e.dept_nono, c.title, d.salary
  from employees a, dept_emp b, titles c, salaries d,
	   (select b.dept_no as dept_nono, avg(a.salary) as max_salary
          from salaries a, dept_emp b
	     where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
      group by b.dept_no
        having max_salary = (select max(a.avg_salary)
							   from (select b.dept_no, avg(a.salary) as avg_salary
                                       from salaries a, dept_emp b
                                      where a.emp_no = b.emp_no
                                        and a.to_date = '9999-01-01'
                                        and b.to_date = '9999-01-01'
							       group by b.dept_no) a)) e
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and b.dept_no = e. dept_nono
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
order by d.salary desc;

-- sol2)
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    b.title,
    c.salary
FROM
    employees a,
    titles b,
    salaries c,
    dept_emp d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND a.emp_no = d.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND d.dept_no = (SELECT 
            dept_no
        FROM
            (SELECT 
                dept_no, AVG(salary) AS avg_salary
            FROM
                salaries a, dept_emp b
            WHERE
                a.emp_no = b.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY dept_no
            ORDER BY avg_salary DESC
            LIMIT 0 , 1) a)
ORDER BY c.salary DESC;

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
  
-- sol2)
SELECT 
    f.dept_name AS '부서이름',
    a.first_name AS '사원이름',
    d.salary AS '연봉',
    g.first_name AS '매니저 이름',
    e.salary AS '매니저 연봉'
FROM
    employees a,
    dept_emp b,
    dept_manager c,
    salaries d,
    salaries e,
    departments f,
    employees g
WHERE
    a.emp_no = b.emp_no
        AND c.dept_no = b.dept_no
        AND a.emp_no = d.emp_no
        AND c.emp_no = e.emp_no
        AND c.dept_no = f.dept_no
        AND c.emp_no = g.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND e.to_date = '9999-01-01'
        AND d.salary > e.salary;
