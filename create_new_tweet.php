<?php

session_start();

// Connection parameters 
$host = 'cspp53001.cs.uchicago.edu';
$username = 'yiqin';
$password = 'aitiejah';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Getting the input parameter (user):
$user = $_SESSION['username'];
$content = $_REQUEST['tweetContent'];


// Get the attributes of the user with the given username
$query = "INSERT INTO Tweet(writerName, content)
		  VALUES('$user', '$content')";

$result = mysqli_query($dbcon, $query);
if (!$result) {
    die('Failed: ' . mysqli_error($dbcon));
}
else {
	header('Location: user.php');
}


// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);

?> 