-- Q4: The username(s) of the person who has purchased the
-- most tickets and the number of tickets they purchased.
-- If there is a tie, all tied users are reported.

SET SEARCH_PATH TO TicketSchema;

-- Number of tickets purchased per user.
DROP VIEW IF EXISTS UserTicketCounts CASCADE;
CREATE VIEW UserTicketCounts AS
    SELECT u.username,
           COUNT(t.ticket_id) AS tickets_purchased
    FROM AppUser u
    JOIN Purchase p ON p.user_id = u.user_id
    JOIN Ticket t ON t.purchase_id = p.purchase_id
    GROUP BY u.user_id, u.username;

-- The user(s) with the highest number of purchased tickets.
DROP VIEW IF EXISTS Q4 CASCADE;
CREATE VIEW Q4 AS
    SELECT username, tickets_purchased
    FROM UserTicketCounts
    WHERE tickets_purchased = (
        SELECT MAX(tickets_purchased)
        FROM UserTicketCounts
    );

SELECT * FROM Q4;
