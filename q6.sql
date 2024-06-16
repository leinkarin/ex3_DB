SELECT DISTINCT a1.name
FROM authors a1
WHERE NOT EXISTS (
    SELECT c1.conference
    FROM conferences c1 NATURAL JOIN authors a2
    WHERE a2.name = 'Omri Abend'
      AND NOT EXISTS (
          SELECT c2.conference
          FROM authors a3 NATURAL JOIN conferences c2
          WHERE a2.year = a3.year
            AND a3.name = a1.name
      )
)
ORDER BY a1.name;
