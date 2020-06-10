-- 1
 
UPDATE `users`
set created_at = now(), updated_at = now();

-- 2

create table users_1(
created_at varchar(255),
update_at varchar(255)
)

insert into users_1(created_at, update_at)
values 
('1987-06-09 01:11:09', '1980-01-31 18:51:37'),
('1998-09-13 16:18:17', '1987-07-26 14:37:23'),
('1970-08-23 21:03:38', '1999-04-17 09:14:39'),
('1978-05-03 11:14:23', '1983-03-02 03:31:56'),
('1983-12-02 10:08:28', '2008-05-17 19:00:33');

select STR_TO_DATE(created_at, '%d.%m.%Y') from users_1;

alter table users_1 change created_at created_at DATETIME default CURRENT_TIMESTAMP;
alter table users_1 change update_at update_at DATETIME default CURRENT_TIMESTAMP;

describe users_1; 

-- 3

drop table storehouses_products;
create table storehouses_products(
value int unsigned)

insert into storehouses_products(value)
values
(0),
(2500),
(0),
(30),
(500),
(1)

select * from storehouses_products order by value desc;

-- 4

drop table users_2
create table users_2(
id SERIAL PRIMARY key,  
firstname VARCHAR(50),
    lastname VARCHAR(50),
    birthday VARCHAR(120) unique)
    
INSERT INTO `users_2` (`id`, `firstname`, `lastname`, `birthday`) 
VALUES ('1', 'Dean', 'Satterfield', 'January'),
('2','Liza','Spinka','February'),
('3','Marley','Kerluke','March'),
('4','Linnea','Thiel','April'),
('5','Adrienne','Harber','May'),
('6','Ron','Block','June'),
('8','Margaret','Gislason','July'),
('9','Earnest','Breitenberg','August'),
('10','Myriam','Wilderman','September')

select * from users_2 where birthday = 'May' or birthday = 'August';

-- 1 агрегация данных

ALTER TABLE users ADD birthday TIMESTAMP;

select timestampdiff(year,birthday,now()) as age from users;

select avg(timestampdiff(year,birthday,now())) as age from users;

-- 2

select birthday from users;

select year(now()), month(birthday), day(birthday) from users;

select concat_ws('-', year(now()), month(birthday), day(birthday)) as day from users;

select DATE_FORMAt(DATE((concat_ws('-', year(now()), month(birthday), day(birthday))), '%W') as day, count(*) as total from users group by day;

-- 3

insert into catalogs (id)
values
(3),
(4)

select exp(sum(ln(id))) from catalogs; 

