# Absolute (!) path of the directory containing the unzipped, raw CSV files, without trailing slash
dir_patstat_raw = "D:/Databases//PATSTAT/2022/raw"
# PostgreSQL server connection info
psql_server = "127.0.0.1"
psql_port = 5432
psql_user = "patstat_admin"
psql_passwd = "password"
psql_db = "patstat_global_2022_autumn"
tablespace = "patstat"
# List of tables to exclude from import
tbls_excl = ["tls203", "tls204", "tls205", "tls216", "tls211", "tls212", "tls214",
             "tls215", "tls227", "tls223", "tls231","tls803"]
