CREATE TABLE test
(
	id INTEGER PRIMARY KEY
,	name TEXT NOT NULL
);

INSERT INTO test (id, name)
VALUES (1, 'Hello, world');

SELECT * FROM test;

DROP TABLE test;

