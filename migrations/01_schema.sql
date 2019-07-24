-- Include DROP TABLE statement so that the file can be rerun easily
DROP TABLE users CASCADE; 
DROP TABLE properties CASCADE;
DROP TABLE reservations CASCADE;
DROP TABLE property_reviews CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL, 
  email TEXT NOT NULL, 
  password TEXT NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY, 
  owner_id INTEGER NOT NULL REFERENCES users(id), 
  title TEXT NOT NULL, 
  description TEXT NOT NULL, 
  thumbnail_photo_url TEXT, 
  cover_photo_url TEXT, 
  cost_per_night INTEGER NOT NULL,
  parking_spaces INTEGER, 
  number_of_bathrooms INTEGER, 
  number_of_bedrooms INTEGER, 
  country TEXT NOT NULL, 
  street TEXT NOT NULL, 
  city TEXT NOT NULL, 
  province TEXT NOT NULL, 
  post_code TEXT NOT NULL, 
  active BOOLEAN DEFAULT false
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY, 
  start_date TIMESTAMP NOT NULL, 
  end_date TIMESTAMP NOT NULL, 
  property_id INTEGER NOT NULL REFERENCES properties(id), 
  guest_id INTEGER NOT NULL REFERENCES users(id)
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY, 
  guest_id INTEGER NOT NULL REFERENCES users(id), 
  reservation_id INTEGER NOT NULL REFERENCES reservations(id), 
  property_id INTEGER NOT NULL REFERENCES properties(id), 
  rating INTEGER NOT NULL, 
  message TEXT
);