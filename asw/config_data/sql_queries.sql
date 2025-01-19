-- a) Join between two different tables and use of the GROUP BY clause
SELECT e.title, COUNT(te.tapestry_id) AS num_tapestries
FROM Exhibition e
LEFT JOIN Tapestry_Exhibition te ON e.exhibition_id = te.exhibition_id
GROUP BY e.title;

-- b) Sub-query that has a function in the nested part
SELECT title, estimated_value
FROM Tapestry
WHERE estimated_value > (SELECT AVG(estimated_value) FROM Tapestry);

-- c) Correlated-query
SELECT title
FROM Tapestry t1
WHERE t1.artist_id = (
    SELECT artist_id
    FROM Artist
    WHERE name = 'Vincent van Gogh'
);

-- d) Self join that uses primary key/foreign key attributes
SELECT t1.title AS tapestry_title, t2.title AS similar_tapestry
FROM Tapestry t1
JOIN Tapestry t2 ON t1.artist_id = t2.artist_id
WHERE t1.tapestry_id != t2.tapestry_id;
