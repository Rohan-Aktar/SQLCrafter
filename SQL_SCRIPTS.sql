CREATE DATABASE IF NOT EXISTS Crafter;


CREATE TABLE  Crafter.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL
);

insert into Crafter.users (username, password,email)values('DOOTAM','Dootam123','xyz@gmail.com');
insert into Crafter.users (username, password,email)values('ROHAN','Rohan123','xyzRohan@gmail.com');

select * from Crafter.users;

