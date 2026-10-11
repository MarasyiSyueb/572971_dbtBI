import duckdb, os
OUT = os.path.expanduser('~/tugas_dbt_bi_572971/raw_source')
con = duckdb.connect('data/warehouse.duckdb')
con.execute("CREATE SCHEMA IF NOT EXISTS raw;")

tables = ['daily_sales', 'top_products', 'sales_by_branch', 'sales_by_payment', 'avg_rating_by_product']
for t in tables:
    path = os.path.join(OUT, f'{t}.csv')
    con.execute(f"CREATE OR REPLACE TABLE raw.{t} AS SELECT * FROM read_csv_auto('{path}', header=true);")
    print(f"raw.{t:24}", con.execute(f"SELECT count(*) FROM raw.{t}").fetchone()[0], "baris")

con.close()