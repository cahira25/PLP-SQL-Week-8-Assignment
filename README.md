# PLP-SQL-Week-8-Assignment

**Complete Database Management System**
_Library Management System_
**Database Design Overview:**
_Tables:_
Books: Contains information about the books.
Patrons: Stores information about library members (who borrow books).
Loans: Tracks book loans by patrons.
Authors: Contains authors' details.
Book_Authors: A many-to-many relationship table between books and authors (since books can have multiple authors and authors can write multiple books).

_Relationships:_
1:M between Patrons and Loans (a patron can borrow multiple books).
M:M between Books and Authors (a book can have multiple authors and an author can write multiple books).

**How the Database Works:**
Patrons can borrow Books.
Each Loan tracks which Patron borrowed which Book and when.
A Book can have multiple Authors, and each Author can write multiple Books (many-to-many relationship).

