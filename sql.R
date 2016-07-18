library(dplyr)
my_db <- src_sqlite("my_db.sqlite3", create = T)


library(nycflights13)
flights_sqlite <- copy_to(my_db, flights, temporary = FALSE, indexes = list(
  c("year", "month", "day"), "carrier", "tailnum"))
copy_to(my_db, planes, temporary = FALSE)

tbl(my_db, sql("SELECT year, month FROM flights LIMIT 5"))
tbl(my_db, sql("SELECT * FROM flights LIMIT 5"))
tbl(my_db, sql("SELECT count(*) FROM flights"))
tbl(my_db, sql("SELECT count(1)  FROM planes"))
tbl(my_db, sql("SELECT DISTINCT engines FROM planes"))

#1
tbl(my_db, sql("SELECT max(distance) FROM flights LIMIT 5"))
tbl(my_db, sql("SELECT dest FROM flights
               WHERE distance = 4983"))
#2
tbl(my_db, sql("SELECT max(seats), engines FROM planes
               GROUP BY engines"))
#3


tbl(my_db, sql("SELECT count (flights))
               

#4
tbl(my_db, sql("SELECT count(*) N, CARRIER FROM flights
               GROUP BY carrier
#5              
tbl(my_db, sql("SELECT count(*) N, CARRIER FROM flights
               GROUP BY carrier
               ORDER BY COUNT(*) DESC"))
#6
tbl(my_db, sql("SELECT count(*) N, CARRIER FROM flights LIMIT 5"
               GROUP BY carrier
               ORDER BY COUNT(*) DESC"))
#7
tbl(my_db, sql("SELECT count(*) N, CARRIER FROM flights
                WHERE distance > 1000
               GROUP BY carrier
               ORDER BY COUNT(*) DESC
               LIMIT 5"))


