-- Sample data for the concert ticket database.

SET search_path TO TicketSchema;


-- Owners (6 total; Owner 1 owns 3 venues for Q2)
INSERT INTO Owner (owner_id, name, phone) VALUES
    (1, 'LiveNation Entertainment', '416-555-0001'),
    (2, 'Maple Leaf Sports', '416-555-0002'),
    (3, 'Jade Chen', '647-555-0003'),
    (4, 'Obsidian Events Inc.', '905-555-0004'),
    (5, 'Rosa Martinez', '514-555-0005'),
    (6, 'Summit Venues Corp.', '604-555-0006');


-- Venues (10 total)
-- Venue 1 has 60 seats for the big concert (Q1).
-- Venue 4 has 12 seats, 25% accessible (Q3).
INSERT INTO Venue (venue_id, owner_id, name, city,
    street_address) VALUES
    (1, 1, 'Meridian Hall', 'Toronto',
        '1 Front St E'),
    (2, 1, 'The Danforth Music Hall', 'Toronto',
        '147 Danforth Ave'),
    (3, 1, 'History', 'Toronto',
        '1095 Queen St E'),
    (4, 2, 'Scotiabank Arena', 'Toronto',
        '40 Bay St'),
    (5, 2, 'Budweiser Stage', 'Toronto',
        '909 Lake Shore Blvd W'),
    (6, 3, 'Massey Hall', 'Toronto',
        '178 Victoria St'),
    (7, 3, 'The Rex', 'Toronto',
        '194 Queen St W'),
    (8, 4, 'Place Bell', 'Montreal',
        '2100 Avenue des Canadiens'),
    (9, 5, 'Centre Bell', 'Montreal',
        '1909 Avenue des Canadiens'),
    (10, 6, 'Rogers Arena', 'Vancouver',
        '800 Griffiths Way');


-- Sections (12 total)
-- Venue 1: Orchestra + Balcony (2 sections, 30 seats each)
-- Venue 4: Lower Bowl + Upper Bowl (2 sections, 6 seats each)
-- All other venues: General (1 section, 10 seats)
INSERT INTO Section (section_id, venue_id, name) VALUES
    (1, 1, 'Orchestra'),
    (2, 1, 'Balcony'),
    (3, 2, 'General'),
    (4, 3, 'General'),
    (5, 4, 'Lower Bowl'),
    (6, 4, 'Upper Bowl'),
    (7, 5, 'General'),
    (8, 6, 'General'),
    (9, 7, 'General'),
    (10, 8, 'General'),
    (11, 9, 'General'),
    (12, 10, 'General');


-- Seats (152 total)
-- Venue 4 has 3/12 = 25% accessible seats (Q3).
-- Venues 6 and 10 each have 1/10 = 10% accessible.

-- Venue 1, Section 1 (Orchestra): seats A1-A30
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (1, 1, 'A1', FALSE), (2, 1, 'A2', FALSE),
    (3, 1, 'A3', FALSE), (4, 1, 'A4', FALSE),
    (5, 1, 'A5', FALSE), (6, 1, 'A6', FALSE),
    (7, 1, 'A7', FALSE), (8, 1, 'A8', FALSE),
    (9, 1, 'A9', FALSE), (10, 1, 'A10', FALSE),
    (11, 1, 'A11', FALSE), (12, 1, 'A12', FALSE),
    (13, 1, 'A13', FALSE), (14, 1, 'A14', FALSE),
    (15, 1, 'A15', FALSE), (16, 1, 'A16', FALSE),
    (17, 1, 'A17', FALSE), (18, 1, 'A18', FALSE),
    (19, 1, 'A19', FALSE), (20, 1, 'A20', FALSE),
    (21, 1, 'A21', FALSE), (22, 1, 'A22', FALSE),
    (23, 1, 'A23', FALSE), (24, 1, 'A24', FALSE),
    (25, 1, 'A25', FALSE), (26, 1, 'A26', FALSE),
    (27, 1, 'A27', FALSE), (28, 1, 'A28', FALSE),
    (29, 1, 'A29', FALSE), (30, 1, 'A30', FALSE);

-- Venue 1, Section 2 (Balcony): seats B1-B30
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (31, 2, 'B1', FALSE), (32, 2, 'B2', FALSE),
    (33, 2, 'B3', FALSE), (34, 2, 'B4', FALSE),
    (35, 2, 'B5', FALSE), (36, 2, 'B6', FALSE),
    (37, 2, 'B7', FALSE), (38, 2, 'B8', FALSE),
    (39, 2, 'B9', FALSE), (40, 2, 'B10', FALSE),
    (41, 2, 'B11', FALSE), (42, 2, 'B12', FALSE),
    (43, 2, 'B13', FALSE), (44, 2, 'B14', FALSE),
    (45, 2, 'B15', FALSE), (46, 2, 'B16', FALSE),
    (47, 2, 'B17', FALSE), (48, 2, 'B18', FALSE),
    (49, 2, 'B19', FALSE), (50, 2, 'B20', FALSE),
    (51, 2, 'B21', FALSE), (52, 2, 'B22', FALSE),
    (53, 2, 'B23', FALSE), (54, 2, 'B24', FALSE),
    (55, 2, 'B25', FALSE), (56, 2, 'B26', FALSE),
    (57, 2, 'B27', FALSE), (58, 2, 'B28', FALSE),
    (59, 2, 'B29', FALSE), (60, 2, 'B30', FALSE);

