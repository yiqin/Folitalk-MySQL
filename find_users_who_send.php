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
$query1 = "SELECT COUNTUser.writerName, COUNTUser.COUNTTweets
		   FROM (SELECT writerName, COUNT(writerName) As COUNTTweets
		   FROM Tweet
		   GROUP BY writerName) AS COUNTUser
		   WHERE COUNTUser.COUNTTweets > 
		   (SELECT COUNT(writerName)
		   FROM Tweet
		   WHERE writerName = '$user')";
$result1 = mysqli_query($dbcon, $query1)
  or die('Query failed: ' . mysqli_error($dbcon));

// Can also check that there is only one tuple in the result
$tuple1 = mysqli_fetch_array($result1, MYSQL_ASSOC)
  or die("User $user not found!");



$query2 = "SELECT COUNT(writerName) as count
		   FROM Tweet
		   WHERE writerName = '$user'";
$result2 = mysqli_query($dbcon, $query2)
  or die('Query failed: ' . mysqli_error($dbcon));
// Can also check that there is only one tuple in the result
$tuple2 = mysqli_fetch_array($result2, MYSQL_ASSOC)
  or die("User $user not found!");



print "Find users who send more tweets than the number of tweets sent by <b>$user</b>:";

// Printing user attributes in HTML
print '<ul>'; 
print '<li> The number of tweets: '.$tuple2['count'];
print '</ul>';

print '<ul>'; 
while ($tuple1 = mysqli_fetch_row($result1)) {
   print "<li>$tuple1[0], number of tweets: $tuple1[1]";
}
print '</ul>';

// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?> 