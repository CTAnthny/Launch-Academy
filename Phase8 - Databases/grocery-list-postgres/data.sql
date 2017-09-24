INSERT INTO groceries (name) VALUES ('egg');

INSERT INTO comments (comments, item_id)
  VALUES ('large A organic', (SELECT id FROM groceries WHERE name ILIKE 'egg'));

INSERT INTO comments (comments, item_id)
  VALUES ('medium brown', (SELECT id FROM groceries WHERE name ILIKE 'egg'));
