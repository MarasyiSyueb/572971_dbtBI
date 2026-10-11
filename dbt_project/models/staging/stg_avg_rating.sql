-- Staging avg_rating_by_product.
with src as (select * from {{ source('raw','avg_rating_by_product') }})
select
    "Product line"           as product_line,
    cast("avg_rating" as double) as avg_rating
from src
where "Product line" is not null