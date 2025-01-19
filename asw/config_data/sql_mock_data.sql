-- Sample data for Owner
INSERT INTO Owner (name) VALUES
('John Doe'),
('Jane Smith'),
('Emily Johnson'),
('Michael Brown'),
('Sarah Adams'),
('David Wilson'),
('Lisa Taylor'),
('Robert Jones'),
('Jennifer Lee'),
('Matthew Miller');

-- Sample data for Artist
INSERT INTO Artist (name, date_of_birth, date_of_death, nationality) VALUES
('Leonardo da Vinci', '1452-04-15', '1519-05-02', 'Italian'),
('Vincent van Gogh', '1853-03-30', '1890-07-29', 'Dutch'),
('Pablo Picasso', '1881-10-25', '1973-04-08', 'Spanish'),
('Claude Monet', '1840-11-14', '1926-12-05', 'French'),
('Michelangelo', '1475-03-06', '1564-02-18', 'Italian'),
('Rembrandt', '1606-07-15', '1669-10-04', 'Dutch'),
('Georgia O''Keeffe', '1887-11-15', '1986-03-06', 'American'),
('Salvador Dalí', '1904-05-11', '1989-01-23', 'Spanish'),
('Andy Warhol', '1928-08-06', '1987-02-22', 'American'),
('Frida Kahlo', '1907-07-06', '1954-07-13', 'Mexican');

-- Sample data for Tapestry
INSERT INTO Tapestry (title, estimated_value, current_location, acquisition_date, insurance_value, artist_id, owner_id) VALUES
('Mona Lisa', 1000000.00, 'Gallery Room 1', '1503-07-01', 1500000.00, 1, 1),
('Starry Night', 800000.00, 'Gallery Room 2', '1889-06-01', 1200000.00, 2, 2),
('Guernica', 2000000.00, 'Gallery Room 3', '1937-05-01', 2500000.00, 3, 3),
('Water Lilies', 1200000.00, 'Gallery Room 4', '1916-01-01', 1800000.00, 4, 4),
('The Creation of Adam', 1500000.00, 'Gallery Room 5', '1512-10-01', 2000000.00, 5, 5),
('The Night Watch', 1800000.00, 'Gallery Room 6', '1642-05-01', 2200000.00, 6, 6),
('Red Poppy', 600000.00, 'Gallery Room 7', '1927-03-01', 900000.00, 7, 7),
('The Persistence of Memory', 1400000.00, 'Gallery Room 8', '1931-01-01', 2100000.00, 8, 8),
('Campbell''s Soup Cans', 1000000.00, 'Gallery Room 9', '1962-01-01', 1500000.00, 9, 9),
('The Two Fridas', 900000.00, 'Gallery Room 10', '1939-07-01', 1350000.00, 10, 10);

-- Sample data for Exhibition
INSERT INTO Exhibition (title, start_date, finish_date, venue) VALUES
('Renaissance Masterpieces', '2024-01-15', '2024-02-15', 'Art Museum'),
('Impressionist Gems', '2024-03-01', '2024-04-01', 'Contemporary Gallery'),
('Cubism Revolution', '2024-05-15', '2024-06-15', 'Modern Art Gallery'),
('Baroque Elegance', '2024-07-01', '2024-08-01', 'Metropolitan Museum'),
('Abstract Expressionism', '2024-09-15', '2024-10-15', 'National Gallery'),
('Surrealist Dreams', '2024-11-01', '2024-12-01', 'Tate Modern'),
('Pop Art Extravaganza', '2025-01-15', '2025-02-15', 'Whitney Museum'),
('Minimalist Vision', '2025-03-01', '2025-04-01', 'Guggenheim Museum'),
('Postmodern Reflections', '2025-05-15', '2025-06-15', 'Centre Pompidou'),
('Contemporary Innovations', '2025-07-01', '2025-08-01', 'Museum of Contemporary Art');

-- Sample data for Sponsor
INSERT INTO Sponsor (name) VALUES
('Artists Foundation'),
('Arts Alliance'),
('Creative Minds Inc.'),
('Heritage Art Trust'),
('Art Lovers Society'),
('Visionary Arts Fund'),
('Modern Art Initiative'),
('Creative Expression Foundation'),
('Artistic Endeavors Group'),
('Culture Enthusiasts Association');


-- Sample data for Exhibition_Sponsor
INSERT INTO Exhibition_Sponsor (exhibition_id, sponsor_id) VALUES
(1, 1), -- Renaissance Masterpieces sponsored by Artists Foundation
(1, 2), -- Renaissance Masterpieces sponsored by Arts Alliance
(2, 3), -- Impressionist Gems sponsored by Creative Minds Inc.
(2, 4), -- Impressionist Gems sponsored by Heritage Art Trust
(3, 5), -- Cubism Revolution sponsored by Art Lovers Society
(3, 6), -- Cubism Revolution sponsored by Visionary Arts Fund
(4, 7), -- Baroque Elegance sponsored by Modern Art Initiative
(4, 8), -- Baroque Elegance sponsored by Creative Expression Foundation
(5, 9), -- Abstract Expressionism sponsored by Artistic Endeavors Group
(5, 10); -- Abstract Expressionism sponsored by Culture Enthusiasts Association


-- Sample data for Tapestry_Exhibition
INSERT INTO Tapestry_Exhibition (tapestry_id, exhibition_id) VALUES
(1, 1), -- Mona Lisa exhibited at Renaissance Masterpieces
(2, 2), -- Starry Night exhibited at Impressionist Gems
(3, 3), -- Guernica exhibited at Cubism Revolution
(4, 4), -- Water Lilies exhibited at Baroque Elegance
(5, 5), -- The Creation of Adam exhibited at Abstract Expressionism
(6, 6), -- The Night Watch exhibited at Surrealist Dreams
(7, 7), -- Red Poppy exhibited at Pop Art Extravaganza
(8, 8), -- The Persistence of Memory exhibited at Minimalist Vision
(9, 9), -- Campbell's Soup Cans exhibited at Postmodern Reflections
(10, 10); -- The Two Fridas exhibited at Contemporary Innovations
