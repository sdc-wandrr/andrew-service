DROP DATABASE IF EXISTS reviewservice;

CREATE DATABASE reviewservice;
\c reviewservice;

CREATE TABLE hostels (
  id SERIAL PRIMARY KEY,
  hostel_name VARCHAR(30)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64),
  age_group VARCHAR(64),
  gender VARCHAR(10),
  authdescription VARCHAR(64)
);

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  hostel_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  description VARCHAR(500),
  date VARCHAR(10) NOT NULL,
  security FLOAT(1) NOT NULL,
  location FLOAT(1) NOT NULL,
  staff FLOAT(1) NOT NULL,
  atmosphere FLOAT(1) NOT NULL,
  cleanliness FLOAT(1) NOT NULL,
  facilities FLOAT(1) NOT NULL,
  value FLOAT(1) NOT NULL,
  total FLOAT(1) NOT NULL
);

COPY hostels
FROM '/home/ubuntu/hostels.csv'
DELIMITER ','
CSV HEADER;

COPY authors
FROM '/home/ubuntu/authors.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
FROM '/home/ubuntu/reviews.csv'
DELIMITER ','
CSV HEADER;


SELECT setval(pg_get_serial_sequence('authors', 'id'), coalesce(max(id),0) + 1, false) FROM authors;
SELECT setval(pg_get_serial_sequence('hostels', 'id'), coalesce(max(id),0) + 1, false) FROM hostels;
SELECT setval(pg_get_serial_sequence('reviews', 'review_id'), coalesce(max(review_id),0) + 1, false) FROM reviews;

ALTER TABLE reviews
ADD CONSTRAINT reviews_hostel_id_fkey
FOREIGN KEY (hostel_id)
REFERENCES hostels(id)
ON DELETE CASCADE;

ALTER TABLE reviews
ADD CONSTRAINT reviews_author_id_fkey
FOREIGN KEY (author_id)
REFERENCES authors(id)
ON DELETE CASCADE;

CREATE INDEX hostel_id_index ON reviews (hostel_id);