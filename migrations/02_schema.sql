CREATE TABLE rates (
  id SERIAL PRIMARY KEY, 
  start_date TIMESTAMP NOT NULL, 
  end_date TIMESTAMP NOT NULL, 
  cost_per_night INTEGER NOT NULL, 
  property_id INTEGER NOT NULL REFERENCES properties(id)
);

CREATE TABLE guest_reviews (
  id SERIAL PRIMARY KEY, 
  guest_id INTEGER NOT NULL REFERENCES users(id), 
  owner_id INTEGER NOT NULL REFERENCES users(id), 
  reservation_id INTEGER NOT NULL REFERENCES reservations(id), 
  rating INTEGER NOT NULL, 
  message TEXT
);