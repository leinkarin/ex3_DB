SELECT institution, name
FROM authors
NATURAL JOIN institutions
WHERE institutions.region = 'Africa'
ORDER BY institution, name;