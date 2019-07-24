-- When a user is logged in, they will have an option to view all of their reservations. This page will show details about a reservation and details about the property associated with the reservation. 

SELECT reservations.*, properties.*, AVG(rating) AS average_rating
FROM reservations
JOIN properties ON properties.id = reservations.property_id
JOIN property_reviews ON property_reviews.property_id = reservations.property_id
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::date
GROUP BY reservations.id, properties.id
ORDER BY reservations.start_date LIMIT 10;