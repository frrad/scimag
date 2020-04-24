.headers on
.mode csv
.output index.csv
select lower(doi), id from scimag order by lower(doi) asc;
.quit
