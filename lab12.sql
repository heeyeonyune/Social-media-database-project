--drop any tables with same name of table
drop table if exists Follow;
drop table if exists Likes;
drop table if exists Photos;
drop table if exists Users;


--create table
create table Users (user_id serial primary key, user_name text UNIQUE NOT NULL, created_at date);

create table Photos (photo_id serial primary key, image_url text, user_id serial, 
CONSTRAINT photos_fk FOREIGN KEY (user_id) REFERENCES Users
(user_id),
publication_date date);

--change the start of sequence
alter sequence Photos_photo_id_seq restart with 1000;

create table Likes (user_id serial, photo_id serial, date_of_like date,
CONSTRAINT userlikes_fk FOREIGN KEY (user_id) REFERENCES Users
(user_id),
CONSTRAINT photolikes_fk FOREIGN KEY (photo_id) REFERENCES Photos
(photo_id),
PRIMARY KEY (user_id, photo_id));

create table Follow (follower_id int, followee_id int, date_time_follow TIMESTAMP,
constraint follower_user FOREIGN KEY (follower_id) REFERENCES users(user_id),
constraint followee_user FOREIGN KEY (followee_id) REFERENCES users(user_id),
PRIMARY KEY (follower_id, followee_id));


--change the start of sequence
alter sequence Likes_photo_id_seq restart with 1000;


--insert data into table Users
insert into Users (user_name,created_at)
values 
('Heeyeon', '2021-04-20'),
('Polina', '2023-05-23'),
('Nina','2020-08-30'),
('Maria','2019-03-21'),
('Sena', '2023-02-10'),
('Jina', '2009-12-23'),
('henry','2017-01-12'),
('Jean','2013-09-14'),
('Georgia', '2021-12-18'),
('Ivan', '2009-04-22'),
('Alex','2018-04-30'),
('Dino','2008-02-28'),
('Clara', '2007-02-20'),
('Jennie','2019-05-05'),
('Kiara', '2019-09-23'),
('henrie',Null),
('Abrakebabra','2033-09-14'),
('Suyaa', '2000-12-18'),
('Jisu', '1988-04-22'),
('Ali', Null),
('Dio','2021-02-28'),
('HeeyeonYoonn', '2017-02-20'),
('Jen','2022-05-25'),
('Sola', Null),
('Sophia','2018-04-17');


--insert data into table Photos
insert into Photos (image_url,publication_date,user_id) 
values
('htpps..//www.google.com/web1','2024-04-13',1),
('htpps..//www.google.com/web2','2015-01-15',2),
('htpps..//www.google.com/web3','2000-04-17',3),
('htpps..//www.google.com/web4','2018-02-18',4),
('htpps..//www.google.com/web5','2022-03-14',5),
('htpps..//www.google.com/web6','2024-05-05',1),
('htpps..//www.google.com/web7','2023-05-15',7),
('htpps..//www.google.com/web8','2024-05-17',8),
('htpps..//www.google.com/web9','2024-06-18',9),
('htpps..//www.google.com/web10','2024-06-14',10),
('htpps..//www.google.com/web11','2024-06-13',11),
('htpps..//www.google.com/web12','2024-07-15',12),
('htpps..//www.google.com/web13','2024-08-17',13),
('htpps..//www.google.com/web14','2024-09-18',14),
('htpps..//www.google.com/web15','2024-10-14',14),
('htpps..//www.google.com/web16',null,3),
('htpps..//www.google.com/web17','2023-01-01',7),
('htpps..//www.google.com/web18','2023-05-02',8),
('htpps..//www.google.com/web19','2023-07-13',9),
('htpps..//www.google.com/web21','2022-09-14',10),
('htpps..//www.google.com/web22',null,11),
('htpps..//www.google.com/web23','2022-12-15',12),
('htpps..//www.google.com/web24','2022-12-17',14),
('htpps..//www.google.com/web25','2022-08-18',2),
('htpps..//www.google.com/web26', null,1);

--insert data into table Likes
insert into Likes (user_id, photo_id , date_of_like)
values
(1, 1000,'2021-03-17'),
(2, 1001,'2022-05-18'),
(3, 1002,'2022-06-17'),
(1, 1002,'2022-04-19'),
(1, 1003,'2023-08-20'),
(1, 1004,'2024-11-17'),
(1, 1005,'2024-11-18'),
(2, 1000,'2024-11-17'),
(2, 1004,Null),
(2, 1005,'2024-11-20'),
(2, 1009,'2024-12-17'),
(2, 1008,'2024-12-18'),
(5, 1004,'2024-12-17'),
(5, 1005,'2024-12-19'),
(6, 1009,'2024-12-20'),
(6, 1007,'2020-01-21'),
(7, 1006,'2020-01-22'),
(7, 1005,'2020-01-23'),
(8, 1004,'2020-01-24'),
(8, 1003,'2020-01-25'),
(9, 1002,'2020-02-26'),
(9, 1001,'2020-02-27'),
(10, 1002,'2020-02-28'),
(11, 1001,Null),
(12, 1001,Null);

