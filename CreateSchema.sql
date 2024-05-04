DROP TABLE IF EXISTS Book, Author, Genre, Users, Country, BookGenre, AuthorBook, Friendship, Rating;

CREATE TABLE Country (
    ISO_3166 CHAR(2) PRIMARY KEY,
    CountryName VARCHAR(256),
    CID VARCHAR(16)
);
CREATE TABLE Users (
    UID SERIAL PRIMARY KEY,
    Username VARCHAR(256),
    DoB VARCHAR(16),
    Age VARCHAR(6),
    ISO_3166 CHAR(2)
);
CREATE TABLE Book (
    ISBN VARCHAR(17) PRIMARY KEY,
    Title VARCHAR(256),
    Published VARCHAR(16),
    Pages VARCHAR(16),
    Language VARCHAR(256)
);
CREATE TABLE Rating (
    UID SERIAL,
    ISBN VARCHAR(17),
    PRIMARY KEY (UID,ISBN),
    Rating VARCHAR(16)
);
CREATE TABLE Friendship (
    User1 INT,
    User2 INT,
    PRIMARY KEY (User1, User2),
    CONSTRAINT columns_cannot_equal CHECK (User1 <> User2)
);
CREATE TABLE Author (
    AID SERIAL PRIMARY KEY,
    AuthorName VARCHAR (256)
);
CREATE TABLE AuthorBook (
    AID SERIAL,
    ISBN VARCHAR(17),
    PRIMARY KEY (AID,ISBN)
);
CREATE TABLE Genre (
    GID SERIAL PRIMARY KEY,
    GenreName VARCHAR (1024)
);
CREATE TABLE BookGenre (
    ISBN VARCHAR(17) REFERENCES Book (ISBN),
    GID SERIAL REFERENCES Genre (GID),
    PRIMARY KEY (ISBN,GID)
);
