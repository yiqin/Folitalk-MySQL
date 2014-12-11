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

session_start();
$_SESSION['username'] = $user;

header('Location: user.php');


// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);

?> 