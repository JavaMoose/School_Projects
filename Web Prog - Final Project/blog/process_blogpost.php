<?php

  require_once("../_includes/config.php");

  $userID = $_COOKIE["userID"];
  $postdate = date("Y-m-d H:i:s");
  $title = $_POST["title"];
  $postbody = $_POST["postbody"];
  $fileName = $_FILES['postimage']['name'];

  if (isset($_POST['submit'])) {
    $file = $_FILES['postimage'];

    $fileName = $_FILES['postimage']['name'];
    $fileTmpName = $_FILES['postimage']['tmp_name'];
    $fileSize = $_FILES['postimage']['size'];
    $fileError = $_FILES['postimage']['error'];
    $fileType = $_FILES['postimage']['type'];

    $fileExt = explode('.', $fileName);
    $fileActualExt = strtolower(end($fileExt));

    $allowed = array('jpg', 'jpeg', 'png', 'pdf');

    if (in_array($fileActualExt, $allowed)) {
      if ($fileError === 0) {
        if ($fileSize < 100000) {
          $fileDestination = 'uploads/'.$fileName;
          move_uploaded_file($fileName, $fileDestination);
          header("Location: success.php");
        } else {
          echo ("Your files is too large.");
        }
      } else {
        echo ("There was an error uploading the image.");
      }
    } else {
      echo ("You cannot upload images of this type!");
    }

  }

  $dsn = DB_SOURCE;
  $DBusername = DB_USER;
  $DBpassword = DB_PASS;

  try {
    $conn = new PDO($dsn, $DBusername, $DBpassword);
  }
  catch(PDOException $e) {

  }

  $sql = "INSERT into blogposts (userid, postdate, title, postbody, postimage) values (:userid, :postdate, :title, :postbody, :postimage)";

  $pdoQuery = $conn->prepare($sql);
  $pdoQuery->bindValue(":userid", $userID, PDO::PARAM_STR);
  $pdoQuery->bindValue(":postdate", $postdate, PDO::PARAM_STR);
  $pdoQuery->bindValue(":title", $title, PDO::PARAM_STR);
  $pdoQuery->bindValue(":postbody", $postbody, PDO::PARAM_STR);
  $pdoQuery->bindValue(":postimage", $fileName, PDO::PARAM_STR);
  $pdoQuery->execute();

  $userID = $conn->lastInsertId();

  if ($postdate > 0) {
    header("Location: success.php");
  }
  else {
    setcookie("blogError", "Blog post failed. Please try again.", 0, "/");
    header("Location: newblogpost.php");
  }
 ?>
