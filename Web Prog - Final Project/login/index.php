<?php
include '../_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<?php
  if (isset ($_COOKIE["loginError"])) {
    echo ($_COOKIE["loginError"]);
    setcookie("loginError", "", time()-3600, "/");
  }
?>

<div id="contents">
  <div id="main">
    <div class="box">
      <div>
        <div>
          <div class="body">
            <h2>Login</h2>
            <form action="process_login.php" method="post">
              Username:<br>
              <input type="text" name="username" id="username" required/>
              <br>
              Password:<br>
              <input type="text" name="password" id="password" required/>
              <br><br>
              <input type="submit" value="Submit">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/jquery.validate.js"></script>
