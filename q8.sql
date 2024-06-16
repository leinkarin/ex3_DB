SELECT DISTINCT a1.name
FROM authors a1
NATURAL JOIN conferences c1
WHERE c1.subarea = 'ML'
  AND a1.name IN (
    SELECT a2.name
    FROM authors a2
    NATURAL JOIN conferences c2
    WHERE c2.subarea = 'ML'
    GROUP BY a2.name
    HAVING COUNT(DISTINCT c2.conference) >= 3
  )
  AND a1.name IN (
    SELECT a3.name
    FROM authors a3
    NATURAL JOIN conferences c3
    WHERE c3.area = 'ML'
      AND a3.year >= 2020
  )
ORDER BY a1.name;
