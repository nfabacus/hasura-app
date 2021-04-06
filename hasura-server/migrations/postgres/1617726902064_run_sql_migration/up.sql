CREATE TABLE users (id serial primary key,
username VARCHAR (20) unique not null,
avatarUrl VARCHAR (200),
email VARCHAR (30) unique not null,
password VARCHAR (200) not null,
accountConfirmed boolean default false not null,
accountConfirmationToken varchar (20),
confirmationTokenExpires timestamp,
resetPasswordToken varchar (20),
resetPasswordExpires timestamp,
createdAt timestamp default now
(),
updatedAt timestamp default now
()) ;

CREATE TABLE roles (id serial primary key,
name varchar (20) unique not null,
description varchar (100),
created_at timestamp default now
(),
updatedAt timestamp default now
()) ;

CREATE TABLE users_roles (user_id integer not null,
role_id integer not null,
created_at timestamp default now
(),
foreign key (user_id) references users (id),
foreign key (role_id) references roles (id),
primary key (user_id, role_id)) ;

CREATE TABLE groups (id serial primary key,
name varchar (80) unique not null,
description varchar (200),
created_at timestamp default now
(),
updatedAt timestamp default now
()) ;

CREATE TABLE users_groups (user_id integer not null,
group_id integer not null,
created_at timestamp default now
(),
foreign key (user_id) references users (id),
foreign key (group_id) references groups (id),
primary key (user_id, group_id)) ;
