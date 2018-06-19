<?php
include '../_includes/config.php';
include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<div id="contents">
  <div id="main">
    <div class="box">
      <div>
        <div>
          <div class="body">
            Login successfull!
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php
  echo "Your user ID is: <b>" . $_COOKIE["userID"] . "</b>.";
?>

<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
