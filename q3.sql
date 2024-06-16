SELECT DISTINCT name, institution
FROM authors
WHERE institution IN (SELECT institution FROM institutions WHERE country = 'il')
  AND conference LIKE 'sig%'
GROUP BY name, institution
HAVING COUNT(*) >= 2
ORDER BY institution,name;
