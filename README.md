# Theater & Event Management System - SQL Project

A relational database project built with *PostgreSQL* to manage theater shows, customer bookings, ticket sales, and operational performance.

## 🛠️ Tools Used
* *Database:* PostgreSQL
* *Language:* SQL

---

## 📌 Business Problem
Theater management entities often struggle to track performance schedules, ticket sales, and seat utilization effectively. Without structured analytics, identifying top-performing shows and managing unbooked slots becomes challenging. This project provides a robust SQL-based solution to extract actionable operational insights.

---

## 📊 Key Queries & Insights

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
