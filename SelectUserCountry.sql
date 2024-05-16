SELECT country.countryname, COUNT(DISTINCT rating.isbn) FROM country
JOIN users ON country.iso_3166 = users.iso_3166
JOIN rating ON users.uid = rating.uid
GROUP BY country.countryname;
