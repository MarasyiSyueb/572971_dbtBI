## Cara Menjalankan

### 1. Clone repository
```bash
git clone https://github.com/USERNAME/572971_dbtBI.git
cd 572971_dbtBI
```

### 2. Siapkan virtual environment (Python 3.12) + dbt
Jika Python sistem 3.10–3.12:
```bash
python3 -m venv ~/dbt-venv
source ~/dbt-venv/bin/activate
```
Jika Python terlalu baru (3.13/3.14), pakai uv:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
uv venv ~/dbt-venv --python 3.12
source ~/dbt-venv/bin/activate
```
Lalu install dbt-duckdb (menarik dbt-core + duckdb sekaligus):
```bash
pip install dbt-duckdb        # jika pakai uv: uv pip install dbt-duckdb
```
Verifikasi: `dbt --version`.

### 3. Muat data raw ke DuckDB
Berkas `data/warehouse.duckdb` sudah disertakan, jadi langkah ini **opsional**. Untuk
membangun ulang warehouse dari CSV di `raw_source/`:
```bash
python3 load_raw.py
```
Ini memuat 5 CSV output Airflow ke schema `raw` (daily_sales, top_products,
avg_rating_by_product, sales_by_branch, sales_by_payment).

### 4. Jalankan dbt
Dari dalam folder `dbt_project/`:
```bash
cd dbt_project
dbt debug --profiles-dir .      # cek koneksi  -> "All checks passed!"
dbt run   --profiles-dir .      # bangun 5 staging (view) + 4 mart (table) -> PASS=9
dbt test  --profiles-dir .      # jalankan semua test -> PASS=24
```

### 5. Dokumentasi & lineage
```bash
dbt docs generate --profiles-dir .
dbt docs serve    --profiles-dir . --port 8081
```
Buka http://localhost:8081, klik ikon lineage (kanan bawah) untuk melihat alur
5 sumber → 5 staging → 4 mart. Tekan Ctrl+C untuk berhenti.


