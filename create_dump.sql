.headers on
.mode csv
.output index.csv
SELECT
    lower(doi) AS doi,
    id
FROM scimag
ORDER BY lower(doi) ASC;
.quit
