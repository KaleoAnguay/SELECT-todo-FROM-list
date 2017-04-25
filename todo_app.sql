
DROP USER "kaleo";
CREATE USER "kaleo" WITH PASSWORD 'stonebreaker';

DROP database IF EXISTS "todo_app";
CREATE database "todo_app";
\c todo_app

CREATE TABLE "tasks"(
  id SERIAL PRIMARY KEY,
  title varchar(255),
  description text,
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at timestamp WITHOUT TIME ZONE,
  completed boolean DEFAULT false

);

ALTER TABLE tasks
DROP COLUMN completed;


ALTER TABLE tasks
ADD completed_at timestamp WITHOUT TIME ZONE NULL DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES(
'Study SQL',
'Complete this exercise',
now(),
now(),
null
);

INSERT INTO tasks (title,description)
VALUES(
'Study PostgreSQL',
'Read all the documentation'
);


\c michael