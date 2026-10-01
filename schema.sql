
drop table if exists events cascade ;
drop table if exists booking cascade ;
drop table if exists performance cascade ;
drop table if exists customers cascade ;
drop table if exists payments cascade ;

create table events (
event_id SERIAL primary key,
event_name varchar (50) not null,
genre varchar (50),
venue varchar (50),
duration_minutes INT,
ticket_price numeric (10,2),
start_date date ,
end_date date 
);

create table performance (
performance_id SERIAL primary key,
event_id INT  references events (event_id),
show_time timestamp not null,
available_seats INT
);

create table customers (
customer_id SERIAL primary key,
customer_name VARCHAR (100) not null ,
email VARCHAR (200) unique,
membership_tier varchar (10)
);

create table booking (
booking_id serial primary key,
customer_id int,
performance_id int,
booking_date date,
seat_number varchar(100),
ticket_count int,
total_amount numeric(10, 2),
foreign key (customer_id) references customers(customer_id),
foreign key (performance_id) references performance(performance_id)
);

create table payments (
payment_id serial primary key,
booking_id int,
payment_date date,
amount numeric(10, 2),
payment_status varchar(20),
foreign key (booking_id) references booking(booking_id)
);

create index idx_booking_date on booking(booking_date)




