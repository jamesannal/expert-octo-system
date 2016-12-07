DROP TABLE IF EXISTS artists;

DROP TABLE IF EXISTS albums;

CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE albumns (
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255)
);