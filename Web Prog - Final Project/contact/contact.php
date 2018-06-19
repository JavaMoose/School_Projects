<?php
include '../_includes/config.php';

include ABSOLUTE_PATH . '/_includes/header.inc.php';
?>

<?php
  if (isset ($_COOKIE["contactError"])) {
    echo ($_COOKIE["contactError"]);
    setcookie("contactError", "", time()-3600, "/");
  }
?>

			<div id="contents">
				<div class="box">
					<div>
						<div id="contact" class="body">
							<h1>Contact</h1>
							<form id="contactform" action="process_contact.php" method="post">
								<table>
									<tbody>
										<tr>
											<td>Name:</td>
											<td><input name="name" id="name" type="text" class="txtfield" minlength=5 maxlength=26 required></td>
										</tr> <tr>
											<td>Email:</td>
											<td><input name="email" id="email" type="email" class="txtfield" required></td>
										</tr> <tr>
											<td>Phone:</td>
											<td><input name="phone" id="phone" type="tel" class="txtfield" placeholder="123-4567-8901" required></td>
										</tr> <tr>
											<td class="txtarea">Message:</td>
											<td><textarea name="message" id="message" required></textarea></td>
										</tr> <tr>
											<td></td>
											<td><input type="submit" class="btn"></td>
										</tr>
									</tbody>
								</table>
							</form>
							<h2>Bhaccasyoniztas Beach Resort</h2>
							<p>
								<span>Address:</span> 123 Lorem Ipsum Cove, Sed Ut City, LI 12345
							</p>
							<p>
								<span>Telephone Number:</span> 1-800-999-9999
							</p>
							<p>
								<span>Fax Number:</span> 1-800-111-1111
							</p>
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
