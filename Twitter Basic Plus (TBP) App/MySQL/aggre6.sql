/*Find users who send more tweets than the number of tweets sent by user1*/
SELECT COUNTUser.writerName, COUNTUser.COUNTTweets
FROM (SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName) AS COUNTUser
WHERE COUNTUser.COUNTTweets > 
(SELECT COUNT(writerName)
FROM Tweet
WHERE writerName = 'user1');

/*Find the user (name) who tweet most.*/
SELECT writerName, COUNT(writerName)
FROM Tweet
GROUP BY writerName
HAVING COUNT(writerName) >= ALL
(SELECT COUNT(writerName)
FROM Tweet
GROUP BY writerName);

/*Find the user (name) who have the most followers.*/
SELECT username_leader, COUNT(username_leader)
FROM Follow
GROUP BY username_leader
HAVING COUNT(username_leader) >= ALL
(SELECT COUNT(username_leader)
FROM Follow
GROUP BY username_leader);

SELECT username_follower, COUNT(username_follower)
FROM Follow
GROUP BY username_follower
HAVING COUNT(username_follower) >= ALL
(SELECT COUNT(username_follower)
FROM Follow
GROUP BY username_follower);


SELECT tweetID, COUNT(tweetID)
FROM Favorite
GROUP BY tweetID
HAVING COUNT(tweetID) >= ALL
(SELECT COUNT(tweetID)
FROM Favorite
GROUP BY tweetID);










