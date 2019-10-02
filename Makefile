.PHONY: clean

all: index.csv

scimag.sql.gz:
	aria2c -c "http://gen.lib.rus.ec/dbdumps/scimag.sql.gz" -x 5

sqldb.sqlite: scimag.sql.gz
	pv scimag.sql.gz | gunzip | ./mysql2sqlite | sqlite3 sqldb.sqlite

index.csv: sqldb.sqlite
	sqlite3 sqldb.sqlite < create_dump.sql

clean:
	rm -f scimag.sql.gz sqldb.sqlite
