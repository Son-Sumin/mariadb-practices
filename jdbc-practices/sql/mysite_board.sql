-- user / insert
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
 
 -- user / elect
 select * from user;
 
 -- user / login
 select no, name from user where email='dooly@gmail.com' and password='1234';
 
 -- user / delete
 delete from user where name = 'manggu';

-- board -----------------------------------
 
desc board;
select * from board;
 
-- select
select a.no, a.title, a.hit, 
        date_format(a.reg_date, '%Y/%m/%d %H:%i:%s') as regDate, a.depth, a.user_no
  from board a, user b
 where a.user_no = b.no
order by group_no desc, order_no asc;

-- insert
insert into board values(null, '베스킨', '사빠딸', '1', now(), '1', '1', '0', '6');
insert into board values(null, '빠바', '소시지빵', '1', now(), 'maxGroupNo+1', '1', '0', '6');
insert into board values(null, '방앗간', '인절미', '1', now(), 'max(group_no) as maxGroupNo+1', '1', '0', '7');
insert into board values(null, '도미노피자', '슈프림피자', '1', now(), '1', '1', '1', '4');
insert into board values(null, '아', '샷츄', '0', now(), (select ifnull(max(group_no), 1))+1, '1', '0', '6');

-- primary key를 null이 아닌 직접 insert로 사용하고 싶을 때
select last_insert_id();

-- delete
delete from board where title = '빠바';
select ifnull(max(group_no), 1) from board;

-- view
select no, title, contents, hit, user_no
  from board
 where no = 3;
 
-- update
update board
   set title='타코야끼루~',
       contents='붕어빵 수정'
 where no=5;

-- updateHit
update board
   set hit = hit +1
 where no = 3;