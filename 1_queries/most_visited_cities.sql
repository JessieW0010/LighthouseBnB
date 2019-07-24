-- Our product managers want a query to see a list of the most visited cities.

SELECT city, COUNT(*)
FROM reservations
JOIN properties ON properties.id = property_id
GROUP BY city
ORDER BY COUNT(*) DESC;