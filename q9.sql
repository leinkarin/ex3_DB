WITH institution_counts AS (
  SELECT institution, country, SUM(totalcount) AS countryCount
  FROM authors
  JOIN institutions ON authors.institution = institutions.institution
  GROUP BY institution, country
)
SELECT country, institution, countryCount
FROM (
  SELECT country, institution, countryCount,
         ROW_NUMBER() OVER (PARTITION BY country ORDER BY countryCount DESC) AS rn
  FROM institution_counts
) ranked_institutions
WHERE rn = 1
ORDER BY country, institution;
