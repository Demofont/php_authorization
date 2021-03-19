<?php

	$con = mysqli_connect("localhost:8889", "root", "root", "demo");

//connnection to database checker
	if (!$con) 
	{
    echo "Error: Unable to connect to the database." . PHP_EOL;
    echo "Error code errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Error text error: " . mysqli_connect_error() . PHP_EOL;
    exit;
	}

	$username = $_POST["name"];
	$newscore = $_POST["score"];

	//double check there is only one user with this name
	$namecheckquery = "SELECT username FROM users WHERE username='" . $username . "';";

	$namecheck = mysqli_qurey($con, $namecheckquery) or die("2: Name check query failed"); //error code #2 - name check query failed

	if (mysqli_num_rows($namecheck) != 1)
	{
		echo "5: Either no user with name, or more than one"; // error code #5 - number of names matching !=1
		exit();
	}

	$updatequery = "UPDATE users SET score = " . $newscore . "WHERE username = '" . $username . "';";
	mysqli_qurey($con, $updatequery) or die("7: Save query failed"); // error code #7 UPDATE query failed

	echo "0";

?>