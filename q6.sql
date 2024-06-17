SELECT DISTINCT a1.name
FROM authors a1
WHERE NOT EXISTS (
    SELECT c1.conference
    FROM conferences c1 NATURAL JOIN authors a2
    WHERE a2.name = 'Omri Abend'
    AND NOT EXISTS (
        SELECT c2.conference
        FROM conferences c2
        NATURAL JOIN authors a3
        WHERE a3.name = a1.name
        AND c2.conference= c1.conference
        AND a2.year = a3.year
    )
)
ORDER BY a1.name;