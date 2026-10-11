-- Mart: penjualan harian 
with d as (select * from {{ ref('stg_daily_sales') }})
select
    order_date,
    date_trunc('month', order_date) as order_month,
    round(total_sales, 2)           as total_sales
from d