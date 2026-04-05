-- Q2: For each owner, the number of venues they own.

SET SEARCH_PATH TO TicketSchema;

DROP VIEW IF EXISTS Q2 CASCADE;
CREATE VIEW Q2 AS
    SELECT o.name AS owner_name,
           o.phone,
           COUNT(v.venue_id) AS num_venues
    FROM Owner o
    LEFT JOIN Venue v ON v.owner_id = o.owner_id
    GROUP BY o.owner_id, o.name, o.phone;

SELECT * FROM Q2;