-- Venue 2, Section 3 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (61, 3, 'G1', FALSE), (62, 3, 'G2', FALSE),
    (63, 3, 'G3', FALSE), (64, 3, 'G4', FALSE),
    (65, 3, 'G5', FALSE), (66, 3, 'G6', FALSE),
    (67, 3, 'G7', FALSE), (68, 3, 'G8', FALSE),
    (69, 3, 'G9', FALSE), (70, 3, 'G10', FALSE);

-- Venue 3, Section 4 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (71, 4, 'G1', FALSE), (72, 4, 'G2', FALSE),
    (73, 4, 'G3', FALSE), (74, 4, 'G4', FALSE),
    (75, 4, 'G5', FALSE), (76, 4, 'G6', FALSE),
    (77, 4, 'G7', FALSE), (78, 4, 'G8', FALSE),
    (79, 4, 'G9', FALSE), (80, 4, 'G10', FALSE);

-- Venue 4, Section 5 (Lower Bowl): seats L1-L6
-- L1-L3 are accessible (3/12 = 25% for this venue)
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (81, 5, 'L1', TRUE), (82, 5, 'L2', TRUE),
    (83, 5, 'L3', TRUE), (84, 5, 'L4', FALSE),
    (85, 5, 'L5', FALSE), (86, 5, 'L6', FALSE);

-- Venue 4, Section 6 (Upper Bowl): seats U1-U6
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (87, 6, 'U1', FALSE), (88, 6, 'U2', FALSE),
    (89, 6, 'U3', FALSE), (90, 6, 'U4', FALSE),
    (91, 6, 'U5', FALSE), (92, 6, 'U6', FALSE);

-- Venue 5, Section 7 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (93, 7, 'G1', FALSE), (94, 7, 'G2', FALSE),
    (95, 7, 'G3', FALSE), (96, 7, 'G4', FALSE),
    (97, 7, 'G5', FALSE), (98, 7, 'G6', FALSE),
    (99, 7, 'G7', FALSE), (100, 7, 'G8', FALSE),
    (101, 7, 'G9', FALSE), (102, 7, 'G10', FALSE);

-- Venue 6, Section 8 (General): seats G1-G10
-- G1 is accessible
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (103, 8, 'G1', TRUE), (104, 8, 'G2', FALSE),
    (105, 8, 'G3', FALSE), (106, 8, 'G4', FALSE),
    (107, 8, 'G5', FALSE), (108, 8, 'G6', FALSE),
    (109, 8, 'G7', FALSE), (110, 8, 'G8', FALSE),
    (111, 8, 'G9', FALSE), (112, 8, 'G10', FALSE);

-- Venue 7, Section 9 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (113, 9, 'G1', FALSE), (114, 9, 'G2', FALSE),
    (115, 9, 'G3', FALSE), (116, 9, 'G4', FALSE),
    (117, 9, 'G5', FALSE), (118, 9, 'G6', FALSE),
    (119, 9, 'G7', FALSE), (120, 9, 'G8', FALSE),
    (121, 9, 'G9', FALSE), (122, 9, 'G10', FALSE);

-- Venue 8, Section 10 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (123, 10, 'G1', FALSE), (124, 10, 'G2', FALSE),
    (125, 10, 'G3', FALSE), (126, 10, 'G4', FALSE),
    (127, 10, 'G5', FALSE), (128, 10, 'G6', FALSE),
    (129, 10, 'G7', FALSE), (130, 10, 'G8', FALSE),
    (131, 10, 'G9', FALSE), (132, 10, 'G10', FALSE);

-- Venue 9, Section 11 (General): seats G1-G10
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (133, 11, 'G1', FALSE), (134, 11, 'G2', FALSE),
    (135, 11, 'G3', FALSE), (136, 11, 'G4', FALSE),
    (137, 11, 'G5', FALSE), (138, 11, 'G6', FALSE),
    (139, 11, 'G7', FALSE), (140, 11, 'G8', FALSE),
    (141, 11, 'G9', FALSE), (142, 11, 'G10', FALSE);

-- Venue 10, Section 12 (General): seats G1-G10
-- G1 is accessible
INSERT INTO Seat (seat_id, section_id, name, is_accessible)
VALUES
    (143, 12, 'G1', TRUE), (144, 12, 'G2', FALSE),
    (145, 12, 'G3', FALSE), (146, 12, 'G4', FALSE),
    (147, 12, 'G5', FALSE), (148, 12, 'G6', FALSE),
    (149, 12, 'G7', FALSE), (150, 12, 'G8', FALSE),
    (151, 12, 'G9', FALSE), (152, 12, 'G10', FALSE);


