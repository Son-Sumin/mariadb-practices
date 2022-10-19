-- alter table member add column name varchar(45) not null after no;
-- drop table member;

show tables;

 create table member(
   no int(20) not null auto_increment,
   name varchar(45) not null,
   phone varchar(13) not null,
   email varchar(200) not null,
   password varchar(100) not null,
   primary key(no)
);  
desc member;

create table category(
  no int(20) not null auto_increment,
  category varchar(100) not null,
  primary key(no)
);
desc category;

 create table book(
   no int(20) not null auto_increment,
   category_no int(45) not null,
   title varchar(100) not null,
   price int(20) not null,
   cart_no int(45) not null,
   orders_book_no int(45) not null,
   primary key(no)
   );  
desc book;

 create table cart(
   no int(20) not null auto_increment,
   member_no int(45) not null,
   book_title varchar(100) not null,
   amount int(20) not null,
   book_price int(20) not null,
   orders_no int(45) not null,
   primary key(no)
   );  
desc cart;
drop table cart;

 create table orders_book(
   no int(20) not null auto_increment,
   book_no int(45) not null,
   book_title varchar(100) not null,
   amount int(45) not null,
   primary key(no)
   );  
desc orders_book;
-- drop table orders_book;

 create table orders(
   no int(20) not null auto_increment,
   orders_number varchar(100) not null,
   member_no int(45) not null,
   member_name_email varchar(250) not null,
   payment int(20) not null,
   delivery_address varchar(250) not null,
   orders_book_no int(45) not null,
   primary key(no)
   );  
desc orders;

insert into member values(null, '짱구', '01022225555', 'zzang@gmail.com', '5555');
insert into member values(null, '맹구', '01033336666', 'mang@gmail.com', '6666');
select * from member;

delete from member where name = '짱구';
delete from member where name = '맹구';
drop table member;
drop table cart;
drop table orders;
drop table book;
drop table orders_book;
drop table category;


select * from category;