WITH young_conferences AS(
    SELECT conference, COUNT(DISTINCT years) as years
    FROM authors
    GROUP BY conference
    HAVING COUNT(DISTINCT year) <= 15
)


SELECT DISTINCT a1.name
FROM authors a1
WHERE NOT EXISTS(
                SELECT a2.name
                FROM authors a2
                WHERE a1.name = a2.name AND a2.conference NOT IN (
                                                                    SELECT conference FROM young_conferences)
)
ORDER BY a1.name;


