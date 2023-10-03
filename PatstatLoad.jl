using CSV
using DataFrames
using LibPQ

include("config.jl")

db = LibPQ.Connection("postgresql://$psql_user:$psql_passwd@$psql_server:$psql_port/$psql_db")

println("=== Importing data. Tables to import:")

tbls = CSV.read("PATSTAT_table_description.csv", DataFrame)
tbls_incl = filter(t -> !(t.table_id in tbls_excl), tbls)
println(tbls_incl)

execute(db, "SET default_tablespace = $tablespace;")

for tbl in eachrow(tbls_incl)
    println()
    parts = filter(fname -> startswith(fname, tbl.table_id) && endswith(fname, ".csv"), readdir(dir_patstat_raw))
    println("Importing table: $(tbl.description) ($(tbl.table_id)_$(tbl.name)), $(length(parts)) parts...")
    for part in parts
        fullpath = dir_patstat_raw * "/" * part
        println("Loading $fullpath...")
        @time begin
            try
                execute(db, "COPY $(tbl.table_id)_$(tbl.name) FROM '$fullpath' WITH (FORMAT CSV, HEADER MATCH);")
            catch e
                showerror(stderr, e)
                println(stderr)
            end
        end
    end
end

println("=== Creating foreign keys")

fkeys = open("foreignkeys.sql", "r")

for line in readlines(fkeys)
    startswith(line, "--") && continue
    println("Executing: $line")
    @time begin
        try
            execute(db, line)
        catch e
            showerror(stderr, e)
            println(stderr)
        end
    end
end

println("=== Creating indices")

idxs = open("indices.sql", "r")

for line in readlines(idxs)
    startswith(line, "--") && continue
    println("Executing: $line")
    @time begin
        try
            execute(db, line)
        catch e
            showerror(stderr, e)
            println(stderr)
        end
    end
end

close(db)
