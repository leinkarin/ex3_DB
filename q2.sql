SELECT institution, name
JOIN institutions ON authors.institution = institutions.institution
WHERE institutions.region = 'Africa'
ORDER BY institution, name;