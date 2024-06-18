SELECT
    c1.cid AS cid1,
    c2.cid AS cid2
FROM
    (SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
     FROM Course natural left outer JOIN Prerequisites
     GROUP BY cid) AS c1
JOIN
    (SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
     FROM Course natural left outer JOIN Prerequisites
     GROUP BY cid) AS c2
ON (c1.PrereqList = c2.PrereqList or (c1.PrereqList IS NULL AND c2.PrereqList is NULL))  AND c1.cid < c2.cid
ORDER BY c1.cid, c2.cid;