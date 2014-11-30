/*1*/
/*Find all pairs of users that followered by at least one user in common*/
SELECT DISTINCT F_1.username_leader AS user1, 
F_2.username_leader AS user2
FROM Follow F_1 JOIN Follow F_2
USING (username_follower)
WHERE F_1.username_leader != F_2.username_leader;

/*2*/
/*Find the tweets favorated by at least one user.*/
SELECT Tweet.tweetID,Tweet.writerName,Tweet.content
FROM Tweet
NATURAL JOIN Favorite;

/*3*/
/*List all users and their tweets, if known.*/
SELECT u.name AS user, t.tweetID As tweetID, t.content As tweetContent
FROM User u LEFT OUTER JOIN Tweet t
ON u.name = t.writerName
WHERE t.tweetID IS NULL;

/*4*/
/*Find super active users (send more than four tweets) who also have at least one follower. We call this kind of users super active and popular users.*/
SELECT writerName
FROM Tweet
JOIN (SELECT username_leader, COUNT(username_follower) AS COUNTUsername_follower
FROM Follow
GROUP BY username_leader) popularUser
ON Tweet.writerName = popularUser.username_leader
GROUP BY writerName
HAVING COUNT(*) > 4;

/*5*/
/*Find the tweets favorated by at least two user.*/
SELECT Tweet.writerName, Tweet.tweetID, Tweet.content, COUNTFavoriteTweet.favoriteNumber
FROM Tweet JOIN (SELECT tweetID AS favorateTweetID, COUNT(TweetID) AS favoriteNumber
FROM Favorite
GROUP BY(TweetID)
HAVING (COUNT(TweetID))>1
) AS COUNTFavoriteTweet
ON Tweet.tweetID = COUNTFavoriteTweet.favorateTweetID;

/*6*/
/*Find the user who wrote at least one tweet and has at least one follower*/
SELECT DISTINCT U.name
FROM User U
INNER JOIN Tweet T ON T.writerName = U.name
INNER JOIN Follow F ON F.username_leader = U.name;

/*7*/
/*Find all user who follow one of user3377's leader*/
SELECT DISTINCT username_follower
FROM Follow f
JOIN (SELECT username_leader
FROM Follow
WHERE username_follower = 'user3377') User1Follows
ON f.username_follower = User1Follows.username_leader;

/*8*/
/*Find the tweets that is sent by the user (name) who tweet most.*/
SELECT Tweet.writerName, Tweet.tweetID, Tweet.content
FROM Tweet JOIN
(SELECT writerName, COUNT(writerName)
FROM Tweet
GROUP BY writerName
HAVING COUNT(writerName) >= ALL
(SELECT COUNT(writerName)
FROM Tweet
GROUP BY writerName) ) AS MostActiveUser
ON (Tweet.writerName = MostActiveUser.writerName);

/*9*/
/*Find the tweets that is sent by the user (name) who have the most followers*/
SELECT Tweet.writerName, Tweet.tweetID, Tweet.content
FROM Tweet JOIN
(SELECT username_leader AS name, COUNT(username_leader)
FROM Follow
GROUP BY username_leader
HAVING COUNT(username_leader) >= ALL
(SELECT COUNT(username_leader)
FROM Follow
GROUP BY username_leader) ) AS MostFollowerUser
ON (Tweet.writerName = MostFollowerUser.name);

/*10*/
/*Find all followers of the user who sent the most favorite tweet.*/
SELECT username_follower
FROM Follow
WHERE username_leader =
(SELECT Tweet.writerName
FROM Tweet JOIN
(SELECT tweetID, COUNT(tweetID)
FROM Favorite
GROUP BY tweetID
HAVING COUNT(tweetID) >= ALL
(SELECT COUNT(tweetID)
FROM Favorite
GROUP BY tweetID)) AS MostFavoriteTweet
ON (Tweet.tweetID = MostFavoriteTweet.tweetID));

