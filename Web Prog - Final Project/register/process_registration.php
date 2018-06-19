<?php

  require_once("../_includes/config.php");

  $firstname = $_POST["firstname"];
  $lastname = $_POST["lastname"];
  $email = $_POST["email"];
  $username = $_POST["username"];
  $password = $_POST["password"];

  $crypted_password = crypt($password, "21500");

  $dsn = DB_SOURCE;
  $DBusername = DB_USER;
  $DBpassword = DB_PASS;

  try {
    $conn = new PDO($dsn, $DBusername, $DBpassword);
  }
  catch(PDOException $e) {

  }

  $sql = "INSERT into users (firstname, lastname, email, username, password) values (:firstname, :lastname, :email, :username, :password)";

  $pdoQuery = $conn->prepare($sql);
  $pdoQuery->bindValue(":firstname", $firstname, PDO::PARAM_STR);
  $pdoQuery->bindValue(":lastname", $lastname, PDO::PARAM_STR);
  $pdoQuery->bindValue(":email", $email, PDO::PARAM_STR);
  $pdoQuery->bindValue(":username", $username, PDO::PARAM_STR);
  $pdoQuery->bindValue(":password", $crypted_password, PDO::PARAM_STR);
  $pdoQuery->execute();

  $userID = $conn->lastInsertId();

  if ($userID > 0) {
    setcookie("userID", $userID, 0, "/");
    header("Location: success.php");
  }
  else {
    setcookie("registrationError", "Registration failed. Please try again.", 0, "/");
    header("Location: index.php");
  }
 ?>
