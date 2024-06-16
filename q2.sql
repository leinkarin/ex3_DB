SELECT DISTINCT a.institution, a.name
FROM authors a
NATURAL JOIN institutions i
WHERE i.region = 'africa'
ORDER BY a.institution, a.name;