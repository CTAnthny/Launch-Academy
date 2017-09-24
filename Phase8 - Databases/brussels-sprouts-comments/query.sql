SELECT count(*) FROM recipes;
SELECT count(*) FROM comments;
SELECT rcps.id, rcps.name, count(cmts.recipe_id) AS cmt_amt
  FROM comments cmts INNER JOIN recipes rcps
  ON cmts.recipe_id = rcps.id
  GROUP BY rcps.id;
