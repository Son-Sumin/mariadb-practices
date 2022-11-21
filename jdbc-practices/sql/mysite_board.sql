show tables;

select * from category;

insert into book values(null, category_no, title, price, null) ;
insert into book values(null, '맹구', '01033336666', 'mang@gmail.com', '6666');
select * from book;

select b.category, a.title, a.price 
  from book a, category b
 where a.category_no = b.no
  order by a.no desc;
  
  select a.orders_number, b.name, b.email, a.payment, a.delivery_address 
    from orders a, member b
   where a.member_no = b.no
    order by a.no desc;
    
insert into orders values(null, '2210230005', null,'20000', '서울특별시 서초구 서초대로74길 33');
select * from orders;

select b.title, a.amount, b.price
  from cart a, book b
where a.no = b.cart_no
order by a.no desc;

-- ---------about mysite-------------
desc guestbook;
select * from guestbook;

insert into guestbook values(null, '둘리', '1234', '호이~', now());
insert into guestbook values(null, '마이콜', '1234', '라면 구공탄~', now());

select no, name, contents, password, date_format(reg_date, '%Y/%m/%d %H:%i:%s')
  from guestbook;

desc user;
-- join
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
 
 -- select
 select * from user;
 
 -- login
 select no, name from user where email='dooly@gmail.com' and password='1234';
 
 -- delete
 delete from user where name = 'manggu';
 
 desc board;
select * from board;
 
 select a.no, a.title, a.hit, 
        date_format(a.reg_date, '%Y/%m/%d %H:%i:%s'), a.depth, a.user_no
   from board a, user b
 where a.user_no = b.no
order by group_no desc, order_no asc;
 -- limit ((현page-1)*3, 3);
 
 -- pstmt.setInt(1, (page-1)*3)
 
insert into board values(null, '베스킨', '사빠딸', '1', now(), '1', '1', '1', '6');
 insert into board values(null, '빠바', '소시지빵', '1', now(), 'maxGroupNo+1', '1', '0', '6');
 insert into board values(null, '방앗간', '인절미', '1', now(), 'max(group_no) as maxGroupNo+1', '1', '0', '7');
  insert into board values(null, '도미노피자', '슈프림피자', '1', now(), '1', '1', '1', '4');
 
 delete from board where title = '빠바';
select max(group_no) as maxGroupNo from board;


select title, contents
  from board
 where no = 3;
 
 
 -- primary key를 null이 아닌 직접 insert로 사용하고 싶을 때
  select last_insert_id();
 insert
   into guestbook
 values(null, '둘리', '1234', '호호이이~', now());
 
 select last_insert_id();