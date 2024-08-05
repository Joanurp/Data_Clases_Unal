

library(RPostgres)
library(DBI)


# Crear la conexión utilizando RPostgres
conexion <- dbConnect(RPostgres::Postgres(), dbname = "CTrabajo",
                      host = "localhost",
                      port = 5432,
                      user = "postgres",
                      password = "...")


estructura <- dbGetQuery(conexion, "
  SELECT column_name
  FROM information_schema.columns
  WHERE table_name = 'Base1';")


# Proporcion de medalllas
query <- "
  SELECT medal, 
         COUNT(*) * 100.0 / (SELECT COUNT(*) FROM \"Base1\") AS porcentaje
  FROM \"Base1\"
  GROUP BY medal;
"

resultado <- dbGetQuery(conexion, query)

print(resultado)




