-- Singular test: total_sales harian tak boleh negatif (harus 0 baris).
select order_date, total_sales
from {{ ref('mart_daily_sales') }}
where total_sales < 0