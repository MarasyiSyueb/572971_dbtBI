with p as (select * from {{ ref('stg_sales_by_payment') }})
select payment, round(total_sales, 2) as total_sales
from p
order by total_sales desc