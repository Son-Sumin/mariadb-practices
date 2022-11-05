show tables;
desc pet;
insert into pet values('복진이', '손수민', 'dog', 'm', '2022-07-05', null);
delete from pet where name = '복진이';

select name, owner, species, gender, date_format(birth, '%Y-%m-%d'), death from pet;

-- emaillist sql 연습

-- insert
insert into emaillist values(null, '둘', '리', 'dooly@gmail.com');
insert into emaillist values(null, '마', '이콜', 'michol@gmail.com');
insert into emaillist values(null, '짱', '구', 'zzanggu@gmail.com');


-- select
select * from emaillist order by no desc;

-- delete(by email)
delete from emaillist where email = 'kickscar@gmail.com';

desc emaillist;

select * from dept;

insert
  into dept
values (null, '디자인');

delete
  from dept
 where no = 8;
 
 update dept
    set name = '전략기획'
  where no = 4;