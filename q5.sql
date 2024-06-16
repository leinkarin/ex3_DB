SELECT DISTINCT name
FROM authors a1 NATURAL JOIN conferences
WHERE area = 'theory' AND year < 1980
  AND NOT EXISTS (
    SELECT name
    FROM authors a2 NATURAL JOIN conferences c2
    WHERE a1.name = a2.name
      AND (c2.area != 'theory' OR a2.year >= 1980)
  )
ORDER BY name;

