WITH record_holders AS(
    SELECT year, name, SUM(totalcount) AS totalcount
    FROM authors NATURAL JOIN conferences
    WHERE institution = 'Hebrew University of Jerusalem'
    AND area='ai'
    GROUP BY year, name
)

SELECT DISTINCT year, name
FROM record_holders r1
WHERE totalcount= (
                    SELECT MAX(totalcount)
                    FROM record_holders r2
                    WHERE r1.year= r2.year) AND year BETWEEN 2000 AND 2020
ORDER BY year, name;



