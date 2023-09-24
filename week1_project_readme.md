1. How many users do we have?
answer: 130
query: Select count (distinct user_id) from DEV_DB.DBT_RLACM10ICLOUDCOM.STG_POSTGRES_USERS

2. On average, how many orders do we receive per hour?
answer: 7.5
query: 
WITH HourlyOrderCounts AS (
    SELECT
        DATE_TRUNC('HOUR', created_at) AS hour,
        COUNT(*) AS order_count
    FROM
        DEV_DB.DBT_RLACM10ICLOUDCOM.STG_POSTGRES_ORDERS
    GROUP BY
        hour
)

SELECT
    AVG(order_count) AS avg_orders_per_hour
FROM
    HourlyOrderCounts;

3. On average, how long does an order take from being placed to being delivered?
answer: 3.8 days
query: 
SELECT
    AVG(DATEDIFF(DAY, created_at, delivered_at)) AS avg_delivery_time_days
FROM
            DEV_DB.DBT_RLACM10ICLOUDCOM.STG_POSTGRES_ORDERS

WHERE
    delivered_at IS NOT NULL;




4. How many users have only made one purchase? Two purchases? Three+ purchases?
answer: 1 time purchasers: 25
        2 time purchasers: 28
        3 time purchasers: 34


5. On average, how many unique sessions do we have per hour?
answer 16.32
query:
SELECT
    AVG(unique_sessions_per_hour) AS average_sessions_per_hour
FROM (
    SELECT
        DATE_TRUNC('HOUR', created_at) AS hour,
        COUNT(DISTINCT session_id) AS unique_sessions_per_hour
    FROM
        DEV_DB.DBT_RLACM10ICLOUDCOM.STG_POSTGRES_EVENTS
    GROUP BY
        hour
) subquery;
