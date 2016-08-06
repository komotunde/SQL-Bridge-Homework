create table EMPLOYEE_NAMES2 (
EMPLOYEE_ID int NOT NULL auto_increment,
EMPLOYEE varchar(25) NOT NULL,
GROUPNAME varchar(25),
primary key (EMPLOYEE_ID)
);


create table GROUP_NAME3 (
GROUP_ID int not null auto_increment,
TITLE varchar(50),
ROOM_NAME varchar(50),
employee_id int,
primary key (GROUP_ID),
foreign key (employee_id) references employee_names2(employee_id)
);


create table EMPLOYEE_GROUPS2 (
EMPLOYEE_ID int NOT NULL references EMPLOYEE_NAMES2(EMPLOYEE_ID),
GROUP_ID int NOT NULL references GROUP_NAME3(GROUP_ID),
CONSTRAINT pk_EMPLOYEE_GROUPS2 PRIMARY KEY(EMPLOYEE_ID, GROUP_ID)
);
 

insert into employee_names2(EMPLOYEE, GROUPNAME)
VALUES ('Christopher', 'Sales');
insert into employee_names2(EMPLOYEE, GROUPNAME)
VALUES ('Modesto', 'I.T');
insert into employee_names2(EMPLOYEE, GROUPNAME)
VALUES ('Ayine', 'I.T');
insert into employee_names2(EMPLOYEE, GROUPNAME)
VALUES ('Cheong woo', 'Sales');
insert into employee_names2(EMPLOYEE, GROUPNAME) 
VALUES ('Saulat', 'Administration');
insert into employee_names2(EMPLOYEE)
VALUES ('Heidy');


insert into GROUP_NAME3(TITLE)
VALUES ('Administrator');

insert into GROUP_NAME3(TITLE, ROOM_NAME)
VALUES ('I.T', 102 );


insert into GROUP_NAME3(TITLE, ROOM_NAME)
VALUES ('I.T', 101 );
insert into GROUP_NAME3(TITLE)
VALUES ('Operations');

insert into GROUP_NAME3(TITLE, ROOM_NAME)
VALUES ('Sales', 102);

insert into GROUP_NAME3(TITLE, ROOM_NAME)
VALUES ('Sales', 'Auditorium A');

select employee_names2.EMPLOYEE,employee_names2.employee_id, group_name3.title, group_name3. room_name
from employee_names2
left join group_name3
on employee_names2.EMPLOYEE_ID=group_name3.GROUP_ID;

#Write SELECT statements that provide the following information.

#1 All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
SELECT GROUP_NAME3.TITLE, GROUP_NAME3.employee_id;

#2 All rooms and groups assigned to each room.

SELECT GROUP_NAME3.ROOM_NAME, GROUP_NAME3.GROUP_ID;

#3 A list of users, groups they're in and rooms assigned sorted alphabetically by user, group, room.

select employee_names2.EMPLOYEE, group_name3.TITLE, group_name3.ROOM_NAME
order by employee_names2.EMPLOYEE DESC, group_name3.title desc, group_name3.ROOM_NAME desc;
