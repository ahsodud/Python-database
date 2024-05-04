SELECT country.countryname, users.username, COUNT(rating.isbn) FROM country
JOIN users ON country.iso_3166 = users.iso_3166
JOIN rating ON users.uid = rating.uid
WHERE (users.uid, rating.isbn) IN (
    SELECT rating.uid, rating.isbn FROM rating
    GROUP BY rating.uid, rating.isbn
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY country.countryname, users.uid, users.username;
