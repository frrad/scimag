.headers on
.mode csv
.output index.csv
select doi, id from scimag where id <= 77299999 order by doi asc;
.quit
