DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS UserBooks CASCADE;
DROP TABLE IF EXISTS Books CASCADE;

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_not_hashed TEXT NOT NULL
);

CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    author TEXT NOT NULL,
    title TEXT NOT NULL,
    publisher TEXT NOT NULL,
    publisher_address TEXT NOT NULL,
    publication_year INT NOT NULL
);

CREATE TABLE UserBooks (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(id),
    book_id INT NOT NULL REFERENCES Books(id),
    UNIQUE(user_id, book_id)
);

INSERT INTO books (author, title, publisher, publisher_address, publication_year) 
VALUES  ('Martin, Robert','Clean Code: A Handbook of Agile Software Craftsmanship', 'Prentice Hall', '', 2008),
        ('Hawking, Stephen','A Brief History of Time: From the Big Bang to Black Holes', 'Bantam', '', 1988);
