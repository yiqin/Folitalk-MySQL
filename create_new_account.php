<?php


// Connection parameters 
$host = 'cspp53001.cs.uchicago.edu';
$username = 'yiqin';
$password = 'aitiejah';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());

// Getting the input parameter (user):
$user = $_REQUEST['user'];
$timezone = $_REQUEST['timezone'];
$language = $_REQUEST['language'];
$email = $_REQUEST['email'];

session_start();
$_SESSION['username'] = $user;

// Get the attributes of the user with the given username
$query = "INSERT INTO User(name, timezone, language, email)
		  VALUES('$user', '$timezone', '$language', '$email')";

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