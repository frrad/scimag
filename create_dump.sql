.headers on
.mode csv
.output index.csv
select doi, id from scimag order by doi asc;
.quit
