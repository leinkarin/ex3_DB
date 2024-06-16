--SELECT DISTINCT name
--FROM authors
--WHERE year < 1980
--  AND conference IN (SELECT conference FROM conferences WHERE area = 'theory')
--  AND NOT EXISTS (
--    SELECT 1
--    FROM authors a2
--    WHERE authors.name = a2.name
--      AND (a2.conference NOT IN (SELECT conference FROM conferences WHERE area = 'theory') OR a2.year >= 1980)
--  )
--ORDER BY name;



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

