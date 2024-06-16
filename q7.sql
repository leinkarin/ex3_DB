SELECT country, COUNT(institution) AS institutionCount
FROM institutions
GROUP BY country
ORDER BY institutionCount DESC, country;