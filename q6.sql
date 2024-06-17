SELECT DISTINCT a1.name
FROM authors a1
WHERE NOT EXISTS (
    SELECT a2.conference
    FROM authors a2
    WHERE a2.name = 'Omri Abend'
    AND NOT EXISTS (
        SELECT a3.conference
        FROM authors a3
        WHERE a3.name = a1.name
        AND a3.conference= a2.conference
        AND a2.year = a3.year
    )
)
ORDER BY a1.name;
