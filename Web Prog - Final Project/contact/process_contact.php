<?php

  require_once("../_includes/config.php");

  $name = $_POST["name"];
  $email = $_POST["email"];
  $phone = $_POST["phone"];
  $message = $_POST["message"];


  $dsn = DB_SOURCE;
  $DBusername = DB_USER;
  $DBpassword = DB_PASS;

  try {
    $conn = new PDO($dsn, $DBusername, $DBpassword);
  }
  catch(PDOException $e) {

  }

  $sql = "INSERT into contacts (name, email, phone, message) values (:name, :email, :phone, :message)";

  $pdoQuery = $conn->prepare($sql);
  $pdoQuery->bindValue(":name", $name, PDO::PARAM_STR);
  $pdoQuery->bindValue(":email", $email, PDO::PARAM_STR);
  $pdoQuery->bindValue(":phone", $phone, PDO::PARAM_STR);
  $pdoQuery->bindValue(":message", $message, PDO::PARAM_STR);
  $pdoQuery->execute();

  $userID = $conn->lastInsertId();

  if ($name > 0) {
    header("Location: results.php");
  }
  else {
    setcookie("contactError", "Contact information failed. Please try again.", 0, "/");
    header("Location: contact.php");
  }
 ?>
