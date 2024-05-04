SELECT book.title
FROM book
JOIN authorbook ON book.isbn = authorbook.isbn
JOIN author ON author.aid = authorbook.aid
WHERE author.authorname = 'Anne Rice';