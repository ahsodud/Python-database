SELECT book.title FROM book
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON bookgenre.gid = genre.gid
JOIN rating ON book.isbn = rating.isbn
WHERE genre.genrename = 'Fiction' AND rating.rating = '10';
