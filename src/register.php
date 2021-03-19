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
	$namecheckquery = "SELECT username FROM users WHERE username='" . $usernameclean . "';";

	$namecheck = mysqli_query($con, $namecheckquery) or die("2: Name check query failed"); //error code #2 - name check query failed

	if (mysqli_num_rows($namecheck) > 0)
	{
		echo "3: Name already exists"; // error code #3 - name exists cannot register
		exit();
	}

	//add user to the table
	$salt = "\$5\$rounds=5000\$" . "steamedhams" . $usernameclean . "\$";
	$hash = crypt($password, $salt);
	$insertuserquery  = "INSERT INTO users (username, hash, salt) VALUES ('" . $usernameclean . "', '" . $hash . "', '" . $salt . "');";
	mysqli_query($con, $insertuserquery) or die("4: Insert user query faild"); //error code #4 - insert query failed

	echo "0";

?>