SELECT DISTINCT book.title FROM book
JOIN bookgenre ON book.isbn = bookgenre.isbn
JOIN genre ON genre.gid = bookgenre.gid
JOIN rating ON rating.isbn = book.isbn
JOIN users ON rating.uid = users.uid
JOIN country ON users.iso_3166 = country.iso_3166
WHERE book.language != 'English'
  AND rating.rating > '8'
  AND country.countryname IN ('US', 'GB', 'CA', 'AU');
