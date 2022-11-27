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

desc guestbook;
select * from guestbook;

insert into guestbook values(null, '둘리', '1234', '호이~', now());
insert into guestbook values(null, '마이콜', '1234', '라면 구공탄~', now());
insert
  into guestbook
values(null, '둘리', '1234', '호호이이~', now());

select no, name, contents, password, date_format(reg_date, '%Y/%m/%d %H:%i:%s') 
from guestbook order by reg_date desc;

delete from guestbook where no= 1;