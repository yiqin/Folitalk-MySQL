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
$leader = $_REQUEST['user'];


// Get the attributes of the user with the given username
$query = "INSERT INTO Follow(username_leader, username_follower)
		  VALUES('$leader', '$user')";

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