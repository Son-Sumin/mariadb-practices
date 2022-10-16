-- table 생성
drop table member;
create table member(
   no int(11) not null auto_increment,
   email varchar(100) not null,
   password varchar(64) not null,
   name varchar(100) not null,
   department varchar(100),
   primary key(no) 
);   -- not null: 반드시 입력하라 / auto_increment: 자동 증가

desc member;    -- 스키마 확인

-- table 수정
alter table member add column juminbunho char(13) not null;
desc member; 

alter table member drop juminbunho;
desc member; 

-- 위치 지정 (after); before는 없음
alter table member add column juminbunho char(13) not null after email;
desc member; 

-- 기존 정보 수정
alter table member change department department varchar(200) not null;
desc member; 

alter table member add self_intro text;
desc member; 

alter table member drop juminbunho;
desc member; 

-- insert; insert table into values()
insert
  into member
values (null, 'ooo@gmail,com', password('1234'), '손수민', '개발팀', null);
select * from member;

insert
  into member(no, email, name, password, department)
values (null, 'ooo@gmail2,com', '손수민2', password('1234'),'개발팀');
select * from member;

-- update (where 필수); update table set where 
update member
   set email = 'rrr@gmail.com', password=password('4321')
 where no = 2;
 select * from member;
 
 -- delete (where 필수); delete from table where
 delete
   from member
 where no = 2;
 select * from member;
 
 -- insert update delete 는 입력할 내용이 여러 개여도 1개씩 출력할 것
 -- 이유: transaction 관리되야 함
 -- rollback; 쿼리들이 순차적으로 실행될 때 실패 시 다시 처음으로 돌아가기
 -- commit; 쿼리들이 성공적으로 실행 시 결과에 반영
 
 -- transaction
 select @@autocommit;  -- 대체로 기본적으로 시스템화 되어있음 1=true
 set autocommit=0;  -- autocommit 비활성화 / 즉 table 수정 시 나에게만 보여짐
 insert
  into member(no, email, name, password, department)
values (null, 'ooo@gmail5,com', '손수민5', password('1234'),'개발팀');
select * from member;
commit;  -- 결과 올리기
