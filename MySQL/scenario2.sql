START TRANSACTION;

/* 1 */
/* Just show latest tweets. */
SELECT * FROM Tweet
WHERE tweetID > '25420';

CALL addTweet('user553', 'tweet-meaningless.tweet-meaningless.tweet-meaningless.tweet-meaningless.');
CALL addTweet('user553', 't.');
/* We can see there are no duplicate tweetIDs in the tweet. */
SELECT * FROM Tweet
WHERE tweetID > '25420';


/* 2 */
/* Set the maximum length of the tweet. Here, we set it to 10.*/
CALL NoShortTweet('10');

SELECT * FROM Tweet
WHERE tweetID > '25420';


/* 3 */
/* Auto-Follow. When a new user is created, we assign him some default users. */

/* Delete */
DELETE FROM User
WHERE name = 'user8251';

/* Since we have setup the trigger, it shows empty. */
SELECT * FROM User
WHERE name = 'user8251';

SELECT * FROM Follow
WHERE username_leader = 'user8251'
OR username_follower = 'user8251';

/* Create new user */
CALL NewUser('user8251','PST', 'English', 'yiqin@uchicago.edu');

/* Finally we create a lot of stuff. */
SELECT * FROM User
WHERE name = 'user8251';

SELECT * FROM Follow
WHERE username_leader = 'user8251'
OR username_follower = 'user8251';


ROLLBACK;