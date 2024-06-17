WITH publish_count AS(
    SELECT institution, SUM(totalcount) as countryCount, country
    FROM authors NATURAL JOIN institutions
    GROUP BY institution, region, country
)
SELECT *
FROM publish_count p1
WHERE countryCount= (SELECT MAX(countryCount)
                     FROM publish_count p2
                     WHERE p1.country= p2.country)
ORDER BY country,institution;