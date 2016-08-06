CREATE TABLE GROUPS
(
  GROUP_ID int PRIMARY KEY,
  GROUP_NAME varchar(50) NOT NULL
);

CREATE TABLE USERS
(
  USER_ID int PRIMARY KEY,
  USER_NAME varchar(50) NOT NULL,
  GROUP_ID int references Groups(GROUP_ID)
);

CREATE TABLE ROOMS
(
  ROOM_ID int PRIMARY KEY,
  ROOM_NAME varchar(50) NOT NULL
);

CREATE TABLE GROUP_ROOMS
(
  GROUP_ID int references GROUPS(GROUP_ID),
  ROOM_ID int references ROOMS(ROOM_ID)
);

INSERT INTO GROUPS (GORUP_ID, GROUP_NAME) 
VALUES (1, 'I.T.');
INSERT INTO GROUPS (GROUP_ID, GROUP_NAME) 
VALUES (2, 'Sales');
INSERT INTO Groups (GROUP_ID, GROUP_NAME) 
VALUES (3, 'Administration');
INSERT INTO Groups (GROUP_ID, GROUP_NAME) 
VALUES (4, 'Operations');


INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID)
 VALUES (1, 'Modesto', 1);
INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID)
 VALUES (2, 'Ayine', 1);

INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID) 
VALUES (3, 'Christopher', 2);
INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID) 
VALUES (4, 'Cheong woo', 2);

INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID) 
VALUES (5, 'Saulat', 3);
INSERT INTO USERS (USER_ID, USER_NAME, GROUP_ID) 
VALUES (6, 'Heidy', null);


INSERT INTO ROOMS (ROOM_ID, ROOM_NAME) VALUES (1, '101');
INSERT INTO ROOMS (ROOM_ID, ROOM_NAME) VALUES (2, '102');
INSERT INTO ROOMS (ROOM_ID, ROOM_NAME) VALUES (3, 'Auditorium A');
INSERT INTO ROOMS (ROOM_ID, ROOM_NAME) VALUES (4, 'Auditorium B');


INSERT INTO GROUP_ROOMS (GROUP_ID, ROOM_ID) VALUES (1, 1);
INSERT INTO GROUP_ROOMS (GROUP_ID, ROOM_ID) VALUES (1, 2);

INSERT INTO GROUP_ROOMS (GROUP_ID, ROOM_ID) VALUES (2, 2);
INSERT INTO GROUP_ROOMS (GROUP_ID, ROOM_ID) VALUES (2, 3);

# Write SELCET statement that returns all groups, and the USSERS in the groups.
Select a.*, b.USER_NAME from GROUPS a
left join USERS b on a.GROUP_ID = b.GROUP_ID;


#Write a SELECT statement that returns all ROOMS and the groups assigned to them.

Select a.*, c.GROUP_NAME from ROOMS a
left join GROUP_ROOMS b on a.ROOM_ID = b.ROOM_ID
left join GROUPS c on b.GROUP_ID = c.GROUP_ID ;

#Write a SELECT statement that returns a list of USERS, the groups they belong to and the ROOMS to which they are assigned. Sort alphabetically by user, then group, then room.

Select a.USER_ID, a.USER_NAME, b.GROUP_NAME, d.ROOM_NAME from USERS a
left join GROUPS b on a.GROUP_ID = b.GROUP_ID
left join GROUP_ROOMS c on b.GROUP_ID = c.GROUP_ID
left join ROOMS d on c.ROOM_ID = d.ROOM_ID
order by a.USER_NAME, b.GROUP_NAME, d.ROOM_NAME;