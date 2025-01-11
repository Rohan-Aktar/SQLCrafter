CREATE TABLE DEMO.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    registration_date DATE,
    last_login DATETIME,
    status ENUM('active', 'inactive')
);

CREATE TABLE DEMO.products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    category VARCHAR(50),
    stock_quantity INT,
    supplier_id INT
);

CREATE TABLE DEMO.customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE DEMO.orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status ENUM('pending', 'processing', 'shipped', 'delivered')
);

CREATE TABLE DEMO.employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    manager_id INT,
    job_title VARCHAR(100)
);

CREATE TABLE DEMO.departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT,
    location VARCHAR(100),
    budget DECIMAL(15, 2),
    num_employees INT
);

CREATE TABLE DEMO.suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE DEMO.inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    warehouse_location VARCHAR(100),
    last_stocked DATETIME
);

CREATE TABLE DEMO.transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2),
    transaction_type ENUM('purchase', 'refund', 'deposit', 'withdrawal')
);

CREATE TABLE DEMO.accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20),
    account_type VARCHAR(50),
    balance DECIMAL(15, 2),
    opening_date DATE,
    branch VARCHAR(100),
    interest_rate DECIMAL(5, 2)
);

CREATE TABLE DEMO.contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE DEMO.reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date DATE
);

CREATE TABLE DEMO.messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message_text TEXT,
    sent_at TIMESTAMP,
    is_read BOOLEAN
);

CREATE TABLE DEMO.events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    location VARCHAR(100),
    organizer_id INT,
    max_capacity INT,
    registration_deadline DATE
);

CREATE TABLE DEMO.books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_date DATE,
    isbn VARCHAR(20),
    publisher VARCHAR(100)
);

CREATE TABLE DEMO.movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    director VARCHAR(100),
    genre VARCHAR(50),
    release_date DATE,
    rating DECIMAL(3, 1),
    duration_minutes INT
);

CREATE TABLE DEMO.restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    cuisine VARCHAR(100),
    location VARCHAR(100),
    rating DECIMAL(3, 1),
    opening_hours VARCHAR(100),
    reservation_required BOOLEAN
);

CREATE TABLE DEMO.hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    location VARCHAR(100),
    rating DECIMAL(3, 1),
    price DECIMAL(10, 2),
    check_in_time TIME,
    check_out_time TIME
);

CREATE TABLE DEMO.students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    major VARCHAR(100),
    year_of_study INT,
    advisor_id INT
);

CREATE TABLE DEMO.professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    office_location VARCHAR(100),
    office_hours VARCHAR(100)
);

CREATE TABLE DEMO.courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100),
    professor_id INT,
    credits INT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE DEMO.schools (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    location VARCHAR(100),
    principal VARCHAR(100),
    num_students INT,
    foundation_date DATE,
    accreditation_status ENUM('accredited', 'not_accredited')
);

CREATE TABLE DEMO.clubs (
    club_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    advisor VARCHAR(100),
    meeting_location VARCHAR(100),
    num_members INT,
    established_date DATE,
    club_type ENUM('sports', 'academic', 'social')
);

CREATE TABLE DEMO.events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(200),
    event_date DATE,
    location VARCHAR(100),
    organizer_id INT,
    max_capacity INT,
    registration_deadline DATE
);

CREATE TABLE DEMO.music (
    music_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    artist VARCHAR(100),
    genre VARCHAR(50),
    release_date DATE,
    duration_minutes INT,
    album_id INT
);

CREATE TABLE DEMO.albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    artist VARCHAR(100),
    genre VARCHAR(50),
    release_date DATE,
    num_tracks INT,
    record_label VARCHAR(100)
);

CREATE TABLE DEMO.artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    genre VARCHAR(50),
    country VARCHAR(100),
    num_albums INT,
    debut_year INT
);

CREATE TABLE DEMO.paintings (
    painting_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    artist VARCHAR(100),
    year_created INT,
    price DECIMAL(10, 2),
    medium VARCHAR(100),
    style VARCHAR(100)
);

CREATE TABLE DEMO.sculptures (
    sculpture_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    artist VARCHAR(100),
    material VARCHAR(100),
    height DECIMAL(10, 2),
    weight DECIMAL(10, 2),
    creation_date DATE
);

CREATE TABLE DEMO.exhibitions (
    exhibition_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    organizer VARCHAR(100),
    start_date DATE,
    end_date DATE,
    location VARCHAR(100),
    ticket_price DECIMAL(10, 2)
);

CREATE TABLE DEMO.subscribers (
    subscriber_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    subscribed_date DATE,
    subscription_type ENUM('free', 'premium'),
    last_payment_date DATE,
    renewal_date DATE
);

CREATE TABLE DEMO.comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    commenter_id INT,
    comment_text TEXT,
    commented_at TIMESTAMP,
    parent_comment_id INT,
    likes INT
);

CREATE TABLE DEMO.posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT,
    title VARCHAR(200),
    content TEXT,
    published_date DATE,
    likes INT,
    dislikes INT
);

CREATE TABLE DEMO.groups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    category VARCHAR(100),
    creator_id INT,
    num_members INT,
    creation_date DATE,
    group_description TEXT
);

CREATE TABLE DEMO.meetups (
    meetup_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    organizer VARCHAR(100),
    location VARCHAR(100),
    event_date DATE,
    max_attendees INT,
    description TEXT
);




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
('GUEST', 'GUEST123', 'xyzRohan@gmail.com');

insert into
    Crafter.t_Crafter_users (username, password, email, user_creation_date)
values
(
        'GUEST',
        'GUEST123',
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
