desc gallery;
select * from gallery;

desc user;

alter table user add column role enum('user', 'admin') default 'user';

select * from user;

insert 
  into user 
values(null, '관리자', 'admin@mysite.com', '1234', 'male', now(), 'admin');