-- mariadb 설치 > workbench 설치 > 해당 프로그램에 맞는 환경변수 추가
-- 예시1) C:\Program Files\MariaDB 10.5\bin
-- 예시2) C:\Program Files\Java\jdk-12.0.2\bin

--workbench 접속 후 root 생성 후 그 곳에서 다른 db 생성
--현상태 확인
show tables;
select * from user;

-- 데이터베이스 생성
-- create database db이름;
create database webdb;

-- 데이터베이스 생성 확인
show databases;

-- db 사용자(user) 생성
-- create user 'user이름'@'localhost' identified by '해당 user password';
create user 'webdb'@'localhost' identified by 'webdb';

-- 권한 부여
-- grant all privileges on user이름.* to 'user이름'@'localhost';
grant all privileges on webdb.* to 'webdb'@'localhost';

-- flush privileges(권한 정보 재로딩)
flush privileges;



-- 사용자 삭제
drop user 'webdb'@'locahost';
