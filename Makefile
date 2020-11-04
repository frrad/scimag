.PHONY: clean

all: index.csv.xz

scimag.sql.gz:
	aria2c -c "http://gen.lib.rus.ec/dbdumps/scimag.sql.gz" -x 5

sqldb.sqlite: scimag.sql.gz
	pv scimag.sql.gz | gunzip | ./mysql2sqlite | sqlite3 sqldb.sqlite

index.csv: sqldb.sqlite
	sqlite3 sqldb.sqlite < create_dump.sql

index.csv.xz: index.csv
	pv index.csv | xz --block-size=100KiB -T 0 > index.csv.xz

clean:
	rm -f scimag.sql.gz sqldb.sqlite index.csv index.csv.xz
