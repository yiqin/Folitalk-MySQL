START TRANSACTION;
/* 1 */
/* Just show latest tweets. */
SELECT * FROM Tweet
WHERE tweetID > '25420';

INSERT INTO Tweet(tweetID, writerName, content)
VALUES('294437', 'user553', 'tweet-meaningless.tweet-meaningless.tweet-meaningless.tweet-meaningless.');

/* We can see there are no duplicate tweetIDs in the tweet. */
SELECT * FROM Tweet
WHERE tweetID > '25420';


/* 2 */
/* user9999 have already existed. We can check the database. */
SELECT * FROM User
WHERE name = 'user9999';

/* Now we insert user9999 again. It shows a message */
INSERT INTO User(name, timezone, language, email)
VALUES('user9999','PST', 'English', 'yiqin@uchicago.edu');


/* 3 */
/*Prepare for the trigger to make sure we have user8251 and his follow. */
INSERT INTO User(name, timezone, language, email)
VALUES('user8251','PST', 'English', 'yiqin@uchicago.edu');

INSERT INTO Follow(username_leader, username_follower)
VALUES('user8251','Taylor Swift');
INSERT INTO Follow(username_leader, username_follower)
VALUES('user8251','Objective-C');
INSERT INTO Follow(username_leader, username_follower)
VALUES('user8251','Swift');
INSERT INTO Follow(username_leader, username_follower)
VALUES('user8251','Facebook');
INSERT INTO Follow(username_leader, username_follower)
VALUES('Apple','user8251');
INSERT INTO Follow(username_leader, username_follower)
VALUES('Google','user8251');
INSERT INTO Follow(username_leader, username_follower)
VALUES('MHacks','user8251');
INSERT INTO Follow(username_leader, username_follower)
VALUES('Uchicago','user8251');


/* Before delete */
SELECT * FROM User
WHERE name = 'user8251';

SELECT * FROM Follow
WHERE username_leader = 'user8251'
OR username_follower = 'user8251';


/* Delete */
DELETE FROM User
WHERE name = 'user8251';


/* After delete */
SELECT 'After deleting user8251, the database also delete him in Follow.' as ''; 

SELECT * FROM User
WHERE name = 'user8251';

SELECT * FROM Follow
WHERE username_leader = 'user8251'
OR username_follower = 'user8251';


ROLLBACK;