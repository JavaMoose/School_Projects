<?php
include '../_includes/config.php';
include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<?php
  if (isset ($_COOKIE["registrationError"])) {
    echo ($_COOKIE["registrationError"]);
    setcookie("registrationError", "", time()-3600, "/");
  }
?>

<div id="contents">
  <div id="main">
    <div class="box">
      <div>
        <div>
          <div class="body">
            <h2>Register New Account</h2>

            <form id="register_form" name="register_form" action="process_registration.php" method="post">
              First Name:<br>
              <input type="text" name="firstname" id="firstname" minlength="2" required/>
              <br>
              Last Name:<br>
              <input type="text" name="lastname" id="lastname" minlength="2" required/>
              <br>
              Email Address:<br>
              <input type="email" name="email" id="email" required/>
              <br>
              Username:<br>
              <input type="text" name="username" id="username" minlength="2" required/>
              <br>
              Password:<br>
              <input type="password" name="password" id="password" minlength="2" required/>
              <br>
              Password Confirmation:<br>
              <input type="password" name="password_confirm" id="password_confirm" minlength="2" required/>
              <br><br>
              <input type="submit" value="Submit">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script src='http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.js'></script>

    <script>

      $("#register_form").validate({
       rules: {
         password: {
           required: true,
           minlength: 2,
           maxlength: 16,

         } ,

         password_confirm: {

          equalTo: "#password",
          minlength: 2,
          maxlength: 16
        }
      },
      messages:{
        password_confirm: {
          required:"The password is required.",
          equalTo: "Passwords must match for verification."
        }
      }

    });
    </script>
<?php

include ABSOLUTE_PATH . '/_includes/footer.inc.php';

?>
