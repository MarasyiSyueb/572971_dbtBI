-- Staging sales_by_branch.
with src as (select * from {{ source('raw','sales_by_branch') }})
select
    "Branch"                as branch,
    cast("Sales" as double) as total_sales
from src
where "Branch" is not null