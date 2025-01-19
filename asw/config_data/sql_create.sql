-- Table: Owner
CREATE TABLE Owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: Artist
CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_death DATE,
    nationality VARCHAR(255) NOT NULL
);

-- Table: Tapestry
CREATE TABLE Tapestry (
    tapestry_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    estimated_value DECIMAL(10, 2) NOT NULL,
    current_location VARCHAR(255) NOT NULL,
    acquisition_date DATE NOT NULL,
    insurance_value DECIMAL(10, 2) NOT NULL,
    artist_id INT,
    owner_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

-- Table: Exhibition
CREATE TABLE Exhibition (
    exhibition_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    finish_date DATE NOT NULL,
    venue VARCHAR(255) NOT NULL
);

-- Table: Sponsor
CREATE TABLE Sponsor (
    sponsor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: Tapestry_Exhibition (to represent Many-to-Many relationship)
CREATE TABLE Tapestry_Exhibition (
    tapestry_id INT,
    exhibition_id INT,
    PRIMARY KEY (tapestry_id, exhibition_id),
    FOREIGN KEY (tapestry_id) REFERENCES Tapestry(tapestry_id),
    FOREIGN KEY (exhibition_id) REFERENCES Exhibition(exhibition_id)
);

-- Table: Exhibition_Sponsor (to represent Many-to-Many relationship)
CREATE TABLE Exhibition_Sponsor (
    exhibition_id INT,
    sponsor_id INT,
    PRIMARY KEY (exhibition_id, sponsor_id),
    FOREIGN KEY (exhibition_id) REFERENCES Exhibition(exhibition_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id)
);
