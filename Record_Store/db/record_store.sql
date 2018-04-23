DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
id SERIAL PRIMARY KEY,
name  VARCHAR(255)
   );

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  quantity INT,
  genre VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  url VARCHAR(255),
  buy_price INT,
  sell_price INT
);
