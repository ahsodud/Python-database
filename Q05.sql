SELECT users.username FROM users
JOIN friendship ON users.uid = friendship.user1
GROUP BY users.uid, users.username
ORDER BY COUNT(friendship.user2) DESC
LIMIT 1;
