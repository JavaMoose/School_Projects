<?php

  require_once("../_includes/config.php");

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

  $sql = "SELECT * FROM users WHERE username=:username AND password=:password LIMIT 1";

  $pdoQuery = $conn->prepare($sql);
  $pdoQuery->bindValue(":username", $username, PDO::PARAM_STR);
  $pdoQuery->bindValue(":password", $crypted_password, PDO::PARAM_STR);
  $pdoQuery->execute();
  $row = $pdoQuery->fetch(PDO::FETCH_ASSOC);

  if (is_array($row)) {
    setcookie("userID", $row["id"], 0, "/");
    header("Location: success.php");
  }
  else {
    setcookie("loginError", "Your username or password was invalid.", 0, "/");
    header("Location: index.php");
  }
 ?>
