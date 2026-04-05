-- Q3: For each venue, the number of seats and the percentage
-- of seats that are accessible.

SET SEARCH_PATH TO TicketSchema;

DROP VIEW IF EXISTS Q3 CASCADE;
CREATE VIEW Q3 AS
    SELECT v.name AS venue_name,
           v.city,
           COUNT(s.seat_id) AS num_seats,
           ROUND(
               SUM(CASE WHEN s.is_accessible
                   THEN 1 ELSE 0 END) * 100.0
               / COUNT(s.seat_id), 2
           ) AS percent_accessible
    FROM Venue v
    JOIN Section sec ON sec.venue_id = v.venue_id
    JOIN Seat s ON s.section_id = sec.section_id
    GROUP BY v.venue_id, v.name, v.city;

SELECT * FROM Q3;
