-- When users come to our home page, they should see a list of properties. They wil be able to view the properties and filter them by location. They will be able to see all data about the property, including the average rating. 

SELECT properties.id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active, AVG(rating) AS average_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING AVG(rating) >= 4
ORDER BY cost_per_night ASC
LIMIT 10;