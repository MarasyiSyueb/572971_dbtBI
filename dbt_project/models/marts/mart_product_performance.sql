-- Mart: kinerja per tipe produk, MENGGABUNGKAN dua tabel sumber
-- (stg_top_products + stg_avg_rating) via join pada product_line.
with q as (select * from {{ ref('stg_top_products') }}),
     r as (select * from {{ ref('stg_avg_rating') }})
select
    q.product_line,
    q.total_quantity,
    r.avg_rating
from q
left join r on q.product_line = r.product_line
order by q.total_quantity desc