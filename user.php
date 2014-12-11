<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<h2>You have login successfully.</h2>
		<h2>User Profile Page</h2>
        <p>
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

				// Get the attributes of the user with the given username
				$query = "SELECT * FROM User WHERE name = '$user'";
				$result = mysqli_query($dbcon, $query)
				  or die('Query failed: ' . mysqli_error($dbcon));

				// Can also check that there is only one tuple in the result
				$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
				  or die("User $user not found!");

				print "User <b>$user</b> has the following attributes:";

				// Printing user attributes in HTML
				print '<ul>'; 
				print '<li> Name: '.$tuple['name']; 
				print '<li> Timezone: '.$tuple['timezone'];
				print '<li> Language: '.$tuple['language'];
				print '<li> Email: '.$tuple['email'];
				print '</ul>';


				// Free result
				mysqli_free_result($result);

				// Closing connection
				mysqli_close($dbcon);
          ?>
        </p>

        <form method=get action="find_users_who_follow_leader.php">
			<b>Write a new tweet</b><br />
			<input type="text" name="user"><br />
			<input type="submit" value="Submit">
		</form>









		<h2>Tweets</h2>
        <p>
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
				// print 'Connected successfully!<br>';

				// Getting the input parameter (user):
				$user = $_SESSION['username'];

				// Get the attributes of the user with the given username
				$query = "SELECT t.content As tweetContent
						  FROM Tweet t
						  WHERE t.writerName = '$user'";
				$result = mysqli_query($dbcon, $query)
				  or die('Query failed: ' . mysqli_error($dbcon));

				// Can also check that there is only one tuple in the result
				$tuple = mysqli_fetch_array($result, MYSQL_ASSOC)
				  or die("You haven't sent any tweets.");

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
        </p>

	</body>
</html>