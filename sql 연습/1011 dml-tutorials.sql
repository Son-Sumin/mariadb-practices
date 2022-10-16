-- MySQL Shell에서 나오기: mysql> exit 또는 QUIT

-- 대소문자 구문 없음
select version(), current_date();
select VerSion(), curRent_date();

-- 함수 및 수식 가능
select sin(pi()/4), (4+1)*5;

-- ; 의미는 해당 쿼리만 실행하라는 의미
select version(); select now();

-- command 취소: \c

show databases;
show tables;

-- 테이블 삭제
drop table pet;

-- 테이블 만들기 (varchar는 최대 20자 써라, char는 딱 그 수만큼 채워라)
create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

-- 스키마 확인
desc pet;

-- 조회(컬럼을 올리다고 표현)  [select col.. from tbl]
select name, owner, species, gender, birth, death from pet;

-- 데어터 넣기(생성, Create)
-- insert into tbl 또는 tbl(항1, 항2) value
insert
	into pet
    value('성탄이', '안대혁', 'dog', 'm', '2018-12-25', null);
select name, owner, species, gender, birth, death from pet;

-- 데이터 삭제(삭제, Delete)
-- delete from tbl where 어떤 row
delete
 from pet
 where name='성탄이';
 
 -- load data local file
 load data local infile 'c:\\pet.txt' into table pet;
 
 -- 아래 에러시 OPT_LOCAL_INFILE=1 시작 화면 edit 두번째 advance에 입력할 것
 -- update(수정, Update)
 update pet set death = null where name != 'Bowser';
 
 -- 조회1: where
 
 -- 1990이후에 태어난 아이들은? (출력: 이름, 종, 생일)
 select name, species, birth from pet where birth > '1990-12-31';
 
 -- Gwen과 함께 사는 아이들은? (출력: 이름, 종, 집사)
 select name, species, owner from pet where owner = 'Gwen';
 
 -- null 다루기1 : 현재 살아있는 아이들은?(이름, 생일, 사망일)
 select name, birth, death
 from pet
 where death is null;
 
  -- null 다루기2 : 사망한 아이들은?(이름, 생일, 사망일)
 select name, birth, death
 from pet
 where death is not null;
 
 -- like 검색1(패턴매칭): 이름이 b로 시작하는 아이들은?(이름)
 select name
 from pet
 where name like 'b%'; -- %는 글자수 미지정
 
  -- like 검색2(패턴매칭): 이름이 b로 시작하는 아이들 중 이름이 6자인 아이는?(이름)
select name
 from pet
 where name like 'b_____'; -- 글자 수만틈 _

-- 정렬(order by) : asc 내림(작은거부터), desc(큰거부터)
-- 어린 순으로 아이들을 출력하세요(이름, 생일)
select name, birth
 from pet
 order by birth desc;
 
 -- 나이가 많은 순으로 출력하세요(이름, 생일)
 select name, birth
 from pet
 order by birth asc;
 
 -- 집계(통계) 함수
 select count(*) from pet;  -- * 넣으면 알아서 제일 효율적인거 잡고 세어줌
select count(death) from pet;
select count(death) from pet where death is not null;

-- select col.. from tbl where.. order by asc, desc
-- col. 에 통계함수가 들어가면 뒤에 group by 또는 having 이 들어감
