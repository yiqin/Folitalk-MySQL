<?php

// Connection parameters 
$host = 'cspp53001.cs.uchicago.edu';
$username = 'yiqin';
$password = 'aitiejah';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br>';

// Getting the input parameter (user):
$user = $_REQUEST['user'];

// Get the attributes of the user with the given username
$query = "SELECT DISTINCT username_follower
		  FROM Follow f
		  JOIN (SELECT username_leader
		  FROM Follow
		  WHERE username_follower = '$user') User1Follows
		  ON f.username_follower = User1Follows.username_leader";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

// Can also check that there is only one tuple in the result
$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
  or die("User $user not found! No users who follow one of $user 's leader");

print "Find all users who follow one of <b>$user</b>'s leader";

// Printing user attributes in HTML
print '<ul>';
while ($tuple = mysqli_fetch_row($result)) {
   print "<li>$tuple[0]";
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 