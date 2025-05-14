-- Create the 'Authors' table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    FirstName VARCHAR(100) NOT NULL,           -- First Name of the Author
    LastName VARCHAR(100) NOT NULL,            -- Last Name of the Author
    BirthYear INT,                             -- Birth Year of the Author
    UNIQUE (FirstName, LastName)               -- Ensuring no two authors with same first and last names
);

-- Create the 'Books' table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    Title VARCHAR(255) NOT NULL,                -- Title of the Book
    ISBN VARCHAR(20) UNIQUE,                    -- ISBN of the Book (Unique)
    PublishYear INT,                            -- Year the Book was Published
    Genre VARCHAR(100),                         -- Genre of the Book
    StockQuantity INT NOT NULL DEFAULT 0        -- Number of copies available in stock
);

-- Create the 'Patrons' table
CREATE TABLE Patrons (
    PatronID INT AUTO_INCREMENT PRIMARY KEY,    -- Primary Key
    FirstName VARCHAR(100) NOT NULL,             -- First Name of the Patron
    LastName VARCHAR(100) NOT NULL,              -- Last Name of the Patron
    Email VARCHAR(255) UNIQUE,                   -- Unique email for the Patron
    JoinDate DATE NOT NULL DEFAULT CURRENT_DATE  -- Date the Patron joined
);

-- Create the 'Loans' table to track which patron borrowed which book
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,      -- Primary Key
    PatronID INT,                               -- Foreign Key from Patrons table
    BookID INT,                                 -- Foreign Key from Books table
    LoanDate DATE NOT NULL DEFAULT CURRENT_DATE, -- Date the Book was borrowed
    ReturnDate DATE,                            -- Date the Book was returned
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID) ON DELETE CASCADE,  -- Foreign Key Constraint
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE       -- Foreign Key Constraint
);

-- Create the 'Book_Authors' table to handle many-to-many relationship
CREATE TABLE Book_Authors (
    BookID INT,                                 -- Foreign Key from Books table
    AuthorID INT,                               -- Foreign Key from Authors table
    PRIMARY KEY (BookID, AuthorID),             -- Composite Primary Key
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,   -- Foreign Key Constraint
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE -- Foreign Key Constraint
);
