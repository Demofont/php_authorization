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

	$username = mysqli_real_escape_string($con, $_POST["name"]);
	$usernameclean = filter_var($username, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
	$password = $_POST["password"];

	//check if name exists
	$namecheckquery = "SELECT username, salt, hash, score FROM users WHERE username='" . $usernameclean . "';";

	$namecheck = mysqli_query($con, $namecheckquery) or die("2: Name check query failed"); //error code #2 - name check query failed

	if (mysqli_num_rows($namecheck) != 1)
	{
		echo "5: Either no user with name, or more than one"; // error code #5 - number of names matching !=1
		exit();
	}

	//get login info from query
	$existinginfo = mysqli_fetch_assoc($namecheck);
	$salt = $existinginfo["salt"];
	$hash = $existinginfo["hash"];

	$loginhash = crypt($password, $salt);
	if ($hash != $loginhash)
	{
		echo "6: Incorrect password"; // error code #6 password does not hash to match table
		exit();
	}

	echo "0\t" . $existinginfo["score"];


?>