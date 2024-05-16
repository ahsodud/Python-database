SELECT author.authorname, COUNT(*) AS times_read FROM author
JOIN authorbook ON author.aid = authorbook.aid
JOIN rating ON authorbook.isbn = rating.isbn
JOIN (
    SELECT rating.uid FROM rating
    JOIN bookgenre ON rating.isbn = bookgenre.isbn
    GROUP BY rating.uid
    HAVING COUNT(DISTINCT bookgenre.gid) >= 3
) AS users_with_3_genres ON rating.uid = users_with_3_genres.uid
GROUP BY author.aid, author.authorname
ORDER BY times_read DESC
LIMIT 3;
