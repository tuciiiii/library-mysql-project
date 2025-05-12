CREATE DATABASE LibraryDB; 
USE LibraryDB; 
 
 CREATE TABLE Publishers ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL 
); 

CREATE TABLE Authors ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL 
); 
 
CREATE TABLE Genres ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    genre_name VARCHAR(50) NOT NULL 
); 
 
 
CREATE TABLE Books ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    author_id INT, 
    pages INT, 
    year_published INT, 
    publisher_id INT, 
    CONSTRAINT FOREIGN KEY (publisher_id) REFERENCES Publishers(id), 
    UNIQUE KEY (title, author_id, year_published)     
); 

CREATE TABLE Magazines ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    volume INT, 
    year_published INT, 
    publisher_id INT, 
    CONSTRAINT FOREIGN KEY (publisher_id) REFERENCES Publishers(id), 
    UNIQUE KEY (title, publisher_id, volume) 
); 
 
 CREATE TABLE Users ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(50) NOT NULL UNIQUE, 
    password VARCHAR(100) NOT NULL, 
    email VARCHAR(255) NOT NULL UNIQUE, 
    last_activity TIMESTAMP 
); 
 
CREATE TABLE GenresBooks( 
    book_id INT NOT NULL, 
    genre_id INT NOT NULL, 
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES Books(id), 
    CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genres(id), 
    PRIMARY KEY (book_id, genre_id) 
); 
 
CREATE TABLE AuthorsBooks( 
    author_id INT NOT NULL, 
    book_id INT NOT NULL, 
    CONSTRAINT FOREIGN KEY (author_id) REFERENCES Authors(id),  
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES Books(id), 
    PRIMARY KEY (author_id, book_id) 
); 
 
 
CREATE TABLE GenresMagazines( 
    magazine_id INT NOT NULL, 
    genre_id INT NOT NULL, 
    CONSTRAINT FOREIGN KEY (magazine_id) REFERENCES Magazines(id), 
    CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genres(id), 
    PRIMARY KEY (magazine_id, genre_id) 
); 
 
 
CREATE TABLE UserReadings ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    user_id INT, 
    book_id INT, 
    magazine_id INT, 
    pages_read INT, 
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id), 
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES Books(id), 
    CONSTRAINT FOREIGN KEY (magazine_id) REFERENCES Magazines(id) 
); 
 
CREATE TABLE Ratings ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    book_id INT, 
    magazine_id INT, 
    user_id INT, 
    rating FLOAT, 
    CONSTRAINT FOREIGN KEY (book_id) REFERENCES Books(id), 
    CONSTRAINT FOREIGN KEY (magazine_id) REFERENCES Magazines(id), 
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id) 
); 


INSERT INTO Publishers (name) VALUES 
('Orbit Books'), 
('Tor Publishing'), 
('Vintage Classics'), 
('Simon & Schuster'), 
('Bloomsbury'),
('Penguin Books'),
('Harlequin Enterprises');

INSERT INTO Authors (name) VALUES 
('George R.R. Martin'),   
('Gillian Flynn'),         
('Frank Herbert'),         
('Nicholas Sparks'),       
('John Green'),            
('J.K. Rowling'),          
('George Orwell'),         
('J.R.R. Tolkien'),        
('Jane Austen'),           
('Karen M. McManus');

INSERT INTO Genres (genre_name) VALUES 
('Fantasy'),
('Thriller'),
('Science Fiction'),
('Romance'),
('Drama'),
('Mystery');

INSERT INTO Books (title, author_id, pages, year_published, publisher_id) VALUES 
('A Game of Thrones', 1, 694, 1996, 1),
('Gone Girl', 2, 422, 2012, 4),
('Dune', 3, 412, 1965, 2),
('The Notebook', 4, 214, 1996, 7),
('The Fault in Our Stars', 5, 313, 2012, 3),
('Harry Potter and the Sorcerer\'s Stone', 6, 309, 1997, 5),
('1984', 7, 328, 1949, 6),
('The Hobbit', 8, 310, 1937, 2),
('Pride and Prejudice', 9, 279, 1813, 3),
('One of Us Is Lying', 10, 368, 2017, 4);

INSERT INTO Magazines (title, volume, year_published, publisher_id) VALUES 
('Sci-Fi Today', 58, 2024, 2),
('Crime Monthly', 32, 2023, 4),
('Romance Review', 17, 2025, 7),
('Fantasy Monthly', 9, 2022, 1),
('Romance Now', 4, 2024, 3);


