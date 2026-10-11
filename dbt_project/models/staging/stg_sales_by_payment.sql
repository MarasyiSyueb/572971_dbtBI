-- Staging sales_by_payment.
with src as (select * from {{ source('raw','sales_by_payment') }})
select
    "Payment"               as payment,
    cast("Sales" as double) as total_sales
from src
where "Payment" is not null