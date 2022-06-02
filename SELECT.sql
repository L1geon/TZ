SELECT p.regNum, l.number, l.name, l.maxSum FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureid
WHERE l.active = 1;

SELECT p.regNum, l.number, l.name, f.title FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureid
JOIN procedureFeature AS pf ON p.id = pf.procedureid
JOIN features AS f ON pf.featureid = f.id
WHERE p.active = 1 and f.title = 'Быстрая закупка'


SELECT p.regNum, p.publicationDateTime, l.number, o.name  FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureId
JOIN organization AS o ON p.placerId = o.id
WHERE p.active = 1 AND p.publicationDateTime > '01.08.2021'


SELECT p.regNum FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureId
JOIN lotCustomer AS lc ON l.id = lc.lotId
JOIN organization AS o ON lc.organizationId = o.id
JOIN  organizationType AS ot ON o.typeId = ot.id
WHERE ot.title = 'Участник'


SELECT p.regNum, l.number, l.name, COUNT(r.lotId) FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureId
JOIN request AS r ON l.id = r.lotId
GROUP BY r.lotId
ORDER BY r.publicationDateTime


SELECT p.regNum, l.number, r.id, o.name FROM  procedures AS p
JOIN lot AS l ON p.id = l.procedureId
JOIN request AS r ON l.id = r.lotId
JOIN organization AS o ON r.organizationId = o.id
RIGHT JOIN requestDocuments AS rd ON r.id = rd.requestId
WHERE r.id IS NULL


SELECT p.regNum, l.number, l.name, r.id, o.name, MIN(r.offer) FROM procedures AS p
JOIN lot AS l ON p.id = l.procedureId
JOIN request AS r ON l.id = r.lotId
JOIN organization AS o ON r.organizationId = o.id
GROUP BY l.number