--insert data into table Follow
insert into Follow (follower_id, followee_id, date_time_follow)
values
(5,2,'2020-09-12 03:01:02'),
(4,3,'2022-01-20 00:24:59'),
(2,4,'2022-07-06 12:34:34'),
(1,5,'2023-03-30 17:25:07'),
(3,1,'2024-01-28 23:13:10'),
(6,2,'2021-03-13 11:01:02'),
(6,3,'2021-11-21 00:25:52'),
(4,6,'2024-11-06 04:44:44'),
(11,10,'2023-12-30 13:26:26'),
(12,11,'2024-12-31 11:17:16'),
(13,10,'2024-10-31 13:11:12'),
(10,13,'2024-05-25 03:34:39'),
(15,14,'2024-06-06 12:24:24'),
(14,15,'2024-03-31 17:55:57'),
(6,15,'2024-01-29 00:00:10'),
(1,2,'2021-03-13 11:01:02'),
(1,3,'2021-11-21 00:25:52'),
(1,6,'2024-11-06 04:44:44'),
(1,10,'2023-12-30 13:26:26'),
(12,1,'2024-12-31 11:17:16'),
(13,4,'2024-10-31 13:11:12'),
(10,7,'2024-05-25 03:34:39'),
(15,3,'2024-06-06 12:24:24'),
(2,15,'2024-03-31 17:55:57'),
(13,15,'2024-01-29 00:00:10');


--return the records of tables
select * from USERS;

select * from PHOTOS;

select * from LIKES;

/*  Likes table include user_name from Users table 
select Users.user_name, Likes.photo_id, Likes.date_of_like
FROM Likes JOIN Users ON Likes.user_id = Users.user_id;
*/

select * from Follow;

SELECT Users.user_name
FROM Likes JOIN Users ON Likes.user_id = Users.user_id WHERE Likes.photo_id = 1005;

SELECT Users.user_name
FROM Follow JOIN Users ON Follow.follower_id = Users.user_id WHERE Follow.followee_id = 2;

SELECT Users.user_name
FROM Likes JOIN Users ON Likes.user_id = Users.user_id WHERE Likes.date_of_like < '2023-08-20';

select distinct U.user_name as "Username"
from Follow F 
join Users U on F.followee_id = U.user_id;

select distinct P.image_url as "Linked Image URL"
from Photos P
join Likes L on L.photo_id = P.photo_id
where P.user_id = 4;

select U.user_name as "Username"
from Users U
left join photos P on U.user_id = P.user_id
where P.photo_id is Null;

select U.user_name as "Username"
from Likes L
join photos P on L.photo_id = P.photo_id 
join Users U on L.user_id = U.user_id 
where P.user_id = L.user_id;

select U.user_name as "Username"
from Photos P
join Users U on P.user_id = U.user_id 
left join Likes L on P.photo_id = L.photo_id
where L.photo_id is Null;

select distinct U.user_name as "Username"
from Photos P 
join Users U on P.user_id = U.user_id
join Likes L on P.photo_id = L.photo_id;

select U.user_name as "Username"
from Users U
where LENGTH(U.user_name) > 10;

select U.user_name as "Username"
from Users U
where U.user_name like '%n';

select replace(U.user_name, 'a', 'b') as "Modified Username"
from Users U;

select U.user_name as "Username" , count(P.photo_id) as "Number of photos"
from Users U
left join photos p on U.user_id = P.user_id 
group by U.user_name
order by "Number of photos" desc;

select L.photo_id, count(L.user_id) as "Number of likes"
from Likes L
group by L.photo_id 
order by "Number of likes" desc;

select U.user_name as "Username", to_char(P.publication_date, 'DD/MM/YYYY') as "Earliest Photo date"
from Photos P
join Users U on U.user_id = P.user_id 
where P.publication_date is not NULL
order by p.publication_date asc
limit 1;

explain analyze select*from Users where user_name = 'Maria';

drop index if exists person_username_index;
create index person_username_index on Users(user_name);
explain analyze select*from Users where user_name = 'Maria';

explain analyze select * from Photos order by publication_date desc;

drop index if exists photo_publication_date_index;
create index photo_publication_date_index on Photos(publication_date);
explain analyze select * from Photos order by publication_date desc;


select distinct U.user_name as "Username"
from follow F
join Users U on F.follower_id = U.user_id 
where F.followee_id = (select user_id from users where user_name = 'Maria')
union 
select distinct U.user_name as "Username"
from follow F
join Users U on F.followee_id = U.user_id 
where F.follower_id = (select user_id from users where user_name = 'Maria');


select distinct L.user_id as "User ID" 
from Likes L
intersect
(select distinct F.follower_id as "User ID"
from Follow F
union
select distinct F.followee_id as "User ID"
from Follow F);


select * from follow;

CREATE OR REPLACE FUNCTION auto_follow()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO FOLLOW (follower_id, followee_id, date_time_follow)
VALUES (NEW.user_id, (SELECT user_id FROM photos WHERE photo_id = NEW.photo_id), NOW());
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER auto_follow_trigger
AFTER INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION auto_follow();

INSERT INTO likes (user_id, photo_id, date_of_like) VALUES (1, 1022, '2023-09-13 12:00:00');
INSERT INTO likes (user_id, photo_id, date_of_like) VALUES (3, 1003, '2024-01-02 23:00:00');
INSERT INTO likes (user_id, photo_id, date_of_like) VALUES (15,1012, '2024-12-13 09:00:00');

select * from follow;

