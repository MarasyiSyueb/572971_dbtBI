import duckdb

con = duckdb.connect('data/warehouse.duckdb')

def q(sql):
    return con.execute(sql).fetchone()[0]

print("daily dup tanggal   :", q("SELECT count(*) - count(DISTINCT date) FROM raw.daily_sales"))
print("daily total negatif :", q("SELECT count(*) FROM raw.daily_sales WHERE total_sales < 0"))
print("branch dup          :", q('SELECT count(*) - count(DISTINCT "Branch") FROM raw.sales_by_branch'))
print("payment dup         :", q('SELECT count(*) - count(DISTINCT "Payment") FROM raw.sales_by_payment'))

con.close()