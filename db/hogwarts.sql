DROP TABLE students cascade;
DROP TABLE houses cascade;

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house INT REFERENCES houses(id) ON DELETE CASCADE,
  age INT
);
