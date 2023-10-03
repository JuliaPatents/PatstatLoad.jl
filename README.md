# PatstatLoad.jl

*A Julia script to semi-automatically import [PATSTAT](https://www.epo.org/searching-for-patents/business/patstat.html) Global into a PostgreSQL database.*

*Last tested for: PATSTAT Global, 2022 Autumn Edition*

## User guide

### 1. Preparations

* Make sure your database server has adequate RAM and disk space (At least 32GB of RAM and 1TB of free disk space recommended).
* Unzip all of the raw data files (named "tlsXXX_partXX.csv") into a single directory on the database server.
* Setup a PostgreSQL server and create a fresh database.
* Setup a PostgreSQL user with full privileges (including CREATE) on the database (or use the "postgres" superuser).
* (OPTIONAL) Set up a tablespace on the drive where you want to store the data. You can do this with `CREATE TABLESPACE patstat LOCATION 'path/to/tablespace';` followed by `SET default_tablespace = patstat;`.
* Clone this repository somewhere on the database server.
* Install a recent version of Julia (Recommended: 1.9+) on the database server.
* Open a Julia REPL in the repository root directory and enter PKG mode using the `]` key.
* Activate the julia environment (`activate .`) and install the dependencies (`instantiate`).
* **Note: It is not necessary for the script to be in the same directory as the data files. However, the import script must be executed on the database server, as the script uses the PostgreSQL `COPY` query. Import onto a remote server is not possible with this method.**

### 2. Configuration

* Rename "config.template.jl" to "config.jl" and update it with the correct database information and the path to your .csv files.
* **Note: The location of the data files must be given as an *absolute* path!**
* If you wish to exclude any PATSTAT tables from the import, add them to the `tbls_excl` array. Example:
```julia
tbls_excl = ["tls222", "tls223"]
```
* If you exclude tables, index and foreign key creation queries for those tables will fail. This is expected behavior.
* Similarly, foreign keys and indices you do not need can be excluded by adding `--` in front of the respective lines in the "foreignkeys.sql" or "indices.sql" files.

### 3. Initializing the schema

* Make sure your database is completely empty (no tables, views, indexes etc.).
* Run all of the SQL queries in the file "schema.sql" on your empty database (using `psql`, PgAdmin or another SQL client).

### 4. Data import

* Make sure the computer does not have any auto-standby or hibernation rules enabled.
* In a Julia REPL with the correct environment, run `include "PatstatLoad.jl"` to begin the import process.
* The import process will probably take several hours.
* The script will automatically read in the following files during the process: 
    - config.jl
    - PATSTAT_table_description.csv
    - foreignkeys.sql
    - indices.sql
* The script will report progress and any errors that occur during the import through StdOut / StdErr.
* When encountering an SQL error, the script will always report it and then proceed to the next instruction.

## Acknowledgements

Many of the SQL queries used for creating tables, foreign keys and indices were adapted from [daniel-hain/PATSTAT-PostgreSQL](https://github.com/daniel-hain/PATSTAT-PostgreSQL).
