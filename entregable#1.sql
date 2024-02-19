-- Creación de la tabla USERS

create table users (
 	id serial primary key,
	firstName varchar(50),
	lastName varchar(50),
	email varchar(100)
);

-- Inserción de datos en la tabla USERS

insert into users (firstName, lastName, email)
values
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Alice', 'Johnson', 'alice@example.com');

-- Creación de la tabla POSTS

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text
);

-- Inserción de datos en la tabla POSTS

insert into posts (creator_id, title, text)
values
(3, 'First Post', 'Description of the text in the first post'),
(1, 'Second Post', 'Description of the text in the second post'),
(1, 'Third Post', 'Description of the text in the third post'),
(2, 'Fourth Post', 'Description of the text in the fourth post'),
(3, 'Fifth Post', 'Description of the text in the fifth post');

--USERS INNER JOIN POSTS

select P.title, P.text, U.firstName ||' '|| U.lastName AS creator, U.email from posts P
inner join users U on P.creator_id = U.id;

-- Creación de la tabla LIKES

create table liKes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

-- Inserción de datos en la tabla LIKES

insert into likes (user_id, post_id)
values
(2, 5),
(3, 4),
(2, 3),
(3, 2),
(1, 1);

--USERS INNER JOIN LIKES INNER JOIN POSTS

select P.title, P.text, U.firstName ||' '|| U.lastName AS user_like, U.email from posts P
inner join likes L on L.post_id = P.id
inner join users U on L.user_id = U.id;


