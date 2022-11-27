-- insert
insert 
  into user 
 values(null, '둘리', 'dooly@gmail.com', '1234', 'male', now());
 
insert 
  into user 
values(null, '마이콜', 'micol@gmail.com', '1234', 'male', now());

insert 
  into user 
values(null, '맹구', 'menggu@gmail.com', '1234', 'male', now());
 
 insert 
  into user 
values(null, '짱구', 'zzanggu@gmail.com', '1234', 'male', now());

insert 
  into user 
values(null, '뽀로로', 'pororo@gmail.com', '1234', 'male', now(), 'user');

insert 
  into user 
values(null, '크롱', 'crong@gmail.com', '1234', 'male', now(), 'user');
 
 -- select
 select * from user;
 
 -- login
 select no, name from user where email='dooly@gmail.com' and password='1234';
 
 -- delete
 delete from user where name = 'manggu';