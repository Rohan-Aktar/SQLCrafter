CREATE DATABASE
    IF NOT EXISTS Crafter;

CREATE DATABASE
    IF NOT EXISTS Dootam123;

CREATE DATABASE
    IF NOT EXISTS DEMO;

CREATE TABLE
    Crafter.t_Crafter_users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        email VARCHAR(50) NOT NULL,
        role_id INT,
        user_creation_date date,
        user_updation_date date,
        user_status varchar(1) DEFAULT('A')
    );

insert into
    Crafter.t_Crafter_users (username, password, email)
values
('DOOTAM', 'Dootam123', 'xyz@gmail.com');

insert into
    Crafter.t_Crafter_users (username, password, email)
values
('ROHAN', 'Rohan123', 'xyzRohan@gmail.com');

insert into
    Crafter.t_Crafter_users (username, password, email, user_creation_date)
values
(
        'MASTER3',
        'MASTER123',
        'xyzMASTER@gmail.com',
        SYSDATE()
    );

--update Crafter.t_Crafter_users set role_id=1 where user_status='A';
select
    *
from
    Crafter.t_Crafter_users;

CREATE TABLE
    Crafter.t_crafter_role (
        role_id INT AUTO_INCREMENT PRIMARY KEY,
        role_name VARCHAR(50) NOT NULL DEFAULT('ADMIN'),
        role_creation_date date,
        role_updation_date date,
        role_status varchar(1) DEFAULT('A')
    );

insert into
    Crafter.t_crafter_role (role_name, role_creation_date) value ('ADMIN', SYSDATE());

insert into
    Crafter.t_crafter_role (role_name, role_creation_date) value ('SUPERUSER', SYSDATE());

select
    *
from
    Crafter.t_crafter_role;

CREATE TABLE
    Crafter.t_crafter_role_access (
        access_id INT AUTO_INCREMENT PRIMARY KEY,
        role_id int,
        schema_access VARCHAR(50),
        table_access VARCHAR(50),
        read_access varchar(1) DEFAULT('Y') CHECK (read_access IN ('Y', 'N')),
        write_access varchar(1) DEFAULT('Y') CHECK (write_access IN ('Y', 'N')),
        update_access varchar(1) DEFAULT('Y') CHECK (update_access IN ('Y', 'N')),
        delete_access varchar(1) DEFAULT('Y') CHECK (delete_access IN ('Y', 'N')),
        delete_table_access varchar(1) DEFAULT('Y') CHECK (delete_table_access IN ('Y', 'N')),
        delete_schema_access varchar(1) DEFAULT('Y') CHECK (delete_schema_access IN ('Y', 'N')),
        role_access_creation_date date,
        role_access_updation_date date,
        role_access_status varchar(1) DEFAULT('A')
    );

--drop table Crafter.t_crafter_role_access;
insert into
    Crafter.t_crafter_role_access (
        role_id,
        schema_access,
        table_access,
        role_access_creation_date,
        read_access,
        write_access,
        update_access,
        delete_access,
        delete_table_access,
        delete_schema_access,
        role_access_updation_date,
        role_access_status
    )
values
(
        1,
        'DEMO',
        'accounts',
        SYSDATE(),
        'Y',
        'Y',
        'Y',
        'Y',
        'Y',
        'Y',
        null,
        'A'
    );

--for admin role id =1;
select
    *
from
    Crafter.t_crafter_role_access;

CREATE TABLE
    Crafter.t_crafter_database (
        database_id INT AUTO_INCREMENT PRIMARY KEY,
        database_username VARCHAR(50) NOT NULL,
        database_password VARCHAR(255) NOT NULL,
        database_url VARCHAR(50) NOT NULL,
        database_schema VARCHAR(50),
        creation_date date,
        updation_date date,
        status varchar(1) DEFAULT('A')
    );

--drop table Crafter.t_crafter_database;
insert into
    Crafter.t_crafter_database(
        database_username,
        database_password,
        database_url,
        database_schema,
        creation_date
    )
VALUES
(
        'root',
        'rocketman123',
        'mysql://localhost:3306',
        'Crafter',
        SYSDATE()
    );

select
    *
from
    Crafter.t_crafter_database;