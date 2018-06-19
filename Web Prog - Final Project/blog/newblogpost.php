<?php
include '../_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<?php
  if (isset ($_COOKIE["blogError"])) {
    echo ($_COOKIE["blogError"]);
    setcookie("blogError", "", time()-3600, "/");
  }
?>

<div id="contents">
  <div class="box">
    <div>
      <div id="blog" class="body">
        <h1>New Blog Post</h1>
        <form id="blogform" action="process_blogpost.php" method="post" enctype="multipart/form-data">
          <table>
            <tbody>
              <tr>
                <td>Title:</td>
                <td><input name="title" id="title" type="text" class="txtfield" minlength=5 maxlength=26 required></td>
              </tr>
              <tr>
                <td class="txtarea">Body:</td>
                <td><textarea name="postbody" id="postbody" rows="30" cols="75" minlength=20 maxlength=500 required></textarea></td>
              </tr>
              <tr>
                <td>Select image to upload:</td>
                <td><input type="file" name="postimage" id="postimage"></td>
              </tr>
              <tr>
                <td></td>
                <td><input type="submit" class="btn"></td>
              </tr>
            </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>
</div>


<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>



    <script  src="js/index.js"></script>

<?php
include ABSOLUTE_PATH . '/_includes/footer.inc.php';
?>