-- Concerts (3 total)
-- Concert 1: 50 tickets sold (Q1)
-- Concert 2: 0 tickets sold (Q1)
-- Concert 3: 5 tickets sold, between 0 and 50 exclusive (Q1)
INSERT INTO Concert (concert_id, venue_id, name, datetime)
VALUES
    (1, 1, 'Mariah Carey - Merry Christmas to All',
        '2026-12-20 20:00:00'),
    (2, 6, 'Jazz Night',
        '2026-07-15 19:00:00'),
    (3, 3, 'Indie Showcase',
        '2026-08-10 21:00:00');


-- SectionPrice
-- Prices for each (concert, section) combination.
INSERT INTO SectionPrice
    (price_id, concert_id, section_id, amount) VALUES
    (1, 1, 1, 150.00),   -- Concert 1, Orchestra
    (2, 1, 2, 75.00),    -- Concert 1, Balcony
    (3, 2, 8, 40.00),    -- Concert 2, General (Venue 6)
    (4, 3, 4, 25.00);    -- Concert 3, General (Venue 3)


-- AppUser (5 total)
-- User 1 buys 26 tickets (Q4 requires >= 25)
INSERT INTO AppUser (user_id, username) VALUES
    (1, 'concertfan99'),
    (2, 'musiclover42'),
    (3, 'jazzcat'),
    (4, 'rockstar'),
    (5, 'popqueen');


-- Purchase (3 total)
INSERT INTO Purchase (purchase_id, user_id, datetime) VALUES
    (1, 1, '2026-11-01 10:00:00'),
    (2, 2, '2026-11-02 14:30:00'),
    (3, 3, '2026-07-01 09:00:00');


-- Tickets (55 total)
-- Concert 1 (Venue 1, 60 seats): 50 tickets sold
--   Purchase 1 (User 1): seats 1-26  (Orchestra, $150 each)
--   Purchase 2 (User 2): seats 27-30 (Orchestra, $150 each)
--                         seats 31-50 (Balcony,   $75 each)
--   Total value: 30*150 + 20*75 = $6,000
--
-- Concert 2 (Venue 6, 10 seats): 0 tickets sold
-- Concert 3 (Venue 3, 10 seats): 5 tickets sold
--   Purchase 3 (User 3): seats 71-75 (General, $25 each)
--   Total value: 5*25 = $125

-- Purchase 1: User 1, Concert 1, seats 1-26
INSERT INTO Ticket
    (ticket_id, purchase_id, concert_id, seat_id) VALUES
    (1, 1, 1, 1),   (2, 1, 1, 2),   (3, 1, 1, 3),
    (4, 1, 1, 4),   (5, 1, 1, 5),   (6, 1, 1, 6),
    (7, 1, 1, 7),   (8, 1, 1, 8),   (9, 1, 1, 9),
    (10, 1, 1, 10), (11, 1, 1, 11), (12, 1, 1, 12),
    (13, 1, 1, 13), (14, 1, 1, 14), (15, 1, 1, 15),
    (16, 1, 1, 16), (17, 1, 1, 17), (18, 1, 1, 18),
    (19, 1, 1, 19), (20, 1, 1, 20), (21, 1, 1, 21),
    (22, 1, 1, 22), (23, 1, 1, 23), (24, 1, 1, 24),
    (25, 1, 1, 25), (26, 1, 1, 26);

-- Purchase 2: User 2, Concert 1, seats 27-50
INSERT INTO Ticket
    (ticket_id, purchase_id, concert_id, seat_id) VALUES
    (27, 2, 1, 27), (28, 2, 1, 28), (29, 2, 1, 29),
    (30, 2, 1, 30), (31, 2, 1, 31), (32, 2, 1, 32),
    (33, 2, 1, 33), (34, 2, 1, 34), (35, 2, 1, 35),
    (36, 2, 1, 36), (37, 2, 1, 37), (38, 2, 1, 38),
    (39, 2, 1, 39), (40, 2, 1, 40), (41, 2, 1, 41),
    (42, 2, 1, 42), (43, 2, 1, 43), (44, 2, 1, 44),
    (45, 2, 1, 45), (46, 2, 1, 46), (47, 2, 1, 47),
    (48, 2, 1, 48), (49, 2, 1, 49), (50, 2, 1, 50);

-- Purchase 3: User 3, Concert 3, seats 71-75
INSERT INTO Ticket
    (ticket_id, purchase_id, concert_id, seat_id) VALUES
    (51, 3, 3, 71), (52, 3, 3, 72), (53, 3, 3, 73),
    (54, 3, 3, 74), (55, 3, 3, 75);
