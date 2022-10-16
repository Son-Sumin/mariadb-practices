-- 함수 : 날짜 함수

-- curdate(); 함수, current_date; 상수  #날짜
select curdate(), current_date;

-- curtime(); 함수, current_time; 상수  #시간
select curtime(), current_time;

-- now() vs sysdate() #날짜, 시간
-- now는 쿼리가 실행될 때 시간, sysdate는 함수가 실행되는 시간
-- sleep; 잠깐 시스템 멈춰
select now();
select sysdate();
select now(), sleep(2), now();
select now(), sleep(2), sysdate();

-- date_format()
-- 2022년 10월 13일 10:12:55 형식으로 표현하기
select date_format(now(), '%Y-');
select date_format(now(), '%Y년 %m월 %d일 %h:%i:%s');
select date_format(now(), '%d %b,\'%y %h:%i:%s');

-- period_diff(endmon, startmon); 기간 사이의 개월 수를 반환(일자X)
-- 포맷팅 YYMM, YYYYMM

-- 예제: 근무 개월 수           
select first_name, 
  period_diff(date_format(curdate(),'%y%m'), date_format(hire_date, '%y%m')) as month
  from employees
  order by month desc;
  
-- date_add(=adddate), date_sub(=subdate)
-- 날짜를 date에 type(year, month, day)의 표현식을 더하거나 뺀다.
-- 예제: 각 사원들의 근속 년수가 5년이 되는 날은 언제인가요?
select first_name, 
       hire_date,
       date_add(hire_date, interval 5 year)
	from employees;

-- cast(형 변환)
select '12345'+10, cast('12345' as int)+10;
select date_format(cast('2022-10-10' as date), '%Y년 %m월 %d일');
select cast(cast(1-2 as unsigned) as int);
select cast(cast(1-2 as unsigned) as integer); 
select cast(cast(1-2 as unsigned) as signed); 

-- type
-- 문자: varchar(최대글자), char(지정글자), text(varchar보다 더 길게),
-- CLOB(Character Large OBject; 더더 긴 글)
-- 정수: signed(unsigned), int(=integer), medium int, big int(더 큰수)
-- 실수: float, double
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large OBject)
