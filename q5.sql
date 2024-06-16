SELECT DISTINCT name
FROM authors
WHERE year < 1980
  AND conference IN (SELECT conference FROM conferences WHERE area = 'theory')
  AND NOT EXISTS (
    SELECT 1
    FROM authors a2
    WHERE authors.name = a2.name
      AND (a2.conference NOT IN (SELECT conference FROM conferences WHERE area = 'theory') OR a2.year >= 1980)
  )
ORDER BY name;
