DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  url TEXT
);

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house SERIAL4 REFERENCES houses(id) ON DELETE CASCADE,
  age INT2
);
