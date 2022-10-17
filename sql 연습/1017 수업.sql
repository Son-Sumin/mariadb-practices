-- date analysis, date architect, date modeling, schema design, 데이터베이스 설계,
-- ERD(Entity Relation Diagram) 작성
-- => 비지니스(도메인, 문제영역) 분석

-- 데이터베이스 설계 목적: 중복내용 제거, 정규화(Normalization, 구체화)
-- 데이터베이스 3요소: 엔티티(entity), 속성(attribute), 관계(relation)
-- 데이터베이스 단계: 주로 3개(1~3NF)
-- 1NF: 하나의 엔티티의 모든 속성들이 하나의 값을 가져야한다.
-- 		중복된 속성을 가진 엔티티는 그 안에 최소 1개 이상의 다른 엔티티가 존재함을 의미
-- 		각각의 엔티티는 유일한 PK(not null)를 가져야 함
-- 2NF: PK가 아닌 속성들이 PK에 종속적이어야 한다.
-- 3NF: PK 외의 속성들이 서로 종속적인 관계를 가지면 안 된다.

-- 식별(실선) vs 비식별(점선)
-- 비식별; A의 테이블 PK가 B의 테이블 FK가 될 때
-- 식별; A의 테이블 PK가 B의 테이블 PK도 될 때

-- create database cdmall;
-- create user 'cdmall'@'localhost' identified by 'cdmall';
-- grant all privileges on cdmall.* to 'cdmall'@'localhost';
-- flush privileges;