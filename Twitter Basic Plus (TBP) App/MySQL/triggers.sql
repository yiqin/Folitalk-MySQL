/* 1 */
/* The system will assign a Tweet ID no matter what value it uses. 
   Get the current maximum tweetID, and increment it.
   Tweet must be within 20 character length. */
DELIMITER $$
DROP TRIGGER IF EXISTS TweetLengthInsertTrigger;

CREATE TRIGGER TweetLengthInsertTrigger
	BEFORE INSERT ON Tweet 
	FOR EACH ROW
	BEGIN
		SET NEW.tweetID = (SELECT MAX(tweetID) FROM Tweet)+1;
		IF (char_length(NEW.content) > 20 ) THEN
			SET NEW.content = SUBSTRING(NEW.content, 1, 20);
		END IF;
	END $$
DELIMITER ;


/* 2 */
/* No duplicate username */
DELIMITER $$
DROP TRIGGER IF EXISTS UserNameInsertTrigger;

CREATE TRIGGER UserNameInsertTrigger
	BEFORE INSERT ON User 
	FOR EACH ROW
	BEGIN
		IF (NEW.name = ANY (SELECT name FROM User)) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate insert. Please choose another username';
		END IF;
	END $$
DELIMITER ;


/* 3 */
/* When the user is deleted, it also effect on Follows. */
DELIMITER $$
DROP TRIGGER IF EXISTS UserNameDeleteTrigger;

CREATE TRIGGER UserNameDeleteTrigger
	AFTER DELETE ON User 
	FOR EACH ROW
	BEGIN
		DELETE FROM Follow
		WHERE username_follower = OLD.name;
		DELETE FROM Follow
		WHERE username_leader = OLD.name;
	END $$
DELIMITER ;







