SELECT DISTINCT name
FROM authors
JOIN conferences ON authors.conference = conferences.conference
WHERE conferences.years <= 15
GROUP BY name
HAVING COUNT(DISTINCT conferences.conference) = COUNT(DISTINCT conferences.years)
ORDER BY name;
