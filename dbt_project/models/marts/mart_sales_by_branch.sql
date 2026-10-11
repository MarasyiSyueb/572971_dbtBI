with b as (select * from {{ ref('stg_sales_by_branch') }})
select branch, round(total_sales, 2) as total_sales
from b
order by total_sales desc