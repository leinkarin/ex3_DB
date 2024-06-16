SELECT DISTINCT a.institution, a.name
FROM authors a
NATURAL JOIN institutions i
WHERE i.country = 'il' AND a.totalcount >= 2 AND conference LIKE 'sig%'
ORDER BY a.institution, a.name;
