-- Q1: For each concert, the total number of tickets sold,
-- the total value of all tickets sold, and the percentage of
-- the venue that was sold.

SET SEARCH_PATH TO TicketSchema;

-- Total number of seats in each venue.
DROP VIEW IF EXISTS VenueSeats CASCADE;
CREATE VIEW VenueSeats AS
    SELECT v.venue_id,
           COUNT(s.seat_id) AS total_seats
    FROM Venue v
    JOIN Section sec ON sec.venue_id = v.venue_id
    JOIN Seat s ON s.section_id = sec.section_id
    GROUP BY v.venue_id;

-- Total tickets sold and revenue for each concert.
DROP VIEW IF EXISTS TicketSales CASCADE;
CREATE VIEW TicketSales AS
    SELECT t.concert_id,
           COUNT(*) AS tickets_sold,
           SUM(sp.amount) AS total_value
    FROM Ticket t
    JOIN Seat s ON t.seat_id = s.seat_id
    JOIN SectionPrice sp
        ON sp.concert_id = t.concert_id
        AND sp.section_id = s.section_id
    GROUP BY t.concert_id;

-- For each concert, the ticket count, total revenue, and the
-- percentage of the venue's seats that were sold.
DROP VIEW IF EXISTS Q1 CASCADE;
CREATE VIEW Q1 AS
    SELECT c.name AS concert_name,
           v.name AS venue_name,
           c.datetime,
           COALESCE(ts.tickets_sold, 0) AS tickets_sold,
           COALESCE(ts.total_value, 0.00) AS total_value,
           ROUND(
               COALESCE(ts.tickets_sold, 0) * 100.0
               / vs.total_seats, 2
           ) AS percent_sold
    FROM Concert c
    JOIN Venue v ON c.venue_id = v.venue_id
    JOIN VenueSeats vs ON vs.venue_id = v.venue_id
    LEFT JOIN TicketSales ts
        ON ts.concert_id = c.concert_id;

SELECT * FROM Q1;
