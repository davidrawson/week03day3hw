DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(255),
);

CREATE TABLE album(
  id SERIAL4 PRIMARY KEY,
  album_title VARCHAR(255),
  genre VARCHAR(255),
  artist_id SERIAL4 REFERENCES artist(id)
);