INSERT INTO AuthorsBooks (author_id, book_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO GenresBooks (book_id, genre_id) VALUES 
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5),  
(6, 1),  
(7, 2),  
(8, 1),  
(9, 4), 
(10, 6); 


INSERT INTO Users (username, password, email, last_activity) VALUES 
('sandra_reads', 'safepass123', 'sandra@example.com', NOW()),
('alice', 'pass123', 'alice@example.com', NOW()),
('bob', 'secure456', 'bob@example.com', NOW()),
('charlie', 'mypassword', 'charlie@example.com', NOW()),
('diana', 'qwerty', 'diana@example.com', NOW()),
('evan', 'letmein', 'evan@example.com', NOW()),
('fiona', 'bookworm1', 'fiona@example.com', NOW()),
('george', 'readmore', 'george@example.com', NOW()),
('hannah', 'ilovebooks', 'hannah@example.com', NOW());

INSERT INTO Ratings (book_id, magazine_id, user_id, rating) VALUES 
(1, NULL, 1, 4.5), 
(2, NULL, 2, 4.0), 
(3, NULL, 3, 4.8), 
(4, NULL, 4, 3.9), 
(5, NULL, 5, 4.2),
(6, NULL, 1, 5.0),
(7, NULL, 2, 4.4),
(8, NULL, 3, 4.7),
(9, NULL, 4, 4.1),
(10, NULL, 5, 4.3);


INSERT INTO GenresMagazines (magazine_id, genre_id) VALUES 
(1, 3), 
(2, 6),  
(3, 4), 
(4, 1),
(5, 4);  

INSERT INTO UserReadings (user_id, book_id, magazine_id, pages_read) VALUES 
(1, 1, NULL, 200), 
(2, 2, NULL, 300),  
(3, 3, NULL, 412),  
(4, 4, NULL, 150),  
(5, 5, NULL, 313),  
(6, 6, NULL, 309),   
(7, 7, NULL, 328),   
(8, 8, NULL, 310),

(1, NULL, 1, 45),   
(2, NULL, 2, 30),   
(3, NULL, 3, 20),  
(4, NULL, 4, 15),   
(5, NULL, 5, 25),
(6, NULL, 1, 40),    
(7, NULL, 2, 33),    
(8, NULL, 3, 18);   


SELECT * FROM Books
WHERE year_published > 2010;

SELECT book_id, AVG(rating) AS average_rating
FROM Ratings
WHERE book_id IS NOT NULL
GROUP BY book_id;

SELECT Books.title, Authors.name
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.id;

SELECT Users.username, Books.title, UserReadings.pages_read
FROM Users
LEFT JOIN UserReadings ON Users.id = UserReadings.user_id
LEFT JOIN Books ON UserReadings.book_id = Books.id;

SELECT title
FROM Books
WHERE id IN (
    SELECT book_id
    FROM Ratings
    GROUP BY book_id
    HAVING AVG(rating) > 4.0
);

SELECT Users.username, SUM(UserReadings.pages_read) AS total_pages
FROM Users
JOIN UserReadings ON Users.id = UserReadings.user_id
GROUP BY Users.username;


DELIMITER $$

CREATE TRIGGER update_last_activity
BEFORE UPDATE ON Users
FOR EACH ROW
BEGIN
    SET NEW.last_activity = CURRENT_TIMESTAMP;
END$$

DELIMITER ;

SELECT id, username, last_activity FROM Users;

UPDATE Users
SET email = 'newemail@example.com'
WHERE id = 1;

SELECT id, username, last_activity FROM Users
WHERE id = 1;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_titles (
    title VARCHAR(255)
);

DELIMITER $$

CREATE PROCEDURE ListBookTitles()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE book_title VARCHAR(255);

    DECLARE book_cursor CURSOR FOR
        SELECT title FROM Books;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN book_cursor;

    read_loop: LOOP
        FETCH book_cursor INTO book_title;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
		INSERT INTO temp_titles(title) VALUES (book_title);
    END LOOP;

    CLOSE book_cursor;
END$$

DELIMITER ;

CALL ListBookTitles();
SELECT * FROM temp_titles;


DELIMITER $$

CREATE TRIGGER delete_user
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN

END $$
DELIMITER ;


