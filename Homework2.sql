#1 Creat one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL. Populate the table with at least three related videos from Youtube or other publicly available resources. 

create table HowTo_Videos (
ID numeric(5),
TITLE varchar(100),
LENGTH numeric(5,2),
URL varchar(100)
);


insert into howto_videos 
(ID, TITLE, LENGTH, URL)
VALUES (1000, 'Natural Hair-Twist Out', 10.56, 'https://youtu.be/cd2365hf0jY');

insert into howto_videos
(ID, TITLE, LENGTH, URL)
VALUES (1001, 'Super Defined Twist Out on Natural Hair', 5.10, 'https://youtu.be/mX5g9Bo1DGI');

insert into howto_videos
(ID, TITLE, LENGTH, URL)
VALUES (1002, 'Natural Hair: Defined Chunky Flat Twist Out', 9.28, 'https://youtu.be/U9LkNVeHPuE');

#2 Create a second table that provides at least two user reviews for each of at least two of the videos.


create table Reviews (
ID numeric(5),
USERNAME varchar(20),
RATING numeric(1),
REVIEW varchar(100)
);

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1000,'LILBOYWONDER', 3, 'This video was ok but needed to show products used more.');

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1001,'1LUCKYBLONDE', 2, 'WOW!! Amazing turnout!.');

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1000,'Curls4Dayz', 3, 'Did not turn out at all :(');

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1002,'4EveCurls', 3, 'This is not realistic at all.');

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1001,'CURLQUE', 1, 'OY! Where to start. Terrible.');

insert into reviews
(ID, USERNAME, RATING, REVIEW)
VALUES (1000,'NATURALMAMA', 4, 'I will be using this tutorial again!');

SELECT * from reviews
STRAIGHT_JOIN  howto_videos ON reviews.id=howto_videos.id
 



