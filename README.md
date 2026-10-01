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



### 2. Revenue Ranking by Genre ( RANK )
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





