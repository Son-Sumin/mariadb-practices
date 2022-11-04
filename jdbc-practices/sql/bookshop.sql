-- 스키마 확인
show tables;
desc book;
desc author;

-- author insert
insert into author values(null, '원수연');

-- author select
select * from author;

-- author delete all
delete from author;

-- book insert
insert into book values(null, 'test', '재고있음', 2);

-- book select
select * from book;

-- book delete all
delete from book;