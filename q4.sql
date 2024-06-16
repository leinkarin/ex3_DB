SELECT name, year
FROM authors a1
WHERE institution = 'Hebrew University of Jerusalem'
  AND conference IN (SELECT conference FROM conferences WHERE subarea = 'ai')
  AND EXISTS (SELECT 1 FROM authors a2 WHERE a1.name = a2.name AND a1.year = a2.year AND a2.conference IN (SELECT conference FROM conferences WHERE subarea = 'economics'))
ORDER BY name, year;


