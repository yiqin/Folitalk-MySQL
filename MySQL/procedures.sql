/* 1 */
/* Create Tweet, no need to assign tweetID */
DROP PROCEDURE IF EXISTS addTweet;

DELIMITER $$
CREATE PROCEDURE addTweet(
	IN addWriterName varchar(255),
	IN addContent varchar(255))
BEGIN
	INSERT INTO Tweet(tweetID, writerName, content)
	VALUES('0', addWriterName, addContent);
END $$
DELIMITER ;


/* 2 */
/* Set the maximum length of the tweet. */
DROP PROCEDURE IF EXISTS NoShortTweet;

DELIMITER $$
CREATE PROCEDURE NoShortTweet(
	IN TweetLength int)
BEGIN
	DECLARE aTweetID int;
	DECLARE aWriterName varchar(255);
	DECLARE aContent varchar(255);
	DECLARE flag int DEFAULT 0;
	DECLARE findTweets CURSOR FOR
		SELECT tweetID, writerName, content
		FROM Tweet;
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND
		SET flag = 1;
	OPEN findTweets;
	REPEAT
		FETCH findTweets INTO aTweetID, aWriterName, aContent;
		IF (char_length(aContent) > TweetLength) THEN
			UPDATE Tweet SET content = SUBSTRING(aContent, 1, TweetLength)
			WHERE tweetID = aTweetID;
		END IF;
	UNTIL flag = 1
	END REPEAT;
	CLOSE findTweets;
END $$
DELIMITER ;


/* 3 */
/* Auto-Follow. When a new user is created, we assign him some default users. */
DROP PROCEDURE IF EXISTS NewUser;

DELIMITER $$
CREATE PROCEDURE NewUser(
	IN NewUserName varchar(255),
	IN NewUserTimezone varchar(255),
	IN NewUserLanguage varchar(255),
	IN NewUserEmail varchar(255))
BEGIN
	INSERT INTO User(name, timezone, language, email)
	VALUES(NewUserName, NewUserTimezone, NewUserLanguage, NewUserEmail);
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
END $$
DELIMITER ;







