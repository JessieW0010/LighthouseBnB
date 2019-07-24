-- Produce managers want a query to see the average duration of a reservation

SELECT AVG(end_date - start_date)
AS average_duration 
FROM reservations;