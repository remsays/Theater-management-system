# Theater & Event Management System - SQL Project

A relational database project built with *PostgreSQL* to manage theater shows, customer bookings, ticket sales, and operational performance.

##  Tools Used
* *Database:* PostgreSQL
* *Language:* SQL

---

##  Business Problem
Theater management entities often struggle to track performance schedules, ticket sales, and seat utilization effectively. Without structured analytics, identifying top-performing shows and managing unbooked slots becomes challenging. This project provides a robust SQL-based solution to extract actionable operational insights.

---

##  Key Queries & Insights

### 1. Total Revenue per Event
```sql
select ev.event_name,
       ev.genre,
       sum(bo.ticket_count * ev.ticket_price) as total_revenue
from events ev
join performance per on ev.event_id = per.event_id
join booking bo on per.performance_id = bo.performance_id
group by ev.event_name, ev.genre
order by total_revenue desc;
```

Insight: Calculates total earnings for each theatrical production to identify top financial performers and guide future event planning.



### 2. Revenue Ranking by Genre 
```sql
select ev.event_name,
       ev.genre,
       sum(bo.ticket_count * ev.ticket_price) as event_revenue,
       rank() over (partition by ev.genre order by sum(bo.ticket_count * ev.ticket_price) desc) as revenue_rank_in_genre
from events ev
join performance per on ev.event_id = per.event_id
join booking bo on per.performance_id = bo.performance_id
group by ev.event_name, ev.genre;
```

Insight: Ranks events by revenue specifically within their own artistic genre category using advanced window functions for fair evaluation.



### 3. Zero-Sales Shows
```sql
select ev.event_name, 
       bo.ticket_count
from events ev
join performance per on ev.event_id = per.event_id
left join booking bo on bo.performance_id = per.performance_id 
where bo.ticket_count is null;
```
Insight: Isolates shows and performances with zero bookings using an anti-join, helping marketing teams target inactive time slots.




### 4. Seat Availability 
```sql
select ev.event_name,
       per.show_time,
       per.available_seats,
       coalesce(sum(bo.ticket_count), 0) as total_booked_seats,
       (per.available_seats - coalesce(sum(bo.ticket_count), 0)) as remaining_seats
from performance per
join events ev on per.event_id = ev.event_id
left join booking bo on per.performance_id = bo.performance_id
group by per.performance_id, ev.event_name, per.show_time, per.available_seats;
```
Insight: Safely computes remaining available seats for every show time using null-handling (⁠COALESCE⁠) to handle unbooked performances seamlessly.

---

## Conclusion
This project successfully transformed raw relational database design into an analytical framework for theater administration. By deploying advanced SQL techniques—including Window Functions, Anti-Joins, and null handling—the project delivers deep operational intelligence regarding financial performance, risk management, and venue capacity optimization.


