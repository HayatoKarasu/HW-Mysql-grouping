drop database if exists vk;
create database if not exists vk;
use vk;

create table if not exists users(
id int primary key auto_increment,
username varchar(30),
password_hash varchar(300),
last_seen datetime
);

create table if not exists chats(
id int primary key auto_increment,
title varchar(50),
description varchar(200),
owner_id int,
numb int,
foreign key (owner_id) references users(id)
);

create table if not exists users_to_chats(
users_id int,
chat_id int,
primary key (users_id, chat_id),
enter_datetime datetime,
foreign key (users_id) references users(id),
foreign key (chat_id) references chats(id)
);

insert into users(username) values
(' user 1 '),
(' User 2 '),
(' User 3 '),
(' User 4 '),
(' User 5 '),
(' User 6 '),
(' User 7 '),
(' User 8 ');

insert into chats(title, description, owner_id, numb) values
('chat 1', 'for car lovers', 1, 82.123456789),
('chat 2', 'anime is the best kino', 2, 99.987654321),
('chat 3', '', 4, 55.45654);

insert into users_to_chats values
(1, 1, '2023-01-15 14:56:07'),
(2, 1, '2023-01-15 14:56:07'),
(3, 1, '2023-01-15 14:56:07'),
(4, 1, '2023-01-17 09:34:27'),
(1, 2, '2023-01-16 14:56:07'),
(2, 2, '2023-01-16 14:56:07'),
(4, 2, '2023-01-15 14:56:07'),
(5, 2, '2023-01-18 14:56:07'),
(7, 2, '2023-01-23 13:00:04'),
(8, 2, '2023-01-30 13:09:13'),
(3, 3, '2023-01-25 00:06:54'),
(4, 3, '2023-01-25 00:06:54');

-- ФУНКЦИИ ДЛЯ СТРОК 
-- соединить строки
select concat(users.username, ' ', chats.title) from users, chats;
-- длина строки
select length(users.username) as 'Длина строки' from users;
-- убрать пустые символы в начале и в конце
select trim(users.username) from users;
-- убрать пустые символы слева
select ltrim(users.username) from users;
-- убрать пустые символы справа
select rtrim(users.username) from users;
select substring(users.username, 6) from users; -- начиная с 6 символа вырезать
select substring(users.username, 3, 3) from users; -- начиная с 3 символа вырезать 3 символа
select reverse(users.username) from users; -- перевернуть строку
select lower(users.username) from users; -- нижний регистр
select upper(users.username) from users; -- верхний

-- ФУНКЦИИ ДЛЯ ЧИСЕЛ
select round(numb, 2) from chats; -- округлить число
select round(numb, -2) from chats; -- округлить число
select truncate(numb, 1) from chats; -- отбросить лишние числа
select abs(numb) from chats; -- модуль числа
-- округление вниз
select floor(numb) from chats;
-- округление вверх
select ceiling(numb) from chats;
-- возведение в степень 
select power(owner_id, 2) from chats;
select power(owner_id, 3) from chats;
-- квадратный корень 
select sqrt(owner_id) from chats;
-- знак числа 
select sign(owner_id) from chats;
-- случайное число от 0 до 1
select rand(), round(rand(), 2), rand();
select rand(1), round(rand(2), 2), rand(3); -- запомнить случайное число под определенным индексом
select rand(2);

-- ФУНКЦИИ ДЛЯ ВРЕМЕНИ 
-- дата и время
select now(); -- время начала функции
select sysdate(); -- системное время
select current_timestamp();
select now(), sysdate(), sleep(5), now(), sysdate(); -- разница между системным временем и временем начала ф-ции
-- текущая дата
select current_date();
select curdate();
-- текущее время 
select current_time();
select curtime();
-- дата по UTC
select utc_date();
-- время по UTC
select utc_time();

select dayofmonth('2023-09-20'); -- день месяца в число
select dayofweek('2023-09-20'); -- день недели в число
select dayofyear('2023-09-20'); -- день года в число
select month('2023-09-20'); -- месяц в число
select year('2023-09-20'); -- год в число
select quarter('2023-09-20'); -- квартал в число
select week('2023-09-20', 1); -- номер недели в число
select last_day('2023-09-20'); -- последний день в месяце
select dayname('2023-09-20'); -- название дня недели
select monthname('2023-09-20'); -- название месяца
select dayname('2023-09-20'); -- название дня недели
select hour('21:21:36'); -- час времени в число
select minute('21:21:36'); -- минуты времени в число
select second('21:21:36'); -- секунды времени в число

-- добавить к дате 
select date_add('2023-09-20', interval 1 day);
select date_add('2023-09-20', interval 1 month);
select date_add('2023-09-20', interval 1 year);
select date_add('2023-09-20 21:21:36', interval 1 hour);
-- вычесть из даты 
select date_sub('2023-09-20', interval 1 year);
-- разница дат в днях
select datediff('2022-09-20', '2023-09-20');
select datediff('2023-09-20', '2023-10-20');
select datediff('2023-09-20', '2023-09-10');
-- форматирование 
select date_format('2023-09-20 21:21:36', '%m'); -- взяли только месяц 01...12
select date_format('2023-09-20 21:21:36', '%c'); -- взяли только месяц 1...12
select date_format('2023-09-20 21:21:36', '%M'); -- взяли только название месяца 
select date_format('2023-09-20 21:21:36', '%b'); -- взяли только аббревиатура месяца
select date_format('2023-09-20 21:21:36', '%d'); -- взяли только день 01...30
select date_format('2023-09-20 21:21:36', '%e'); -- взяли только день 1...30
select date_format('2023-09-20 21:21:36', '%D'); -- взяли только день с суффиксом 
select date_format('2023-09-20 21:21:36', '%y'); -- взяли только год в двух числах 
select date_format('2023-09-20 21:21:36', '%Y'); -- взяли только год в четырех числах 
select date_format('2023-09-20 21:21:36', '%a'); -- взяли только аббревиатура дня недели 
select date_format('2023-09-20 21:21:36', '%H'); -- взяли только час 01...24
select date_format('2023-09-20 21:21:36', '%k'); -- взяли только час 1...24
select date_format('2023-09-20 21:21:36', '%h'); -- взяли только месяц 01...12
select date_format('2023-09-20 21:21:36', '%l'); -- взяли только месяц 1...12
select date_format('2023-09-20 21:21:36', '%i'); -- взяли только минуты 01...12
select date_format('2023-09-20 21:21:36', '%r'); -- взяли только время в 12
select date_format('2023-09-20 21:21:36', '%T'); -- взяли только время в 24
select date_format('2023-09-20 21:21:36', '%S'); -- взяли только секунды 01...12
select date_format('2023-09-20 21:21:36', '%p'); -- взяли только AM or PM

select count(*) from users; -- число строк

select floor(avg(numb)) as 'Среднее число' from chats; -- среднее 

select max(numb), min(numb), sum(numb) from chats; -- максимальное число, минимальное, сумма 

select count(*) from chats
group by title;

select count(*), title from chats
group by title;

select count(*), concat(title, ' ', description) from chats
group by title, description;

select title, count(*) as 'count', round(avg(numb), 2) from chats
where numb > 65
group by title
order by title desc;

select title, count(*) as 'count', round(avg(numb), 2) from chats
group by title
having round(avg(numb), 2) > 65;