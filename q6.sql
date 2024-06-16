SELECT DISTINCT a1.name
FROM authors a1
JOIN authors omri ON omri.name = 'Omri Abend' AND a1.conference = omri.conference AND a1.year = omri.year
GROUP BY a1.name
HAVING COUNT(DISTINCT a1.conference) = (SELECT COUNT(DISTINCT omri.conference) FROM authors omri WHERE omri.name = 'Omri Abend')
ORDER BY a1.name;
