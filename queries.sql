with payment_details as (
    select 
        pa.booking_id,
        pa.payment_status
    from payments pa
    where pa.payment_status = 'Completed'
)
select 
    ev.event_name,
    per.show_time,
    count(bo.booking_id) as total_bookings,
    sum(bo.ticket_count) as total_tickets_sold
from events ev
join performance per 
on ev.event_id = per.event_id
join booking bo 
on per.performance_id = bo.performance_id
join payment_details pd 
on bo.booking_id = pd.booking_id
group by 1, 2
order by total_tickets_sold desc;


select ev.event_name,
per.show_time,
bo.ticket_count,
row_number() over (partition by ev.event_id order by  bo.ticket_count) as booking_rank
from events ev 
join performance per 
on ev.event_id = per.event_id
join booking bo 
on per.performance_id = bo.performance_id;


select ev.event_name, per.show_time, bo.ticket_count,
case when bo.ticket_count >= 3 then 'group' else 'standard' end 
from events ev
join performance per
on ev.event_id = per.event_id
join booking bo
on bo.performance_id = per.performance_id;


select ev.event_name, bo.ticket_count
from events ev
join performance per
on ev.event_id = per.event_id
left join booking bo
on bo.performance_id = per.performance_id 
where bo.ticket_count is null ;



select ev.event_name,
    ev.genre,
    sum(bo.ticket_count * ev.ticket_price) as total_revenue
from events ev
join performance per 
on ev.event_id = per.event_id
join booking bo 
on per.performance_id = bo.performance_id
group by ev.event_name, ev.genre
order by total_revenue desc;


select  genre,
    round(avg(ev.duration_minutes), 2) as avg_duration,
    round(avg(ev.ticket_price), 2) as avg_price
from events ev
group by genre;

 
 select 
    ev.event_name,
    ev.genre,
    sum(bo.ticket_count * ev.ticket_price) as event_revenue,
    rank() over (partition by ev.genre order by sum(bo.ticket_count * ev.ticket_price) desc) as revenue_rank_in_genre
from events ev
join performance per on ev.event_id = per.event_id
join booking bo on per.performance_id = bo.performance_id
group by ev.event_name, ev.genre;
 
 select c.customer_name,
c.membership_tier,
sum(bo.total_amount) as total_spent
from customers c
join booking bo on c.customer_id = bo.customer_id
group by c.customer_id, c.customer_name, c.membership_tier
order by total_spent desc;


select 
    ev.event_name,
    per.show_time,
    per.available_seats,
    coalesce(sum(bo.ticket_count), 0) as total_booked_seats,
    (per.available_seats - coalesce(sum(bo.ticket_count), 0)) as remaining_seats
from performance per
join events ev on per.event_id = ev.event_id
left join booking bo on per.performance_id = bo.performance_id
group by per.performance_id, ev.event_name, per.show_time, per.available_seats;


select c.customer_name,
c.email,
ev.event_name,
bo.booking_date,
bo.ticket_count,
bo.total_amount
from customers c
join booking bo on c.customer_id = bo.customer_id
join performance per on bo.performance_id = per.performance_id
join events ev on per.event_id = ev.event_id
where c.membership_tier = 'VIP'
order by bo.booking_date desc;


