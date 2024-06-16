SELECT year, name
FROM (
  SELECT year, name, SUM(totalcount) AS totalcount,
         ROW_NUMBER() OVER (PARTITION BY year ORDER BY SUM(totalcount) DESC) AS rn
  FROM authors
  WHERE institution = 'Hebrew University of Jerusalem'
    AND conference IN (SELECT conference FROM conferences WHERE subarea = 'ai')
  GROUP BY year, name
) ranked_authors
WHERE rn = 1
ORDER BY year, name;
