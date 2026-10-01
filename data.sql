insert into events (event_name, genre, venue, duration_minutes, ticket_price, start_date, end_date) values
('Phantom of the Opera', 'Classic Musical', 'Her Majestys Theatre', 150, 120.00, '2026-10-15', '2026-10-30'),
('Hadestown', 'Folk Opera', 'Walter Kerr Theatre', 140, 95.00, '2026-10-22', '2026-11-05'),
('Wicked', 'Family / Fantasy Musical', 'Gershwin Theatre', 160, 110.00, '2026-11-01', '2026-11-20'),
('Dream Girls', 'R&B Musical', 'Savoy Theatre', 130, 100.00, '2026-11-15', '2026-11-30'),
('Hamilton', 'Hip Hop Musical', 'Richard Rodgers Theatre', 170, 150.00, '2026-12-01', '2026-12-20'),
('West Side Story', 'Classic Drama', 'Broadway Theatre', 130, 115.00, '2026-12-10', '2026-12-25'),
('Newsies', 'Dance Musical', 'Nederlander Theatre', 150, 90.00, '2026-12-15', '2026-12-30'),
('Les Misérables', 'Classic Musical', 'West End Theatre', 170, 125.00, '2027-12-15', '2027-12-30'),
('The Lion King', 'Family / Fantasy Musical', 'Lyceum Theatre', 150, 110.00, '2027-12-20', '2028-01-05');

insert into performance (event_id, show_time, available_seats) values
(1, '2027-10-15 20:00:00', 150),
(2, '2027-10-22 19:30:00', 100),
(3, '2027-11-01 20:00:00', 200),
(4, '2027-11-15 20:00:00', 120),
(5, '2027-12-01 20:00:00', 250),
(6, '2027-12-10 19:30:00', 180),
(7, '2027-12-15 20:00:00', 140),
(8, '2027-12-20 21:00:00', 250),
(9, '2027-12-25 18:30:00', 180);

insert into customers (customer_id, customer_name, email, membership_tier) values 
(1, 'Sara Ahmed', 'sara@email.com', 'Regular'),
(2, 'Mohammed Ali', 'mohammed@email.com', 'VIP'),
(3, 'Nouf Khalid', 'nouf@email.com', 'Gold'),
(4, 'Fahad Al-Otaibi', 'fahad@email.com', 'Regular'),
(5, 'Layan Nasser', 'layan@email.com', 'VIP'),
(6, 'Abdullah Saleh', 'abdullah@email.com', 'Gold'),
(7, 'Reem Al-Shehri', 'reem@email.com', 'VIP'),
(8, 'Tariq Ziyad', 'tariq@email.com', 'VIP'),
(9, 'Haya Mansour', 'haya@email.com', 'Gold'),
(10, 'Sultan Nasser', 'sultan@email.com', 'Regular');


insert into booking (customer_id, performance_id, booking_date, seat_number, ticket_count, total_amount) values 
(1, 1, '2027-10-01', 'A1, A2', 2, 400.00),
(2, 2, '2027-10-02', 'B5', 1, 200.00),
(3, 3, '2027-10-05', 'C1, C2, C3', 3, 660.00),
(1, 4, '2027-10-10', 'D2', 1, 220.00),
(2, 5, '2027-10-12', 'E1, E2', 2, 300.00),
(4, 1, '2027-10-13', 'A3, A4', 2, 400.00),
(5, 3, '2027-10-14', 'C4, C5, C6, C7', 4, 880.00),
(6, 6, '2027-10-15', 'F1, F2', 2, 500.00),
(7, 2, '2027-10-16', 'B6', 1, 200.00),
(8, 4, '2027-10-18', 'D3, D4, D5', 3, 660.00),
(9, 5, '2027-10-19', 'E3, E4', 2, 300.00),
(10, 7, '2027-10-20', 'G1, G2, G3', 3, 540.00);

insert into payments (booking_id, payment_date, amount, payment_status) values 
(1, '2027-10-01', 400.00, 'Completed'),
(2, '2027-10-02', 200.00, 'Completed'),
(3, '2027-10-05', 660.00, 'Completed'),
(4, '2027-10-10', 220.00, 'Pending'),
(5, '2027-10-12', 300.00, 'Completed'),
(6, '2027-10-13', 400.00, 'Completed'),
(7, '2027-10-14', 880.00, 'Completed'),
(8, '2027-10-15', 500.00, 'Completed'),
(9, '2027-10-16', 200.00, 'Failed'),
(10, '2027-10-18', 660.00, 'Completed'),
(11, '2027-10-19', 300.00, 'Completed'),
(12, '2027-10-20', 540.00, 'Completed');



