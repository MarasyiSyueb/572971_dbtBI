import duckdb; con=duckdb.connect('data/warehouse.duckdb')
for m in ['mart_product_performance','mart_daily_sales','mart_sales_by_branch','mart_sales_by_payment']:
    con.execute(f"COPY main.{m} TO 'dashboard/{m}.csv' (HEADER);")
    print("exported", m)
con.close()