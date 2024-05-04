SELECT author.authorname, AVG(rating.rating) AS avg_rating FROM author
JOIN authorbook ON author.aid = authorbook.aid
JOIN rating ON authorbook.isbn = rating.isbn
GROUP BY author.aid, author.authorname
HAVING COUNT(DISTINCT authorbook.isbn) >= 3
ORDER BY avg_rating DESC
LIMIT 5;
