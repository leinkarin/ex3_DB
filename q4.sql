SELECT DISTINCT name, year
FROM authors a1 NATURAL JOIN conferences c1
WHERE institution = 'Hebrew University of Jerusalem'
  AND c1.subarea = 'ai'
  AND EXISTS (SELECT name FROM authors a2 NATURAL JOIN conferences c2 WHERE a1.name = a2.name AND a1.year = a2.year AND c2.subarea = 'economics')
ORDER BY name, year;
