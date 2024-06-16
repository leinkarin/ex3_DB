WITH ml_authors AS (
  SELECT name
  FROM authors
  JOIN conferences ON authors.conference = conferences.conference
  WHERE conferences.subarea = 'ml'
  GROUP BY name
  HAVING COUNT(*) >= 3
),
recent_ml_authors AS (
  SELECT name
  FROM authors
  JOIN conferences ON authors.conference = conferences.conference
  WHERE conferences.subarea = 'ml' AND year >= 2020
)
SELECT DISTINCT ml_authors.name
FROM ml_authors
JOIN recent_ml_authors ON ml_authors.name = recent_ml_authors.name
ORDER BY ml_authors.name;
