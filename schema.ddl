-- Could not:
-- 1. Enforce that a venue has at least 10 seats.
-- 2. Enforce that the Section in SectionPrice belongs to the Concert's Venue.
-- 3. Enforce that the Seat in Ticket belongs to the Concert's Venue.

-- Did not:
-- 1. Use composite primary keys to enforce the venue-matching 
--    constraints mentioned above. Doing so would violate the requirement 
--    for single-attribute integer primary keys and would introduce redundancy.

-- Extra constraints:
-- 1. Added UNIQUE(concert_id, seat_id) to the Ticket table to prevent the 
--    same seat from being sold multiple times for the same concert.
-- 2. Added a CHECK constraint to ensure ticket prices are non-negative.

-- Assumptions:
-- 1. Concert date and time are combined into a single TIMESTAMP column.
-- 2. Named the user table "AppUser" because "User" is a SQL reserved keyword.
-- 3. Prices are stored as NUMERIC(10, 2).

DROP SCHEMA IF EXISTS TicketSchema CASCADE;
CREATE SCHEMA TicketSchema;
SET search_path TO TicketSchema;


-- The owner of one or more venues.
-- <owner_id> is the unique identifier for the owner.
-- <name> is the string name of the person, organization, or company.
-- <phone> is a single, unique phone number associated with the owner.
CREATE TABLE Owner (
    owner_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);

-- A venue where concerts are hosted.
-- <venue_id> is the unique identifier for the venue.
-- <owner_id> links to the Owner who owns this venue.
-- <name>, <city>, and <street_address> describe the venue's location.
CREATE TABLE Venue (
    venue_id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES Owner(owner_id),
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street_address VARCHAR(150) NOT NULL
);

-- An organized section of seats within a specific venue.
-- <section_id> is the unique identifier for the section.
-- <venue_id> is the venue where this section is located.
-- <name> is the name of the section (e.g., 'floor level 1'), 
-- which is unique within its specific venue.
CREATE TABLE Section (
    section_id SERIAL PRIMARY KEY,
    venue_id INT NOT NULL REFERENCES Venue(venue_id),
    name VARCHAR(100) NOT NULL,
    UNIQUE (venue_id, name)
);

-- A specific seat located within a venue's section.
-- <seat_id> is the unique identifier for the seat.
-- <section_id> is the section to which this seat belongs.
-- <name> is the seat identifier (e.g., 'B37'), unique within its section.
-- <is_accessible> indicates if the seat is accessible for mobility issues.
CREATE TABLE Seat (
    seat_id SERIAL PRIMARY KEY,
    section_id INT NOT NULL REFERENCES Section(section_id),
    name VARCHAR(20) NOT NULL,
    is_accessible BOOLEAN NOT NULL,
    UNIQUE (section_id, name)
);

-- A specific concert event.
-- <concert_id> is the unique identifier for the concert.
-- <venue_id> is the venue where the concert is taking place.
-- <name> is the name of the concert.
-- <datetime> records the date and time of the concert.
-- A venue can only have one concert at a given date and time.
CREATE TABLE Concert (
    concert_id SERIAL PRIMARY KEY,
    venue_id INT NOT NULL REFERENCES Venue(venue_id),
    name VARCHAR(150) NOT NULL,
    datetime TIMESTAMP NOT NULL,
    UNIQUE (venue_id, datetime)
);

-- The price of a ticket for a specific section at a specific concert.
-- <price_id> is the unique identifier for this pricing rule.
-- <concert_id> is the concert this price applies to.
-- <section_id> is the section this price applies to.
-- <amount> is the cost of the ticket, which cannot be negative.
CREATE TABLE SectionPrice (
    price_id SERIAL PRIMARY KEY,
    concert_id INT NOT NULL REFERENCES Concert(concert_id),
    section_id INT NOT NULL REFERENCES Section(section_id),
    amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0),
    UNIQUE (concert_id, section_id)
);

-- A user of the ticket purchasing app.
-- <user_id> is the unique identifier for the user.
-- <username> is their unique chosen display name.
CREATE TABLE AppUser (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
);

-- A record of a transaction made by a user.
-- <purchase_id> is the unique identifier for the purchase event.
-- <user_id> is the user who made the purchase.
-- <datetime> is the exact date and time the purchase was recorded.
CREATE TABLE Purchase (
    purchase_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES AppUser(user_id),
    datetime TIMESTAMP NOT NULL
);

-- An individual ticket sold for a concert.
-- <ticket_id> is the unique identifier for the ticket.
-- <purchase_id> links to the transaction record.
-- <concert_id> is the concert the ticket is for.
-- <seat_id> is the specific seat reserved by this ticket.
-- A specific seat can only be sold once per concert.
CREATE TABLE Ticket (
    ticket_id SERIAL PRIMARY KEY,
    purchase_id INT NOT NULL REFERENCES Purchase(purchase_id),
    concert_id INT NOT NULL REFERENCES Concert(concert_id),
    seat_id INT NOT NULL REFERENCES Seat(seat_id),
    UNIQUE (concert_id, seat_id)
);