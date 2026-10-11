-- Staging daily_sales: rapikan tipe & nama kolom.
with src as (select * from {{ source('raw','daily_sales') }})
select
    cast(date as date)          as order_date,
    cast(total_sales as double) as total_sales
from src
where date is not null