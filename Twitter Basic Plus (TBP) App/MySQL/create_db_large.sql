/* Drop class first.*/
DROP TABLE User;
DROP TABLE Tweet;
DROP TABLE Follow;

DROP TABLE Hashtag;
DROP TABLE Location;
DROP TABLE At;
DROP TABLE Favorite;
DROP TABLE Hash;
DROP TABLE Inlocaion;

CREATE TABLE User (
	name varchar(255) PRIMARY KEY,
	timezone varchar(255),
	language varchar(255),
	email varchar(255)
);

CREATE TABLE Tweet (
	tweetID int PRIMARY KEY,
	writerName varchar(255),
	content varchar(255)
);

CREATE TABLE Follow(
	username_leader varchar(255),
	username_follower varchar(255),
	PRIMARY KEY(username_leader, username_follower)
);

CREATE TABLE Favorite(
	userName varchar(255),
	tweetID int,
	PRIMARY KEY(userName, tweetID)
);


CREATE TABLE Hashtag(
	label varchar(255) PRIMARY KEY,
	currentTrend real
);

CREATE TABLE Location(
	coordinateX DECIMAL(8,8),
	coordinateY DECIMAL(8,8),
	placeName varchar(255),
	PRIMARY KEY(coordinateX, coordinateY)
);


CREATE TABLE At(
	userName varchar(255),
	tweetTime datetime,
	writerName varchar(255),
	PRIMARY KEY(userName, tweetTime, writerName)
);

CREATE TABLE Hash(
	hashtagLabel varchar(255),	
	tweetTime datetime,
	writerName varchar(255),
	PRIMARY KEY(hashtagLabel, tweetTime, writerName)
);

CREATE TABLE Inlocaion(
	locationCoordinateX DECIMAL(8,8),
	locationCoordinateY DECIMAL(8,8),
	tweetTime datetime,
	writerName varchar(255),
	PRIMARY KEY(locationCoordinateY, locationCoordinateX, tweetTime, writerName)
);




