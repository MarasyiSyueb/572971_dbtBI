-- Staging top_products: snake_case + tipe.
with src as (select * from {{ source('raw','top_products') }})
select
    "Product line"              as product_line,
    cast("Quantity" as integer) as total_quantity
from src
where "Product line" is not null