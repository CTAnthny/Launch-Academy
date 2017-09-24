EXPLAIN ANALYZE
-- Find all rows that have an ingredient name of Brussels sprouts.
SELECT name
FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

-- Calculate the total count of rows of ingredients with a name of Brussels sprouts.
SELECT COUNT(name)
FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

-- Find all Brussels sprouts ingredients having a unit type of gallon(s).
SELECT name, unit
FROM ingredients
WHERE name LIKE '%Brussels sprouts%' AND unit LIKE '%gallon%';

-- Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.
SELECT name, unit
FROM ingredients
WHERE name LIKE '%Brussels sprouts%' OR unit LIKE '%gallon%' OR name LIKE '%j%';
--
-- CREATE INDEX ON ingredients(name);
-- CREATE INDEX ON ingredients(unit);
